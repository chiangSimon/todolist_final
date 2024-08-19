using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using todolist.BusinessLogicLayer;
using todolist.Models;

namespace todolist.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class TaskManageController : ControllerBase
    {
        private readonly TaskBLL _taskBLL;

        public TaskManageController()
        {
            _taskBLL = new TaskBLL();
        }

        [HttpGet]

        public IEnumerable<ToDoList> GetData() { 
            return _taskBLL.GetData().OrderBy(x=> x.ExpectedFinishTime);
        }

        [HttpGet]
        public IEnumerable<ToDoList> GetDataByDate(DateTime date)
        {
            var tasksInDate = _taskBLL.GetData()
                .Where(t => t.ExpectedFinishTime.Date == date.Date).OrderBy(x => x.ExpectedFinishTime)
                .ToList();
            return tasksInDate;
        }

        [HttpGet]
        public IEnumerable<ToDoList> GetDataByWeek(DateTime start, DateTime end)
        {
            var tasksInWeek = _taskBLL.GetData()
                .Where(t => t.ExpectedFinishTime.Date >= start.Date && t.ExpectedFinishTime.Date <= end.Date).OrderBy(x => x.ExpectedFinishTime)
                .ToList();
            return tasksInWeek;
        }

        [HttpPost]

        public Task<string> AddTask([FromForm] ToDoList addTask) 
        {
            return _taskBLL.AddTask(addTask);
        }

        [HttpPost]

        public Task<string> UpdateTask([FromForm] ToDoList update)
        {
            return _taskBLL.UpdateTask(update);
        }

        [HttpDelete("{id}")]

        public Task<string> DeleteTask(int id)
        {
            return _taskBLL.DeleteTask(id);
        }


    }
}
