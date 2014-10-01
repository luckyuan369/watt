package com.watt.framework.home.service.impl;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.watt.framework.common.exception.AppException;
import com.watt.framework.common.service.impl.BaseServiceImpl;
import com.watt.framework.common.util.NavigationPref;
import com.watt.framework.common.util.PageResult;
import com.watt.framework.home.constant.WattConstant;
import com.watt.framework.home.dao.IProjectDao;
import com.watt.framework.home.dao.IProjectFocusDao;
import com.watt.framework.home.dao.IUserDao;
import com.watt.framework.home.domain.Project;
import com.watt.framework.home.dto.ProjectDto;
import com.watt.framework.home.service.IProjectService;
import com.watt.framework.home.service.ISupporterService;
import com.watt.framework.home.util.DateUtil;

/**
 * 鉴定项目接口实现类
 * @author JIAYUAN
 *
 */
@Transactional(rollbackFor = AppException.class)
@Service
public class ProjectServiceImpl extends BaseServiceImpl implements
		IProjectService {

	@Autowired
	private IProjectDao projectDao;

	@Autowired
	private IUserDao userDao;

	@Autowired
	private IProjectFocusDao projectFocusDao;

	@Autowired
	private ISupporterService supporterService;
	
	public PageResult<ProjectDto> listProject(ProjectDto projectDto,
			NavigationPref pref) throws Exception{

		PageResult<Project> result = this.projectDao.listProject(projectDto, pref);
		List<ProjectDto> dtoList = new ArrayList<ProjectDto>();
		
		boolean isLogion = false;
		if (projectDto.getLoginId() != null
				&& !"".equals(projectDto.getLoginId())) {
			isLogion = true;
		}

		List<Project> list = result.getResult();
		if (!list.isEmpty()) {
			for (Project project : list) {
				ProjectDto dto = new ProjectDto();
				BeanUtils.copyProperties(project, dto);
				if (isLogion) {
					int c = this.projectFocusDao.countProjectFocusByUserIdAndProjectId(Long.parseLong(projectDto.getLoginId()), project.getId());
					if (c > 0) {
						dto.setIsFocus("Y");
					} else {
						dto.setIsFocus("N");
					}
				} else {
					dto.setIsFocus("N");
				}
				
				int supporterCopies = supporterService.countCopiesByProjectId(project.getId());
				// 创建一个数值格式化对象
				NumberFormat numberFormat = NumberFormat.getInstance();
				// 设置精确到小数点后2位
				numberFormat.setMaximumFractionDigits(2);
				float percent = (float)supporterCopies/(float)project.getCopies()*100;
				dto.setPercent(numberFormat.format(percent));
				
				if(percent > 100){
					dto.setCss_percent(numberFormat.format(100));
				}else{
					dto.setCss_percent(dto.getPercent());
				}
				
				dto.setSupporterCopies(supporterCopies);
				
				int remain_days = DateUtil.daysBetween(new Date(), project.getExpirationDate());
				if(remain_days < 0){
					remain_days = 0;
				}
				dto.setRemain_days(remain_days);
				
				dtoList.add(dto);
			}
		}

		return new PageResult<ProjectDto>(dtoList, result.getPager());
	}
	
	public List<ProjectDto> listProject(ProjectDto projectDto) throws Exception{
		List<ProjectDto> dtoList = new ArrayList<ProjectDto>();
		boolean isLogion = false;
		if (projectDto.getLoginId() != null
				&& !"".equals(projectDto.getLoginId())) {
			isLogion = true;
		}

		List<Project> list = this.projectDao.listProject(projectDto);
		if (!list.isEmpty()) {
			for (Project project : list) {
				ProjectDto dto = new ProjectDto();
				BeanUtils.copyProperties(project, dto);
				if (isLogion) {
					int c = this.projectFocusDao.countProjectFocusByUserIdAndProjectId(Long.parseLong(projectDto.getLoginId()), project.getId());
					if (c > 0) {
						dto.setIsFocus("Y");
					} else {
						dto.setIsFocus("N");
					}
				} else {
					dto.setIsFocus("N");
				}
				
				int supporterCopies = supporterService.countCopiesByProjectId(project.getId());
				// 创建一个数值格式化对象
				NumberFormat numberFormat = NumberFormat.getInstance();
				// 设置精确到小数点后2位
				numberFormat.setMaximumFractionDigits(2);
				float percent = (float)supporterCopies/(float)project.getCopies()*100;
				dto.setPercent(numberFormat.format(percent));
				
				if(percent > 100){
					dto.setCss_percent(numberFormat.format(100));
				}else{
					dto.setCss_percent(dto.getPercent());
				}
				
				dto.setSupporterCopies(supporterCopies);
				
				int remain_days = DateUtil.daysBetween(new Date(), project.getExpirationDate());
				if(remain_days < 0){
					remain_days = 0;
				}
				dto.setRemain_days(remain_days);
				
				dtoList.add(dto);
			}
		}

		return dtoList;
	}

	public void addAttention(Long id) {
		Project project = this.projectDao.findById(id);
		project.setAttention(project.getAttention() + 1);
		this.projectDao.save(project);
	}

	public Map<String, Object> getDeal(ProjectDto projectDto) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		Project project = this.projectDao.findById(projectDto.getId());
		if(null != project){
			boolean isLogion = false;
			if (projectDto.getLoginId() != null
					&& !"".equals(projectDto.getLoginId())) {
				isLogion = true;
			}
			
			ProjectDto dto = new ProjectDto();
			BeanUtils.copyProperties(project, dto);
			if (isLogion) {
				int c = this.projectFocusDao.countProjectFocusByUserIdAndProjectId(Long.parseLong(projectDto.getLoginId()),	project.getId());
				if (c > 0) {
					dto.setIsFocus("Y");
				} else {
					dto.setIsFocus("N");
				}
			} else {
				dto.setIsFocus("N");
			}
			
			int supporter = 0;
			if(!project.getSupporter().isEmpty()){
				supporter = project.getSupporter().size();
			}
			int supporterCopies = supporterService.countCopiesByProjectId(project.getId());
			
			// 创建一个数值格式化对象
			NumberFormat numberFormat = NumberFormat.getInstance();
			// 设置精确到小数点后2位
			numberFormat.setMaximumFractionDigits(2);
			float percent = (float)supporterCopies/(float)project.getCopies()*100;
			dto.setPercent(numberFormat.format(percent));
			
			if(percent > 100){
				dto.setCss_percent(numberFormat.format(100));
			}else{
				dto.setCss_percent(dto.getPercent());
			}
			
			int remain_days = DateUtil.daysBetween(new Date(), project.getExpirationDate());
			if(remain_days < 0){
				remain_days = 0;
			}
			dto.setRemain_days(remain_days);
			
			map.put("supporter", supporter);//支持者数量
			map.put("supporterCopies", supporterCopies);//支持份数
			map.put("project", dto);//项目信息
			map.put("listSupporter", project.getSupporter());
			map.put("user", project.getUser());//项目信息
		}
		return map;
	}

	public Project saveProject(ProjectDto projectDto) {
		Project project = new Project();
		project.setUser(this.userDao.findById(projectDto.getUserId()));// 用户
		project.setName(projectDto.getName()); // 项目名称
		project.setCopies(projectDto.getCopies()); // 筹集份数
		project.setLimit_price(projectDto.getLimit_price()); // 筹资金额
		project.setDeal_days(projectDto.getDeal_days()); // 筹资天数
		project.setCate_id(projectDto.getCate_id()); // 产品类别
		project.setProvince("上海"); // 所属省份
		project.setCity(null); // 所属城市
		project.setImage(projectDto.getImage());// 项目封面
		project.setBrief(projectDto.getBrief()); // 项目简介
		project.setDescription(projectDto.getDescription()); // 项目详情
		project.setAttention(0); // 关注 默认为0
		project.setStatus(projectDto.getStatus()); // 项目状态
		project.setCreateDate(new Date()); // 创建日期
		return this.projectDao.save(project);
	}

	public Project findProjectById(Long id) {
		return this.projectDao.findById(id);
	}

	public void updateProject(ProjectDto projectDto) {
		Project project = this.projectDao.findById(projectDto.getId());
		project.setName(projectDto.getName()); // 项目名称
		project.setCopies(projectDto.getCopies()); // 筹集份数
		project.setLimit_price(projectDto.getLimit_price()); // 筹资金额
		project.setDeal_days(projectDto.getDeal_days()); // 筹资天数
		project.setCate_id(projectDto.getCate_id()); // 产品类别
		project.setProvince("上海"); // 所属省份
		project.setCity(null); // 所属城市
		project.setImage(projectDto.getImage());// 项目封面
		project.setBrief(projectDto.getBrief()); // 项目简介
		project.setDescription(projectDto.getDescription()); // 项目详情
		project.setUpdate_date(new Date()); // 修改日期
		this.projectDao.update(project);
	}

	public int countProjectByUserId(Long userId) {
		return this.projectDao.countProjectByUserId(userId);
	}

	public List<Project> listProjectByUserId(Long userId) {
		return this.projectDao.listProjectByUserId(userId);
	}

	public List<Project> listProjectByUserIdAndStatus(Long userId, String status) {
		return this.projectDao.listProjectByUserIdAndStatus(userId, status);
	}

	public int countProjectByUserIdAndStatus(Long userId, String status) {
		return this.projectDao.countProjectByUserIdAndStatus(userId, status);
	}

	public List<ProjectDto> listProjectByStatus(String status) {
		List<ProjectDto> result = new ArrayList<ProjectDto>();
		List<Project> list = this.projectDao.listProjectByStatus(status);
		for (Project project : list) {
			ProjectDto dto = new ProjectDto();
			BeanUtils.copyProperties(project, dto);
			dto.setUserName(project.getUser().getUser_name());
			result.add(dto);
		}
		return result;
	}

	public int countProjectByStatus(String status) {
		return this.projectDao.countProjectByStatus(status);
	}

	public void rejectProject(Long projectId) throws Exception {
		Project project = this.projectDao.findById(projectId);
		if (WattConstant.STATUS_1.equals(project.getStatus())) {
			project.setStatus(WattConstant.STATUS_3);
			project.setUpdate_date(new Date());
			this.projectDao.update(project);
		} else {
			throw new Exception("不符合审核条件");
		}
	}

	public void passProject(Long projectId) throws Exception {
		Project project = this.projectDao.findById(projectId);
		if (WattConstant.STATUS_1.equals(project.getStatus())) {
			project.setStatus(WattConstant.STATUS_2);
			project.setUpdate_date(new Date());
			this.projectDao.update(project);
		} else {
			throw new Exception("不符合审核条件");
		}
	}

	public void applyProject(ProjectDto projectDto) throws Exception {
		if (null == projectDto.getId()) {
			Project project = new Project();
			BeanUtils.copyProperties(projectDto, project);
			project.setProvince("上海"); // 所属省份
			project.setCity(null); // 所属城市
			project.setAttention(0); // 关注 默认为0
			project.setStatus(WattConstant.STATUS_1); // 项目状态
			project.setCreateDate(new Date()); // 创建日期
			project.setUpdate_date(new Date());// 修改日期
			project.setUser(this.userDao.findById(projectDto.getUserId()));
			this.projectDao.save(project);
		} else {
			Project project = this.projectDao.findById(projectDto.getId());
			project.setName(projectDto.getName()); // 项目名称
			project.setCopies(projectDto.getCopies()); // 筹集份数
			project.setLimit_price(projectDto.getLimit_price()); // 筹资金额
			project.setDeal_days(projectDto.getDeal_days()); // 筹资天数
			project.setCate_id(projectDto.getCate_id()); // 产品类别
			project.setProvince("上海"); // 所属省份
			project.setCity(null); // 所属城市
			project.setImage(projectDto.getImage());// 项目封面
			project.setBrief(projectDto.getBrief()); // 项目简介
			project.setDescription(projectDto.getDescription()); // 项目详情
			project.setUpdate_date(new Date()); // 修改日期
			project.setStatus(WattConstant.STATUS_1); // 项目状态
			this.projectDao.update(project);
		}
	}

	public void releaseProject(Long projectId, Long userId) throws Exception {
		Project project = this.projectDao.findById(projectId);
		
		if(project.getUser().getId() == userId){
			project.setStatus(WattConstant.STATUS_4);
			Date d=new Date();
			project.setReleaseDate(d);
			project.setExpirationDate(new Date(d.getTime() + project.getDeal_days() * 24 * 60 * 60 * 1000));
			project.setUpdate_date(new Date());
			this.projectDao.update(project);
		}else{
			throw new Exception("非法的项目");
		}
	}
}
