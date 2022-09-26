package kr.co.mont.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mont.service.LoginService;
import kr.co.mont.vo.MemberVO;

@Controller
public class LoginController {

	@Autowired
	@Qualifier("ls")
	private LoginService service;
	
	@RequestMapping("/login/login")
	public String login(HttpServletRequest request, Model model)
	{
		model.addAttribute("err",request.getParameter("err"));
		return "/login/login";
	}
	
	@RequestMapping("/login/login_ok")
	public String login_ok(MemberVO mvo, HttpSession session)
	{
		return service.login_ok(mvo,session);
	}
	
	@RequestMapping("/login/logout")
	public String logout(HttpSession session)
	{
		return service.logout(session);
	}
	
	
}
