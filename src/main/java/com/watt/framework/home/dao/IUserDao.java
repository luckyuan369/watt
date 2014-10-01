package com.watt.framework.home.dao;

import java.util.List;

import com.watt.framework.common.dao.IBaseDao;
import com.watt.framework.common.util.NavigationPref;
import com.watt.framework.common.util.PageResult;
import com.watt.framework.home.domain.User;
import com.watt.framework.home.dto.UserDto;

public interface IUserDao extends IBaseDao<User, Long> {

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
     * 用户登录
     * @param userDto
     * @return
     */
    public User userLogin(UserDto userDto);
    
    /**
     * 邮件是否已经注册
     * @param userDto
     * @return
     */
    public boolean isEmailRegistered(String email);
    
    /**
     * 用户名是否已经注册
     * @param userName
     * @return
     */
    public boolean isUserNameRegistered(String userName);
}
