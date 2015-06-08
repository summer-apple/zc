package com.zc.service;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;




public class JsonService {
	
	
/*
 * object转化成json
 */
	private JSONObject objectToJson(Object object) {
		JSONObject job = new JSONObject();
		
		Method[] methods = object.getClass().getMethods();//Object.class.getMethods();// 类的方法

		for (Method method : methods) {
			String methodName = method.getName();//获取方法名
			
			if (methodName.startsWith("get") && !methodName.equals("getClass")) {
				String jsonkey = methodName.substring(3).toLowerCase();//根据方法名获取key值
				Object jsonvalue = null;
				
				try {
					jsonvalue = method.invoke(object);//调用get方法获取值
					
					if (jsonvalue!=null) {//判断是否为null
						if (jsonvalue.getClass().toString().endsWith("ArrayList")) {//判断值是否为list
							JSONArray jary = this.listToJson((List<Object>) jsonvalue);//调用listToJson生成JsonArray
							job.put(jsonkey, jary);//将生成的JsonArray加入
						} else {
							job.put(jsonkey, jsonvalue);//取到的值不为列表，直接put
						}
					} else {
						job.put(jsonkey, "null");//取到的值不为列表，直接put
					}
					
				} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
					e.printStackTrace();	
				}
			
//System.out.println(jsonkey+"="+jsonvalue);

			}
		}
		
		
//System.out.println(job.toJSONString());
//		System.out.println(job.size());
		return job;
	}
	
	
	/*
	 * list转化成json
	 */	
	private JSONArray listToJson(List<Object> lo) {
		JSONArray jary = new JSONArray();
		
		for (int i = 0; i < lo.size(); i++) {
			
			JSONObject jo = this.objectToJson(lo.get(i));//每一个对象调用objectToJson转换为json对象
			jary.add(jo);//将生成的json对象加入jsonarray
			
		}
		
		return jary;
	}
	
	
	
	
	
	
	
	
	
	/*
	 * 返回json对象
	 */	
	public JSONObject getJson(Object object) {
		JSONObject obj = new JSONObject();
		
		String objclass = object.getClass().toString();//获取对象类型
		
		if (objclass.endsWith("ArrayList")) {//判断对象是否为列表
			
			List<Object> lo = (List<Object>) object;
			
			String beanclass = lo.get(0).getClass().toString();
			String jsonkey = "";
			int lastpointindex = beanclass.lastIndexOf(".");
			String beanname = beanclass.substring(lastpointindex+1);
			
			jsonkey = beanname.toLowerCase()+"list";
			
			JSONArray jsonvalue = this.listToJson((List<Object>) object);
			
			obj.put(jsonkey, jsonvalue);
			
		}else {
			obj = this.objectToJson(object);
		}
		
		return obj;
	}
}
