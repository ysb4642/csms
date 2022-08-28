package com.spring.csms.common.service;

import java.util.List;

import com.spring.csms.common.dto.ContactDto;

public interface CommonService {

	public void addNewContact(ContactDto contactDto) throws Exception;
	public List<ContactDto> getContactList() throws Exception;
	public ContactDto getContactDetail(int contactCd) throws Exception;
	public void removeContact(int[] deleteContactCdList) throws Exception;

}
