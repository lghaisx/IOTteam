package lgh.service;

import lgh.model.Member;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface MemberService {
    //增加
    void addMember(Member member);
    //删除
    void deleteMember(int id);
    //更改
    void updateMember(Member member);
    //查询
    List<Member> findAll();
    //得到一个member
    Member getMember(int id);
    //
    List<Member> findByName(String name);
    //
    List<Member> findByDesc();

    Member login(Member member);

    void editPass(Member member);
    void editMotto(Member member);
    void addByLogin(int id); // +0.5分
    void addByViewProduction(int id);   // +0.2分
    void addByCommitTask(int id) ;  //  +5分
    void addByUploadProduction(int id);  //  +30分
    void addByGrade(int id,String grade);  // 取每次成绩的15%;
}
