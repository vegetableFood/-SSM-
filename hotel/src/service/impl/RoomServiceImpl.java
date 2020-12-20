package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.CategoryDao;

import entity.Category;
import service.RoomServiceService;

@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class RoomServiceImpl implements RoomServiceService {
	
	@Autowired
	private CategoryDao categoryDao;

	@Transactional(readOnly=true)
	public List<Category> findAllCategories() {
		return categoryDao.selectAll();
	}

}
