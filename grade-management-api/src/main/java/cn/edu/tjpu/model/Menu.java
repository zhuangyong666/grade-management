package cn.edu.tjpu.model;

import java.io.Serializable;
import java.util.List;

public class Menu implements Serializable {
	private String icon;
	private String index;
	private String title;
	private List<Menu> subs;
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getIndex() {
		return index;
	}
	public void setIndex(String index) {
		this.index = index;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<Menu> getSubs() {
		return subs;
	}
	public void setSubs(List<Menu> subs) {
		this.subs = subs;
	}
	
}
