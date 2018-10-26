package lgh.service.Impl;


import lgh.dao.GenericDAO;
import lgh.model.Task;
import lgh.service.TaskService;

import java.util.List;

public class TaskServiceImpl implements TaskService {
    private GenericDAO<Task> taskDao;

    public void setTaskDao(GenericDAO<Task> taskDao) {
        this.taskDao = taskDao;
    }

    @Override
    public void addTask(lgh.model.Task task) {
        taskDao.save(task);
    }

    @Override
    public void deleteTask(int id) {
        Task task = taskDao.findById(Task.class,id);
        taskDao.delete(task);
    }

    @Override
    public lgh.model.Task getTask(int id) {
        return taskDao.findById(Task.class,id);
    }

    @Override
    public void updateTask(lgh.model.Task task) {
        taskDao.update(task);
    }

    @Override
    public List<lgh.model.Task> findAll() {
        return taskDao.findAll();
    }

    @Override
    public void faBuDaAn(Task task) {
        Task task1 = taskDao.findById(Task.class,task.getId());
        task1.setQuestion(task.getQuestion());
    }

    @Override
    public void commitAdd(int id) {
        Task task = taskDao.findById(Task.class,id);
        int num = task.getCommitNum();
        task.setCommitNum(num+1);
    }

    @Override
    public void updateStaut(int id) {
        Task task = taskDao.findById(Task.class,id);
        task.setStaut("已结束");
    }


}
