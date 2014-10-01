package com.watt.framework.home.controller;

import java.io.File;
import java.util.HashMap;
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
import com.watt.framework.home.constant.WattConstant;
import com.watt.framework.home.domain.User;
import com.watt.framework.home.dto.ProjectDto;
import com.watt.framework.home.dto.UserDto;
import com.watt.framework.home.service.ICarouselService;
import com.watt.framework.home.service.IProjectService;
import com.watt.framework.home.service.IUserService;

@Controller
public class UserController {

	@Autowired
	private IUserService userService;
	
	@Autowired
    private IProjectService projectService;
	
	@Autowired
	private ICarouselService carouselService;
	
	private Gson gson = new Gson();
	/**
	 * 初始化瓦特鉴定首页
	 * @param request
	 * @return
	 * @throws Exception 
	 */
    @RequestMapping(value = "/index.watt")
    public String index(HttpServletRequest request, ProjectDto projectDto) throws Exception{
    	Object object = request.getSession().getAttribute("user");
    	if(object != null){
    		User user = (User)object;
    		projectDto.setLoginId(user.getId().toString());
    	}
    	projectDto.setStatus(WattConstant.STATUS_4);
    	
    	request.setAttribute("listProject", projectService.listProject(projectDto));
    	request.setAttribute("listCarousel", carouselService.listCarousel());
        return "index";
    }
    
    /**
	 * 初始化瓦特鉴定首页
	 * @param request
	 * @return
	 * @throws Exception 
	 */
    @RequestMapping(value = "/home.watt")
    public String home(HttpServletRequest request, ProjectDto projectDto) throws Exception{
        return "home";
    }
    
	/**
     * 用户注册初始页面
     * @param request
     * @return
     */
    @RequestMapping(value = "/user-register.watt")
    public String userRegister(HttpServletRequest request){
        return "user-register";
    }
    
    /**
     * 服务协议
     * @param request
     * @return
     */
    @RequestMapping(value = "/help-registerpro.watt")
    public String helpRegisterpro(HttpServletRequest request){
        return "help-registerpro";
    }
    
    /**
     * 用户登录初始页面
     * @param request
     * @return
     */
    @RequestMapping(value = "/user-login.watt")
    public String userLogin(HttpServletRequest request){
        return "user-login";
    }
    
    /**
     * 用户AJAX登录
     * @param request
     * @param userDto
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/user-ajax_login.watt")
    public Map<String, Object> userAjaxLogin(HttpServletRequest request, UserDto userDto){
    	Map<String, Object> map = new HashMap<String, Object>();
    	User user = this.userService.userLogin(userDto);
    	if(user != null){
    		map.put("status", "1");
    		request.getSession().setAttribute("user", user);
    	}else{
    		request.getSession().removeAttribute("user");
    		map.put("status", "0");
    		map.put("info", "用户密码错误");
    	}
        return map;
    }
    
    /**
     * 注册用户
     * @param request
     * @param userDto
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/user-ajax_register.watt")
    public Map<String, Object> userAjaxRegister(HttpServletRequest request, UserDto userDto){
    	Map<String, Object> map = new HashMap<String, Object>();
    	try{
    		if(!userDto.getUser_pwd().equals(userDto.getConfirm_user_pwd())){
        		map.put("status", "0");
        		map.put("info", "密码不一致");
        		return map;
        	}
    		if(this.userService.isEmailRegistered(userDto.getEmail())){
    			map.put("status", "0");
        		map.put("info", "邮箱已被注册");
        		return map;
        	}
    		if(this.userService.isUserNameRegistered(userDto.getUser_name())){
    			map.put("status", "0");
        		map.put("info", "昵称已被注册");
        		return map;
        	}
    		request.getSession().setAttribute("user", this.userService.registerUser(userDto));
    		map.put("status", "1");
    		return map;
    	}catch (Exception ex){
    		map.put("status", "0");
    		map.put("info", "注册失败");
    		return map;
    	}
        
    }
    
    
    /**
     * 用户AJAX登录
     * @param request
     * @param userDto
     * @return
     */
    @RequestMapping(value = "/user-loginout.watt")
	public String userLoginOut(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:index.watt";
	}
    
    /**
     * 用户AJAX登录
     * @param request
     * @param userDto
     * @return
     */
    @RequestMapping(value = "/settings.watt")
	public String settings(HttpServletRequest request) {
    	Object object = request.getSession().getAttribute("user");
    	if(object != null){
    		User user = (User)object;
    		user = this.userService.findById(user.getId());
    		request.setAttribute("user", user);
    		return "settings";
    	}
    	return "index";
	}
    
    @ResponseBody
    @RequestMapping(value = "/settings-save_index.watt")
    public Map<String, Object> settingsSaveIndex(HttpServletRequest request, UserDto userDto){
    	Map<String, Object> map = new HashMap<String, Object>();
    	try{
    		User user = this.userService.settingsSaveIndex(userDto);
    		user = this.userService.findById(user.getId());
    		request.setAttribute("user", user);
    		map.put("status", "1");
    	}catch(Exception ex){
    		map.put("status", "0");
    		map.put("info", "密码不一致");
    	}
        return map;
    }
    
    /**
     * 进入密码修改
     * @param request
     * @param userDto
     * @return
     */
    @RequestMapping(value = "/settings-password.watt")
	public String settingsPassword(HttpServletRequest request) {
    	Object object = request.getSession().getAttribute("user");
    	if(object != null){
    		User user = (User)object;
    		user = this.userService.findById(user.getId());
    		request.setAttribute("user", user);
    		return "settings-password";
    	}
    	return "index";
	}
    
    /**
     * 密码修改
     * @param request
     * @param userDto
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/settings-ajax_save_password.watt")
    public Map<String, Object> settingsAjaxSavePassword(HttpServletRequest request, UserDto userDto){
    	Map<String, Object> map = new HashMap<String, Object>();
    	try{
    		Object object = request.getSession().getAttribute("user");
    		if(object != null){
        		User user = (User)object;
        		userDto.setId(user.getId());
        		if(userDto.getUser_pwd().equals(userDto.getConfirm_user_pwd())){
        			this.userService.settingsAjaxSavePassword(userDto);
                	map.put("status", "1");
        		}else{
            		map.put("status", "0");
            		map.put("info", "密码不一致");
            	}
        	}else{
        		map.put("status", "0");
        		map.put("info", "会话过期");
        	}
    	}catch(Exception ex){
    		map.put("status", "0");
    		map.put("info", ex.getMessage());
    	}
        return map;
    }
    
    /**
     * 修改头像
     * @param request
     * @return
     */
    @RequestMapping(value = "/settings-avatar.watt")
	public String settingsAvatar(HttpServletRequest request) {
    	Object object = request.getSession().getAttribute("user");
    	if(object != null){
    		User user = (User)object;
    		user = this.userService.findById(user.getId());
    		request.setAttribute("user", user);
    		return "settings-avatar";
    	}
    	return "index";
	}
    
    @ResponseBody
    @RequestMapping(value = "/fileAvatarUpload.watt")
	public String fileAvatarUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("avatar_file") MultipartFile avatar_file, @RequestParam("id") Long id)
			throws Exception {
    	
    	response.setContentType("text/html;charset=UTF-8");
    	
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		if (avatar_file.isEmpty()) {
		}
		String fileName = avatar_file.getOriginalFilename();
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/avatar");
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		File uploadFile = new File(uploadPath + "/" + fileName);
		avatar_file.transferTo(uploadFile);// 上传
		jsonMap.put("middle_url", "upload/avatar/"+fileName);
		jsonMap.put("url", "upload/avatar/"+fileName);
		
		Object object = request.getSession().getAttribute("user");
    	if(object != null){
    		User user = (User)object;
    		UserDto userDto = new UserDto();
    		userDto.setId(user.getId());
    		userDto.setImage("upload/avatar/"+fileName);
    		this.userService.fileAvatarUpload(userDto);
    	}
		jsonMap.put("status", 1);
		return gson.toJson(jsonMap);
	}
}
