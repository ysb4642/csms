package com.spring.csms.common.dao;

import java.util.List;

import com.spring.csms.common.dto.ContactDto;

public interface CommonDao {

	public void insertContact(ContactDto contactDto) throws Exception;
	public List<ContactDto> selectListContact() throws Exception;
	public ContactDto selectOneContact(int contactCd) throws Exception;
	public void deleteContact(int[] deleteContactCdList) throws Exception;

}
