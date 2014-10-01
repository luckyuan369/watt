package com.watt.framework.home.service;

import java.util.List;

import com.watt.framework.common.service.IBaseService;
import com.watt.framework.common.util.NavigationPref;
import com.watt.framework.common.util.PageResult;
import com.watt.framework.home.domain.ProjectFocus;
import com.watt.framework.home.dto.ProjectFocusDto;

public interface IProjectFocusService extends IBaseService {
	
	public PageResult<ProjectFocus> listProjectFocus(ProjectFocusDto projectFocusDto, NavigationPref pref);

	public List<ProjectFocus> listProjectFocusByUserId(Long userId);
	
	public ProjectFocusDto addProjectFous(ProjectFocusDto projectFocusDto);
	
	public void removeProjectFocus(Long id);
	
	public int countProjectFocusByUserId(Long userId);
}
