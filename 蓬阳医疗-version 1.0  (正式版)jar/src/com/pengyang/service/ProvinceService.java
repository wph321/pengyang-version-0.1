/**
 * 
 */
package com.pengyang.service;

import java.util.List;

import com.modle.Provinces;

/**
 * @author wph 2018年4月25日下午3:33:53
 */
public interface ProvinceService {

	public List<Provinces> findAll() throws Exception;

	public Provinces findOne(int id) throws Exception;

	public void add(Provinces p) throws Exception;

	public void update(Provinces p) throws Exception;

	public void delete(int id) throws Exception;

}
