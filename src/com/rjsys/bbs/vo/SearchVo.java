package com.rjsys.bbs.vo;

import java.io.Serializable;

public class SearchVo implements Serializable{

	private String[] strings;
	
	private Integer index;
	private Integer currentCount;
	public SearchVo(String[] strings, Integer index, Integer currentCount) {
		super();
		this.strings = strings;
		this.index = index;
		this.currentCount = currentCount;
	}
	/**
	 * @return the strings
	 */
	public String[] getStrings() {
		return strings;
	}
	/**
	 * @param strings the strings to set
	 */
	public void setStrings(String[] strings) {
		this.strings = strings;
	}
	/**
	 * @return the index
	 */
	public Integer getIndex() {
		return index;
	}
	/**
	 * @param index the index to set
	 */
	public void setIndex(Integer index) {
		this.index = index;
	}
	/**
	 * @return the currentCount
	 */
	public Integer getCurrentCount() {
		return currentCount;
	}
	/**
	 * @param currentCount the currentCount to set
	 */
	public void setCurrentCount(Integer currentCount) {
		this.currentCount = currentCount;
	}
	
	
	
}
