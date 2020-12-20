package controller;

import entity.Member;
import entity.Subscription;
import exception.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.SubscriptionService;
import vo.ManagerQueryVo;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Controller
@RequestMapping("/subscription")
public class SubscriptionController {
    @Autowired
    private SubscriptionService subscriptionService;

    @ExceptionHandler(DuplicateUsernameNoExistException.class)
    public ModelAndView loginExceptionHandler(Exception e){
        return new ModelAndView("memberCenter","e",e);
    }
    @ExceptionHandler(DuplicatedeleteFail.class)
    public ModelAndView DuplicatedeleteFail(Exception e){
        return new ModelAndView("memberCenter","e",e);
    }
    @ExceptionHandler(DuplicateReserveIsNull.class)
    public ModelAndView DuplicateReserveIsNull(Exception e){
        return new ModelAndView("memberCenter","e",e);
    }
    @ExceptionHandler(ManagerDuplicateReserveIsNull.class)
    public ModelAndView ManagerDuplicateReserveIsNull(Exception e){
        return new ModelAndView("manager/subscriptionList","e",e);
    }
    @ExceptionHandler(DuplicateInsertFail.class)
    public ModelAndView DuplicateInsertFail(Exception e){
        return new ModelAndView("newSubscriptionMessage","e",e);
    }
//    客房预定
    @RequestMapping("/selectAllSubscription")
    public String selectAllReserve(Map map, HttpSession session,String id)throws Exception {
        Object member = session.getAttribute("member");
        if (member == null) {
            session.setAttribute("loginMessage", "你还没有登录");
            return "login";
        } else {
            List<Subscription> subscriptions = subscriptionService.selectAllSubscription(id);
            map.put("subscriptions", subscriptions);
            return "memberCenter";
//        }
        }
    }
//    删除一条订单
    @RequestMapping(value = "/deleteOneItem")
    public String deleteOneItem(String id,String mid)throws Exception{
        subscriptionService.deleteOneItem(id);
        return "redirect:/subscription/selectAllSubscription?id="+mid;
    }
//    修改订单联系人信息
    @RequestMapping("/updateOderMessage")
    public String updateOderMessage(Subscription subscription,HttpSession session)throws Exception{
        Member member1 = (Member) session.getAttribute("member");
        subscriptionService.updateOderMessage(subscription);
        return "redirect:/subscription/selectAllSubscription?id="+member1.getId();
    }
//    查询历史订单
    @RequestMapping("/selectHistoryOrder")
    public String selectHistoryOrder(String id,HttpSession session)throws Exception{
        List<Subscription> list = subscriptionService.selectHistoryOrder(id);
        session.setAttribute("selectHistoryOrders",list);
        return "historySubscription";
    }
//   新建订单
    @RequestMapping("/newSubscription")
    public String newSubscription(Subscription subscription,HttpSession session)throws Exception{
        Member member = (Member) session.getAttribute("member");
        subscription.setCretime(new Date());
        subscription.setMid(member.getId());
        Random random = new Random();//16 06 65 30 08 02 9
        int endNo = random.nextInt(99999);
        String no = String.valueOf(new Date().getTime())+ endNo;
        subscription.setNo(no);
        subscription.setStatus("1");
        subscriptionService.newSubscription(subscription);
        session.setAttribute("newSubscriptionMessage","添加成功");
        return "redirect:/subscription/selectAllSubscription?id="+member.getId();
    }
    //    管理员查询List<SubscriptionService>
    @RequestMapping("/manager/managerQueryOrder")
    public String managerQueryOrder(ManagerQueryVo managerQueryVo, Map map,HttpSession session)throws Exception{
        if(managerQueryVo == null){
            managerQueryVo = (ManagerQueryVo) session.getAttribute("managerQueryVo");
        }
        List<Subscription> list = subscriptionService.selectBySubscriptionCriteria(managerQueryVo);
        session.setAttribute("managerQueryVo",managerQueryVo);
        map.put("managerQueryOrders",list);
        return "manager/subscriptionList";
    }
}
