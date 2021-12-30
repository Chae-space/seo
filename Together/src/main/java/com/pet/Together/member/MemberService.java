package com.pet.Together.member;



import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;

	public void addMember(Member m) {
		mapper.insert(m);
	}

	public Member getMember(String id) {
		return mapper.select(id);
	}

	public void editMember(Member m) {
		mapper.update(m);
	}

	public void delMember(String id) {
		mapper.delete(id);
	}

	public void changePwd(Member m) {
		mapper.changePwd(m);
	}

	public ArrayList<Member> list() {
		return mapper.list();
	}


}
