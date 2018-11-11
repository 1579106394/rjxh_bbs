package com.rjsys.bbs.vo;

import java.io.Serializable;

public class CartUtils implements Serializable {

	private String type;
	private Integer index;
	private Integer currentCount;
	private Integer typeId;
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
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
	public CartUtils() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CartUtils(String type, Integer index, Integer currentCount, Integer typeId) {
		super();
		this.type = type;
		this.index = index;
		this.currentCount = currentCount;
		this.typeId = typeId;
	}
	/**
	 * @return the typeId
	 */
	public Integer getTypeId() {
		return typeId;
	}
	/**
	 * @param typeId the typeId to set
	 */
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	
	
	
}
