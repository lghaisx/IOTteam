package lgh.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import flexjson.JSONSerializer;
import lgh.model.Member;
import lgh.service.MemberService;
import lgh.util.MD5Utils;

import org.apache.struts2.ServletActionContext;

import java.io.*;
import java.util.List;
public class MemberAction extends ActionSupport implements ModelDriven<Member> {
    Member member = new Member();
    private MemberService memberService;
    private String nameStr;
    private int[] ids;
    private File upload;
    private String uploadContentType;
    private String uploadFileName;

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public void setMemberService(MemberService memberService) {
        this.memberService = memberService;
    }

    public int[] getIds() {
        return ids;
    }

    public void setIds(int[] ids) {
        this.ids = ids;
    }

    public String getNameStr() {
        return nameStr;
    }

    public void setNameStr(String nameStr) {
        this.nameStr = nameStr;
    }

    @Override
    public Member getModel() {
        return member;
    }

    //查询所有
    public String query(){
        List<Member> members = memberService.findAll();
        ServletActionContext.getRequest().setAttribute("members",members);
        return "memberQuery";
    }
    //条件搜索
    public String search(){
        List<Member> memberList = memberService.findByName(nameStr);
        ServletActionContext.getRequest().setAttribute("members",memberList);
        return "memberQuery";
    }
    //添加成员
    public String save(){
        String pass = member.getNumber();
        member.setPwd(MD5Utils.md5(pass));
        member.setActive(0.0);
        memberService.addMember(member);
        return SUCCESS;
    }
    //删除单个
    public String delete() throws IOException {
        memberService.deleteMember(member.getId());
        String data = "success";
        JSONSerializer jsonSerializer = new JSONSerializer();
        String result = jsonSerializer.serialize(data);
        ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
        ServletActionContext.getResponse().getWriter().print(result);
        return NONE;
    }
    //批量删除
    public String dels(){
        for (int i = 0;i<ids.length;i++){
            memberService.deleteMember(ids[i]);
        }
        return "OK";
    }
    //得到单个成员信息
    public String get(){
        Member member1 = memberService.getMember(member.getId());
        ServletActionContext.getRequest().setAttribute("member",member1);
        return "memberUpdate";
    }
    public String get2(){
        Member member1 = memberService.getMember(member.getId());
        ServletActionContext.getRequest().setAttribute("member",member1);
        return "memberGet";
    }
    //更新
    public String update(){
        memberService.updateMember(member);
        return SUCCESS;
    }
    public String login() throws IOException {
        Member member1 = memberService.login(member);
        if(member1!=null){
            memberService.addByLogin(member1.getId());
            ActionContext.getContext().getSession().put("login2",member1);
            return "index2";
        }else{
            return "loginFail";
        }

    }

    public String editPass() throws IOException {
        Member member1 = memberService.getMember(member.getId());
        if(member1.getQq().equals(member.getQq())){
            memberService.editPass(member);
            return SUCCESS;
        }else{
            String data = "qqError";
            JSONSerializer jsonSerializer = new JSONSerializer();
            String result = jsonSerializer.serialize(data);
            ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
            ServletActionContext.getResponse().getWriter().print(result);
            return NONE;
        }
    }
    public String editMotto(){
        Member member1 = memberService.getMember(member.getId());
        memberService.editMotto(member);
        return SUCCESS;
    }
    public String exit(){
        ActionContext.getContext().getSession().clear();
        return "index2";
    }

}
