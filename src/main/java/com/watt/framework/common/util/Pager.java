/******************************************************************************
 * @File name   :      Pager.java
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
 * 2012-12-22 下午4:00:30        JIAYUAN     1.0            Initial Version
 *****************************************************************************/
package com.watt.framework.common.util;

import com.watt.framework.common.constant.CommonConstants;

/**
 *
 */
public class Pager {
    // current page no.
    private int currentPage = CommonConstants.DEFAULT_CURRENT_PAGE;
    // page size
    private int pageSize = CommonConstants.DEFAULT_PAGE_SIZE;
    // total pages
    private int totalPages;
    // total record size
    private int totalSize;
    // navigation preference
    private NavigationPref pref = new NavigationPref();;
    
    public Pager() {
    }
    
    public Pager(NavigationPref pref) {
        this.pref = pref;
        this.currentPage = pref.getPage();
        this.pageSize = pref.getRows();
    }
    
    /**
     * get current page number.
     * 
     * @Date : 2011-3-4
     * 
     * @return the currentPage
     */
    public int getCurrentPage() {
        return currentPage;
    }

    /**
     * set current page number.
     * 
     * @Date : 2011-3-4
     * 
     * @param currentPage
     *            the currentPage to set
     */
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    /**
     * get page size
     * 
     * @Date : 2011-3-4
     * 
     * @return the pageSize
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * set page size
     * 
     * @Date : 2011-3-4
     * 
     * @param pageSize
     *            the pageSize to set
     */
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    /**
     * get total pages
     * 
     * @Date : 2011-3-4
     * 
     * @return the totalPages
     */
    public int getTotalPages() {
        return totalPages;
    }

    /**
     * set total pages
     * 
     * @Date : 2011-3-4
     * 
     * @param totalPages
     *            the totalPages to set
     */
    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    /**
     * get total size
     * 
     * @Date : 2011-3-4
     * 
     * @return the totalSize
     */
    public int getTotalSize() {
        return totalSize;
    }

    /**
     * set total size
     * 
     * @Date : 2011-3-4
     * 
     * @param totalSize
     *            the totalSize to set
     */
    public void setTotalSize(int totalSize) {
        this.totalSize = totalSize;
    }

    /**
     * get navigation preference
     * 
     * @Date : 2012-8-1
     * 
     * @return the pref
     */
    public NavigationPref getPref() {
        return pref;
    }

    /**
     * set navigation preference
     * 
     * @Date : 2012-8-1
     * 
     * @param pref
     */
    public void setPref(NavigationPref pref) {
        this.pref = pref;
    }

    /**
     * According to total size and page size, rebuild current page and total
     * pages.
     * 
     * @Date : 2011-3-23
     * @param totalSize
     *            - total size of records
     */
    public void rebuild(int totalSize) {
        setTotalSize(totalSize);
        setTotalPages((totalSize - 1) / getPageSize() + 1);
        if (this.currentPage < 1) {
            setCurrentPage(1);
        }
        if (this.currentPage > this.totalPages) {
            setCurrentPage(this.totalPages);
        }
    }

}
