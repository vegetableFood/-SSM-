package controller;

import entity.Subscription_dtl;
import exception.DuplicatedeleteFail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.SubscriptionDtlService;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/subscriptionDtl")
public class SubscriptionController_dtl {
    @Autowired
    private SubscriptionDtlService subscriptionDtlService;

    @ExceptionHandler(DuplicatedeleteFail.class)
    public ModelAndView DuplicatedeleteFail(Exception e){
        return new ModelAndView("memberCenter","e",e);
    }
//    查询用户订单
    @RequestMapping("/selectOrderRoom")
    public String selectOrderRoom(String id, Map map){
        List<Subscription_dtl> list = subscriptionDtlService.selectOrderRoom(id);
        map.put("Subscription_dtls",list);
        return "subscriptionDetail";
    }
//    删除用户订单
    @RequestMapping("/deleteOrderRoom")
    public String deleteOrderRoom(String id,String sid) throws Exception{
        subscriptionDtlService.deleteOrderRoom(id);
        return "redirect:/subscriptionDtl/selectOrderRoom?id="+sid;
    }

}
