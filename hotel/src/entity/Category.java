package entity;

import java.io.Serializable;

public class Category implements Serializable {
	private Integer id;
	private String name;
	private String code;
	private String description;
	private Double bedprice;
	private Double roomprice;
	public Category() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getBedprice() {
		return bedprice;
	}
	public void setBedprice(Double bedprice) {
		this.bedprice = bedprice;
	}
	public Double getRoomprice() {
		return roomprice;
	}
	public void setRoomprice(Double roomprice) {
		this.roomprice = roomprice;
	}
	
	
}
