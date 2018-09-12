/**
 * 
 */
package com.service.impl;

import java.util.List;



import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crud.dao.province_Dao;
import com.modle.Provinces;
import com.pengyang.service.ProvinceService;

/**
 * @author admin 2018年4月25日下午3:37:57
 */
@Service(value = "provinceService")
public class ProvincesServiceImpl implements ProvinceService {

	@Autowired
	private province_Dao pd;
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.pengyang.service.ProvinceService#findAll()
	 */
	@Override
	public List<Provinces> findAll() throws Exception {
		// TODO Auto-generated method stub
		return pd.findAll();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.pengyang.service.ProvinceService#findOne()
	 */
	@Override
	public Provinces findOne(int id) throws Exception {
		// TODO Auto-generated method stub
		return pd.findOne(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.pengyang.service.ProvinceService#add(com.modle.Provinces)
	 */
	@Override
	public void add(Provinces p) throws Exception {
		// TODO Auto-generated method stub
		pd.add(p);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.pengyang.service.ProvinceService#update(com.modle.Provinces)
	 */
	@Override
	public void update(Provinces p) throws Exception {
		// TODO Auto-generated method stub
		pd.update(p);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.pengyang.service.ProvinceService#delete(int)
	 */
	@Override
	public void delete(int id) throws Exception {
		// TODO Auto-generated method stub
		pd.delete(id);
	}

}
