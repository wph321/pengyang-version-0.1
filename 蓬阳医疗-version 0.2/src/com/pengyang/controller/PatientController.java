package com.pengyang.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.modle.Patients;
import com.pengyang.service.PatientsService;

@Controller
@RequestMapping("patient")
public class PatientController {

	
	@Resource
	private PatientsService ps;
	
	@RequestMapping("/show")
	public String showPatient(int page,HttpServletRequest request){
		
		
		try {
			int patientCount = ps.patientCount();
			int patientpageNum = ps.pageNumber();
			List<Patients> paList = ps.pageFindAll(page);
//			for(Patients patient : paList){
//				System.out.println(patient.getPat_id());
//			}
			request.setAttribute("paList", paList);
			request.setAttribute("patientCount", patientCount);
			request.setAttribute("pagenum", patientpageNum);
			request.setAttribute("nowPage", page);			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "user-list";
	}
	
	
	@RequestMapping("/baogao")
	public String showBaoGao(String fileAddress,HttpServletRequest request,HttpServletResponse response){
			String str;
			try {
				str = new String((request.getParameter("fileAddress")).getBytes("iso-8859-1"),"utf-8");
				int id = Integer.parseInt(str);
				
				try {
					Patients patient = ps.findOne(id);

					fileAddress = patient.getPdf_path();
					pdfStreamHandeler(fileAddress,request,response);
					ServletOutputStream out = response.getOutputStream();
					out.close();
					out.flush();
					System.out.println(patient);
					request.setAttribute("file", fileAddress);
					return "web/viewer";
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		return "web/viewer";
	}

	@RequestMapping("findByNameOrNum")
	public String findByNameOrNum(String mess,int page,HttpServletRequest request){
		
		request.setAttribute("mess", mess);
		
		//如果是姓名
//			if(!isStr2Num(mess)){ 
		try {
			
			Map paMap = ps.findByname(mess,page);
			
			List<Patients> paList = (List<Patients>) paMap.get("patient");
			
			int patientpageNum = (int) paMap.get("allpage");
			int count = (int) paMap.get("count");
			
			if(count==0){
				System.out.println("没有一条符合'"+mess+"'条件的数据");
				request.setAttribute("search", "search");
				request.setAttribute("patientCount", 0);
				request.setAttribute("returnMess", " 没有一条符合'"+mess+"'条件的数据,请重新输入查询,或刷新返回首页");
				request.setAttribute("pagenum", 1);
				request.setAttribute("paList", null);
				request.setAttribute("nowPage", 1);
				request.setAttribute("mess", mess);
				request.setAttribute("refresh", "/test/patient/show.do?page=1");
				return "user-list";
			}
			request.setAttribute("search", "search");
			request.setAttribute("patientCount", count);
			request.setAttribute("paList", paList);
			request.setAttribute("pagenum", patientpageNum);
			request.setAttribute("nowPage", page);
			request.setAttribute("mess", mess);
			request.setAttribute("refresh", "/test/patient/findByNameOrNum.do?mess="+mess+"&page="+page);
			return "user-list";
		} catch (Exception e) {
			// TODO Auto-generated catch block
		}
		
		//如果是医疗号
//			}else{
//		int num = Integer.parseInt(mess);
//		try {
//			Patients patient = ps.findOne(num);
//			if(patient==null){
//					
//					request.setAttribute("search", "search");
//					request.setAttribute("patientCount", 0);
//					request.setAttribute("pagenum", 1);
//					request.setAttribute("paList", null);
//					request.setAttribute("nowPage", 1);	
//					request.setAttribute("returnMess", "没有一条符合条件的数据,,请重新输入查询,或刷新返回首页");
//					request.setAttribute("mess", mess);
//					request.setAttribute("refresh", "/test/patient/show.do?page=1");
//					return "user-list";
//			}
//			List<Patients> paList = new ArrayList();
//			paList.add(patient);
//			request.setAttribute("search", "search");
//			request.setAttribute("paList", paList);
//			request.setAttribute("patientCount", 1);
//			request.setAttribute("pagenum", 1);
//			request.setAttribute("nowPage", 1);	
//			request.setAttribute("mess", mess);
//			request.setAttribute("refresh", "/test/patient/findByNameOrNum.do?mess="+mess+"&page="+page);
//			return "user-list";
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			}
//				}
		return null;
		
	}
	
	/** 
	* 查看一个字符串是否可以转换为数字 
	* @param str 字符串 
	* @return true 可以; false 不可以 
	*/  
	public static boolean isStr2Num(String str) {   
	  
		try {  
		    Integer.parseInt(str);  
		    return true;  
		} catch (NumberFormatException e) {  
		    return false;  
		}  
	}  
	
//	读取pdf输入流方法
	public void pdfStreamHandeler(String filePath, HttpServletRequest request, HttpServletResponse response) {
        File file = new File(filePath);
        byte[] data = null;
        try {
            FileInputStream input = new FileInputStream(file);
            
            data = new byte[input.available()];
            input.read(data);
            try{
            response.getOutputStream().write(data);
            }catch(Exception e){
            	
            }finally{
            input.close();
            }
        } catch (Exception e) {
        	
        }

    }
	
}
