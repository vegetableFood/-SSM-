package dao;

import java.util.List;

import entity.Category;

/**
 * 房间类型数据访问对象
 * @author 李恒
 *
 */
public interface CategoryDao {
	/**
	 * 查询所有房间类型
	 * @return 封装了所有房间类型的房间类型对象
	 */
	public List<Category> selectAll();
}
