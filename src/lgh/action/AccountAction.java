package lgh.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import flexjson.JSONSerializer;
import lgh.model.Account;
import lgh.service.AccountService;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.util.List;

public class AccountAction extends ActionSupport implements ModelDriven<Account> {
    private Account account = new Account();
    private AccountService accountService;
    private int[] ids;

    public void setAccountService(AccountService accountService) {
        this.accountService = accountService;
    }

    public int[] getIds() {
        return ids;
    }

    public void setIds(int[] ids) {
        this.ids = ids;
    }

    @Override
    public Account getModel() {
        return account;
    }

    public String query(){
        List<Account> accounts = accountService.findAll();
        ServletActionContext.getRequest().setAttribute("accounts",accounts);
        return "accountQuery";
    }

    public String save(){
        accountService.addAccount(account);
        return SUCCESS;
    }

    public String delete() throws IOException {
        accountService.deleteAccount(account.getId());
        String data = "success";
        JSONSerializer jsonSerializer = new JSONSerializer();
        String result = jsonSerializer.serialize(data);
        ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
        ServletActionContext.getResponse().getWriter().print(result);
        return NONE;
    }

    public String dels(){
        accountService.deleteBatch(ids);
        return "OK";
    }

    public String login(){
        Account account2 = accountService.login(account);
        if(account2==null){
            return "loginFail";
        }else{
            ActionContext.getContext().getSession().put("login",account2);
            return "index";
        }
    }

    public String exit(){
        ActionContext.getContext().getSession().clear();
        return "login";
    }
}
