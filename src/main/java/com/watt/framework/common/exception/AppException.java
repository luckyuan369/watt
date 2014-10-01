/******************************************************************************
 * @File name   :      AppException.java
 *
 * @Author      :      JIAYUAN
 *
 * @Date        :      2012-12-26
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
 * 2012-12-26 下午1:34:11        JIAYUAN     1.0            Initial Version
 *****************************************************************************/
package com.watt.framework.common.exception;

/**
 * 应用异常处理类
 */
public class AppException extends Exception {
    
    private static final long serialVersionUID = 1L;

    private String errorCode;
    private String description;
    private Throwable cause;
    
    public AppException(String errCode) {
        super(errCode);
        this.errorCode = errCode;
    }
    
    public AppException(String errCode, String description) {
        super(description);
        this.errorCode = errCode;
        this.description = description; 
    }
    
    public AppException(String errCode, String description, Throwable cause) {
        super(description,cause);
        this.errorCode = errCode;
        this.description = description;
        this.cause = cause;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Throwable getCause() {
        return cause;
    }

    public void setCause(Throwable cause) {
        this.cause = cause;
    }
    
    @Override
    public String toString() {
        return "错误:"+description+",详细:"+cause;
    }
}
