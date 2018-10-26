package lgh.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import flexjson.JSONSerializer;
import lgh.model.Member;
import lgh.model.Production;
import lgh.service.MemberService;
import lgh.service.ProductionService;
import lgh.util.MD5Utils;
import org.apache.struts2.ServletActionContext;

import java.io.*;
import java.util.List;

public class ProductionAction extends ActionSupport implements ModelDriven<Production> {
    Production production = new Production();
    private ProductionService productionService;
    private MemberService memberService;
    private File pdu;
    private String pduFileName;
    private String pduContentType;
    private int[] ids;
    private String namePr;

    public String getNamePr() {
        return namePr;
    }

    public void setNamePr(String namePr) {
        this.namePr = namePr;
    }

    public int[] getIds() {
        return ids;
    }

    public void setIds(int[] ids) {
        this.ids = ids;
    }

    public File getPdu() {
        return pdu;
    }

    public void setPdu(File pdu) {
        this.pdu = pdu;
    }

    public String getPduFileName() {
        return pduFileName;
    }

    public void setPduFileName(String pduFileName) {
        this.pduFileName = pduFileName;
    }

    public String getPduContentType() {
        return pduContentType;
    }

    public void setPduContentType(String pduContentType) {
        this.pduContentType = pduContentType;
    }

    @Override
    public Production getModel() {
        return production;
    }

    public void setProductionService(ProductionService productionService) {
        this.productionService = productionService;
    }

    public void setMemberService(MemberService memberService) {
        this.memberService = memberService;
    }

    //查询所有
    public String query(){
        List<Production> list = productionService.findall();
        ServletActionContext.getRequest().setAttribute("productions",list);
        return "productionQuery";
    }
    public String search(){
        List<Production> list = productionService.search(namePr);
        ServletActionContext.getRequest().setAttribute("productions",list);
        return "productionQuery2";
    }
    public String more(){
        List<Production> list = productionService.findall();
        ServletActionContext.getRequest().setAttribute("productions",list);
        return "productionQuery2";
    }
    public String get1(){
        Production production1 = productionService.getProdu(production.getId());
        ServletActionContext.getRequest().setAttribute("production",production1);
        return "productionShow1";
    }
    public String get3(){
        Member member = (Member) ActionContext.getContext().getSession().get("login2");
        if(member!=null) {
            memberService.addByViewProduction(member.getId());
        }
        productionService.addRead(production.getId());
        Production production1 = productionService.getProdu(production.getId());
        ServletActionContext.getRequest().setAttribute("production",production1);
        return "productionShow2";
    }
    public String save() throws IOException {
        String end = this.pduFileName.substring(this.pduFileName.length()-4);
        String romdomStr = MD5Utils.getRandomString(10);
        String newFileName = romdomStr+end;
        InputStream in = new FileInputStream(pdu);
        String uploadPath = ServletActionContext.getServletContext().getRealPath("/upload");
        File newFile = new File(uploadPath,newFileName);
        OutputStream out = new FileOutputStream(newFile);
        byte[] buffer = new byte[1024];
        int length = 0;
        while(-1!=(length=in.read(buffer,0,buffer.length))){
            out.write(buffer);
        }
        in.close();
        out.close();
        production.setFileName(newFileName);
        productionService.addProduction(production);
        Member member = (Member) ActionContext.getContext().getSession().get("login2");
        memberService.addByUploadProduction(member.getId());
        return "OK";
    }
    //单个删除
    public String delete() throws IOException {
        productionService.deletePro(production.getId());
        String data = "success";
        JSONSerializer jsonSerializer = new JSONSerializer();
        String result = jsonSerializer.serialize(data);
        ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
        ServletActionContext.getResponse().getWriter().print(result);
        return NONE;
    }

    public String dels(){
        for(int i = 0;i<ids.length;i++){
            productionService.deletePro(ids[i]);
        }
        return "OK";
    }

    public String addZan(){
        productionService.addZan(production.getId());
        return NONE;
    }
}
