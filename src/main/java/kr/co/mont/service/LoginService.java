package kr.co.mont.service;

import javax.servlet.http.HttpSession;

import kr.co.mont.vo.MemberVO;

public interface LoginService {
	
	public String login_ok(MemberVO mvo, HttpSession session);
	public String logout(HttpSession session);
}
