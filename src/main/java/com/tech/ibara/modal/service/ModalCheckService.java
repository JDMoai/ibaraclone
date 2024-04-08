package com.tech.ibara.modal.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.modal.dao.mapper.ModalDao;
import com.tech.ibara.modal.dto.ModalCheckDto;
import com.tech.ibara.modal.dto.ModalCompleteDto;
import com.tech.ibara.modal.dto.NonMemberDto;

@Service
public class ModalCheckService implements ModalService{
			
	private ModalDao modalDao;
	
	@Autowired
	public ModalCheckService(ModalDao modalDao) {
		this.modalDao = modalDao;
	}

	@Override
    public List<ModalCheckDto> getServiceItems(String m_type) {
        return modalDao.selectServiceItems(m_type);
    }

	@Override
    public void insertNonMember(NonMemberDto nonMemberDto) {
        modalDao.insertNonMember(nonMemberDto);
    }
	

	@Override
    public void updateModalComplete(ModalCompleteDto modalCompleteDto) {
		//System.out.println("서비스m_addr: " + modalCompleteDto.getM_addr());
	    //System.out.println("서비스m_tel: " + modalCompleteDto.getM_tel());
		
        modalDao.updateModalComplete(modalCompleteDto);
    }

	@Override
	public ModalCompleteDto getModalCompleteByEstino(String estino) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NonMemberDto getNonMemberByPhone(String phone) {
		// TODO Auto-generated method stub
		return null;
	}
}
