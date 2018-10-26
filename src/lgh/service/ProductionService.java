package lgh.service;

import lgh.model.Production;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface ProductionService {
    //
    void addProduction(Production production);
    //
    void deletePro(int id);
    //
    List<Production> findall();
    //
    Production getProdu(int id);
    //
    List<Production> search(String name);
    List<Production> findByMember(int id);
    void addZan(int id);
    void addRead(int id);
}
