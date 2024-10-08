﻿using System.ComponentModel.DataAnnotations;

namespace todolist.Models
{
    public class RegisterVM
    {
        [Required(ErrorMessage ="請輸入欲註冊帳號")]
        public string? UserEmail { get; set; }

        [Required(ErrorMessage = "請輸入欲註冊密碼")]
        public string? Password { get; set; }
        public string? UserName { get; set; }
    }
}
