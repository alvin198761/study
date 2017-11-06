package com.dl.keep.sys.authority.dao;

import java.util.List;

import com.dl.keep.sys.authority.model.Autho;

public interface IAuthoDao {

	int[] insertBatch(List<Autho> list);

	int delete(Object[] obj);

	int HasLimit(Object[] obj, String condition);

	String getLimtCondition(String resourceType, String userId);

	boolean getButtonLimt(String userId, String key);
}
