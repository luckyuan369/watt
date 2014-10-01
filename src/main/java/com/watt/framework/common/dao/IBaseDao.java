package com.watt.framework.common.dao;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

import com.watt.framework.common.util.Pager;

/**
 * TODO:
 * 
 * @author JIAYUAN
 * 
 */
public interface IBaseDao<T, PK> {

    /**
     * 获取实体管理BEAN
     * @return
     */
    EntityManager getEntityManager();

    /**
     * 根据主键ID查询
     * @param id
     * @return
     */
    T findById(PK id);

    /**
     * 根据HQL语句查询
     * @param queryStr
     * @return
     */
    List<T> getListByQuery(final String queryStr);

    /**
     * 分页查询结果集 
     * @param queryStr
     * @param countQueryStr
     * @param pager
     * @return
     */
    List<T> getListByQueryWithPaging(final String queryStr, final String countQueryStr, Pager pager);

    /**
     * 分页查询结果集
     * @param queryStr
     * @param pager
     * @return
     */
    List<T> getListByQueryWithDefaultPaging(final String queryStr, Pager pager);
    
    /**
     * 根据参数名占位符查询
     * @Date        :      2012-12-26
     * @param queryName
     * @return
     */
    List<T> getListByNamedQuery(final String queryName);
    
    /**
     * 带分页查询
     * @Date        :      2012-12-27
     * @param queryName
     * @param countQueryName
     * @param pager
     * @return
     */
    List<T> getListByNamedQueryWithPaging(final String queryName, final String countQueryName,
        Pager pager);
    
    List<T> getListByNamedQueryWithMap(final String queryName, final Map<String, ?> paraMap);

    List<T> getListByNamedQueryWithVaParam(final String queryName, final Object... params);
    
    
    List<T> getListByNativeQuery(final String nativeQuerySql);

    List<T> getListByNativeQueryWithPaging(final String nativeQuerySql,
        final String countNativeQuerySql, Pager pager);

    List<T> getListByNativeQueryWithMap(final String nativeQuerySql, final Map<String, ?> paraMap);

    List<T> getListByNativeQueryWithVaParam(final String nativeQuerySql, final Object... params);

    List<T> getListByNativeQueryAndRSMapping(final String nativeQuerySql,
        final String sqlResultSetMappingName);
    
    List<T> getListByNativeQueryWithPagingAndRSMapping(final String nativeQuerySql,
        final String sqlResultSetMappingName, final String countNativeQuerySql, Pager pager);

    List<T> getListByNativeQueryWithMapAndRSMapping(final String nativeQuerySql,
        final String sqlResultSetMappingName, final Map<String, ?> paraMap);

    List<T> getListByNativeQueryWithVaParamAndRSMapping(final String nativeQuerySql,
        final String sqlResultSetMappingName, final Object... params);
    
    int countByQuery(final String queryStr);

    int countByQueryWithMap(final String queryStr, final Map<String, ?> paraMap);

    int countByQueryWithVaParam(final String queryStr, final Object... params);

    int countByNamedQuery(final String queryName);

    int countByNamedQueryWithMap(final String queryName, final Map<String, ?> paraMap);

    int countByNamedQueryWithVaParam(final String queryName, final Object... params);

    int countByNativeQuery(final String nativeQuerySql);

    int countByNativeQueryWithMap(final String nativeQuerySql, final Map<String, ?> paraMap);

    int countByNativeQueryWithVaParam(final String nativeQuerySql, final Object... params);

    /**
     * 刷新
     */
    void flush();

    /**
     * 清空
     */
    void clear();

    /**
     * 根据对象保存
     * @param obj
     * @return
     */
    T save(T obj);

    /**
     * 根据对象修改 
     * @param obj
     */
    void update(T obj);

    /**
     * HQL修改
     * @param queryStr
     */
    void updateByQuery(String queryStr);

    /**
     * ͨ带参数HQL修改
     * * @param queryStr
     * @param paraMap
     */
    void updateByQueryAndMap(final String queryStr, final Map<String, ?> paraMap);

    /**
     * 带参数HQL修改
     * @param queryStr
     * @param params
     */
    void updateByQueryAndVaParam(final String queryStr, final Object... params);

    /**
     * 根据对象删除
     * @param obj
     */
    void remove(T obj);

    /**
     * HQL删除 
     * @param queryStr
     */
    void removeByQuery(String queryStr);

    /**
     * 带参数HQL删除
     * @param queryStr
     * @param paraMap
     */
    void removeByQueryAndMap(final String queryStr, final Map<String, ?> paraMap);

    /**
     * 带参数HQL删除
     * @param queryStr
     * @param params
     */
    void removeByQueryAndVaParam(final String queryStr, final Object... params);

    /**
     * 根据主键删除
     * @param id
     */
    void remove(long id);

}
