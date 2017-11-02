package com.biyao.admin.sys.authority.dao;

import java.util.List;

import com.biyao.admin.sys.authority.model.Autho;

public interface IAuthoDao {

	public int[] insertBatch(List<Autho> list);

	public int delete(Object[] obj);

	public int HasLimit(Object[] obj, String condition);
}
