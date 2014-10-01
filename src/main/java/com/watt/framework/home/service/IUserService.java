package com.watt.framework.home.service;

import java.util.List;

import com.watt.framework.common.service.IBaseService;
import com.watt.framework.common.util.NavigationPref;
import com.watt.framework.common.util.PageResult;
import com.watt.framework.home.domain.User;
import com.watt.framework.home.dto.UserDto;

public interface IUserService extends IBaseService {
	/**
     * 分页查询用户
     * @Date        :      2012-12-26
     * @param userDto
     * @param pref
     * @return
     */
    public PageResult<User> listUser(UserDto userDto, NavigationPref pref);
        
    /**
     * 
     * @param projectDto
     * @return
     */
    public List<User> listUser(UserDto userDto);
    
    /**
     * 
     * @param userDto
     * @return
     */
    public User registerUser(UserDto userDto) throws Exception;
    
    public User settingsAjaxSavePassword(UserDto userDto) throws Exception;
    
    public User fileAvatarUpload(UserDto userDto) throws Exception;
    /**
     * 
     * @param userDto
     */
    public void updateUser(UserDto userDto);
    
    /**
     * 用户登录验证
     * @param userDto
     * @return
     */
    public User userLogin(UserDto userDto);
    
    /**
     * 资料修改
     * @param userDto
     */
    public User settingsSaveIndex(UserDto userDto);
    
    /**
     * 根据ID查询用户
     * @param id
     * @return
     */
    public User findById(Long id);
    
    /**
     * 邮件是否已经注册
     * @param userDto
     * @return
     */
    public boolean isEmailRegistered(String email) throws Exception;
    
    /**
     * 用户名是否已经注册
     * @param userName
     * @return
     */
    public boolean isUserNameRegistered(String userName) throws Exception;
}
