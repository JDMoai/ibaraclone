package com.tech.ibara.modal.dao.mapper;

import java.util.List;

import com.tech.ibara.modal.dto.CompleteInfoDto;
import com.tech.ibara.modal.dto.ModalCheckDto;
import com.tech.ibara.modal.dto.ModalCompleteDto;
import com.tech.ibara.modal.dto.NonMemberDto;


public interface ModalDao {

	List<ModalCheckDto> selectServiceItems(String m_type);

	void insertNonMember(NonMemberDto nonMemberDto);
	
	void updateModalComplete(ModalCompleteDto modalCompleteDto);

	CompleteInfoDto selectCompleteInfo(String phone);
<<<<<<< HEAD
=======

	ModalBoardDto getModalBoard(String email, String pw);
>>>>>>> 4872eb86d0c43a66ca5d2dfdbbde917c4fd6ee35
}
