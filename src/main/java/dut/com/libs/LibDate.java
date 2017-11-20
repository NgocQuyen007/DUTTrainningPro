package dut.com.libs;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class LibDate {
	public static java.sql.Date convertToSDate(String sDate){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date date = null;
		try {
			date = new java.sql.Date(sdf.parse(sDate).getTime());
		} catch (ParseException e) {
			System.out.println("!!! Convert String to SQL Date");
		}
		return date;
	}
}
