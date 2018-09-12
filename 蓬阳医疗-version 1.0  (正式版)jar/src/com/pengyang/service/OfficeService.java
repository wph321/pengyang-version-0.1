/**
 * 
 */
package com.pengyang.service;

import java.util.List;

import com.modle.Office;

/**
 * @author admin 2018年4月28日上午10:39:51
 */
public interface OfficeService {

	public List<Office> findAll() throws Exception;

	public Office findById(int id) throws Exception;

	public void add(Office office) throws Exception;

	public void update(Office office) throws Exception;

	public void delete(int id) throws Exception;

}
