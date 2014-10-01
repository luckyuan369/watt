package com.watt.framework.home.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.watt.framework.common.exception.AppException;
import com.watt.framework.common.service.impl.BaseServiceImpl;
import com.watt.framework.common.util.NavigationPref;
import com.watt.framework.common.util.PageResult;
import com.watt.framework.home.dao.IProjectDao;
import com.watt.framework.home.dao.IProjectFocusDao;
import com.watt.framework.home.dao.IUserDao;
import com.watt.framework.home.domain.ProjectFocus;
import com.watt.framework.home.dto.ProjectFocusDto;
import com.watt.framework.home.service.IProjectFocusService;

@Transactional(rollbackFor = AppException.class)
@Service
public class ProjectFocusServiceImpl extends BaseServiceImpl implements IProjectFocusService {

	@Autowired
	private IProjectFocusDao projectFocusDao;
	
	@Autowired
	private IProjectDao projectDao;
	
	@Autowired
	private IUserDao userDao;
	
	public PageResult<ProjectFocus> listProjectFocus(
			ProjectFocusDto projectFocusDto, NavigationPref pref) {
		return this.projectFocusDao.listProjectFocus(projectFocusDto, pref);
	}

	public List<ProjectFocus> listProjectFocusByUserId(Long userId) {
		return this.projectFocusDao.listProjectFocusByUserId(userId);
	}

	public ProjectFocusDto addProjectFous(ProjectFocusDto projectFocusDto) {
		ProjectFocus projectFocus = new ProjectFocus();
		projectFocus.setCreate_date(new Date());
		projectFocus.setProject(this.projectDao.findById(projectFocusDto.getProject_id()));
		projectFocus.setUser(this.userDao.findById(projectFocusDto.getUser_Id()));
		projectFocus = this.projectFocusDao.save(projectFocus);
		projectFocusDto.setId(projectFocus.getId());
		return projectFocusDto;
	}

	public void removeProjectFocus(Long id) {
		this.projectFocusDao.remove(id);
	}

	public int countProjectFocusByUserId(Long userId) {
		return this.projectFocusDao.countProjectFocusByUserId(userId);
	}
	
}
