package lgh.dao.Impl;

import lgh.dao.GenericDAO;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.io.Serializable;
import java.util.List;

//实现接口
public class GenericDAOImpl<T> extends HibernateDaoSupport implements GenericDAO<T> {

    private Class<T> model1;

    public GenericDAOImpl(String classNmae){
        try {
            this.model1 = (Class<T>) Class.forName(classNmae);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    @Override
    public void save(T t) {
        this.getHibernateTemplate().save(t);
    }

    @Override
    public void delete(T t) {
        this.getHibernateTemplate().delete(t);
    }

    @Override
    public void update(T t) {
        this.getHibernateTemplate().update(t);
    }

    @Override
    public T findById(Class<T> model, Serializable id) {
        return this.getHibernateTemplate().get(model1,id);
    }
    @Override
    public List<T> findAll() {
        return this.getHibernateTemplate().find("from "+model1.getName());
    }

    @Override
    public List<T> findByCriteria(DetachedCriteria detachedCriteria) {
        return this.getHibernateTemplate().findByCriteria(detachedCriteria);
    }

    @Override
    public List<T> findByCriteria(DetachedCriteria detachedCriteria, int firstResult, int maxResult) {
        return this.getHibernateTemplate().findByCriteria(detachedCriteria,firstResult,maxResult);
    }

    @Override
    public List<T> findByNamedQuery(String namedQuery,Object...args) {
        return this.getHibernateTemplate().findByNamedQuery(namedQuery,args);
    }

    @Override
    public int findDataCount() {
        List list= this.getHibernateTemplate().find("select count(*) from "+ model1.getName());
        long temp = (Long) list.get(0);
        return (int) temp;
    }
}
