package com.tech.ibara.modal.service;

import java.util.List;

import org.springframework.ui.Model;

import com.tech.ibara.modal.dto.ModalCheckDto;
import com.tech.ibara.modal.dto.NonMemberDto;

public interface ModalService {

	public List<ModalCheckDto> getServiceItems(String m_type);

	void insertNonMember(NonMemberDto nonMemberDto);

}
