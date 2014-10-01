package com.watt.framework.home.dao;

import java.util.List;

import com.watt.framework.common.dao.IBaseDao;
import com.watt.framework.common.util.NavigationPref;
import com.watt.framework.common.util.PageResult;
import com.watt.framework.home.domain.Project;
import com.watt.framework.home.dto.ProjectDto;

public interface IProjectDao extends IBaseDao<Project, Long> {

	/**
     * 分页查询用户
     * @Date        :      2012-12-26
     * @param userDto
     * @param pref
     * @return
     */
    public PageResult<Project> listProject(ProjectDto projectDto, NavigationPref pref);
    
    /**
     * 
     * @param projectDto
     * @return
     */
    public List<Project> listProject(ProjectDto projectDto);
    
    /**
     * 查询用户所有的鉴定项目
     * @param userId
     * @return
     */
    public List<Project> listProjectByUserId(Long userId);
    
    /**
     * 查询用户所有的鉴定项目数量
     * @param userId
     * @return
     */
    public int countProjectByUserId(Long userId);
    
    /**
     * 查询用户某个状态的鉴定项目
     * @param userId
     * @param status
     * @return
     */
    public List<Project> listProjectByUserIdAndStatus(Long userId, String status);
    
    /**
     * 查询用户某个状态的鉴定项目数量
     * @param userId
     * @param status
     * @return
     */
    public int countProjectByUserIdAndStatus(Long userId, String status);
    
    /**
     * 查询所有某个状态的鉴定项目
     * @param status
     * @return
     */
    public List<Project> listProjectByStatus(String status);
    
    /**
     * 查询所有某个状态的鉴定项目数量
     * @param status
     * @return
     */
    public int countProjectByStatus(String status);
}
