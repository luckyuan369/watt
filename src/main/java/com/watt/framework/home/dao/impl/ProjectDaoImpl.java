package com.watt.framework.home.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.watt.framework.common.dao.impl.BaseDaoImpl;
import com.watt.framework.common.util.NavigationPref;
import com.watt.framework.common.util.PageResult;
import com.watt.framework.common.util.Pager;
import com.watt.framework.home.dao.IProjectDao;
import com.watt.framework.home.domain.Project;
import com.watt.framework.home.dto.ProjectDto;

@Repository
public class ProjectDaoImpl extends BaseDaoImpl<Project, Long> implements IProjectDao {

	@Inject
	public ProjectDaoImpl(@Value("com.watt.framework.home.domain.Project") Class<Project> clazz) {
		super(clazz);
	}

	public PageResult<Project> listProject(ProjectDto projectDto, NavigationPref pref) {

		StringBuilder hql = new StringBuilder("from Project p where 1=1 ");

		if (!"".equals(StringUtils.trimToEmpty(projectDto.getName()))) {
			hql.append(" and p.name like '%" + projectDto.getName() + "%'");
		}

		if (!"".equals(StringUtils.trimToEmpty(projectDto.getStatus()))) {
			hql.append(" and p.status = '" + projectDto.getStatus() + "'");
		}

		hql.append(" order by p.createDate desc");

		Pager pager = null;
		if (pref != null) {
			pager = new Pager(pref);
		}
		List<Project> list = getListByQueryWithDefaultPaging(hql.toString(), pager);
		return new PageResult<Project>(list, pager);
	}

	public List<Project> listProject(ProjectDto projectDto) {
		StringBuilder hql = new StringBuilder("from Project p where 1=1 ");

		if (!"".equals(StringUtils.trimToEmpty(projectDto.getName()))) {
			hql.append(" and p.name like '%" + projectDto.getName() + "%'");
		}

		if (!"".equals(StringUtils.trimToEmpty(projectDto.getStatus()))) {
			hql.append(" and p.status = '" + projectDto.getStatus() + "'");
		}
		hql.append(" order by p.createDate desc");
		return this.getListByQuery(hql.toString());
	}

	public List<Project> listProjectByUserId(Long userId) {
		String queryStr = "from Project p where p.user.id = " + userId;
		return this.getListByQuery(queryStr);
	}

	public int countProjectByUserId(Long userId) {
		String queryStr = "select count(*) from Project p where p.user.id = " + userId;
		return this.countByQuery(queryStr);
	}

	public List<Project> listProjectByUserIdAndStatus(Long userId, String status) {
		String queryStr = "from Project p where p.user.id = " + userId + " and p.status = '" + status + "'";
		return this.getListByQuery(queryStr);
	}

	public int countProjectByUserIdAndStatus(Long userId, String status) {
		String queryStr = "select count(*) from Project p where p.user.id = " + userId + " and p.status = '" + status + "'";
		return this.countByQuery(queryStr);
	}

	public List<Project> listProjectByStatus(String status) {
		String queryStr = "from Project p where p.status = '" + status + "'";
		return this.getListByQuery(queryStr);
	}

	public int countProjectByStatus(String status) {
		String queryStr = "select count(*) from Project p where p.status = '" + status + "'";
		return this.countByQuery(queryStr);
	}

}
