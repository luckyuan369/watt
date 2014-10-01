package com.watt.framework.home.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.watt.framework.common.dao.impl.BaseDaoImpl;
import com.watt.framework.common.util.CipherUtil;
import com.watt.framework.common.util.NavigationPref;
import com.watt.framework.common.util.PageResult;
import com.watt.framework.common.util.Pager;
import com.watt.framework.home.dao.IUserDao;
import com.watt.framework.home.domain.User;
import com.watt.framework.home.dto.UserDto;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User, Long> implements IUserDao {

	@Inject
    public UserDaoImpl(@Value("com.watt.framework.home.domain.User")Class<User> clazz) {
        super(clazz);
    }
	
	public PageResult<User> listUser(UserDto userDto, NavigationPref pref) {
		
		StringBuilder hql = new StringBuilder("from User u where 1=1 ");
		
        hql.append(" order by p.createDate desc");
        
        Pager pager = null;
        if (pref != null) {
            pager = new Pager(pref);
        }
        List<User> list = getListByQueryWithDefaultPaging(hql.toString(),pager);
        return new PageResult<User>(list, pager);
	}

	public List<User> listUser(UserDto userDto) {
		StringBuilder hql = new StringBuilder("from User u where 1=1 ");
		return this.getListByQuery(hql.toString());
	}

	public User userLogin(UserDto userDto) {
		StringBuilder hql = new StringBuilder("from User u where 1=1 and user_pwd='"+CipherUtil.generatePassword(userDto.getUser_pwd())
				+ "' and (user_name = '" + userDto.getUser_name() + "' or email = '" + userDto.getUser_name() + "')");
		List<User> listUser = this.getListByQuery(hql.toString());
		if(listUser != null && listUser.size() > 0){
			return listUser.get(0);
		}
		return null;
	}

	public boolean isEmailRegistered(String email) {
		String queryStr = "select count(*) from User u where u.email = '"+email+"'";
		if(this.countByQuery(queryStr)>0){
			return true;
		}
		return false;
	}

	public boolean isUserNameRegistered(String userName) {
		String queryStr = "select count(*) from User u where u.user_name = '"+userName+"'";
		if(this.countByQuery(queryStr)>0){
			return true;
		}
		return false;
	}
}
