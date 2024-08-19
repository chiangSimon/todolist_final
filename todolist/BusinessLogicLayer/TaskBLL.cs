using Microsoft.AspNetCore.Mvc;
using todolist.DataAcessLayer;
using todolist.Models;

namespace todolist.BusinessLogicLayer
{
    public class TaskBLL
    {
        private readonly TaskDAL _taskDAL;

        public TaskBLL()
        {
            _taskDAL = new TaskDAL();
        }

        public IEnumerable<ToDoList> GetData()
        {
            return _taskDAL.GetData();
        }

        public Task<string> AddTask([FromForm] ToDoList addTask)
        {
            return _taskDAL.AddTask(addTask);
        }

        public Task<string> UpdateTask([FromForm] ToDoList updateTask)
        {
            return _taskDAL.UpdateTask(updateTask);
        }

        public Task<string> DeleteTask(int id)
        {
            return _taskDAL.DeleteTask(id);
        }


    }
}
