package com.pengyang.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.modle.UserLogin;
import com.pengyang.service.UserLoginService;
import com.request.entity.Login;

@Controller
@RequestMapping("/login")
public class LoginController {

//	@Autowired
//	@Resource
//	private AdminService adminService;
	@Autowired
	private UserLoginService uls;
	
	@RequestMapping("/doctor")
	public String checkLoging(Login login,HttpSession session,HttpServletResponse response){
//		Admin admin = adminService.findAdminById(1);
		try {
			PrintWriter out = response.getWriter();
			String password = login.getPassword().toString();
			String username = login.getUsername().toString();
			UserLogin user = uls.findOne(username);
//			System.out.println(user); 
				if(user.getPassword().equals(password)){
					session.setAttribute("isLogin", "2");
					session.setAttribute("userloginname", user.getUserName());
					return "redirect:/index.jsp";
				}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		System.out.println("username:"+login.getUsername()+"     "+"password:"+login.getPassword());
//		System.out.println("isLogin:"+session.getAttribute("isLogin"));
		PrintWriter out;
	
			try {
				out = response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		return "redirect:/login.jsp";
	}
	
//	ajax验证登陆用户名是否存在
	@RequestMapping("/testusername")
	@ResponseBody
	public void ajaxUserName(String username,HttpServletResponse response,HttpServletRequest request){  
        try{  
            JSONObject obj=new JSONObject();//创建json对象  
            PrintWriter out = response.getWriter();
//            System.out.println("ajax:"+username);
            int count = uls.findCount(username);//在数据库中重复次数  
            if(count > 0){  //登录状态“1”，存在用户，“2”用户不存在
                obj.put("info", "1");  //将状态码放入json对象中
            }else{  
                obj.put("info", "0"); 
            }  
            System.out.println(obj.getString("info"));
             out.print(obj);  //返回登陆界面json对象
              
        }catch(Exception ex){  
            System.out.println(ex);  
        }  
    }  

//退出登陆，清空session
	@RequestMapping("/exit")
public String  exitSystem(HttpServletRequest req,HttpServletResponse res,HttpSession session){

	session.removeAttribute("isLogin");//删除登录状态
	session.removeAttribute("userloginname");//删除session中登陆时保存的用户名
	
	return "redirect:/login.jsp";//返回登陆界面
}
}