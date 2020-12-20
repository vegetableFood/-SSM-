package service.impl;

import dao.ManagerDao;
import dao.SubscriptionDao;
import entity.Manager;
import entity.Subscription;
import exception.DuplicateUpdateFailException;
import exception.DuplicateUsernameNoExistException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.ManagerService;
import service.SubscriptionService;


@Service
@Transactional(propagation= Propagation.REQUIRED,rollbackFor=Exception.class)
public class ManagerServiceImp implements ManagerService {
    @Autowired
    private ManagerDao managerDao;
    @Autowired
    private SubscriptionDao subscriptionDao;
    @Override
//    管理员登录
    @Transactional(readOnly=true)
    public Manager login(Manager manager) throws DuplicateUsernameNoExistException {
        Manager m = managerDao.selectManagerNameAndPassWord(manager);
        if (m == null) {
            throw new DuplicateUsernameNoExistException("用戶名或密码错误");
        }
        return m;
    }
    // 更新用户订单信息
    @Override
    public void saveUserOrder(String id, String status, String remark) throws DuplicateUpdateFailException {
        managerDao.saveUserOrder(id,status,remark);
        Subscription subscription = subscriptionDao.selectOneItem2(id);
        if((subscription.getStatus().equals(status))&&(subscription.getRemark().equals(remark))){

        }else {
            throw new DuplicateUpdateFailException("修改失败");
        }
    }
}
