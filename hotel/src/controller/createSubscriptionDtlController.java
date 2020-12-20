package controller;

import entity.Member;
import entity.Reside;
import entity.Room;
import entity.Subscription_dtl;
import exception.DuplicateInsertFail;
import exception.DuplicateReserveIsNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.createSubscriptionDtlService;
import vo.CreatSubDtlVo;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/createSubscriptionDtl")
public class createSubscriptionDtlController {
    @Autowired
    private createSubscriptionDtlService createSubscriptionDtlService;

    @ExceptionHandler(DuplicateReserveIsNull.class)
    public ModelAndView DuplicateReserveIsNull(Exception e){
        return new ModelAndView("createSubscriptionDtl-2","e",e);
    }

    @ExceptionHandler(DuplicateInsertFail.class)
    public ModelAndView DuplicateInsertFail(Exception e){
        return new ModelAndView("subscriptionDetail","e",e);
    }


    @RequestMapping("/two")
    public String  createSubscriptionDtl_2 (CreatSubDtlVo creatSubDtlVo, Map map, HttpSession session,String linkman,
                                            String sid)throws Exception{
        List<Room> list = null;
        if(creatSubDtlVo.getBookType() == 1){
            list = createSubscriptionDtlService.selectOneBedNo(creatSubDtlVo);
        }else if(creatSubDtlVo.getBookType() == 2){
            list = createSubscriptionDtlService.selectAllRoomNo(creatSubDtlVo);
        }
        session.setAttribute("creatSubDtlVo",creatSubDtlVo);
        map.put("RoomNo",list);
        session.setAttribute("creatLinkman",linkman);
        session.setAttribute("creatSid",sid);
        return "createSubscriptionDtl-2";
    }
    @RequestMapping("/two2")
    public String createSubscriptionDtlInsert(@RequestParam Map<String,String> map,HttpSession session)throws Exception{
        Subscription_dtl subscription_dtl = new Subscription_dtl();
        Reside reside = new Reside();
        String linkman = (String)session.getAttribute("creatLinkman");
        reside.setRoomername(linkman);
        CreatSubDtlVo creatSubDtlVo = (CreatSubDtlVo) session.getAttribute("creatSubDtlVo");
        //订单id
        String orderId = (String)session.getAttribute("creatSid");
        subscription_dtl.setSid(Integer.valueOf(orderId));
        //开始时间
        subscription_dtl.setSdate(creatSubDtlVo.getStartDate());
        reside.setResidedate(creatSubDtlVo.getStartDate());
        //结束时间
        subscription_dtl.setEdate(creatSubDtlVo.getEndDate());
        //预定类型
        subscription_dtl.setResidetype(creatSubDtlVo.getBookType());
        float rootType = 0.0f;
        if(creatSubDtlVo.getBookType() == 1){
           //单个床位
            if(creatSubDtlVo.getRootType()==1){
                rootType = 50.0f;
            }else if(creatSubDtlVo.getRootType()==2){
                rootType = 100.0f;
            }else if(creatSubDtlVo.getRootType()==3){
                rootType = 150.0f;
            }
            //房间价格
            subscription_dtl.setPrice(rootType);

        }else if(creatSubDtlVo.getBookType() == 2){
           //整件房间
            if(creatSubDtlVo.getRootType()==1){
                rootType = 80.0f;
            }else if(creatSubDtlVo.getRootType()==2){
                rootType = 160.0f;
            }else if(creatSubDtlVo.getRootType()==3){
                rootType = 260.0f;
            }
            //房间价格
            subscription_dtl.setPrice(rootType);
        }
        //房间号
        Integer roomid = 0;
        for (String v : map.values()) {
            roomid = Integer.valueOf(v);
            subscription_dtl.setRid(roomid);
            //插入语句
            createSubscriptionDtlService.insertAllRoomNo(subscription_dtl,reside);
        }
        return "createSubscriptionDtl-3";
    }
}
