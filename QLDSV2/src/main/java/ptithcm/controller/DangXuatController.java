package ptithcm.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DangXuatController {
	@RequestMapping("dangxuat")
	public String dangXuat(HttpServletResponse response, HttpServletRequest request) throws IOException {
		HttpSession ss = request.getSession();
		
		ss.invalidate();
		//response.sendRedirect(request.getContextPath()+ "/nhapdiem/nhap.htm");
		return "loginn";
	}
	@RequestMapping("nhapdiem/dangxuat")
	public String dangXuat1(HttpServletResponse response, HttpServletRequest request) throws IOException {
		HttpSession ss = request.getSession();

		response.sendRedirect(request.getContextPath()+ "/loginn.htm?logOut");
		return "loginn";
	}
	@RequestMapping("nhapdiem/nhap/dangxuat")
	public String dangXuat2(HttpServletResponse response, HttpServletRequest request) throws IOException {
		HttpSession ss = request.getSession();

		response.sendRedirect(request.getContextPath()+ "/loginn.htm?logOut");
		return "loginn";
	}
	@RequestMapping(value ="loginn.htm",params="logOut")
	public String dangXuat3(HttpServletResponse response, HttpServletRequest request) throws IOException {
		HttpSession ss = request.getSession();

		ss.invalidate();
		return "loginn";
	}
	
	// ve trang thong tin dang nhap
	@RequestMapping("nhapdiem/ttdn")
	public String veTTDN(HttpServletResponse response, HttpServletRequest request) throws IOException {
		HttpSession ss = request.getSession();

		response.sendRedirect(request.getContextPath()+ "/loginn.htm");
		return "loginn";
	}
	@RequestMapping("nhapdiem/nhap/ttdn")
	public String veTTDN1(HttpServletResponse response, HttpServletRequest request) throws IOException {
		HttpSession ss = request.getSession();

		response.sendRedirect(request.getContextPath()+ "/loginn.htm");
		return "loginn";
	}
}
