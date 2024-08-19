using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using todolist.Models;

namespace todolist.DataAcessLayer
{
    public class TaskDAL
    {
        private readonly TodolistContext _context;

        public TaskDAL()
        {
            _context = new TodolistContext();
        }

        public IEnumerable<ToDoList> GetData()
        {
            return _context.ToDoLists;
        }

   

        public async Task<string> AddTask([FromForm] ToDoList addTask)
        {
            ToDoList toDoList = new ToDoList
            {
                TaskContent = addTask.TaskContent,
                PriorityLevel = addTask.PriorityLevel,
                TaskStatus = addTask.TaskStatus,
                ExpectedFinishTime = addTask.ExpectedFinishTime,
            };
            _context.ToDoLists.Add(toDoList);
            await _context.SaveChangesAsync(); 
            return "新增成功";
        }

        public async Task<string> UpdateTask([FromForm] ToDoList updateTask)
        {
            var toDoList = await _context.ToDoLists.FirstOrDefaultAsync(p => p.TaskId == updateTask.TaskId);
            toDoList.TaskContent = updateTask.TaskContent;
            toDoList.PriorityLevel = updateTask.PriorityLevel;
            toDoList.TaskStatus = updateTask.TaskStatus;
            toDoList.ExpectedFinishTime = updateTask.ExpectedFinishTime;
            await _context.SaveChangesAsync();
            return "修改成功";
        }



        public async Task<string> DeleteTask(int id)
        {
            if (_context.ToDoLists == null)
            {
                return "刪除失敗";
            }
            var toDoList = await _context.ToDoLists.FindAsync(id);
            if (toDoList == null)
            {
                return "刪除失敗";
            }
            try
            {
                _context.ToDoLists.Remove(toDoList);
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                return "刪除失敗";
            }
            return "刪除成功";

        }

    }
}
