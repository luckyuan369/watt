package com.watt.framework.home.service;

import java.util.List;
import java.util.Map;

import com.watt.framework.common.service.IBaseService;
import com.watt.framework.home.domain.Supporter;
import com.watt.framework.home.dto.SupporterDto;

/**
 * 项目支持者
 * @author JIAYUAN
 *
 */
public interface ISupporterService extends IBaseService {

	/**
	 * 查询项目支持者人数
	 * @param projectId
	 * @return
	 */
	public int countSupporterByProjectId(Long projectId) throws Exception;
	
	/**
	 * 添加项目支持者
	 * @throws Exception
	 */
	public Supporter saveSupporter(SupporterDto supporterDto) throws Exception;
	
	/**
	 * 查询项目所有支持者
	 */
	public List<Supporter> getSupporterByProjectId(Long projectId) throws Exception;
	
	/**
	 * 查询用户支持的项目
	 * @param userId
	 * @return
	 */
	public List<SupporterDto> getSupporterByUserId(Long userId, final String status) throws Exception;
	
	/**
	 * 查询项目支持的份额
	 * @param projectId
	 * @return
	 */
	public int countCopiesByProjectId(Long projectId) throws Exception;
	
	/**
	 * 查询支持者支持信息
	 * @param supporterId
	 * @param userId
	 * @param projectId
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getUserProjectCaryPay(Long supporterId) throws Exception;
	
	/**
	 * 查询用户支持的项目数量
	 * @param userId
	 * @return
	 */
	public int countSupporterByUserId(Long userId) throws Exception;
}
