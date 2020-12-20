package controller;

import entity.Manager;
import exception.DuplicateUpdateFailException;
import exception.DuplicateUsernameNoExistException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.ManagerService;
import vo.ManagerQueryVo;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/managers")
public class ManagerController {
    @Autowired
    private ManagerService managerService;
    //登录DuplicateUsernameNoExistException
    @ExceptionHandler(DuplicateUsernameNoExistException.class)
    public ModelAndView DuplicateUsernameNoExistException(Exception e){
        return new ModelAndView("manager/managerLogin","e",e);
    }
    @ExceptionHandler(DuplicateUpdateFailException.class)
    public ModelAndView DuplicateUpdateFailException(Exception e){
        return new ModelAndView("manager/managerLogin","e",e);
    }
//    管理员登录
    @RequestMapping("/login")
    public String login(Manager manager, HttpSession httpSession)throws Exception{
        Manager m = managerService.login(manager);
        httpSession.setAttribute("manager",m.getUsername());
        return "manager/subscriptionQuery";
    }

    @RequestMapping("/removeSession")
    public String removeSession(HttpSession httpSession){
        httpSession.removeAttribute("manager");
        return "manager/managerLogin";
    }
//    保存订单
    @RequestMapping("/saveUserOrder")
    public String saveUserOrder(String id,String status,String remark,HttpSession session)throws Exception{
        managerService.saveUserOrder(id,status,remark);
        ManagerQueryVo managerQueryVo = (ManagerQueryVo)session.getAttribute("managerQueryVo");
        session.setAttribute("managerQueryVo",managerQueryVo);
        return "redirect:/subscription/manager/managerQueryOrder";
    }

}
