package com.watt.framework.home.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.watt.framework.common.service.impl.BaseServiceImpl;
import com.watt.framework.home.constant.WattConstant;
import com.watt.framework.home.dao.IProjectDao;
import com.watt.framework.home.dao.ISupporterDao;
import com.watt.framework.home.dao.IUserDao;
import com.watt.framework.home.domain.Project;
import com.watt.framework.home.domain.Supporter;
import com.watt.framework.home.domain.User;
import com.watt.framework.home.dto.SupporterDto;
import com.watt.framework.home.service.ISupporterService;

@Transactional
@Service
public class SupporterServiceImpl extends BaseServiceImpl implements ISupporterService {

	public static final Logger logger = Logger.getLogger(SupporterServiceImpl.class);     
	
	@Autowired
	private ISupporterDao supporterDao;
	
	@Autowired
	private IProjectDao projectDao;
	
	@Autowired
	private IUserDao userDao;
	
	public int countSupporterByProjectId(Long projectId) throws Exception {
		return this.supporterDao.countSupporterByProjectId(projectId);
	}

	public Supporter saveSupporter(SupporterDto supporterDto) throws Exception {
		Project project = this.projectDao.findById(supporterDto.getProject_id());
		if(null == project){
			logger.error("未查询到项目信息:id="+supporterDto.getProject_id());
			throw new Exception("未查询到项目信息");
		}
		User user = userDao.findById(supporterDto.getUser_id());
		if(null == user){
			logger.error("未查询到用户信息:id="+supporterDto.getUser_id());
			throw new Exception("未查询到用户信息");
		}
		
		Supporter supporter = new Supporter();
		List<Supporter> list = this.supporterDao.getSupporterByUserIdAndProjectIdAndStatus(supporterDto.getUser_id(), supporterDto.getProject_id(), WattConstant.ORDER_1);
		if(list.isEmpty()){
			BeanUtils.copyProperties(supporterDto, supporter);
			supporter.setLimit_price(project.getLimit_price());
			BigDecimal b2 = new BigDecimal(Double.toString(supporterDto.getCopies()));
			supporter.setTotal_price(project.getLimit_price().multiply(b2));
			supporter.setUser(user);
			supporter = this.supporterDao.save(supporter);
		}else{
			if(list.size() != 1){
				logger.error("用户未付款订单只能保存一份:size = " + list.size());
				throw new Exception("用户未付款订单只能保存一份");
			}else{
				supporter = list.get(0);
			}
		}
		return supporter;
	}

	public List<Supporter> getSupporterByProjectId(Long projectId)
			throws Exception {
		return this.supporterDao.getSupporterByProjectId(projectId);
	}

	public List<SupporterDto> getSupporterByUserId(Long userId, final String status) throws Exception {
		List<SupporterDto> result = new ArrayList<SupporterDto>();
		List<Supporter>  list =  this.supporterDao.getSupporterByUserId(userId, status);
		if(!list.isEmpty()){
			for(Supporter sup : list){
				SupporterDto dto = new SupporterDto();
				BeanUtils.copyProperties(sup, dto);
				dto.setProject(sup.getProject());
				result.add(dto);
			}
		}
		return result;
	}

	public int countCopiesByProjectId(Long projectId) throws Exception {
		return this.supporterDao.countCopiesByProjectId(projectId);
	}

	public Map<String, Object> getUserProjectCaryPay(Long supporterId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Supporter supporter = this.supporterDao.findById(supporterId);
		if(null == supporter){
			logger.error("未查询到支持者信息:id="+supporterId);
			throw new Exception("未查询到支持者信息");
		}
		map.put("supporter", supporter);
		map.put("project", supporter.getProject());
		map.put("user", supporter.getUser());
		return map;
	}

	public int countSupporterByUserId(Long userId) throws Exception {
		return this.supporterDao.countSupporterByUserId(userId);
	}

}
