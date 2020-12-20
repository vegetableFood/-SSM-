package service;

import entity.Subscription_dtl;
import exception.DuplicatedeleteFail;

import java.util.List;

public interface SubscriptionDtlService {
//    查询用户的预定房间
    public List<Subscription_dtl> selectOrderRoom(String id);
//    删除用户的预定房间
    public void deleteOrderRoom(String id) throws DuplicatedeleteFail;
}
