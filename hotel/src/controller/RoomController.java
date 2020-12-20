package controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import service.RoomServiceService;
import entity.Category;

@Controller
@RequestMapping("/room")
public class RoomController {

	@Autowired
	private RoomServiceService roomService;
	
	@RequestMapping("/findAllCategories")
	public String findAllCategories(Map map){
		List<Category> categories=roomService.findAllCategories();
		map.put("categories", categories);
		return "roomPrice";
	}
}
