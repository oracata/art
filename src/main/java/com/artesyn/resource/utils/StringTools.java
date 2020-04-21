package com.artesyn.resource.utils;

import java.util.Random;
import java.util.UUID;


public class StringTools {
	
	public static String getUUID(){
		return UUID.randomUUID().toString().replaceAll("-", "");	
	}
	
	public static String getStringRandom(int length){
		String val="";
		Random random = new Random();
		for (int i = 0; i <length; i++) {
			String charOrNum=random.nextInt(2)%2==0?"char":"num";
			if("char".equalsIgnoreCase(charOrNum)){
				int temp=random.nextInt(2)%2==0?65:97;
				val+=(char)(random.nextInt(26)+temp);
			}else if("num".equalsIgnoreCase(charOrNum)){
				val+=String.valueOf(random.nextInt(10));
			}
		}
		return val;
	}
	
	public static boolean isBlank(String key){
		boolean flag=true;
		if(key == null || key.length() <= 0){
			flag=false;
		}
		return flag;
	}
	
}
