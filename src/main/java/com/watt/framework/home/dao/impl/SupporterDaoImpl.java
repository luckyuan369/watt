package com.watt.framework.home.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.watt.framework.common.dao.impl.BaseDaoImpl;
import com.watt.framework.home.dao.ISupporterDao;
import com.watt.framework.home.domain.Supporter;

@Repository
public class SupporterDaoImpl extends BaseDaoImpl<Supporter, Long> implements
		ISupporterDao {

	@Inject
	public SupporterDaoImpl(@Value("com.watt.framework.home.domain.Supporter") Class<Supporter> clazz) {
		super(clazz);
	}
	
	public int countSupporterByProjectId(Long projectId) {
		String queryStr = "select count(*) from Supporter s where s.project.id = " + projectId;
		return this.countByQuery(queryStr);
	}

	public List<Supporter> getSupporterByProjectId(Long projectId) {
		String queryStr = "from Supporter s where s.project.id = " + projectId;
		return this.getListByQuery(queryStr);
	}

	public List<Supporter> getSupporterByUserId(Long userId, final String status) {
		String str = "";
		if(!"".equals(status)){
			str += " and s.status = '" +status+ "'";
		}
		String queryStr = "from Supporter s where s.user.id = " + userId + str;
		return this.getListByQuery(queryStr);
	}

	public int countCopiesByProjectId(Long projectId) {
		String queryStr = "select COALESCE(sum(copies),0) from Supporter s where s.project.id = " + projectId;
		return this.countByQuery(queryStr);
	}

	public List<Supporter> getSupporterByUserIdAndProjectIdAndStatus(
			Long UserId, Long projectId, String status) {
		String queryStr = "from Supporter s where s.project.id = " + projectId + " and s.user.id = " + UserId + " and s.status = '" + status + "'" ;
		return this.getListByQuery(queryStr);
	}

	public int countSupporterByUserId(Long userId) {
		String queryStr = "select count(*) from Supporter s where s.user.id = " + userId;
		return this.countByQuery(queryStr);
	}

}
