package com.watt.framework.home.dto;

import java.math.BigDecimal;
import java.util.Date;

import com.watt.framework.common.dto.BaseDto;

public class ProjectDto extends BaseDto {

	private static final long serialVersionUID = 1L;

	private Long id;
	private Long userId; // 用户ID
	private String userName; // 用户名称
	private String name; // 项目名称
	private int copies; // 筹集份数
	private BigDecimal limit_price; // 筹资金额
	private int deal_days = 0; // 筹资天数
	private String cate_id; // 所属种类
	private String province; // 所属省份
	private String city; // 所属城市
	private String image; // 项目封面
	private String brief; // 项目简介
	private String description; // 项目明细
	private int attention = 0; // 关注
	private String status; // 项目状态
	private Date releaseDate; // 发布日期
	private Date expirationDate; // 截止日期
	private Date createDate; // 创建时间
	private Date update_date; // 修改时间
	
	private String flag;// 表单标识 SAVE SEND
	private String loginId; // 用户ID
	private String isFocus = "N";
	private int remain_days; //剩余时间
	private String percent; // 计算进度百分比
	private String css_percent ;//样式百分比
	private int supporterCopies; //已购份额
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getLimit_price() {
		return limit_price;
	}

	public void setLimit_price(BigDecimal limit_price) {
		this.limit_price = limit_price;
	}

	public int getDeal_days() {
		return deal_days;
	}

	public void setDeal_days(int deal_days) {
		this.deal_days = deal_days;
	}

	public String getCate_id() {
		return cate_id;
	}

	public void setCate_id(String cate_id) {
		this.cate_id = cate_id;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getAttention() {
		return attention;
	}

	public void setAttention(int attention) {
		this.attention = attention;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public Date getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getCopies() {
		return copies;
	}

	public void setCopies(int copies) {
		this.copies = copies;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getIsFocus() {
		return isFocus;
	}

	public void setIsFocus(String isFocus) {
		this.isFocus = isFocus;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public int getRemain_days() {
		return remain_days;
	}

	public void setRemain_days(int remain_days) {
		this.remain_days = remain_days;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPercent() {
		return percent;
	}

	public void setPercent(String percent) {
		this.percent = percent;
	}

	public int getSupporterCopies() {
		return supporterCopies;
	}

	public void setSupporterCopies(int supporterCopies) {
		this.supporterCopies = supporterCopies;
	}

	public String getCss_percent() {
		return css_percent;
	}

	public void setCss_percent(String css_percent) {
		this.css_percent = css_percent;
	}

}
