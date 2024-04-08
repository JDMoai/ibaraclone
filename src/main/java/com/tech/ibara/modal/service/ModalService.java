package com.tech.ibara.modal.service;

import java.util.List;

import org.springframework.ui.Model;

import com.tech.ibara.modal.dto.ModalCheckDto;
import com.tech.ibara.modal.dto.ModalCompleteDto;
import com.tech.ibara.modal.dto.NonMemberDto;

public interface ModalService {
	

	public List<ModalCheckDto> getServiceItems(String m_type);

	public List<ModalCompleteDto> getModalComplete(String estino);
	
	public List<NonMemberDto> getNonMember(String phone);

	void insertNonMember(NonMemberDto nonMemberDto);
	
	void updateModalComplete(ModalCompleteDto modalCompleteDto);


}
