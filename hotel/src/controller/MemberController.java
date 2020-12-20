package controller;

import entity.Subscription;
import exception.DuplicateUsernameNoExistException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import entity.Member;
import exception.DuplicateUsernameException;
import service.SubscriptionService;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	@ExceptionHandler(DuplicateUsernameException.class)
	public ModelAndView registExceptionHandler(Exception e){
		return new ModelAndView("register-1","e",e);
	}
	@ExceptionHandler(DuplicateUsernameNoExistException.class)
	public ModelAndView loginExceptionHandler(Exception e){
		return new ModelAndView("login","e",e);
	}
//	注册
	@RequestMapping("/regist")
	public String regist(Member member)throws Exception{
		memberService.regist(member);
		return "register-2";
	}
//登录
	@RequestMapping("/login")
	public String login(Member member, HttpSession httpSession)throws Exception{
		Member m = memberService.login(member);
		httpSession.setAttribute("member",m);
		return "redirect:/subscription/selectAllSubscription?id="+m.getId();
	}
	//退出
	@RequestMapping("/outSystem")
	public String outSystem(HttpSession session)throws Exception{
		session.removeAttribute("member");
		return "hotel";
	}
//	修改密码
	@RequestMapping("/updatePassWard")
	public String updatePassWard(String newPassword,HttpSession httpSession)throws Exception{
		Member m = (Member) httpSession.getAttribute("member");
		m.setPwd(newPassword);
		memberService.updatePassWard(m);
		Member member = memberService.selectUpdatePassWardIs(m.getId());
		if(member.getPwd().equals(newPassword)){
			httpSession.setAttribute("passWardMessage","修改成功");
			return "editPassword";
		}else {
			httpSession.setAttribute("passWardMessage","修改失败");
			return "editPassword";
		}
	}
//	修改信息
	@RequestMapping("/updateUserMessage")
	public String updateUserMessage(Member member,HttpSession httpSession,String id ){
		memberService.updateUserMessage(member);
		Member m = memberService.selectUpdatePassWardIs(member.getId());
		if(!m.getName().equals(member.getName())){
			httpSession.setAttribute("updateUserMessage","姓名修改失败");
		}else if(!m.getPhone().equals(member.getPhone())){
			httpSession.setAttribute("updateUserMessage","手机号修改失败");
		}else if(!m.getEmail().equals(member.getEmail())){
			httpSession.setAttribute("updateUserMessage","邮箱修改失败");
		}else {
			httpSession.setAttribute("updateUserMessage","修改成功");
			httpSession.setAttribute("member",m);
		}
		return "editMember";
	}
}
