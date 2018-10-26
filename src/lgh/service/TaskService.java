package lgh.service;

import lgh.model.Task;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface TaskService {
    //发布作业
    void addTask(Task task);
    //删除作业
    void deleteTask(int id);
    //得到task
    Task getTask(int id);
    //更新
    void updateTask(Task task);
    //查询所有
    List<Task> findAll();
    //
    void faBuDaAn(Task task);

    void commitAdd(int id);
    void updateStaut(int id);
}
