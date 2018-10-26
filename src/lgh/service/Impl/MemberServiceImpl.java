package lgh.service.Impl;

import lgh.dao.GenericDAO;
import lgh.model.Member;
import lgh.service.MemberService;
import lgh.util.MD5Utils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import java.util.List;

public class MemberServiceImpl implements MemberService {
    private GenericDAO<Member> memberDao;

    public void setMemberDao(GenericDAO<Member> memberDao) {
        this.memberDao = memberDao;
    }

    @Override
    public void addMember(Member member) {
        memberDao.save(member);
    }

    @Override
    public void deleteMember(int id) {
        Member member = memberDao.findById(Member.class,id);
        memberDao.delete(member);
    }

    @Override
    public void updateMember(Member member) {
        memberDao.update(member);
    }

    @Override
    public List<Member> findAll() {
        return memberDao.findAll();
    }

    @Override
    public Member getMember(int id) {
        return memberDao.findById(Member.class,id);
    }

    @Override
    public List<Member> findByName(String nameStr) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Member.class);
        if(nameStr != null && nameStr.trim().length()>0){
            detachedCriteria.add(Restrictions.ilike("name","%"+nameStr+"%"));
        }
        return memberDao.findByCriteria(detachedCriteria);
    }

    @Override
    public List<Member> findByDesc() {
        return memberDao.findByNamedQuery("Name.query");
    }

    @Override
    public Member login(Member member) {
        List<Member> members = memberDao.findByNamedQuery("Name.login",member.getNumber(),MD5Utils.md5(member.getPwd()));
        if(members.size()>0){
            return members.get(0);
        }
        return null;
    }

    @Override
    public void editPass(Member member) {
        Member exitMember = memberDao.findById(Member.class,member.getId());
        exitMember.setPwd(MD5Utils.md5(member.getPwd()));
    }

    @Override
    public void editMotto(Member member) {
        Member exitMember = memberDao.findById(Member.class,member.getId());
        exitMember.setMotto(member.getMotto());
    }

    @Override
    public void addByLogin(int id) {
        Member member = memberDao.findById(Member.class,id);
        double active = member.getActive();
        member.setActive(active+0.5);
    }

    @Override
    public void addByViewProduction(int id) {
        Member member = memberDao.findById(Member.class,id);
        double active = member.getActive();
        member.setActive(active+0.2);
    }

    @Override
    public void addByCommitTask(int id) {
        Member member = memberDao.findById(Member.class,id);
        double active = member.getActive();
        member.setActive(active+5.0);
    }

    @Override
    public void addByUploadProduction(int id) {
        Member member = memberDao.findById(Member.class,id);
        double active = member.getActive();
        member.setActive(active+30.0);
    }

    @Override
    public void addByGrade(int id,String grade) {
        Member member = memberDao.findById(Member.class,id);
        double active = member.getActive();
        double addFen = Double.parseDouble(grade)*0.15;
        member.setActive(active+addFen);
    }
}
