package com.pengyang.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.modle.Patients;
import com.pengyang.service.PatientsService;

/**
 * @author weipenghui 
 * @time 2018年9月11日下午2:51:18
 * @param zipPath #压缩文件绝对路径
 */

@Controller
@RequestMapping(value = "file")
public class FileComtroller {

	@Resource
	private PatientsService ps;

	private String zipPath;
	

	/**
	 * #以压缩文件形式导出
	 * 
	 * @param filePath
	 * @param fileName
	 * @param response
	 */
	@RequestMapping(value = "dowland")
	@ResponseBody
	public void downloadFile(int id, HttpServletRequest request, HttpServletResponse response) {

		response.setCharacterEncoding("utf-8");

		try {

			request.setCharacterEncoding("utf-8");
			String str = new String((request.getParameter("id")).getBytes("iso-8859-1"), "utf-8");
			int pat_id = Integer.parseInt(str);
			Patients patient = ps.findOne(pat_id);
			zipPath = zipAddress(patient.getPdf_path());

			if(zipPath==null||zipPath.equals("")){
				
				Writer out = response.getWriter();
				out.write("暂无文件可下载或没有文件上传");
			}
			File file = new File(zipPath);
			// 以流的形式下载文件。
			BufferedInputStream fis = new BufferedInputStream(new FileInputStream(file.getPath()));
			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();
			// 清空response
			response.reset();
			OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;filename=");
			toClient.write(buffer);
			toClient.flush();
			toClient.close();

		} catch (IOException ex) {
			ex.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * #获取zip文件具体地址
	 * 
	 * @param address #数据库中的地址
	 * @return #zip文件地址
	 */
	public String zipAddress(String address) {

		String str = address + "\\zip\\";
		File dir = new File(str);// 获取文件夹
		File[] files = dir.listFiles(); // 该文件目录下文件全部放入数组
		if (files != null) {
			for (int i = 0; i < files.length; i++) {
				String fileName = files[i].getName();

				if (files[i].isDirectory()) { // 判断是文件还是文件夹
					String strFileName = files[i].getPath(); // 获取文件绝对路径
					return strFileName;

				} else if (fileName.endsWith("zip")) { // 判断文件名是否以.zip结尾
					String strFileName = files[i].getPath();
					return strFileName;

				} else {
					continue;

				}
			}

		} else {
			return null;
		}
		return null;

	}

}
