using System;
using System.Collections.Generic;

namespace todolist.Models;

public partial class ToDoList
{
    public int TaskId { get; set; }

    public string TaskContent { get; set; } = null!;

    public string PriorityLevel { get; set; } = null!;

    public string TaskStatus { get; set; } = null!;

    public DateTime ExpectedFinishTime { get; set; }
}
