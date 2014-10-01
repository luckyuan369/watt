package com.watt.framework.home.dao;

import java.util.List;

import com.watt.framework.common.dao.IBaseDao;
import com.watt.framework.home.domain.Supporter;

/**
 * 项目支持者
 * @author JIAYUAN
 *
 */
public interface ISupporterDao extends IBaseDao<Supporter, Long> {

	/**
	 * 查询项目支持者人数
	 * @param projectId
	 * @return
	 */
	public int countSupporterByProjectId(Long projectId);
	
	/**
	 * 查询项目支持的份额
	 * @param projectId
	 * @return
	 */
	public int countCopiesByProjectId(Long projectId);
	
	/**
	 * 查询项目所有支持者
	 */
	public List<Supporter> getSupporterByProjectId(Long projectId);
	
	/**
	 * 查询用户支持的项目
	 * @param userId
	 * @return
	 */
	public List<Supporter> getSupporterByUserId(Long userId, final String status);
	
	/**
	 * 查询用户支持的项目数量
	 * @param userId
	 * @return
	 */
	public int countSupporterByUserId(Long userId);
	
	/**
	 * 查询用户某状态的项目
	 * @param UserId
	 * @param projectId
	 * @param status
	 * @return
	 */
	public List<Supporter> getSupporterByUserIdAndProjectIdAndStatus(Long UserId, Long projectId, String status);
}
