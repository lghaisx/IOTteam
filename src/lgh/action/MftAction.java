package lgh.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import flexjson.JSONSerializer;
import lgh.model.MemForTask;
import lgh.model.Member;
import lgh.service.MemForTaskService;
import lgh.service.MemberService;
import lgh.service.TaskService;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.util.List;

public class MftAction extends ActionSupport implements ModelDriven<MemForTask> {
    MemForTask memForTask = new MemForTask();
    @Override
    public MemForTask getModel() {
        return memForTask;
    }
    private MemForTaskService mftService;
    private TaskService taskService;
    private MemberService memberService;
    private int taskid;
    private int[] ids;
    private int taskId;

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public int[] getIds() {
        return ids;
    }

    public void setIds(int[] ids) {
        this.ids = ids;
    }

    public int getTaskid() {
        return taskid;
    }

    public void setTaskid(int taskid) {
        this.taskid = taskid;
    }

    public void setTaskService(TaskService taskService) {
        this.taskService = taskService;
    }

    public void setMftService(MemForTaskService mftService) {
        this.mftService = mftService;
    }

    public void setMemberService(MemberService memberService) {
        this.memberService = memberService;
    }

    public String searchByTask(){
        List<MemForTask> memForTaskList = mftService.findByTask(taskid);
        ServletActionContext.getRequest().setAttribute("mfts",memForTaskList);
        return "queryByTask";
    }
    public String get(){
        MemForTask memForTask1 = mftService.findById(memForTask.getId());
        ServletActionContext.getRequest().setAttribute("mft",memForTask1);
        return "piGai";
    }
    public String piYue(){
        mftService.PiGai(memForTask);
        MemForTask memForTask1 = mftService.findById(memForTask.getId());
        memberService.addByGrade(memForTask1.getMember().getId(),memForTask1.getGrade());
        return "OK";
    }
    public String delete() throws IOException {
        mftService.delete(memForTask.getId());
        String data = "success";
        JSONSerializer jsonSerializer = new JSONSerializer();
        String result = jsonSerializer.serialize(data);
        ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
        ServletActionContext.getResponse().getWriter().print(result);
        return NONE;
    }
    public String dels(){
        for (int id:ids){
            mftService.delete(id);
        }
        return "OK";
    }

    public String save(){
        mftService.add(memForTask);
        Member member = (Member) ActionContext.getContext().getSession().get("login2");
        memberService.addByCommitTask(member.getId());
        taskService.commitAdd(taskId);
        return SUCCESS;
    }
}
