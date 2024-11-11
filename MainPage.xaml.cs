using Microsoft.Maui.Controls;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text.Json;
using System.Threading.Tasks;
using Microsoft.Maui.Graphics;

namespace LooglePlusMobile
{
    public partial class MainPage : ContentPage
    {
        private static readonly HttpClient client = new HttpClient();
        private int currentPage = 1;
        private bool isLoading = false;
        public Color PageBackgroundColor { get; set; }
        public MainPage()
        {
            InitializeComponent();
            BindingContext = this;
            _ = LoadPosts(currentPage); 


        var isDarkMode = Application.Current.RequestedTheme == AppTheme.Dark;

        PageBackgroundColor = isDarkMode ? Color.FromArgb("#121212") : Color.FromArgb("#e5e5e5");

        }

        private async Task LoadPosts(int page)
        {
            if (isLoading) return;

            isLoading = true;
            var apiUrl = $"https://loogle.cc/apiv2/fetch_posts.php?page={page}";

            System.Diagnostics.Debug.WriteLine($"Fetching posts for page {page}...");

            try
            {
                var response = await client.GetStringAsync(apiUrl);

                if (string.IsNullOrEmpty(response))
                {
                    Console.WriteLine("Empty response received from API.");
                    return;
                }

                var newPosts = new List<Post>();

                using (JsonDocument doc = JsonDocument.Parse(response))
                {
                    var root = doc.RootElement;

                    if (root.ValueKind == JsonValueKind.Array)
                    {
                        System.Diagnostics.Debug.WriteLine($"Received {root.GetArrayLength()} posts from the API.");

                        foreach (var element in root.EnumerateArray())
                        {
                            var post = new Post
                            {
                                Id = element.GetProperty("id").GetInt32(),
                                Username = element.GetProperty("username").GetString() ?? string.Empty,
                                Content = element.GetProperty("content").GetString() ?? string.Empty,
                                CreatedAt = DateTime.Parse(element.GetProperty("created_at").GetString() ?? DateTime.MinValue.ToString()),
                                ImageUrl = element.GetProperty("image_url").GetString() ?? string.Empty,
                                AuthorPfpUrl = element.GetProperty("profile_image_url").GetString() ?? string.Empty
                            };

                            var comments = element.GetProperty("comments").EnumerateArray().Select(commentElement => new Comment
                            {
                                Username = commentElement.GetProperty("username").GetString() ?? string.Empty,
                                CommentContent = commentElement.GetProperty("comment_content").GetString() ?? string.Empty,
                                CommentTime = DateTime.Parse(commentElement.GetProperty("comment_time").GetString() ?? DateTime.MinValue.ToString()),
                                ProfileImageUrl = commentElement.GetProperty("profile_image_url").GetString() ?? string.Empty,
                            }).ToList();

                            post.Comments = comments;

                            newPosts.Add(post);
                        }

                        System.Diagnostics.Debug.WriteLine($"Loaded {newPosts.Count} new posts.");

                        foreach (var post in newPosts)
                        {
                            PostsStackLayout.Children.Add(CreatePostView(post));
                            System.Diagnostics.Debug.WriteLine($"Added post with ID: {post.Id}.");
                        }

                        currentPage++; 
                    }
                    else
                    {
                        Console.WriteLine("Unexpected JSON format.");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error fetching posts: {ex.Message}");
                System.Diagnostics.Debug.WriteLine($"Error fetching posts: {ex.Message}");
            }
            finally
            {
                isLoading = false; 
                System.Diagnostics.Debug.WriteLine("Finished fetching posts.");
            }
        }
        private View CreatePostView(Post post)
        {
            var isDarkMode = Application.Current.RequestedTheme == AppTheme.Dark;

            var commentsLayout = new StackLayout
            {
                Spacing = 8,
            };

            foreach (var comment in post.Comments)
            {
                var commentLayout = new StackLayout
                {
                    Spacing = 4,
                    Children =
                    {
                        new StackLayout
                        {
                            Orientation = StackOrientation.Horizontal,
                            Spacing = 8,
                            Children =
                            {
                                new Image
                                {
                                    Source = !string.IsNullOrEmpty(comment.ProfileImageUrl) ? comment.ProfileImageUrl : "default_pfp.png", 
                                    WidthRequest = 30,
                                    HeightRequest = 30,
                                    Aspect = Aspect.AspectFill,
                                    VerticalOptions = LayoutOptions.Center
                                },
                                new StackLayout
                                {
                                    VerticalOptions = LayoutOptions.Center,
                                    Children =
                                    {
                                        new Label
                                        {
                                            Text = comment.Username,
                                            FontSize = 14,
                                            FontAttributes = FontAttributes.Bold,
                                            FontFamily = "ProductSansBold",
                                            TextColor = isDarkMode ? Colors.White : Colors.Black,
                                            VerticalOptions = LayoutOptions.Center
                                        },
                                        new Label
                                        {
                                            Text = comment.CommentTime.ToString("MMM dd, yyyy HH:mm"),
                                            FontSize = 12,
                                            FontFamily = "ProductSansRegular",
                                            TextColor = isDarkMode ? Colors.Gray : Colors.DarkGray,
                                            VerticalOptions = LayoutOptions.Center
                                        }
                                    }
                                }
                            }
                        },

                        new Label
                        {
                            Text = comment.CommentContent,
                            FontSize = 14,
                            FontFamily = "ProductSansRegular", 
                            TextColor = isDarkMode ? Colors.White : Colors.Black,
                            HorizontalOptions = LayoutOptions.Start,
                            LineBreakMode = LineBreakMode.WordWrap
                        }
                    }
                };

                commentsLayout.Children.Add(commentLayout);
            }

            return new Frame
            {
                Margin = new Thickness(0, 0, 0, 8), 
                CornerRadius = 0,
                BackgroundColor = isDarkMode ? Color.FromArgb("#1E1E1E") : Color.FromArgb("#f6f6f6"),

                Shadow = new Shadow
                {
                    Offset = new Microsoft.Maui.Graphics.Point(0, 1),
                    Radius = 3,
                    Opacity = 0.1f,
                },
                Content = new StackLayout
                {
                    Padding = new Thickness(8), 
                    Spacing = 8, 
                    Children =
                    {
                        new StackLayout
                        {
                            Orientation = StackOrientation.Horizontal,
                            Spacing = 8, 
                            Children =
                            {
                                new Image
                                {
                                    Source = !string.IsNullOrEmpty(post.AuthorPfpUrl) ? post.AuthorPfpUrl : "default_pfp.png", 
                                    WidthRequest = 40,
                                    HeightRequest = 40,
                                    Aspect = Aspect.AspectFill,
                                    VerticalOptions = LayoutOptions.Center
                                },
                                new StackLayout
                                {
                                    VerticalOptions = LayoutOptions.Center,
                                    Children =
                                    {
                                        new Label
                                        {
                                            Text = post.Username,
                                            FontSize = 16,
                                            FontAttributes = FontAttributes.Bold,
                                            FontFamily = "ProductSansBold",
                                            TextColor = isDarkMode ? Colors.White : Colors.Black,
                                            VerticalOptions = LayoutOptions.Center
                                        },
                                        new Label
                                        {
                                            Text = post.CreatedAt.ToString("MMM dd, yyyy"), 
                                            FontSize = 12,
                                            FontFamily = "ProductSansRegular",
                                            TextColor = isDarkMode ? Colors.Gray : Colors.DarkGray,
                                            VerticalOptions = LayoutOptions.Center
                                        }
                                    }
                                }
                            }
                        },

                        new Label
                        {
                            Text = post.Content,
                            FontSize = 14,
                            FontFamily = "ProductSansRegular", 
                            TextColor = isDarkMode ? Colors.White : Colors.Black,
                            HorizontalOptions = LayoutOptions.Start,
                            LineBreakMode = LineBreakMode.WordWrap
                        },

                        new Image
                        {
                            Source = !string.IsNullOrEmpty(post.ImageUrl) ? post.ImageUrl : null,
                            HeightRequest = 200,
                            Aspect = Aspect.AspectFill,
                            IsVisible = !string.IsNullOrEmpty(post.ImageUrl),
                            Margin = new Thickness(0, 8, 0, 0) 
                        },

                        commentsLayout 
                    }
                }
            };
        }
        private async void OnScrollViewScrolled(object sender, ScrolledEventArgs e)
        {
            var scrollView = sender as ScrollView;

            if (scrollView == null) return;

            var contentHeight = scrollView.ContentSize.Height;
            var visibleHeight = scrollView.Height;

            System.Diagnostics.Debug.WriteLine($"Scroll Position: {e.ScrollY}");
            System.Diagnostics.Debug.WriteLine($"Content Height: {contentHeight}");
            System.Diagnostics.Debug.WriteLine($"Visible Height: {visibleHeight}");
            System.Diagnostics.Debug.WriteLine($"Is Loading: {isLoading}");

            if (!isLoading && (e.ScrollY + visibleHeight >= contentHeight - 50))
            {
                System.Diagnostics.Debug.WriteLine("Approaching bottom, attempting to load more posts...");
                await LoadPosts(currentPage);
            }
        }
    }
    
}