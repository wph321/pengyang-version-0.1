package com.pengyang.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.modle.CommunityHospital;
import com.modle.Provinces;
import com.modle.Superiorhospital;
import com.modle.User;
import com.modle.UserLogin;
import com.pengyang.service.ProvinceService;
import com.pengyang.service.UserLoginService;
import com.pengyang.service.UserService;
import com.request.entity.Login;
import com.request.entity.Regist;
import com.service.impl.CommunityHospitalServiceImpl;
import com.service.impl.SuperiorhospitalServiceImpl;

@Controller
@RequestMapping("/login")
public class LoginController {

	// @Autowired
	// @Resource
	// private AdminService adminService;
	@Autowired
	private UserLoginService uls;
	@Autowired
	private UserService userService;
	@Autowired
	private SuperiorhospitalServiceImpl shs;
	@Autowired
	private CommunityHospitalServiceImpl chs;
	@Autowired
	private ProvinceService ps;

	@RequestMapping("/doctor")
	public String checkLoging(Login login, HttpSession session, HttpServletResponse response) {
		// Admin admin = adminService.findAdminById(1);
		try {
			PrintWriter out = response.getWriter();
			String password = login.getPassword().toString();
			String username = login.getUsername().toString();
			UserLogin user = uls.findOne(username);
			// System.out.println(user);
			if (user.getPassword().equals(password)) {
				session.setAttribute("isLogin", "2");
				session.setAttribute("userloginname", user.getUserName());
				session.setAttribute("user", user);
				return "redirect:/index.jsp";
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// System.out.println("username:"+login.getUsername()+"
		// "+"password:"+login.getPassword());
		// System.out.println("isLogin:"+session.getAttribute("isLogin"));
		PrintWriter out;

		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/login.jsp";
	}

	// ajax验证登陆用户名是否存在
	@RequestMapping("/testusername")
	@ResponseBody
	public void ajaxUserName(String username, HttpServletResponse response, HttpServletRequest request) {
		try {
			JSONObject obj = new JSONObject();// 创建json对象
			PrintWriter out = response.getWriter();
			// System.out.println("ajax:"+username);
			int count = uls.findCount(username);// 在数据库中重复次数
			if (count > 0) { //“1”，存在用户，“0”用户不存在
				obj.put("info", "1"); // 将状态码放入json对象中
			} else {
				obj.put("info", "0");
			}
			out.print(obj); // 返回登陆界面json对象
//			System.out.println(count);
//			System.out.println(username);

		} catch (Exception ex) {
			System.out.println(ex);
		}
	}

	// 退出登陆，清空session
	@RequestMapping("/exit")
	public String exitSystem(HttpServletRequest req, HttpServletResponse res, HttpSession session) {

		session.removeAttribute("isLogin");// 删除登录状态
		session.removeAttribute("userloginname");// 删除session中登陆时保存的用户名

		return "redirect:/login.jsp";// 返回登陆界面
	}

	// 注册
	@RequestMapping("/regist")
	public String regist(Regist regist, HttpServletRequest request, HttpSession session) {
		User user = new User();
		user.setName(regist.getName());
		user.setHospital(regist.getHospital());
		user.setPassworld(regist.getPassword());
		user.setUsername(regist.getUsername());
		user.setHospital_sign(regist.getHospital_sign());
		session.setAttribute("regist_message", regist);
		System.out.println(regist);

		// 如果是上级医院，保存所属医院为上级医院
		if (regist.getHospital_sign().equals("0") || regist.getHospital_sign() == "0") {
			try {
				// 判断上级医院是否存在
				if (shs.count(regist.getHospital()) >= 1) {
					int id = shs.findId(regist.getHospital());
					Superiorhospital sh = new Superiorhospital();
					sh.setId(id);
					user.setSh(sh);
					userService.addUser(user);
				} else {
					Superiorhospital sh = new Superiorhospital();
					sh.setName(regist.getHospital());
					shs.add(sh);
					int id = shs.findId(regist.getHospital());
					sh.setId(id);
					user.setSh(sh);
					userService.addUser(user);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			// 否则保存为下级医院

			// 上级医院是否存在
			try {
				// 若上级医院存在
				if (shs.count(regist.getSuperiorhospital()) >= 1) {
					int id = shs.findId(regist.getSuperiorhospital());
					Superiorhospital sh = new Superiorhospital();
					CommunityHospital ch = new CommunityHospital();
					ch.setName(regist.getHospital());
					sh.setId(id);
					ch.setSh(sh);
					// 下级医院是否存在，存在
					if (chs.count(regist.getHospital()) >= 1) {
						ch.setId(chs.findId(regist.getHospital()));
						user.setCh(ch);
						user.setSh(sh);
						userService.addUser(user);
					} else {// 若下级医院不存在
						ch.setName(regist.getHospital());
						chs.add(ch);
						ch.setId(chs.findId(regist.getHospital()));
						user.setCh(ch);
						user.setSh(sh);
						userService.addUser(user);
					}
				} else {// 若上级医院不存在
					CommunityHospital ch = new CommunityHospital();
					ch.setName(regist.getHospital());
					Superiorhospital sh = new Superiorhospital();
					sh.setName(regist.getSuperiorhospital());
					shs.add(sh);
					if (chs.count(regist.getHospital()) >= 1) {// 若下级医院存在
						int id = shs.findId(regist.getSuperiorhospital());
						sh.setId(id);
						// ch.setSh(sh);
						// chs.add(ch);下级医院不添加
						ch.setId(chs.findId(regist.getHospital()));
						user.setCh(ch);
						user.setSh(sh);
						userService.addUser(user);
					} else {// 若下级医院不存在
						int id = shs.findId(regist.getSuperiorhospital());
						sh.setId(id);
						ch.setSh(sh);
						chs.add(ch);
						ch.setId(chs.findId(regist.getHospital()));
						user.setCh(ch);
						user.setSh(sh);
						userService.addUser(user);
					}

				}
			} catch (Exception e1) {
				// TODO Auto-generated cat ch block
				e1.printStackTrace();
			}
		}

		return "redirect:/welcome.jsp";
	}

	@RequestMapping("findprovince")
	public void findProvince(HttpServletResponse response, HttpServletRequest request, HttpSession session) {

		try {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			List<Provinces> provinceList = new ArrayList<>();
			provinceList = ps.findAll();
			JSONArray json = new JSONArray();
			for (Provinces p : provinceList) {
				JSONObject jo = new JSONObject();
				jo.put("id", p.getId());
				jo.put("name", p.getName());

				json.add(jo);
			}
//			 System.out.println(provinceList);
			 out.print(json);
			// return provinceList;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// return null;

	}
	
	@RequestMapping("findsh")
	public void findSuperHospitle(int id, HttpServletResponse response, HttpServletRequest request, HttpSession session) {
	
		try {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		List<Superiorhospital> shList = new ArrayList();
		shList=shs.findByPid(id);
		if(shList!=null && !shList.isEmpty()){
		JSONArray json = new JSONArray();
		for (Superiorhospital sh : shList) {
			JSONObject jo = new JSONObject();
			jo.put("id", sh.getId());
			jo.put("name", sh.getName());

			json.add(jo);
		}
		 out.print(json);
		}else{
			return;
		}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}