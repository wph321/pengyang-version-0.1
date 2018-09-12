/**
 * 
 */
package com.crud.dao;

import java.util.List;

import com.modle.Office;

/**
 * @author wph
 * 2018年4月27日下午5:56:25
 */
public interface Office_Dao {

	public List<Office> findAll() throws Exception;
	
	public Office findById(int id) throws Exception;
	
	public void add(Office office) throws Exception;
	
	public void update(Office office) throws Exception;
	
	public void delete(int id) throws Exception;
	
}
