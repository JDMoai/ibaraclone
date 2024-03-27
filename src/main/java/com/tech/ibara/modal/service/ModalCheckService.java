package com.tech.ibara.modal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.modal.dao.mapper.ModalDao;
import com.tech.ibara.modal.dto.ModalCheckDto;

@Service
public class ModalCheckService implements ModalService{
	
	@Autowired
    private ModalDao modalDao;

    @Override
    public void getServiceItems(Model model) {
        List<ModalCheckDto> serviceItems = modalDao.selectServiceItems();
        model.addAttribute("serviceItems", serviceItems);
    }
}
