package dao;

import entity.Subscription;
import exception.DuplicatedeleteFail;
import org.apache.ibatis.annotations.Param;
import vo.ManagerQueryVo;

import java.util.List;

public interface SubscriptionDao {
//    查询所有
    public List<Subscription> selectAllSubscription(String id);
//    单个删除
    public void deleteOneItem(String id);
//    单个查询
    public int selectOneItem(String id) ;
    //    单个查询
    public Subscription selectOneItem2(String id) ;
//    修改订单联系人信息
    public void updateOderMessage(Subscription subscription);
//    查询历史订单
    public List<Subscription> selectHistoryOrder(String id);
//    新建订单
    public int newSubscription(Subscription subscription);
//    管理员查询
    List<Subscription> selectBySubscriptionCriteria(ManagerQueryVo managerQueryVo);
//    管理员查询用户住房详细信息
    public List<Subscription> selectUserRoomDetail(String no);


}
