public class Post
{
    public int Id { get; set; }  
    public string Username { get; set; } = string.Empty;  
    public string Content { get; set; } = string.Empty; 
    public DateTime CreatedAt { get; set; } 
    public string ImageUrl { get; set; } = string.Empty; 
}
