package com.watt.framework.home.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.watt.framework.common.util.NavigationPref;
import com.watt.framework.common.util.PageResult;
import com.watt.framework.common.util.Pager;
import com.watt.framework.home.constant.WattConstant;
import com.watt.framework.home.domain.Project;
import com.watt.framework.home.domain.Supporter;
import com.watt.framework.home.domain.User;
import com.watt.framework.home.dto.ProjectDto;
import com.watt.framework.home.dto.ProjectFocusDto;
import com.watt.framework.home.service.IProjectFocusService;
import com.watt.framework.home.service.IProjectService;
import com.watt.framework.home.service.IUserService;

@Controller
public class ProjectController {

	@Autowired
    private IProjectService projectService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IProjectFocusService projectFocusService;
	
	private Gson gson = new Gson();
	
    @ResponseBody
    @RequestMapping(value = "/addAttention.watt")
    public Map<String, Object> addAttention(HttpServletRequest request, ProjectDto projectDto){
    	Map<String, Object> map = new HashMap<String, Object>();
    	this.projectService.addAttention(projectDto.getId());
    	Object object = request.getSession().getAttribute("user");
    	if(object != null){
    		User user = (User)object;
    		ProjectFocusDto projectFocusDto = new ProjectFocusDto();
    		projectFocusDto.setUser_Id(user.getId());
    		projectFocusDto.setProject_id(projectDto.getId());
    		this.projectFocusService.addProjectFous(projectFocusDto);
    	}
    	map.put("status", "1");
    	map.put("info", "出错啦");
        return map;
    }
    
    @ResponseBody
    @RequestMapping(value = "/listProject.watt")
    public Map<String, Object> listProject(HttpServletRequest request,ProjectDto projectDto, NavigationPref pref) throws Exception{
    	
    	Object object = request.getSession().getAttribute("user");
    	if(object != null){
    		User user = (User)object;
    		projectDto.setLoginId(user.getId().toString());
    	}
    	projectDto.setStatus(WattConstant.STATUS_4);
    	PageResult<ProjectDto> result = projectService.listProject(projectDto, pref);
        Map<String, Object> map = new HashMap<String, Object>();
        Pager pager = result.getPager();
        map.put("list", result.getResult());
        map.put("total", pager.getTotalSize());
        map.put("pageSize", pager.getPageSize());
        map.put("totalPage", pager.getTotalPages());
        return map;
    }
    
    //发起鉴定
    @RequestMapping(value = "/project-add.watt")
    public String projectAdd(HttpServletRequest request){
    	Object object = request.getSession().getAttribute("user");
    	if(object != null){
    		User user = (User)object;
    		user = this.userService.findById(user.getId());
    		request.setAttribute("user", user);
    		return "project-add";
    	}
    	return "redirect:user-login.watt";
    }
    
    //提交审核
    @ResponseBody
    @RequestMapping(value = "/project-save.watt")
    public Map<String, Object> saveProject(HttpServletRequest request,ProjectDto projectDto){
    	Map<String, Object> map = new HashMap<String, Object>();
    	try{
    		Object object = request.getSession().getAttribute("user");
        	if(object != null){
        		User user = (User)object;
        		user = this.userService.findById(user.getId());
        		projectDto.setUserId(user.getId());
        		projectDto.setStatus(WattConstant.STATUS_0);
        		this.projectService.saveProject(projectDto);
        		map.put("info", "保存草稿成功");
        		map.put("status", "1");
        		map.put("url", "home-build_deal.watt");
        	}else{
        		map.put("status", "-1");
        		map.put("errorMes", "保存草稿失败:会话过期,请重新登录");
        	}
    	}catch(Exception ex){
    		map.put("status", "-1");
    		map.put("errorMes", "保存草稿失败");
    	}
        return map;
    }
    
    //保存草稿
    @ResponseBody
    @RequestMapping(value = "/project-update.watt")
    public Map<String, Object> updateProject(HttpServletRequest request,ProjectDto projectDto){
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	try{
    		Object object = request.getSession().getAttribute("user");
        	if(object != null){
        		User user = (User)object;
        		user = this.userService.findById(user.getId());
        		projectDto.setUserId(user.getId());
        		projectDto.setStatus(WattConstant.STATUS_0);
        		this.projectService.updateProject(projectDto);
        		map.put("info", "保存草稿成功");
        		map.put("status", "1");
        		map.put("url", "home-build_deal.watt");
        	}else{
        		map.put("status", "-1");
        		map.put("errorMes", "操作失败:会话过期,请重新登录");
        	}
    	}catch(Exception ex){
    		map.put("status", "-1");
    		map.put("errorMes", "保存草稿成功失败");
    	}
        return map;
    }
    
    //提交申请
    @ResponseBody
    @RequestMapping(value = "/project-send.watt")
    public Map<String, Object> sendProject(HttpServletRequest request,ProjectDto projectDto){
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	try{
    		Object object = request.getSession().getAttribute("user");
        	if(object != null){
        		User user = (User)object;
        		user = this.userService.findById(user.getId());
        		projectDto.setUserId(user.getId());
        		this.projectService.applyProject(projectDto);
        		map.put("info", "提交申请成功");
        		map.put("url", "home-build_deal.watt");
        		map.put("status", "1");
        	}else{
        		map.put("status", "-1");
        		map.put("errorMes", "操作失败:会话过期,请重新登录");
        	}
    	}catch(Exception ex){
    		map.put("status", "-1");
    		map.put("errorMes", "提交申请失败");
    	}
        return map;
    }
    
    @ResponseBody
    @RequestMapping(value = "/project-pass.watt")
    public Map<String, Object> projectPass(HttpServletRequest request,ProjectDto projectDto){
    	Map<String, Object> map = new HashMap<String, Object>();
    	try{
    		this.projectService.passProject(projectDto.getId());
    		map.put("status", "1");
    		map.put("jump", "home-verify_deal.watt");
    		map.put("info", "审核成功");
    	}catch(Exception ex){
    		map.put("status", "-1");
    		map.put("info", "出错啦");
    	}
    	return map;
    }
    
    @ResponseBody
    @RequestMapping(value = "/project-reject.watt")
    public Map<String, Object> projectReject(HttpServletRequest request,ProjectDto projectDto){
    	Map<String, Object> map = new HashMap<String, Object>();
    	try{
    		this.projectService.rejectProject(projectDto.getId());
    		map.put("status", "1");
    		map.put("jump", "home-verify_deal.watt");
    		map.put("info", "驳回成功");
    	}catch(Exception ex){
    		map.put("status", "-1");
    		map.put("info", "出错啦");
    	}
    	return map;
    }
    
    /**
     * 项目详情
     * @param request
     * @param projectDto
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/deal-show.watt")
    public String dealProject(HttpServletRequest request, ProjectDto projectDto) throws Exception{
    	this.getDealInfo(request, projectDto);
        return "deal-show";
    }
    
    @SuppressWarnings("unchecked")
	private void getDealInfo(HttpServletRequest request, ProjectDto projectDto) throws Exception{
    	Object object = request.getSession().getAttribute("user");
    	if(object != null){
    		User user = (User)object;
    		projectDto.setLoginId(user.getId().toString());
    	}
    	
    	Map<String, Object> map = this.projectService.getDeal(projectDto);
    	request.setAttribute("supporterCopies", Integer.parseInt(map.get("supporterCopies").toString()));
    	request.setAttribute("suppoter", Integer.parseInt(map.get("supporter").toString()));
    	request.setAttribute("project", (ProjectDto)map.get("project"));
    	request.setAttribute("listSuppoter", (List<Supporter>)map.get("listSupporter"));
    	request.setAttribute("user", (User)map.get("user"));
    }
    /**
     * 项目详情支持者
     * @param request
     * @param projectDto
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/deal-supporter.watt")
    public String dealProjectSupporter(HttpServletRequest request, ProjectDto projectDto) throws Exception{
    	this.getDealInfo(request, projectDto);
        return "deal-supporter";
    }
    
    @RequestMapping(value = "/project-edit.watt")
    public String projectEdit(HttpServletRequest request,@RequestParam("id") Long id){
    	Project project = this.projectService.findProjectById(id);
    	request.setAttribute("project", project);
        return "project-edit";
    }
    
    @RequestMapping(value = "/project-verify.watt")
    public String projectVerify(HttpServletRequest request,@RequestParam("id") Long id){
    	Object object = request.getSession().getAttribute("user");
    	if(object != null){
    		Project project = this.projectService.findProjectById(id);
        	request.setAttribute("project", project);
            return "project-verify"; 
    	}
    	return "user-login";
    }
    
    @RequestMapping(value = "/project-success.watt")
    public String projectSuccess(HttpServletRequest request){
        return "project-success";
    }
    
    @ResponseBody
    @RequestMapping(value = "/fileUpload.watt")
	public String fileUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("image_file") MultipartFile image_file)
			throws Exception {
    	
    	response.setContentType("text/html;charset=UTF-8");
    	
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		if (image_file.isEmpty()) {
		}
		String fileName = image_file.getOriginalFilename();
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		File uploadFile = new File(uploadPath + "/" + fileName);
		image_file.transferTo(uploadFile);// 上传
		jsonMap.put("status", 1);
		
		jsonMap.put("thumb_url", "upload/"+fileName);
		jsonMap.put("url", "upload/"+fileName);
		return gson.toJson(jsonMap);
	}
}
