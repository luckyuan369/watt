package com.watt.framework.common.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.commons.lang3.StringUtils;

import com.watt.framework.common.dao.IBaseDao;
import com.watt.framework.common.domain.BaseDomain;
import com.watt.framework.common.util.Pager;

public class BaseDaoImpl<T extends BaseDomain, PK extends Serializable> implements IBaseDao<T, PK> {
    
    private static final String SQL_KEY_WORD_FROM = "from ";
    private static final String SQL_COUNT_CLAUSE = "select count(*) ";
	private Class<T> clazz;
	
	@PersistenceContext
	private EntityManager entityManager;
	
	public EntityManager getEntityManager() {
		return this.entityManager;
	}
	
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}
	
	public BaseDaoImpl(Class<T> clazz) {
        this.clazz = clazz;
    }
	
	public T findById(PK id) {
		T obj = entityManager.find(clazz, id);
		return obj;
	}

	@SuppressWarnings("unchecked")
    public List<T> getListByQuery(String queryStr) {
		return entityManager.createQuery(queryStr).getResultList();
	}

	@SuppressWarnings("unchecked")
    public List<T> getListByQueryWithPaging(String queryStr, String countQueryStr, Pager pager) {
        if (pager == null) {
            pager = new Pager();
        }
        StringBuffer sortQueryStr = new StringBuffer(queryStr);
        sortQueryStr.append(" order by ");
        sortQueryStr.append(pager.getPref().getSidx());
        sortQueryStr.append(" ");
        sortQueryStr.append(pager.getPref().getSord());
        
        Query query = entityManager.createQuery(queryStr,clazz);
        Query countQuery = entityManager.createQuery(countQueryStr);
        int actualSize = Integer.parseInt(countQuery.getSingleResult().toString());
        if (null != pager) {
            pager.rebuild(actualSize);
            query.setFirstResult((pager.getCurrentPage() - 1) * pager.getPageSize());
            query.setMaxResults(pager.getPageSize());
        }
        return query.getResultList();
    }

	public List<T> getListByQueryWithDefaultPaging(String queryStr, Pager pager) {
        if (StringUtils.isBlank(queryStr)) {
            throw new IllegalArgumentException("Query String is NULL.");
        }
        int fromIndex = queryStr.toLowerCase().indexOf(SQL_KEY_WORD_FROM);
        String countQueryStr;
        if (fromIndex > -1) {
            countQueryStr = SQL_COUNT_CLAUSE + queryStr.substring(fromIndex);
        } else {
            countQueryStr = SQL_COUNT_CLAUSE + queryStr;
        }

        return getListByQueryWithPaging(queryStr, countQueryStr, pager);
	}
	
	@SuppressWarnings("unchecked")
    public List<T> getListByNamedQuery(String queryName) {
		return entityManager.createNamedQuery(queryName).getResultList();
	}
	
	@SuppressWarnings("unchecked")
    public List<T> getListByNativeQuery(String nativeQuerySql) {
	    Query nativeQuery = entityManager.createNativeQuery(nativeQuerySql, clazz);
        return nativeQuery.getResultList();
	}

	@SuppressWarnings("unchecked")
    public List<T> getListByNativeQueryWithPaging(String nativeQuerySql,
			String countNativeQuerySql, Pager pager) {
	    if (null == pager) {
            pager = new Pager();
        }
	    Query nativeQuery = entityManager.createNativeQuery(nativeQuerySql);
        Query countNativeQuery = entityManager.createNativeQuery(countNativeQuerySql);
        int actualSize = Integer.parseInt(countNativeQuery.getSingleResult().toString());
        if (null != pager) {
            pager.rebuild(actualSize);
            nativeQuery.setFirstResult((pager.getCurrentPage() - 1) * pager.getPageSize());
            nativeQuery.setMaxResults(pager.getPageSize());
        }
        return nativeQuery.getResultList();
	}
	
	@SuppressWarnings("unchecked")
    public List<T> getListByNativeQueryWithMap(String nativeQuerySql,
			Map<String, ?> paraMap) {
	    Query nativeQuery = entityManager.createNativeQuery(nativeQuerySql, clazz);
        prepareQueryParam(nativeQuery, paraMap);
        return nativeQuery.getResultList();
	}
	
	@SuppressWarnings("unchecked")
    public List<T> getListByNativeQueryWithVaParam(String nativeQuerySql,
			Object... params) {
	    Query nativeQuery = entityManager.createNativeQuery(nativeQuerySql, clazz);
        prepareQueryParam(nativeQuery, params);
        return nativeQuery.getResultList();
	}
	
	@SuppressWarnings("unchecked")
    public List<T> getListByNativeQueryAndRSMapping(String nativeQuerySql,
			String sqlResultSetMappingName) {
	    Query nativeQuery = entityManager.createNativeQuery(nativeQuerySql, sqlResultSetMappingName);
        return nativeQuery.getResultList();
	}
	
	@SuppressWarnings("unchecked")
    public List<T> getListByNativeQueryWithPagingAndRSMapping(
			String nativeQuerySql, String sqlResultSetMappingName,
			String countNativeQuerySql, Pager pager) {
	    if (null == pager) {
            pager = new Pager();
        }
        Query nativeQuery = entityManager.createNativeQuery(nativeQuerySql, sqlResultSetMappingName);
        Query countNativeQuery = entityManager.createNativeQuery(countNativeQuerySql);
        int actualSize = Integer.parseInt(countNativeQuery.getSingleResult().toString());
        if (null != pager) {
            pager.rebuild(actualSize);
            nativeQuery.setFirstResult((pager.getCurrentPage() - 1) * pager.getPageSize());
            nativeQuery.setMaxResults(pager.getPageSize());
        }
        return nativeQuery.getResultList();
	}

	@SuppressWarnings("unchecked")
    public List<T> getListByNativeQueryWithMapAndRSMapping(
			String nativeQuerySql, String sqlResultSetMappingName,
			Map<String, ?> paraMap) {
	    Query nativeQuery = entityManager.createNativeQuery(nativeQuerySql, sqlResultSetMappingName);
        prepareQueryParam(nativeQuery, paraMap);
        return nativeQuery.getResultList();
	}

	@SuppressWarnings("unchecked")
    public List<T> getListByNativeQueryWithVaParamAndRSMapping(
			String nativeQuerySql, String sqlResultSetMappingName,
			Object... params) {
	    Query nativeQuery = entityManager.createNativeQuery(nativeQuerySql, sqlResultSetMappingName);
        prepareQueryParam(nativeQuery, params);
        return nativeQuery.getResultList();
	}

	public int countByQuery(String queryStr) {
	    return ((Long) entityManager.createQuery(queryStr).getSingleResult()).intValue();
	}
	
	public int countByQueryWithMap(String queryStr, Map<String, ?> paraMap) {
	    Query query = entityManager.createQuery(queryStr);
        prepareQueryParam(query, paraMap);
        return ((Long) query.getSingleResult()).intValue();
	}

	public int countByQueryWithVaParam(String queryStr, Object... params) {
	    Query query = entityManager.createQuery(queryStr);
        prepareQueryParam(query, params);
        return ((Long) query.getSingleResult()).intValue();
	}

	public int countByNamedQuery(String queryName) {
	    Object countObj = entityManager.createNamedQuery(queryName).getSingleResult();
        return Integer.parseInt(countObj.toString());
	}

	public int countByNamedQueryWithMap(String queryName, Map<String, ?> paraMap) {
	    Query namedQuery = entityManager.createNamedQuery(queryName);
        prepareQueryParam(namedQuery, paraMap);

        Object countObj = namedQuery.getSingleResult();
        return Integer.parseInt(countObj.toString());
	}

	public int countByNamedQueryWithVaParam(String queryName, Object... params) {
	    Query namedQuery = entityManager.createNamedQuery(queryName);
        prepareQueryParam(namedQuery, params);

        Object countObj = namedQuery.getSingleResult();
        return Integer.parseInt(countObj.toString());
	}

	public int countByNativeQuery(String nativeQuerySql) {
	    Object countObj = entityManager.createNativeQuery(nativeQuerySql).getSingleResult();
        return Integer.parseInt(countObj.toString());
	}

	public int countByNativeQueryWithMap(String nativeQuerySql, Map<String, ?> paraMap) {
        Query nativeQuery = entityManager.createNativeQuery(nativeQuerySql);
        prepareQueryParam(nativeQuery, paraMap);
        Object countObj = nativeQuery.getSingleResult();
        return Integer.parseInt(countObj.toString());
    }

	public int countByNativeQueryWithVaParam(String nativeQuerySql,
			Object... params) {
	    Query nativeQuery = entityManager.createNativeQuery(nativeQuerySql);
        prepareQueryParam(nativeQuery, params);

        Object countObj = nativeQuery.getSingleResult();
        return Integer.parseInt(countObj.toString());
	}

	public void flush() {
	    entityManager.flush();
	}

	public void clear() {
	    entityManager.flush();
	    entityManager.clear();
	}
	
	public T save(T obj) {
	    if (obj == null) {
            return null;
        }
		entityManager.persist(obj);
		return obj;
	}

	public void update(T obj) {
		if (obj == null) {
			return;
		}
		entityManager.merge(obj);
	}

	public void updateByQuery(String queryStr) {
	    Query query = entityManager.createQuery(queryStr);
	    query.executeUpdate();
	}

	public void updateByQueryAndMap(String queryStr, Map<String, ?> paraMap) {
	    Query updateQuery = entityManager.createQuery(queryStr);
        prepareQueryParam(updateQuery, paraMap);
        updateQuery.executeUpdate();
	}

	public void updateByQueryAndVaParam(String queryStr, Object... params) {
	    Query updateQuery = entityManager.createQuery(queryStr);
        prepareQueryParam(updateQuery, params);
        updateQuery.executeUpdate();
	}

	public void remove(T obj) {
		if(obj == null){
		    return ;
		}
		entityManager.remove(entityManager.merge(obj));
	}

	public void removeByQuery(String queryStr) {
	    Query query = entityManager.createQuery(queryStr);
        query.executeUpdate();
	}

	public void removeByQueryAndMap(String queryStr, Map<String, ?> paraMap) {
	    Query removeQuery = entityManager.createQuery(queryStr);
        prepareQueryParam(removeQuery, paraMap);
        removeQuery.executeUpdate();
	}

	public void removeByQueryAndVaParam(String queryStr, Object... params) {
	    Query removeQuery = entityManager.createQuery(queryStr);
        prepareQueryParam(removeQuery, params);
        removeQuery.executeUpdate();
	}

	public void remove(long id) {
	    String queryStr = "delete from " + clazz.getSimpleName() + " o where o.id = " + id;
        this.removeByQuery(queryStr);
	}

	private void prepareQueryParam(Query query, Object... params) {
        if (null != params) {
            for (int i = 0; i < params.length; i++) {
                query.setParameter(i + 1, params[i]);
            }
        }
    }
	
	private void prepareQueryParam(Query query, Map<String, ?> paraMap) {
        if (null != paraMap) {
            for (Map.Entry<String, ?> entry : paraMap.entrySet()) {
                query.setParameter(entry.getKey(), entry.getValue());
            }
        }
    }

    /**
     * {@inheritDoc} 
     * overridden:
     * @Date        :      2012-12-26
     * @see com.capgemini.framework.common.dao.IBaseDao#getListByNamedQueryWithPaging(java.lang.String, java.lang.String, com.capgemini.framework.common.util.Pager)
    **/
    @SuppressWarnings("unchecked")
    public List<T> getListByNamedQueryWithPaging(String queryName, String countQueryName,
        Pager pager) {
        if (null == pager) {
            pager = new Pager();
        }
        Query namedQuery = entityManager.createNamedQuery(queryName);

        Query countNamedQuery = entityManager.createNamedQuery(countQueryName);
        int actualSize = Integer.parseInt(countNamedQuery.getSingleResult().toString());
        if (null != pager) {
            pager.rebuild(actualSize);
            namedQuery.setFirstResult((pager.getCurrentPage() - 1) * pager.getPageSize());
            namedQuery.setMaxResults(pager.getPageSize());
        }
        return namedQuery.getResultList();
    }

    /**
     * {@inheritDoc} 
     * overridden:
     * @Date        :      2012-12-26
     * @see com.capgemini.framework.common.dao.IBaseDao#getListByNamedQueryWithMap(java.lang.String, java.util.Map)
    **/
    @SuppressWarnings("unchecked")
    public List<T> getListByNamedQueryWithMap(String queryName, Map<String, ?> paraMap) {
        Query nameQuery = entityManager.createNamedQuery(queryName, clazz);
        prepareQueryParam(nameQuery, paraMap);
        return nameQuery.getResultList();
    }

    /**
     * {@inheritDoc} 
     * overridden:
     * @Date        :      2012-12-26
     * @see com.capgemini.framework.common.dao.IBaseDao#getListByNamedQueryWithVaParam(java.lang.String, java.lang.Object[])
    **/
    @SuppressWarnings("unchecked")
    public List<T> getListByNamedQueryWithVaParam(String queryName, Object... params) {
        Query nameQuery = entityManager.createNamedQuery(queryName, clazz);
        prepareQueryParam(nameQuery, params);
        return nameQuery.getResultList();
    }
}
