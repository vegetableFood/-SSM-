package service.impl;

import dao.createSubscriptionDtlDao;
import entity.Reside;
import entity.Room;
import entity.Subscription_dtl;
import exception.DuplicateInsertFail;
import exception.DuplicateReserveIsNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.createSubscriptionDtlService;
import vo.CreatSubDtlVo;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
@Service
@Transactional(propagation= Propagation.REQUIRED,rollbackFor=Exception.class)
public class createSubscriptionDtlServiceImp implements createSubscriptionDtlService {
    @Autowired
    private createSubscriptionDtlDao createSubscriptionDtlDao;

    public List<Room> selectOneBedNo(CreatSubDtlVo creatSubDtlVo) throws DuplicateReserveIsNull {
        List<Room> list = createSubscriptionDtlDao.selectOneBedNo(creatSubDtlVo);
        if(list.size() <= 0){
            throw new DuplicateReserveIsNull("没有房间了");
        }
        return list;
    }
    public List<Room> selectAllRoomNo(CreatSubDtlVo creatSubDtlVo) throws DuplicateReserveIsNull {
        List<Room> list = createSubscriptionDtlDao.selectAllRoomNo(creatSubDtlVo);
        if(list.size() <= 0){
            throw new DuplicateReserveIsNull("没有房间了");
        }
        return list;
    }

    @Override
    public void insertAllRoomNo(Subscription_dtl subscription_dtl, Reside reside) throws DuplicateInsertFail {
        Integer flag  = createSubscriptionDtlDao.insertAllRoomNo(subscription_dtl);
        reside.setDtlid(subscription_dtl.getId());
        Date startDate = subscription_dtl.getSdate();
        Date endDate = subscription_dtl.getEdate();
        Calendar sCalendar = Calendar.getInstance();
        sCalendar.setTime(startDate);
        Calendar eCalendar = Calendar.getInstance();
        eCalendar.setTime(endDate);
        while(sCalendar.before(eCalendar)){
            sCalendar.add(Calendar.DAY_OF_MONTH,1);
            Date date = sCalendar.getTime();
            reside.setResidedate(date);
                if(flag == 0){
                    throw new DuplicateInsertFail("预定失败");
                }else {
                    Integer flag2 = createSubscriptionDtlDao.insertReside(reside);
                    if (flag2 == 0){
                        throw new DuplicateInsertFail("预定失败");
                    }
                }
            }
        }
}
