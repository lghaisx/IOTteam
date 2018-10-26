package lgh.service.Impl;

import lgh.dao.GenericDAO;
import lgh.model.MemForTask;
import lgh.model.Member;
import lgh.model.Production;
import lgh.service.ProductionService;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import java.util.List;

public class ProductionServiceImpl implements ProductionService {
    private GenericDAO<Production> productionDao;

    public void setProductionDao(GenericDAO<Production> productionDao) {
        this.productionDao = productionDao;
    }

    @Override
    public void addProduction(Production production) {
        productionDao.save(production);
    }

    @Override
    public void deletePro(int id) {
        productionDao.delete(getProdu(id));
    }

    @Override
    public List<Production> findall() {
        return productionDao.findAll();
    }

    @Override
    public Production getProdu(int id) {
        return productionDao.findById(Production.class,id);
    }

    @Override
    public List<Production> search(String name) {
        return productionDao.findByNamedQuery("Production.search","%"+name+"%");
    }

    @Override
    public List<Production> findByMember(int id) {
        Member member = new Member();
        member.setId(id);
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Production.class);
        detachedCriteria.add(Restrictions.eq("member",member));
        return productionDao.findByCriteria(detachedCriteria);
    }

    @Override
    public void addZan(int id) {
        Production production1 = productionDao.findById(Production.class,id);
        int num = production1.getZan();
        production1.setZan(num+1);
    }

    @Override
    public void addRead(int id) {
        Production production1 = productionDao.findById(Production.class,id);
        int num = production1.getReadNum();
        production1.setReadNum(num+1);
    }

}
