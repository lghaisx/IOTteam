package lgh.service.Impl;

import lgh.dao.GenericDAO;
import lgh.model.Account;
import lgh.service.AccountService;
import lgh.util.MD5Utils;

import java.util.List;

public class AccountServiceImpl implements AccountService {
    private GenericDAO<Account> accountDao;

    public void setAccountDao(GenericDAO<Account> accountDao) {
        this.accountDao = accountDao;
    }

    @Override
    public void addAccount(Account account) {
        account.setPassword(MD5Utils.md5(account.getPassword()));
        accountDao.save(account);
    }

    @Override
    public void deleteBatch(int[] ids) {
        for(int id:ids){
            Account account = accountDao.findById(Account.class,id);
            accountDao.delete(account);
        }
    }

    @Override
    public void deleteAccount(int id) {
        accountDao.delete(accountDao.findById(Account.class,id));
    }

    @Override
    public List<Account> findAll() {
        return accountDao.findAll();
    }

    @Override
    public Account login(Account account) {
        List<Account> accounts = accountDao.findByNamedQuery("Account.login",account.getUsername(),MD5Utils.md5(account.getPassword()));
        if(accounts.size()>0){
            return accounts.get(0);
        }
        return null;
    }
}
