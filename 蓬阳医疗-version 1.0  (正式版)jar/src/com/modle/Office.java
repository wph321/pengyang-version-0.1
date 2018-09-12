/**
 * 
 */
package com.modle;

import java.io.Serializable;

/**
 * @author admin 2018年4月27日下午5:43:48
 */
public class Office implements Serializable {

	private int id;

	private String name;
	
	public Office(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Office() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Office [id=" + id + ", name=" + name + "]";
	}

}
