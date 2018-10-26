package lgh.service;

import lgh.model.MemForTask;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface MemForTaskService {
    void add(MemForTask memForTask);
    void delete(int id);
    List<MemForTask> findByTask(int id);
    List<MemForTask> findByMember(int id);
    MemForTask findById(int id);
    void PiGai(MemForTask memForTask);
}
