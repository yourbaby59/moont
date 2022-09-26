package kr.co.mont.mapper;

import kr.co.mont.vo.MemberVO;

public interface MemberMapper {

	public void memberinput_ok(MemberVO mvo);
	public int check_userid(String userid);
}
