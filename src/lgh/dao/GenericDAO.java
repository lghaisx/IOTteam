package lgh.dao;

import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/*
**通用DAO接口
 */
public interface GenericDAO<T> {
    //增加
    void save(T t);
    //删除
    void delete(T t);
    //修改
    void update(T t);
    //查询
    T findById(Class<T> model, Serializable id);  //如果id自增，定义为int 或 long
    List<T> findAll();  //查询所有
    List<T> findByCriteria(DetachedCriteria detachedCriteria); //各种各样条件查询，添加排序
    List<T> findByCriteria(DetachedCriteria detachedCriteria, int firstResult, int maxResult); //分页查询
    List<T> findByNamedQuery(String namedQuery, Object... args);  //条件查询 ，使用HQL语句

    int findDataCount();
}
