package dut.com.libs;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	/**
	 * <h1>convertToUDate</h1> Chuyen ngay kieu java.util.Date thanh
	 * java.sql.Date
	 * 
	 * @param sDate
	 *            java.sql.Date
	 * @return uDate - java.util.Date hoac null
	 */
	public static java.util.Date convertToUDate(java.sql.Date sDate) {
		if (sDate == null) {
			return null;
		} else {
			java.util.Date uDate = new Date(sDate.getTime());
			return uDate;
		}

	}

	/**
	 * <h1>convertToSDate</h1> Chuyen ngay kieu java.util.Date thanh
	 * java.sql.Date
	 * 
	 * @param uDate
	 *            java.util.Date
	 * @return sDate - java.sql.Date hoac null
	 */
	public static java.sql.Date convertToSDate(java.util.Date uDate) {
		if (uDate == null) {
			return null;
		} else {
			java.sql.Date sDate = new java.sql.Date(uDate.getTime());
			return sDate;
		}
	}

	/**
	 * <h1>convertToUDate</h1> Chuyen ngay kieu java.sql.Timestamp thanh
	 * java.util.Date
	 * 
	 * @param timeStamp
	 *            java.sql.Timestamp
	 * @return uDate - java.util.Date hoac null
	 */
	public static java.util.Date convertToUDate(java.sql.Timestamp timeStamp) {
		if (timeStamp == null) {
			return null;
		} else {
			java.util.Date uDate = new Date(timeStamp.getTime());
			return uDate;
		}
	}

	/**
	 * <h1>convertToTimestamp</h1> Chuyen ngay kieu java.util.Date thanh
	 * java.sql.Timestamp
	 * 
	 * @param uDate
	 *            java.util.Date
	 * @return timeStamp-java.sql.Timestamp hoac null
	 */
	public static java.sql.Timestamp convertToTimestamp(java.util.Date uDate) {
		if (uDate == null) {
			return null;
		} else {
			java.sql.Timestamp timeStamp = new Timestamp(uDate.getTime());
			return timeStamp;
		}

	}

	/**
	 * <h1>convertToSDate</h1> Chuyen String dinh dang "dd/MM/yyyy" thanh ngay
	 * kieu java.sql.Date
	 * 
	 * @param dateInString
	 *            String
	 * @return uDate - java.sql.Date hoac null
	 */
	public static java.sql.Date convertToSDate(String dateInString) {
		if (dateInString == null) {
			return null;
		} else {
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
			java.util.Date uDate = null;
			java.sql.Date sDate = null;
			try {
				uDate = dateFormat.parse(dateInString);
				sDate = new java.sql.Date(uDate.getTime());
			} catch (ParseException e) {
				return null;
			}
			return sDate;
		}
	}
	
	/**
	 * <h1>convertToUDate</h1> Chuyen String dinh dang "dd/MM/yyyy" thanh ngay
	 * kieu java.util.Date
	 * 
	 * @param dateInString
	 *            String
	 * @return uDate - java.util.Date hoac null
	 */
	public static java.util.Date convertToUDate(String dateInString) {
		if (dateInString == null) {
			return null;
		} else {
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
			java.util.Date uDate = null;
			try {
				uDate = dateFormat.parse(dateInString);
			} catch (ParseException e) {
				return null;
			}
			return uDate;
		}
	}

	/**
	 * <h1>convertToUDatetime</h1> Chuyen String dinh dang "dd/MM/yyyy HH:mm:ss"
	 * thanh ngay gio kieu java.util.Date
	 * 
	 * @param datetimeInString
	 *            String
	 * @return uDate-java.util.Date hoac null
	 */
	public static java.util.Date convertToUDatetime(String datetimeInString) {
		if (datetimeInString == null) {
			return null;
		} else {
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			java.util.Date uDate = null;
			try {
				uDate = dateFormat.parse(datetimeInString);
			} catch (ParseException e) {
				return null;
			}
			return uDate;
		}
	}
	
	/**
	 * <h1>convertToTimestamp</h1> Chuyen String dinh dang "dd/MM/yyyy HH:mm:ss"
	 * thanh ngay gio kieu java.sql.Timestamp
	 * 
	 * @param datetimeInString
	 *            String
	 * @return java.sql.Timestamp hoac null
	 */
	public static java.sql.Timestamp convertToTimestamp(String timeStampInString) {
		if (timeStampInString == null) {
			return null;
		} else {
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			java.util.Date uDate = null;
			java.sql.Timestamp timeStamp = null;
			try {
				uDate = dateFormat.parse(timeStampInString);
				timeStamp = new Timestamp(uDate.getTime());
			} catch (ParseException e) {
				return null;
			}
			return timeStamp;
		}
	}

	/**
	 * <h1>formatDate</h1> Dinh dang ngay kieu java.util.Date thanh String theo
	 * mau "dd/MM/yyyy"
	 * 
	 * @param uDate
	 *            java.util.Date
	 * @return Chuoi ngay theo dinh dang "dd/MM/yyyy" hoac null
	 */
	public static String formatDate(java.util.Date uDate) {
		if (uDate == null) {
			return null;
		} else {
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
			return dateFormat.format(uDate);
		}
	}

	/**
	 * <h1>formatDate</h1> Dinh dang ngay kieu java.sql.Date thanh String theo
	 * mau "dd/MM/yyyy"
	 * 
	 * @param sDate
	 *            java.sql.Date
	 * @return Chuoi ngay theo dinh dang "dd/MM/yyyy" hoac null
	 */
	public static String formatDate(java.sql.Date sDate) {
		if (sDate == null) {
			return null;
		} else {
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
			return dateFormat.format(sDate);
		}
	}

	/**
	 * <h1>formatDatetime</h1> Dinh dang ngay gio kieu java.util.Date thanh
	 * String theo mau "dd/MM/yyyy HH:mm:ss"
	 * 
	 * @param uDate
	 * @return Chuoi ngay gio theo dinh dang "dd/MM/yyyy HH:mm:ss" hoac null
	 */
	public static String formatDatetime(java.util.Date uDate) {
		if (uDate == null) {
			return null;
		} else {
			SimpleDateFormat dateFormat = new SimpleDateFormat(
					"dd/MM/yyyy HH:mm:ss");
			return dateFormat.format(uDate);
		}
	}

	/**
	 * <h1>formatDatetime</h1> Dinh dang ngay gio kieu java.sql.Timestamp thanh
	 * String theo mau "dd/MM/yyyy HH:mm:ss"
	 * 
	 * @param timeStamp
	 * @return Chuoi ngay gio theo dinh dang "dd/MM/yyyy HH:mm:ss" hoac null
	 */
	public static String formatDatetime(java.sql.Timestamp timeStamp) {
		if (timeStamp == null) {
			return null;
		} else {
			SimpleDateFormat dateFormat = new SimpleDateFormat(
					"dd/MM/yyyy HH:mm:ss");
			return dateFormat.format(timeStamp);
		}
	}

}
