package com.artesyn.resource.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Utils {
	
	public static String getMD5Str(String str){
		MessageDigest messageDigest=null;
		
			try {
				messageDigest=MessageDigest.getInstance("MD5");
				messageDigest.reset();
				messageDigest.update(str.getBytes("UTF-8"));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
				System.exit(-1);
			}catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			byte[] byteArray=messageDigest.digest();
			StringBuffer md5strBuff=new StringBuffer();
			for (int i = 0; i < byteArray.length; i++) {
				if(Integer.toHexString(0xFF&byteArray[i]).length()==1)
					md5strBuff.append("0").append(Integer.toHexString(0xFF&byteArray[i]));
				else
					md5strBuff.append(Integer.toHexString(0xFF&byteArray[i]));
			}
			return md5strBuff.toString();
	}
	
	public static void main(String[] args) {
		System.out.println(getMD5Str("123456"));
	}
}
