package mlk.core.service.impl;

import java.util.List;

import mlk.core.bean.BaseDict;
import mlk.core.dao.BaseDictDao;
import mlk.core.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 基础信息数据字典
 */

@Service("systemService")
public class SystemServiceImpl implements SystemService {
	
	@Autowired
	private BaseDictDao baseDictDao;
	//根据类型编号查询数据字典
	public List<BaseDict> findBaseDictListByType(String typecode) {
		return baseDictDao.selectByTypecode(typecode);
	}

}
