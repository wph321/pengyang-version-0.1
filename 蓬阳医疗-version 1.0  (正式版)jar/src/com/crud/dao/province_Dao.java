/**
 * 
 */
package com.crud.dao;

import java.util.List;

import com.modle.Provinces;

/**
 * @author admin 2018年4月25日下午3:23:24
 */
public interface province_Dao {

	public List<Provinces> findAll() throws Exception;

	public Provinces findOne(int id) throws Exception;

	public void add(Provinces p) throws Exception;

	public void update(Provinces p) throws Exception;

	public void delete(int id) throws Exception;

}
