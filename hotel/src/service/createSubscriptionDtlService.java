package service;

import entity.Reside;
import entity.Room;
import entity.Subscription_dtl;
import exception.DuplicateInsertFail;
import exception.DuplicateReserveIsNull;
import vo.CreatSubDtlVo;

import java.util.List;

public interface


createSubscriptionDtlService {
//    查询单个床位
    public List<Room> selectOneBedNo(CreatSubDtlVo creatSubDtlVo) throws DuplicateReserveIsNull;
//    查询整个房间
    public List<Room> selectAllRoomNo(CreatSubDtlVo creatSubDtlVo) throws DuplicateReserveIsNull;
//    添加整个房间
    public void insertAllRoomNo(Subscription_dtl subscription_dtl, Reside reside) throws DuplicateInsertFail;
}
