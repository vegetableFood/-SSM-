package dao;

import entity.Manager;
import org.apache.ibatis.annotations.Param;

public interface ManagerDao {
    //	登录
    public Manager selectManagerNameAndPassWord(Manager manager);

    // 更新用户订单信息
    public void saveUserOrder(@Param("id") String id, @Param("status")String status, @Param("remark")String remark);
}
