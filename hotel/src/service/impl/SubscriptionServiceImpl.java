package service.impl;

import dao.SubscriptionDao;

import dao.SubscriptionDtlDao;
import entity.Subscription;
import entity.Subscription_dtl;
import exception.DuplicateInsertFail;
import exception.DuplicateReserveIsNull;
import exception.DuplicatedeleteFail;
import exception.ManagerDuplicateReserveIsNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import service.SubscriptionDtlService;
import service.SubscriptionService;
import vo.ManagerQueryVo;

import java.util.Iterator;
import java.util.List;

@Service
@Transactional(propagation= Propagation.REQUIRED,rollbackFor=Exception.class)
public class SubscriptionServiceImpl implements SubscriptionService {

    @Autowired
    private SubscriptionDao subscriptionDao;
    @Autowired
    private SubscriptionDtlService subscriptionDtlService;
//  客房预订
    @Transactional(readOnly = true)
    public List<Subscription> selectAllSubscription(String id) throws DuplicateReserveIsNull {
        List<Subscription> list = subscriptionDao.selectAllSubscription(id);
        if(list.size()<=0){
            throw new DuplicateReserveIsNull("暂无预定客户");
        }
        return list;
    }
//    删除订单
    public void deleteOneItem(String id) throws DuplicatedeleteFail {
        List<Subscription_dtl> list = subscriptionDtlService.selectOrderRoom(id);
        Iterator<Subscription_dtl> iterator = list.iterator();
        while (iterator.hasNext()){
            Subscription_dtl subscription_dtl = iterator.next();
            subscriptionDtlService.deleteOrderRoom(String.valueOf(subscription_dtl.getId()));
        }
        subscriptionDao.deleteOneItem(id);
        Integer exits = subscriptionDao.selectOneItem(id);
        if(exits == 1 ){
            throw new DuplicatedeleteFail("删除失败");
        }
    }
//    查询历史订单
    @Transactional(readOnly = true)
    public List<Subscription> selectHistoryOrder(String id)throws DuplicateReserveIsNull{
        List<Subscription> list = subscriptionDao.selectHistoryOrder(id);
        if(list.size() == 0){
            throw new DuplicateReserveIsNull("历史订单为空");
        }
        return list;
    }
//      新建订单
    @Override
    public void newSubscription(Subscription subscription) throws DuplicateInsertFail {
        int i = subscriptionDao.newSubscription(subscription);
        if(i < 0){
            throw new DuplicateInsertFail("生成订单失败");
        }
    }
//  修改联系人信息
    @Override
    public void updateOderMessage(Subscription subscription) {
        subscriptionDao.updateOderMessage(subscription);
    }

//    管理员查询List<SubscriptionService>
    public  List<Subscription> selectBySubscriptionCriteria(ManagerQueryVo managerQueryVo)
            throws ManagerDuplicateReserveIsNull {
        List<Subscription> list = subscriptionDao.selectBySubscriptionCriteria(managerQueryVo);
        if(list.size()<=0){
            throw new ManagerDuplicateReserveIsNull("查无此单！");
        }
        return list;
    }
//  订单号查询
    @Override
    public List<Subscription> selectUserRoomDetail(String no) {
        List<Subscription> subscriptions = subscriptionDao.selectUserRoomDetail(no);
        return subscriptions;
    }
}
