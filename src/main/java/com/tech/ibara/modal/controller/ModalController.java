package com.tech.ibara.modal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.ibara.modal.dao.mapper.ModalDao;
import com.tech.ibara.modal.dto.ModalCheckDto;
import com.tech.ibara.modal.dto.ModalCompleteDto;
import com.tech.ibara.modal.dto.NonMemberDto;
import com.tech.ibara.modal.service.ModalCheckService;
import com.tech.ibara.modal.service.ModalService;

@Controller
public class ModalController {
	
	
	private ModalService modalService;
	
	
	
	@RequestMapping("/modal/mMain")
	public String mMain(Model model) {

		return "/modal/mMain";
	}

	@RequestMapping("/modal/mSize")
	public String mSize(Model model) {

		return "/modal/mSize";
	}

	@RequestMapping("/modal/mServiceCheck")
    public String mServiceCheck(HttpServletRequest request, Model model) {
	
   
        return "/modal/mServiceCheck";
    }
	@RequestMapping("/modal/mAsk")
	public String mAsk(HttpServletRequest request, Model model) {
		
		
		return "/modal/mAsk";
	}
	@RequestMapping("/modal/mInfo")
	public String mInfo(HttpServletRequest request, Model model) {
		
		
		return "/modal/mInfo";
	}
	
	@Autowired
    public ModalController(ModalService modalService) {
        this.modalService = modalService;
    }

	@GetMapping("/modal/getServiceItems")
	@ResponseBody
	public List<ModalCheckDto> getServiceItems(@RequestParam("m_type") String m_type) {
		System.out.println("getServiceItems");
	    return modalService.getServiceItems(m_type);
	}
	@PostMapping("/modal/insertNonMember")
	@ResponseBody
	public void insertNonMember(NonMemberDto nonMemberDto) {
		
		System.out.println("insertNonMember컨트롤러");
	    modalService.insertNonMember(nonMemberDto);
	    // 리다이렉트 또는 다른 처리 로직 추가
	}
	
	@PostMapping("/modal/updateModalComplete")
	@ResponseBody
	public void updateModalComplete(ModalCompleteDto modalCompleteDto) {
		System.out.println("updateModalComplete컨트롤러");
		System.out.println("========================");		
		System.out.println("Received modalCompleteDto: " + modalCompleteDto);
	    System.out.println("Estino: " + modalCompleteDto.getEstino());
	    System.out.println("M_addr: " + modalCompleteDto.getM_addr());
	    System.out.println("M_tel: " + modalCompleteDto.getM_tel());
	    System.out.println("m_content: " + modalCompleteDto.getM_content());
	    System.out.println("m_size: " + modalCompleteDto.getM_size());
	    System.out.println("m_request: " + modalCompleteDto.getM_request());
	    System.out.println("m_price: " + modalCompleteDto.getM_price());
	    System.out.println("m_wanttime: " + modalCompleteDto.getM_wanttime());
	    System.out.println("m_wantdate: " + modalCompleteDto.getM_wantdate());
	    System.out.println("m_circs: " + modalCompleteDto.getM_circs());
	    System.out.println("m_place: " + modalCompleteDto.getM_place());
	    modalService.updateModalComplete(modalCompleteDto);
	}
}
