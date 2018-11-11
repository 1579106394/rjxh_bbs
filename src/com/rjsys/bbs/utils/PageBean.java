package com.rjsys.bbs.utils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/*
 * 用于分页的类
 */
public class PageBean<T>{
	
	//当前页
	private int currentPage;
	
	//当前页显示条数
	private int currentCount;
	
	//总条数
	private int tatolCount;
	
	//总页数
	private int totalPage;
	
	//每页显示的数据
	private List<T> list = new ArrayList<T>();

	public PageBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PageBean(int currentPage, int currentCount, int tatolCount, int totalPage, List<T> list) {
		super();
		this.currentPage = currentPage;
		this.currentCount = currentCount;
		this.tatolCount = tatolCount;
		this.totalPage = totalPage;
		this.list = list;
	}

	/**
	 * @return the currentPage
	 */
	public int getCurrentPage() {
		return currentPage;
	}

	/**
	 * @param currentPage the currentPage to set
	 */
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	/**
	 * @return the currentCount
	 */
	public int getCurrentCount() {
		return currentCount;
	}

	/**
	 * @param currentCount the currentCount to set
	 */
	public void setCurrentCount(int currentCount) {
		this.currentCount = currentCount;
	}

	/**
	 * @return the tatolCount
	 */
	public int getTatolCount() {
		return tatolCount;
	}

	/**
	 * @param tatolCount the tatolCount to set
	 */
	public void setTatolCount(int tatolCount) {
		this.tatolCount = tatolCount;
	}

	/**
	 * @return the totalPage
	 */
	public int getTotalPage() {
		return totalPage;
	}

	/**
	 * @param totalPage the totalPage to set
	 */
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	/**
	 * @return the list
	 */
	public List<T> getList() {
		return list;
	}

	/**
	 * @param list the list to set
	 */
	public void setList(List<T> list) {
		this.list = list;
	}



	
	
}
