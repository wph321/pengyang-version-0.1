/**
 * 
 */
package com.modle;

import java.io.Serializable;

/**
 * @author admin 2018年4月25日下午3:21:45
 */
public class Provinces implements Serializable {

	private int id;
	private String name;

	public Provinces(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Provinces() {
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
		return "provinces [id=" + id + ", name=" + name + "]";
	}

}
