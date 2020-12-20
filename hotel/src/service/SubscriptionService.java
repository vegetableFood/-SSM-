package service;

import entity.Subscription;
import exception.DuplicateInsertFail;
import exception.DuplicateReserveIsNull;
import exception.DuplicatedeleteFail;
import exception.ManagerDuplicateReserveIsNull;
import vo.ManagerQueryVo;

import java.util.List;

public interface SubscriptionService {
//    查询所有的预定信息
    public List<Subscription>  selectAllSubscription(String id) throws DuplicateReserveIsNull;
//    删除单个信息
    public void deleteOneItem(String id) throws DuplicatedeleteFail;
//    修改订单联系人信息
    public void updateOderMessage(Subscription subscription);
//    历史订单
    public List<Subscription> selectHistoryOrder(String id)throws DuplicateReserveIsNull;
//    新建订单
    public void newSubscription(Subscription subscription) throws DuplicateInsertFail;
//    管理员查询
    public  List<Subscription> selectBySubscriptionCriteria(ManagerQueryVo managerQueryVo)throws ManagerDuplicateReserveIsNull;
//    管理员查询用户住房详细信息
    public List<Subscription> selectUserRoomDetail(String no);
}
