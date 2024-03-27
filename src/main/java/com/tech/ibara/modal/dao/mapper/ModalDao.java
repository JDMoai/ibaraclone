package com.tech.ibara.modal.dao.mapper;

import java.util.List;

import com.tech.ibara.modal.dto.ModalCheckDto;


public interface ModalDao {
	List<ModalCheckDto> selectServiceItems(String m_type,String m_pname,String m_pexp,int m_pprice);
}
