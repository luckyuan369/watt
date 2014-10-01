package com.watt.framework.home.dao;

import java.util.List;

import com.watt.framework.common.dao.IBaseDao;
import com.watt.framework.common.util.NavigationPref;
import com.watt.framework.common.util.PageResult;
import com.watt.framework.home.domain.ProjectFocus;
import com.watt.framework.home.dto.ProjectFocusDto;

public interface IProjectFocusDao extends IBaseDao<ProjectFocus, Long> {

	
    public PageResult<ProjectFocus> listProjectFocus(ProjectFocusDto projectFocusDto, NavigationPref pref);
    
    public List<ProjectFocus> listProjectFocusByUserId(Long userId);
    
    public int countProjectFocusByUserId(Long userId);
    
    public int countProjectFocusByUserIdAndProjectId(Long userId, Long projectId);
}
