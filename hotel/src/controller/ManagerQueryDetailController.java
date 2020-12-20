package controller;

import entity.Subscription;
import exception.DuplicatedeleteFail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.SubscriptionDtlService;
import service.SubscriptionService;
import vo.ManagerQueryVo;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/ManagerQueryDetail")
public class ManagerQueryDetailController {
    @Autowired
    private SubscriptionService subscriptionService;

    @Autowired
    private SubscriptionDtlService subscriptionDtlService;

    @ExceptionHandler(DuplicatedeleteFail.class)
    public ModelAndView DuplicatedeleteFail(Exception e){
        return new ModelAndView("managerQueryOrder","e",e);
    }
//    订单号查询
    @RequestMapping("/selectUserRoomDetail")
    public String selectUserRoomDetail(String no, Map map){
        List<Subscription> subscriptions = subscriptionService.selectUserRoomDetail(no);
        map.put("ManagerQueryDetails",subscriptions);
        return "/manager/subscriptionDetail";
    }

    @RequestMapping("/deleteOrderRoom")
    public String deleteOrderRoom(String id, HttpSession session) throws Exception{
        ManagerQueryVo managerQueryVo = (ManagerQueryVo)session.getAttribute("managerQueryVo");
        subscriptionService.deleteOneItem(id);
        session.setAttribute("managerQueryVo",managerQueryVo);
        return "redirect:/subscription/manager/managerQueryOrder";

    }
//    管理员操作
    @RequestMapping("/deleteResideRoom")
    public String deleteResideRoom(String id,String no) throws Exception{
        subscriptionDtlService.deleteOrderRoom(id);
        return "redirect:/ManagerQueryDetail/selectUserRoomDetail?no="+no;
    }


}
