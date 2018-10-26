package Test;

import lgh.model.Account;
import lgh.service.AccountService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class AccountTest {
    @Autowired
    private AccountService accountService;

    @Test
    public void addAccount(){
        Account account = new Account();
        account.setName("张三");
        account.setUsername("admin");
        account.setPassword("123456");
        accountService.addAccount(account);
    }
    @Test
    public void findAllTest(){
        List<Account> accounts = accountService.findAll();
        for(Account account:accounts){
            System.out.println(account.getName()+" "+account.getUsername());
        }
    }
    @Test
    public void loginTest(){
        Account account = new Account();
        account.setUsername("admin");
        account.setPassword("123456");
        Account account1 = accountService.login(account);
        System.out.println(account1.getName());
    }
    @Test
    public void deleteTest(){
        int[] ids = {1};
        accountService.deleteBatch(ids);
    }
}
