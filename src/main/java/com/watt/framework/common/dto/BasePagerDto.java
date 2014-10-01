package com.watt.framework.common.dto;

import com.watt.framework.common.util.Pager;

public class BasePagerDto extends BaseDto {

	private static final long serialVersionUID = 1L;
	private Pager pager = new Pager();
	private boolean isExport; // �Ƿ���Ҫ����
	private boolean isQueryPage; // �Ƿ��ѯҳ

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public boolean isExport() {
		return isExport;
	}

	public void setExport(boolean isExport) {
		this.isExport = isExport;
	}

	public boolean isQueryPage() {
		return isQueryPage;
	}

	public void setQueryPage(boolean isQueryPage) {
		this.isQueryPage = isQueryPage;
	}

}
