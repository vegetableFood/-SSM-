package service.impl;

import java.util.Date;

import exception.DuplicateUsernameNoExistException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import service.MemberService;

import dao.MemberDao;
import entity.Member;
import exception.DuplicateUsernameException;

@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

//	注册
	public void regist(Member member) throws DuplicateUsernameException {
		Member m = memberDao.selectByUsername(member.getUsername());
		if (m != null) {
			throw new DuplicateUsernameException("用戶名已存在");
		}
		member.setRegtime(new Date());
		memberDao.insert(member);
	}

//	登录
	@Transactional(readOnly=true)
	public Member login(Member member) throws DuplicateUsernameNoExistException {
		Member m = memberDao.selectUsernameAndPassWord(member);
		if (m == null) {
			throw new DuplicateUsernameNoExistException("用戶名或密码错误");
		}
		return m;
	}

//	修改密码
	public void updatePassWard(Member member) {
		memberDao.updatePassWard(member);
	}

//	查看密码是否修改成功
	public Member selectUpdatePassWardIs(int id) {
		return memberDao.selectUpdatePassWardIs(id);
	}
//	修改信息
	public void updateUserMessage(Member member){
		memberDao.updateUserMessage(member);
	}
}
