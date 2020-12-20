package service;

import com.sun.org.apache.xpath.internal.operations.Bool;
import entity.Member;
import exception.DuplicateUsernameException;
import exception.DuplicateUsernameNoExistException;

public interface MemberService {
//	注册
	public void regist(Member member)throws DuplicateUsernameException;
//	登录
	public Member login(Member member) throws DuplicateUsernameNoExistException;
//	修改密码
	public void updatePassWard(Member member);
//	查看密码是否修改成功
	public Member selectUpdatePassWardIs(int id);
//	修改信息
	public void updateUserMessage(Member member);

}
