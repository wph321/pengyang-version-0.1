/**
 * 
 */
package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crud.dao.Office_Dao;
import com.modle.Office;
import com.pengyang.service.OfficeService;

/**
 * @author admin
 * 2018年4月28日上午10:48:35
 */
@Service(value="officeService")
public class OfficeServiceImpl implements OfficeService {

	@Autowired
	private Office_Dao od;

	/* (non-Javadoc)
	 * @see com.pengyang.service.OfficeService#findAll()
	 */
	@Override
	public List<Office> findAll() throws Exception {
		// TODO Auto-generated method stub
		return od.findAll();
	}

	/* (non-Javadoc)
	 * @see com.pengyang.service.OfficeService#findById(int)
	 */
	@Override
	public Office findById(int id) throws Exception {
		// TODO Auto-generated method stub
		return od.findById(id);
	}

	/* (non-Javadoc)
	 * @see com.pengyang.service.OfficeService#add(com.modle.Office)
	 */
	@Override
	public void add(Office office) throws Exception {
		// TODO Auto-generated method stub
		od.add(office);
	}

	/* (non-Javadoc)
	 * @see com.pengyang.service.OfficeService#update(com.modle.Office)
	 */
	@Override
	public void update(Office office) throws Exception {
		// TODO Auto-generated method stub
		od.update(office);
	}

	/* (non-Javadoc)
	 * @see com.pengyang.service.OfficeService#delete(int)
	 */
	@Override
	public void delete(int id) throws Exception {
		// TODO Auto-generated method stub
		od.delete(id);
	}
	
	
}
