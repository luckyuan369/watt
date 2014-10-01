package com.watt.framework.home.constant;

import java.text.DecimalFormat;

public class UtilTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		DecimalFormat df = new DecimalFormat("00");
		for(int i=0; i< 30; i++){
			
			System.out.println(df.format(i));
		}
	}

}
