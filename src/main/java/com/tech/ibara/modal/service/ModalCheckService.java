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
        modalDao.updateModalComplete(modalCompleteDto);
    }
}
