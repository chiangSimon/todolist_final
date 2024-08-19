using System.ComponentModel.DataAnnotations;
namespace todolist.Models

{
    public class LoginVM
    {
        [Required(ErrorMessage = "請輸入帳號")]
        public string? UserEmail { get; set; }

        [Required(ErrorMessage = "請輸入密碼")]
        public string? Password { get; set; }
    }
}
