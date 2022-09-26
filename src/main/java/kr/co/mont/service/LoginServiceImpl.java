package kr.co.mont.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.mont.mapper.LoginMapper;
import kr.co.mont.vo.MemberVO;

@Service
@Qualifier("ls")
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginMapper mapper;

	@Override
	public String login_ok(MemberVO mvo, HttpSession session) {
		MemberVO mvo2=mapper.login_ok(mvo);
		if(mvo2 != null)
		{
			session.setAttribute("userid", mvo2.getUserid());
			session.setAttribute("name", mvo2.getName());
			return "redirect:/main/index";
		}
		else
		{
			return "redirect:/login/login?err=1";
		}
	}

	@Override
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/index";
	}
	
	
	
	
	
	
}
