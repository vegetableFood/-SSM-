package dao;

import entity.Member;
import org.apache.ibatis.annotations.Param;

public interface MemberDao {
	//	查看用户名是否存在
	public Member selectByUsername(String username);
	//	注册用户
	public void insert(Member member);
	//	登录
	public Member selectUsernameAndPassWord(Member member);
	//	修改密码
	public void updatePassWard(Member member);
	//	查看密码是否修改成功
	public Member selectUpdatePassWardIs(int id);
//	修改信息
	public void updateUserMessage(Member member);
}
