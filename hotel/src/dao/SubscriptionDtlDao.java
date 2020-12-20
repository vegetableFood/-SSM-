package dao;

import entity.Subscription_dtl;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SubscriptionDtlDao {
    //    查询用户的预定房间
    public List<Subscription_dtl> selectOrderRoom(String id);
    //    删除用户的预定房间
    public void deleteOrderRoom(@Param("id") String id);
    //    查询用户的预定房间是否删除成功
    public int sDeleteOrderRoom(String id);
    //     删除reside表中的数据
    public void rDeleteOrderRoom(String id);
    //    查询reside表用户的预定房间是否删除成功
    public Integer selectRidesIsExist(String id);

}
