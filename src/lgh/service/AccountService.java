package lgh.service;

import lgh.model.Account;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface AccountService {
    //增加管理员
    void addAccount(Account account);
    //删除
    void deleteBatch(int[] ids);
    void deleteAccount(int id);
    //查询所有
    List<Account> findAll();
    //登录
    Account login(Account account);
}
