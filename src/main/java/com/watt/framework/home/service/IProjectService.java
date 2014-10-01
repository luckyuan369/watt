package com.watt.framework.home.service;

import java.util.List;
import java.util.Map;

import com.watt.framework.common.service.IBaseService;
import com.watt.framework.common.util.NavigationPref;
import com.watt.framework.common.util.PageResult;
import com.watt.framework.home.domain.Project;
import com.watt.framework.home.dto.ProjectDto;

/**
 * 鉴定项目
 * @author JIAYUAN
 *
 */
public interface IProjectService extends IBaseService {
	/**
     * 分页查询用户
     * @Date        :      2012-12-26
     * @param userDto
     * @param pref
     * @return
     */
    public PageResult<ProjectDto> listProject(ProjectDto projectDto, NavigationPref pref) throws Exception;
    
    /**
     * 添加关注
     * @param id
     */
    public void addAttention(Long id);
    
    /**
     * 
     * @param projectDto
     * @return
     */
    public List<ProjectDto> listProject(ProjectDto projectDto) throws Exception;
    
    /**
     * 查询项目详情
     * @param id
     * @return
     * @throws Exception 
     */
    public Map<String, Object> getDeal(ProjectDto projectDto) throws Exception;
    
    /**
     * 
     * @param projectDto
     */
    public Project saveProject(ProjectDto projectDto);
    
    
    public void updateProject(ProjectDto projectDto);
    
    /**
     * 提交申请
     * @param projectDto
     * @throws Exception
     */
    public void applyProject(ProjectDto projectDto) throws Exception;
    
    /**
     * 驳回申请
     * @param projectId
     */
    public void rejectProject(Long projectId) throws Exception;
    
    /**
     * 通过申请
     * @param projectId
     */
    public void passProject(Long projectId) throws Exception;
    
    /**
     * 用户发布项目
     * @param projectId
     * @param userId
     * @throws Exception
     */
    public void releaseProject(Long projectId, Long userId) throws Exception;
    
    /**
     * 
     * @param id
     * @return
     */
    public Project findProjectById(Long id);
    
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
    public List<ProjectDto> listProjectByStatus(String status);
    
    /**
     * 查询所有某个状态的鉴定项目数量
     * @param status
     * @return
     */
    public int countProjectByStatus(String status);
}
