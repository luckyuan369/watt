package com.watt.framework.home.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.watt.framework.common.dao.impl.BaseDaoImpl;
import com.watt.framework.common.util.NavigationPref;
import com.watt.framework.common.util.PageResult;
import com.watt.framework.common.util.Pager;
import com.watt.framework.home.dao.IProjectFocusDao;
import com.watt.framework.home.domain.ProjectFocus;
import com.watt.framework.home.dto.ProjectFocusDto;

@Repository
public class ProjectFocusDaoImpl extends BaseDaoImpl<ProjectFocus, Long> implements IProjectFocusDao {

	@Inject
    public ProjectFocusDaoImpl(@Value("com.watt.framework.home.domain.ProjectFocus")Class<ProjectFocus> clazz) {
        super(clazz);
    }

	public PageResult<ProjectFocus> listProjectFocus(
			ProjectFocusDto projectFocusDto, NavigationPref pref) {
		
		StringBuilder hql = new StringBuilder("from ProjectFocus pf where 1=1 ");
        hql.append(" order by pf.create_date desc");
        
        Pager pager = null;
        if (pref != null) {
            pager = new Pager(pref);
        }
        List<ProjectFocus> list = getListByQueryWithDefaultPaging(hql.toString(),pager);
        return new PageResult<ProjectFocus>(list, pager);
	}

	public List<ProjectFocus> listProjectFocusByUserId(Long userId){
		String queryStr = "from ProjectFocus pf where 1=1 and pf.user.id = "+userId+"  order by pf.create_date desc";
		return this.getListByQuery(queryStr);
	}

	public int countProjectFocusByUserId(Long userId) {
		String queryStr = "select count(*) from ProjectFocus pf where 1=1 and pf.user.id = "+userId;
		return this.countByQuery(queryStr);
	}

	public int countProjectFocusByUserIdAndProjectId(Long userId, Long projectId) {
		String queryStr = "select count(*) from ProjectFocus pf where 1=1 and pf.user.id = "+userId + " and pf.project.id ="+projectId;
		return this.countByQuery(queryStr);
	}
}
