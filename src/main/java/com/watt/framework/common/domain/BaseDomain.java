/******************************************************************************
 * @File name   :      BaseDomain.java
 *
 * @Author      :      JIAYUAN
 *
 * @Date        :      2012-12-19
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
 * 2012-12-19 ����2:52:07        JIAYUAN     1.0            Initial Version
 *****************************************************************************/
package com.watt.framework.common.domain;

import java.io.Serializable;

import javax.persistence.MappedSuperclass;

/**
 * 
 */
@MappedSuperclass
public abstract class BaseDomain implements Serializable {

    private static final long serialVersionUID = 1L;
    
	
}
