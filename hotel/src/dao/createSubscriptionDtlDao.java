package dao;

import entity.Reside;
import entity.Room;
import entity.Subscription_dtl;
import vo.CreatSubDtlVo;

import java.util.List;

public interface createSubscriptionDtlDao {
//    查询单个床位
    public List<Room> selectOneBedNo(CreatSubDtlVo creatSubDtlVo);
//    查询整个房间
    public List<Room> selectAllRoomNo(CreatSubDtlVo creatSubDtlVo);
//    添加整个房间
    public Integer insertAllRoomNo(Subscription_dtl subscription_dtl);
    public Integer insertReside(Reside reside);
}
