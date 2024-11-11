namespace LooglePlusMobile {

    public class Post
    {
        public int Id { get; set; }  
        public string Username { get; set; } = string.Empty;  
        public string Content { get; set; } = string.Empty; 
        public DateTime CreatedAt { get; set; } 
        public string ImageUrl { get; set; } = string.Empty; 
        public string AuthorPfpUrl { get; set; } = string.Empty; 
        public List<Comment> Comments { get; set; } = new List<Comment>();
    }

    public class Comment
    {
        public string Username { get; set; } = string.Empty;
        public string CommentContent { get; set; } = string.Empty;
        public DateTime CommentTime { get; set; }
        public string ProfileImageUrl { get; set; } = string.Empty;
    }

}