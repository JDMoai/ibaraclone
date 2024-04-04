package com.tech.ibara.modal.dao.mapper;

import java.util.List;

import com.tech.ibara.modal.dto.ModalCheckDto;
import com.tech.ibara.modal.dto.NonMemberDto;


public interface ModalDao {
	List<ModalCheckDto> selectServiceItems(String m_type);
	String insertNonMember(NonMemberDto nonMemberDto);
}
