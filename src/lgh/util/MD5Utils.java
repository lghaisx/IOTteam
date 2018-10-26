package lgh.util;


import lgh.model.Production;
import lgh.service.Impl.ProductionServiceImpl;
import lgh.service.ProductionService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Random;

public class MD5Utils {
	/**
	 * 使用md5的算法进行加密
	 */
	private ProductionService productionService;

	public void setProductionService(ProductionService productionService) {
		this.productionService = productionService;
	}

	public static String md5(String plainText) {
		byte[] secretBytes = null;
		try {
			secretBytes = MessageDigest.getInstance("md5").digest(
					plainText.getBytes());
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("没有md5这个算法！");
		}
		String md5code = new BigInteger(1, secretBytes).toString(16);// 16进制数字
		// 如果生成数字未满32位，需要前面补0
		for (int i = 0; i < 32 - md5code.length(); i++) {
			md5code = "0" + md5code;
		}
		return md5code;
	}
	public static String getRandomString(int length){
		//定义一个字符串（A-Z，a-z，0-9）即62位；
		String str="zxcvbnmlkjhgfdsaqwertyuiopQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
		//由Random生成随机数
		Random random=new Random();
		StringBuffer sb=new StringBuffer();
		//长度为几就循环几次
		for(int i=0; i<length; ++i){
			//产生0-61的数字
			int number=random.nextInt(62);
			//将产生的数字通过length次承载到sb中
			sb.append(str.charAt(number));
		}
		//将承载的字符转换成字符串
		return sb.toString();
	}
	@Test
	public void text(){
		//System.out.println(getRandomString(8));
		System.out.println(MD5Utils.md5("123456"));
		//Production list = productionService.getProdu(1);
		//System.out.println(list.getName()+","+list.getMember().getName());
}

}
