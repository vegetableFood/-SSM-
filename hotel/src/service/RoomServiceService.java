package service;

import java.util.List;

import entity.Category;

/**
 * 房间服务对象
 * @author 李恒
 *
 */
public interface RoomServiceService {
	/**
	 * 设施与价格
	 * @return 封装了所有房间类型的房间类型对象
	 */
	public List<Category> findAllCategories();
}
