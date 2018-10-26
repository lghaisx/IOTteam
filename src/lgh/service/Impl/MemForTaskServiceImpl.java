package lgh.service.Impl;

import lgh.dao.GenericDAO;
import lgh.model.MemForTask;
import lgh.model.Member;
import lgh.model.Task;
import lgh.service.MemForTaskService;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import java.util.List;

public class MemForTaskServiceImpl implements MemForTaskService {
    private GenericDAO<MemForTask> mftDao;

    public void setMftDao(GenericDAO<MemForTask> mftDao) {
        this.mftDao = mftDao;
    }

    @Override
    public void add(MemForTask memForTask) {
       mftDao.save(memForTask);
    }

    @Override
    public void delete(int id) {
        mftDao.delete(mftDao.findById(MemForTask.class,id));
    }

    @Override
    public List<MemForTask> findByTask(int id) {
        Task task = new Task();
        task.setId(id);
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(MemForTask.class);
        detachedCriteria.add(Restrictions.eq("task",task));
        return mftDao.findByCriteria(detachedCriteria);
    }

    @Override
    public List<MemForTask> findByMember(int id) {
        Member member = new Member();
        member.setId(id);
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(MemForTask.class);
        detachedCriteria.add(Restrictions.eq("member",member));
        return mftDao.findByCriteria(detachedCriteria);
    }

    @Override
    public MemForTask findById(int id) {
        return mftDao.findById(MemForTask.class,id);
    }

    @Override
    public void PiGai(MemForTask memForTask) {
        MemForTask memForTask1 = mftDao.findById(MemForTask.class,memForTask.getId());
        memForTask1.setGrade(memForTask.getGrade());
        memForTask1.setRemark(memForTask.getRemark());
        memForTask1.setState(true);
    }
}
