/******************************************************************************
 * @File name   :      PageResult.java
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
 * 2012-12-22 下午4:02:10        JIAYUAN     1.0            Initial Version
 *****************************************************************************/
package com.watt.framework.common.util;

import java.util.List;

/**
 *
 */
public class PageResult<T> {
    private List<T> result;
    private Pager pager;

    public PageResult(List<T> result, Pager pager) {
        this.result = result;
        this.pager = pager;
    }

    public List<T> getResult() {
        return result;
    }

    public void setResult(List<T> result) {
        this.result = result;
    }

    public Pager getPager() {
        return pager;
    }

    public void setPager(Pager pager) {
        this.pager = pager;
    }

}
