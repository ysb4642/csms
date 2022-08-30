package com.spring.csms.member.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.csms.member.dao.MemberDao;
import com.spring.csms.member.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public String checkDuplicatedId(String memberId) throws Exception {
		if (memberDao.selectDuplicatedId(memberId) == null)
				return "notDuplicated";
		return "duplicated";
	}

	@Override
	public void addMember(MemberDto memberDto) throws Exception {
		memberDto.setPasswd(bCryptPasswordEncoder.encode(memberDto.getPasswd()));
		if (memberDto.getEmailstsYn() == null)  memberDto.setEmailstsYn("N");
		if (memberDto.getSmsstsYn() == null)    memberDto.setSmsstsYn("N");
		memberDao.insertMember(memberDto);
	}

	@Override
	public boolean login(MemberDto memberDto) throws Exception {
		
		MemberDto checkExsistId = memberDao.selectLogin(memberDto);
		
		if (checkExsistId != null) {
			if (bCryptPasswordEncoder.matches(memberDto.getPasswd(), checkExsistId.getPasswd())) {
				return true;
			}
		}
		return false;
	}

}
