package rrs.model.utils;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;

import rrs.utils.CustomException;

public abstract class AbstractSQL {
	
	// @formatter:off
	@Autowired private JdbcTemplate jdbc;
	
	protected Object execute(String sql, Object...params) throws CustomException {
		if(sql == null) throw new CustomException("cannot execute query is null!");
		else if (sql.isEmpty()) throw new CustomException("Cannot execute query is empty!");
		return this.get(this.createSQL(sql, params));
		// TODO insert - update - delete ...
	}
	
	private Object get(String sql) {
		List<Object> list = new LinkedList<>();
		jdbc.query(sql, new RowCallbackHandler() {
			@Override
			public void processRow(ResultSet rs) throws SQLException {
				ResultSetMetaData mt = rs.getMetaData();
				int count = mt.getColumnCount();
				Map<String, Object> map = new HashMap<>();
				for (int i = 0; i < count;) map.put(mt.getColumnName(++i), rs.getObject(i));
				list.add(map);
			}
		});
		return list;
	};
	
	// replace all<"?"> in sql = parameters<...params>
	private String createSQL(String sql, Object...params) throws CustomException {
		String mes = "\n\nRRs-Thông báo 🥵 > Hệ thống phát hiện nghi vấn hack ⚠⚠⚠\nBạn đừng cố hack hệ thống của chúng tôi làm gì😑\n\n";
		StringBuilder q = new StringBuilder(sql);
		LinkedList<Integer> is = new LinkedList<>();
		char[] params2 = sql.toCharArray();
		// get "is" at "?" to replace
		for(int i = 0; i < params2.length; i++) if(params2[i]=='?') is.add(i);
		if(sql.lastIndexOf("--") > -1) throw new CustomException(mes);
		
		// Set parameters in query parameters
		if(params != null) {
			for (int i = 0; i < params.length; i++) {
				Object p = params[i];
				if(p!=null) if(p.toString().lastIndexOf("--") > -1)
					throw new CustomException(mes);
				
				// set type of value has in primitive
				try {
					if(NumberUtils.isCreatable(p.toString())) continue;
					params[i] = BooleanUtils.toBooleanObject(p.toString()) ? 1 : 0;
					continue;
				} catch (Exception e) {}
	
				// set value non-primitive
				if(p instanceof String || p instanceof Character)
					if(p.toString().equalsIgnoreCase("null")) params[i] = "NULL";
					else params[i] = "'"+p+"'";
				else if(p instanceof Date)
					params[i] = new StringBuilder("'")
					.append(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(p))
					.append("'");
			}

			// Set query -> replace ?[i] = param[i];
			for (int i = is.size(), j = 0; i > 0;)
				if(i > params.length) q.replace(j = is.get(--i), j+1, "NULL");
				else q.replace(j = is.get(--i), j+1, params[i] == null ? "NULL" : params[i].toString());
		} else for (int i = is.size(), j = 0; i > 0;) q.replace(j = is.get(--i), j+1, "NULL");
		return q.toString();
	}
	// @formatter:on
}
