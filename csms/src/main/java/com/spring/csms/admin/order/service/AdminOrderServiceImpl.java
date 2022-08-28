package com.spring.csms.admin.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.csms.admin.order.dao.AdminOrderDao;

@Service
public class AdminOrderServiceImpl implements AdminOrderService {

	@Autowired
	private AdminOrderDao adminOrderDao;
	
	@Override
	public List<Map<String, Object>> getOrderList() throws Exception {
		return adminOrderDao.selectListOrder();
	}

}
