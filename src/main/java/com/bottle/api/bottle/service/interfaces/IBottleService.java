package com.bottle.api.bottle.service.interfaces;

import java.util.List;

import com.bottle.api.bottle.vo.BottleVO;

public interface IBottleService {
	List<BottleVO> selectAll();
	public boolean isBottleExisted_ByIdentifier(final String identifier);
	public void removeCacheByPhoneNumber(final long phoneNumber);
}