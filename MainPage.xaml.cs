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

        public MainPage()
        {
            InitializeComponent();
            BindingContext = this;
            LoadPosts(currentPage); 
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
                                ImageUrl = element.GetProperty("image_url").GetString() ?? string.Empty
                            };

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
           
            string imageUrl = post.ImageUrl.StartsWith("http://loogle.cc") ? post.ImageUrl : "http://loogle.cc" + post.ImageUrl;

            System.Diagnostics.Debug.WriteLine(imageUrl);

            return new Frame
            {
                Margin = new Thickness(10, 5),
                BorderColor = Colors.Black,
                CornerRadius = 0,
                HasShadow = true,
                Content = new StackLayout
                {
                    Padding = 10,
                    Spacing = 10,
                    Children =
                    {
                        new Label
                        {
                            Text = post.Username,
                            FontSize = 16,
                            FontAttributes = FontAttributes.Bold,
                            TextColor = Colors.Black,
                            HorizontalOptions = LayoutOptions.Start
                        },
                        new Label
                        {
                            Text = post.CreatedAt.ToString("MMMM dd, yyyy"),
                            FontSize = 12,
                            TextColor = Colors.Gray,
                            HorizontalOptions = LayoutOptions.Start
                        },
                        new Label
                        {
                            Text = post.Content,
                            FontSize = 14,
                            TextColor = Colors.Black,
                            HorizontalOptions = LayoutOptions.Start,
                            LineBreakMode = LineBreakMode.WordWrap
                        },
                        new Image
                        {
                            Source = imageUrl, // Use the updated imageUrl
                            HeightRequest = 200,
                            Aspect = Aspect.AspectFill,
                            IsVisible = !string.IsNullOrEmpty(post.ImageUrl),
                            Margin = new Thickness(0, 10, 0, 0)
                        }
                    }
                }
            };
        }


        private async void OnScrollViewScrolled(object sender, ScrolledEventArgs e)
        {
            var scrollView = sender as ScrollView;

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