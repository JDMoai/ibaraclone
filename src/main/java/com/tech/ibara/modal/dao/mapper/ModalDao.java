package com.tech.ibara.modal.dao.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tech.ibara.modal.dto.ModalCheckDto;

@Repository
public interface ModalDao {
	List<ModalCheckDto> selectServiceItems();
}
