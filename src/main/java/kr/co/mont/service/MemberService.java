package kr.co.mont.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import kr.co.mont.vo.MemberVO;

public interface MemberService {
	
	public String memberinput_ok(MemberVO mvo);
	public void check_userid(HttpServletRequest request, PrintWriter out);
}
