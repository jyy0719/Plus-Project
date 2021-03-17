package com.project.plus.utils;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class FileUtils {

	public static String uploadFile(String uploadPath, String orgFileName, byte[] fileSize) throws Exception {

		// 겹쳐지지 않는 파일명을 위한 유니크한 값 생성
		UUID uid = UUID.randomUUID();

		// 원본파일 이름과 UUID 결합
		String newFileName = uid.toString() + "_" + orgFileName;

		// 파일을 저장할 폴더 생성(년 월 일 기준)
		String savePath = calcPath(uploadPath);

		// 저장할 파일준비
		File target = new File(uploadPath + savePath, newFileName);

		// 파일을 저장
		FileCopyUtils.copy(fileSize, target);

		String formatName = orgFileName.substring(orgFileName.lastIndexOf(".") + 1);

		String uploadedFileName = null;

		// uploadedFileName는 썸네일명으로 화면에 전달된다.
		return uploadedFileName;
	}//

	public static String calcPath(String uploadPath) {

		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		// calendar 클래스의 월은 0~11이므로 +1 
		//	DecimalFormat("00") : 빈자리 0으로 채움 
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		makeDir(uploadPath, yearPath, monthPath, datePath);

		// return 연,월,일 폴더 경로 
		return datePath;
	}

	// 폴더 생성 함수
	// ...은 매개변수를 받으나 몇개인지 모를 때 쓴다
	private static void makeDir(String uploadPath, String... paths) {

		if (new File(uploadPath + paths[paths.length - 1]).exists()) {
			return;
		} // if

		for (String path : paths) {

			File dirPath = new File(uploadPath + path);

			if (!dirPath.exists()) {
				dirPath.mkdir();
			} // if

		} // for

	}// makeDir

}
