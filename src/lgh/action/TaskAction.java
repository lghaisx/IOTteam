package lgh.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import flexjson.JSONSerializer;
import lgh.model.Task;
import lgh.service.TaskService;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.util.List;

public class TaskAction extends ActionSupport implements ModelDriven<Task> {
    Task task = new Task();
    private TaskService taskService;

    public void setTaskService(TaskService taskService) {
        this.taskService = taskService;
    }

    @Override
    public Task getModel() {
        return task;
    }
    private int[] ids;

    public int[] getIds() {
        return ids;
    }

    public void setIds(int[] ids) {
        this.ids = ids;
    }

    public String query(){
        List<Task> tasks = taskService.findAll();
        ServletActionContext.getRequest().setAttribute("tasks",tasks);
        return "taskQuery";
    }

    public String get(){
        Task task1 = taskService.getTask(task.getId());
        ServletActionContext.getRequest().setAttribute("task",task1);
        return "taskShow1";
    }
    public String get1(){
        Task task1 = taskService.getTask(task.getId());
        ServletActionContext.getRequest().setAttribute("task",task1);
        return "taskUpdate";
    }
    public String get3(){
        Task task1 = taskService.getTask(task.getId());
        ServletActionContext.getRequest().setAttribute("task",task1);
        return "taskGet";
    }
    public String save(){
        task.setStaut("进行中");
        taskService.addTask(task);
        return "OK";
    }
    public String update(){
        taskService.updateTask(task);
        return "OK";
    }
    public String delete() throws IOException {
        taskService.deleteTask(task.getId());
        String data = "success";
        JSONSerializer jsonSerializer = new JSONSerializer();
        String result = jsonSerializer.serialize(data);
        ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
        ServletActionContext.getResponse().getWriter().print(result);
        return NONE;
    }
    public String dels(){
        for(int id:ids){
            taskService.deleteTask(id);
        }
        return "OK";
    }
    public String question(){
        taskService.faBuDaAn(task);
        return "OK";
    }
    public String staut() throws IOException {
        taskService.updateStaut(task.getId());
        String data = "success";
        JSONSerializer jsonSerializer = new JSONSerializer();
        String result = jsonSerializer.serialize(data);
        ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
        ServletActionContext.getResponse().getWriter().print(result);
        return NONE;
    }
}
