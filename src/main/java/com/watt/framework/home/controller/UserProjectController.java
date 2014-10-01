package com.watt.framework.home.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.watt.framework.home.constant.WattConstant;
import com.watt.framework.home.domain.Project;
import com.watt.framework.home.domain.Supporter;
import com.watt.framework.home.domain.User;
import com.watt.framework.home.dto.ProjectDto;
import com.watt.framework.home.dto.SupporterDto;
import com.watt.framework.home.service.IProjectFocusService;
import com.watt.framework.home.service.IProjectService;
import com.watt.framework.home.service.ISupporterService;
import com.watt.framework.home.service.IUserService;

/**
 * 用户项目
 * @author JIAYUAN
 *
 */
@Controller
public class UserProjectController {

	@Autowired
	private IUserService userService;
	
	@Autowired
	private IProjectFocusService projectFocusService;
	
	@Autowired
	private IProjectService projectService;
	
	@Autowired
	private ISupporterService supporterService;
	
	private static final String BTN_RED_H20 = "btn-red-h20";
	private static final String BTN_GRAY_H20 = "btn-gray-h20";
	
	@RequestMapping(value = "/home-focus.watt")
    public String projectAdd(HttpServletRequest request) throws Exception{
		Object object = request.getSession().getAttribute("user");
    	if(object != null){
    		User user = (User)object;
    		request.setAttribute("listProjectFocus", this.projectFocusService.listProjectFocusByUserId(user.getId()));
    		request.setAttribute("countSupporter", this.supporterService.countSupporterByUserId(user.getId()));
    		request.setAttribute("countFocus", this.projectFocusService.countProjectFocusByUserId(user.getId()));
    		request.setAttribute("countProject", this.projectService.countProjectByUserId(user.getId()));
    		return "home-focus";
    	}
    	return "user-login";
    }
	
	@ResponseBody
    @RequestMapping(value = "/home-cancel_like.watt")
    public Map<String, Object> homeCancalLike(HttpServletRequest request,@RequestParam("id") Long id){
    	Map<String, Object> map = new HashMap<String, Object>();
    	this.projectFocusService.removeProjectFocus(id);
    	map.put("status", "1");
        return map;
    }
	
	@ResponseBody
    @RequestMapping(value = "/project-release.watt")
    public Map<String, Object> homeRelease(HttpServletRequest request,@RequestParam("id") Long id){
    	Map<String, Object> map = new HashMap<String, Object>();
    	try{
    		Object object = request.getSession().getAttribute("user");
        	if(object != null){
        		User user = (User)object;
        		this.projectService.releaseProject(id, user.getId());
        		map.put("status", "1");
            	map.put("info", "项目发布成功");
        		map.put("url", "home-build_deal.watt");
        	}else{
        		map.put("status", "-1");
        		map.put("errorMes", "操作失败:会话过期,请重新登录");
        	}
    	}catch(Exception ex){
    		map.put("status", "-1");
    		map.put("errorMes", "项目发布失败");
    	}
    	
        return map;
    }
	
	@RequestMapping(value = "/home-build_deal.watt")
    public String homeBuildDeal(HttpServletRequest request) throws Exception{
		Object object = request.getSession().getAttribute("user");
    	if(object != null){
    		User user = (User)object;
    		List<Project> listProject = this.projectService.listProjectByUserId(user.getId());
    		user = this.userService.findById(user.getId());
    		request.setAttribute("listProject", listProject);
    		request.setAttribute("countSupporter", this.supporterService.countSupporterByUserId(user.getId()));
    		request.setAttribute("countFocus", this.projectFocusService.countProjectFocusByUserId(user.getId()));
    		request.setAttribute("countProject", this.projectService.countProjectByUserId(user.getId()));
    		request.setAttribute("user", user);
    		return "home-build_deal";
    	}
    	return "user-login";
    }
	
	@RequestMapping(value = "/home-support.watt")
    public String homeSupport(HttpServletRequest request) throws Exception{
		request.setAttribute("all", UserProjectController.BTN_RED_H20);
		request.setAttribute("pay", UserProjectController.BTN_GRAY_H20);
		request.setAttribute("unpay", UserProjectController.BTN_GRAY_H20);
		return this.support(request, "");
    }
	
	@RequestMapping(value = "/home-support-pay.watt")
    public String homeSupportPay(HttpServletRequest request) throws Exception{
		request.setAttribute("all", UserProjectController.BTN_GRAY_H20);
		request.setAttribute("pay", UserProjectController.BTN_RED_H20);
		request.setAttribute("unpay", UserProjectController.BTN_GRAY_H20);
		return this.support(request, WattConstant.ORDER_2);
    }
	
	@RequestMapping(value = "/home-support-unpay.watt")
    public String homeSupportUnpay(HttpServletRequest request) throws Exception{
		request.setAttribute("all", UserProjectController.BTN_GRAY_H20);
		request.setAttribute("pay", UserProjectController.BTN_GRAY_H20);
		request.setAttribute("unpay", UserProjectController.BTN_RED_H20);
		return this.support(request, WattConstant.ORDER_1);
    }
    
	private String support(HttpServletRequest request, final String status) throws Exception{
		Object object = request.getSession().getAttribute("user");
    	if(object != null){
    		User user = (User)object;
    		List<SupporterDto> listSupporter = this.supporterService.getSupporterByUserId(user.getId(), status);
    		user = this.userService.findById(user.getId());
    		request.setAttribute("listSupporter", listSupporter);
    		request.setAttribute("countSupporter", this.supporterService.countSupporterByUserId(user.getId()));
    		request.setAttribute("countFocus", this.projectFocusService.countProjectFocusByUserId(user.getId()));
    		request.setAttribute("countProject", this.projectService.countProjectByUserId(user.getId()));
    		request.setAttribute("user", user);
    		return "home-support";
    	}
    	return "user-login";
	}
	
    @RequestMapping(value = "/home-verify_deal.watt")
    public String verifyProject(HttpServletRequest request){
    	Object object = request.getSession().getAttribute("user");
    	if(object != null){
    		User user = (User)object;
    		List<ProjectDto> listProject = this.projectService.listProjectByStatus(WattConstant.STATUS_1);
    		user = this.userService.findById(user.getId());
    		request.setAttribute("listProject", listProject);
    		if(listProject!=null && listProject.size() > 0){
    			request.setAttribute("projectSize", "Y");
    		}
    		request.setAttribute("countProject", this.projectService.countProjectByStatus(WattConstant.STATUS_1));
    		request.setAttribute("user", user);
    		return "home-verify_deal";
    	}
    	return "user-login";
    }
    
    @RequestMapping(value = "/cart-pay.watt")
    public String cartPay(HttpServletRequest request, @RequestParam("id") Long id) throws Exception{
    	Object object = request.getSession().getAttribute("user");
    	if(object != null){
    		User user = (User)object;
    		SupporterDto supporterDto = new SupporterDto();
    		supporterDto.setProject_id(id);
    		supporterDto.setUser_id(user.getId());
    		supporterDto.setCopies(1);
    		supporterDto.setStatus(WattConstant.ORDER_1);
    		supporterDto.setBuy_date(new Date());
    		Supporter supporter = this.supporterService.saveSupporter(supporterDto);
    		return "redirect:/user-cart-pay.watt?id="+supporter.getId(); 
    	}
    	return "user-login";
    }
    
    @RequestMapping(value = "/user-cart-pay.watt")
    public String getUserProjectCaryPay(HttpServletRequest request, @RequestParam("id") Long id) throws Exception{
    	Object object = request.getSession().getAttribute("user");
    	if(object != null){
    		Map<String, Object> map = this.supporterService.getUserProjectCaryPay(id);
    		Supporter supporter = (Supporter)map.get("supporter");
    		Project project = (Project)map.get("project");
    		User user = (User)map.get("user");
    		request.setAttribute("supporter", supporter);
    		request.setAttribute("project", project);
    		request.setAttribute("user", user);
    		return "cart-pay";
    	}
    	return "user-login";
    }
}
