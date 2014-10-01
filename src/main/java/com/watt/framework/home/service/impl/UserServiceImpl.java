package com.watt.framework.home.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.watt.framework.common.exception.AppException;
import com.watt.framework.common.service.impl.BaseServiceImpl;
import com.watt.framework.common.util.CipherUtil;
import com.watt.framework.common.util.NavigationPref;
import com.watt.framework.common.util.PageResult;
import com.watt.framework.home.dao.IUserDao;
import com.watt.framework.home.domain.User;
import com.watt.framework.home.dto.UserDto;
import com.watt.framework.home.service.IUserService;

@Transactional(rollbackFor = AppException.class)
@Service
public class UserServiceImpl extends BaseServiceImpl implements IUserService {

	 @Autowired
	 private IUserDao userDao ;
	 
	public PageResult<User> listUser(UserDto userDto,
			NavigationPref pref) {
		return this.userDao.listUser(userDto, pref);
	}

	public List<User> listUser(UserDto userDto) {
		return this.userDao.listUser(userDto);
	}

	public User registerUser(UserDto userDto) throws Exception{
		
		
		
		User user = new User();
		user.setEmail(userDto.getEmail());
		user.setUser_pwd(CipherUtil.generatePassword(userDto.getUser_pwd()));
		user.setUser_name(userDto.getUser_name());
		user.setRole("员工");
		user.setCreateDate(new Date());
		return this.userDao.save(user);
	}
	
	public User settingsAjaxSavePassword(UserDto userDto) throws Exception{
		User user = this.userDao.findById(userDto.getId());
		if(user != null){
			if(user.getUser_pwd().equals(CipherUtil.generatePassword(userDto.getOld_pwd()))){
				user.setUser_pwd(CipherUtil.generatePassword(userDto.getUser_pwd()));
				this.userDao.update(user);
			}else{
				throw new Exception("原密码不正确");
			}
		}else{
			throw new Exception("会话过期，请重新登录");
		}
		return user;
	}
	

	public User fileAvatarUpload(UserDto userDto) throws Exception {
		User user = this.userDao.findById(userDto.getId());
		if(user != null){
			user.setImage(userDto.getImage());
			this.userDao.update(user);
		}else{
			throw new Exception("会话过期，请重新登录");
		}
		return user;
	}
	
	public void updateUser(UserDto userDto) {
		// TODO Auto-generated method stub
		
	}

	public User userLogin(UserDto userDto) {
		return this.userDao.userLogin(userDto);
	}

	public User settingsSaveIndex(UserDto userDto) {
		User user = this.userDao.findById(userDto.getId());
		if(user != null){
			user.setUser_name(userDto.getUser_name());
			user.setSex(userDto.getSex());
			user.setProvince(userDto.getProvince());
			user.setCity(userDto.getCity());
			user.setIntro(userDto.getIntro());
			user.setUpdate_date(new Date());
			this.userDao.update(user);
		}
		return user;
	}

	public User findById(Long id) {
		// TODO Auto-generated method stub
		return this.userDao.findById(id);
	}

	public boolean isEmailRegistered(String email) throws Exception {
		return userDao.isEmailRegistered(email);
	}

	public boolean isUserNameRegistered(String userName) throws Exception {
		return userDao.isUserNameRegistered(userName);
	}
	
}
