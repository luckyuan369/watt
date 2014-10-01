/******************************************************************************
 * @File name   :      NavigationPref.java
 *
 * @Author      :      JIAYUAN
 *
 * @Date        :      2012-12-22
 *
 * @Copyright Notice: 
 * Copyright (c) 2011 HQISBP, Inc. All  Rights Reserved.
 * This software is published under the terms of the HQISBP Software
 * License version 1.0, a copy of which has been included with this
 * distribution in the LICENSE.txt file.
 * 
 * 
 * ----------------------------------------------------------------------------
 * Date                   Who         Version        Comments
 * 2012-12-22 下午3:56:11        JIAYUAN     1.0            Initial Version
 *****************************************************************************/
package com.watt.framework.common.util;

import java.math.BigDecimal;

import com.watt.framework.common.constant.CommonConstants;

/**
 *
 */
public class NavigationPref {
    // page size
    private int rows;
    // current page no.
    private int page = BigDecimal.ONE.intValue();
    // order by column
    private String sidx = CommonConstants.DEFAULT_SORT_FIELD;
    // sort pattern: asc or desc
    private String sord = CommonConstants.SORT_ASC;
    
    public int getRows() {
        return rows;
    }
    public void setRows(int rows) {
        this.rows = rows;
    }
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        this.page = page;
    }
    public String getSidx() {
        return sidx;
    }
    public void setSidx(String sidx) {
        this.sidx = sidx;
    }
    public String getSord() {
        return sord;
    }
    public void setSord(String sord) {
        this.sord = sord;
    }
}
