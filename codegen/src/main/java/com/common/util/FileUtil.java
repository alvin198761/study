package com.common.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @author gzz_gzz@163.com
 * @date 2015年1月26日下午2:01:13
 * @功能描述: 文件读写辅助类
 */
public class FileUtil {
	private static Log logger = LogFactory.getLog(FileUtil.class);

	// 递归删除文件夹
	public static void deleteFile(File file) {
		if (file.exists()) {// 判断文件是否存在
			if (file.isFile()) {// 判断是否是文件
				file.delete();// 删除文件
			} else if (file.isDirectory()) {// 否则如果它是一个目录
				File[] files = file.listFiles();// 声明目录下所有的文件 files[];
				for (int i = 0; i < files.length; i++) {// 遍历目录下所有的文件
					deleteFile(files[i]);// 把每个文件用这个方法进行迭代
				}
				file.delete();// 删除文件夹
			}
		} else {
			logger.info("所删除的文件不存在");
		}
	}

	/**
	 * 以工作空间编码写文本文件
	 */
	public static void writeFile(String path, String sb) throws IOException {
		File file = new File(path);
		if (file.exists()) {
			// logger.error(path);
		}
		createDir(path);
		OutputStreamWriter write = new OutputStreamWriter(new FileOutputStream(path), "UTF-8");
		BufferedWriter writer = new BufferedWriter(write);
		writer.write(sb);
		// logger.debug("成功创建文件：" + path);
		writer.close();

	}

	/**
	 * 创建文件夹
	 */
	public static void createDir(String path) throws IOException {
		File file = new File(path);
		File parent = file.getParentFile();
		if (parent != null && !parent.exists()) {
			parent.mkdirs();
		}
	}

	public static boolean isWindows() {
		return System.getProperties().getProperty("os.name").toLowerCase().contains("windows");
	}

	/**
	 * 压缩文件或者目录
	 * 
	 * @param baseDirName
	 *            压缩的根目录
	 * @param fileName
	 *            根目录下待压缩的文件或文件夹名， 星号*表示压缩根目录下的全部文件。
	 * @param targetFileName
	 *            目标ZIP文件
	 */
	public static void zipFile(String baseDirName, String fileName, String targetFileName) {
		// 检测根目录是否存在
		if (baseDirName == null) {
			logger.info("压缩失败，根目录不存在：" + baseDirName);
			return;
		}
		File baseDir = new File(baseDirName);
		if (!baseDir.exists() || (!baseDir.isDirectory())) {
			logger.info("压缩失败，根目录不存在：" + baseDirName);
			return;
		}
		String baseDirPath = baseDir.getAbsolutePath();
		// 目标文件
		File targetFile = new File(targetFileName);
		try {
			// 创建一个zip输出流来压缩数据并写入到zip文件
			ZipOutputStream out = new ZipOutputStream(new FileOutputStream(targetFile));
			if (fileName.equals("*")) {
				// 将baseDir目录下的所有文件压缩到ZIP
				dirToZip(baseDirPath, baseDir, out);
			} else {
				File file = new File(baseDir, fileName);
				if (file.isFile()) {
					fileToZip(baseDirPath, file, out);
				} else {
					dirToZip(baseDirPath, file, out);
				}
			}
			out.close();
			// logger.info("压缩文件成功，目标文件名：" + targetFileName);
		} catch (IOException e) {
			logger.info("压缩失败：" + e);
			e.printStackTrace();
		}
	}

	/**
	 * 解压缩ZIP文件，将ZIP文件里的内容解压到targetDIR目录下
	 * 
	 * @param zipName
	 *            待解压缩的ZIP文件名
	 * @param targetBaseDirName
	 *            目标目录
	 */
	public static void upzipFile(String zipFileName, String targetBaseDirName) {
		if (!targetBaseDirName.endsWith(File.separator)) {
			targetBaseDirName += File.separator;
		}
		try {
			// 根据ZIP文件创建ZipFile对象
			ZipFile zipFile = new ZipFile(zipFileName);
			ZipEntry entry = null;
			String entryName = null;
			String targetFileName = null;
			byte[] buffer = new byte[4096];
			int bytes_read;
			// 获取ZIP文件里所有的entry
			Enumeration<?> entrys = zipFile.entries();
			// 遍历所有entry
			while (entrys.hasMoreElements()) {
				entry = (ZipEntry) entrys.nextElement();
				// 获得entry的名字
				entryName = entry.getName();
				targetFileName = targetBaseDirName + entryName;
				if (entry.isDirectory()) {
					// 如果entry是一个目录，则创建目录
					new File(targetFileName).mkdirs();
					continue;
				} else {
					// 如果entry是一个文件，则创建父目录
					new File(targetFileName).getParentFile().mkdirs();
				}

				// 否则创建文件
				File targetFile = new File(targetFileName);
				// logger.info("创建文件：" + targetFile.getAbsolutePath());
				// 打开文件输出流
				FileOutputStream os = new FileOutputStream(targetFile);
				// 从ZipFile对象中打开entry的输入流
				InputStream is = zipFile.getInputStream(entry);
				while ((bytes_read = is.read(buffer)) != -1) {
					os.write(buffer, 0, bytes_read);
				}
				// 关闭流
				os.close();
				is.close();
			}
			zipFile.close();
			// logger.info("解压缩文件成功！");
		} catch (IOException err) {
			System.err.println("解压缩文件失败: " + err);
		}
	}

	/**
	 * 将目录压缩到ZIP输出流。
	 */
	private static void dirToZip(String baseDirPath, File dir, ZipOutputStream out) {
		if (dir.isDirectory()) {
			// 列出dir目录下所有文件
			File[] files = dir.listFiles();
			// 如果是空文件夹
			if (files.length == 0) {
				ZipEntry entry = new ZipEntry(getEntryName(baseDirPath, dir));
				// 存储目录信息
				try {
					out.putNextEntry(entry);
					out.closeEntry();
				} catch (IOException e) {
					e.printStackTrace();
				}
				return;
			}
			for (int i = 0; i < files.length; i++) {
				if (files[i].isFile()) {
					// 如果是文件，调用fileToZip方法
					fileToZip(baseDirPath, files[i], out);
				} else {
					// 如果是目录，递归调用
					dirToZip(baseDirPath, files[i], out);
				}
			}
		}
	}

	/**
	 * 将文件压缩到ZIP输出流
	 */
	private static void fileToZip(String baseDirPath, File file, ZipOutputStream out) {
		FileInputStream in = null;
		ZipEntry entry = null;
		// 创建复制缓冲区
		byte[] buffer = new byte[4096];
		int bytes_read;
		if (file.isFile()) {
			try {
				// 创建一个文件输入流
				in = new FileInputStream(file);
				// 做一个ZipEntry
				entry = new ZipEntry(getEntryName(baseDirPath, file));
				// 存储项信息到压缩文件
				out.putNextEntry(entry);
				// 复制字节到压缩文件
				while ((bytes_read = in.read(buffer)) != -1) {
					out.write(buffer, 0, bytes_read);
				}
				out.closeEntry();
				in.close();
				logger.info("添加文件" + file.getAbsolutePath() + "被到ZIP文件中！");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 获取待压缩文件在ZIP文件中entry的名字。即相对于跟目录的相对路径名
	 * 
	 * @param baseDirPath
	 * @param file
	 * @return
	 */
	private static String getEntryName(String baseDirPath, File file) {
		if (!baseDirPath.endsWith(File.separator)) {
			baseDirPath += File.separator;
		}
		String filePath = file.getAbsolutePath();
		// 对于目录，必须在entry名字后面加上"/"，表示它将以目录项存储。
		if (file.isDirectory()) {
			filePath += "/";
		}
		int index = filePath.indexOf(baseDirPath);
		return filePath.substring(index + baseDirPath.length());
	}

	public static void main(String[] args) {
		// 压缩C盘下的temp目录，压缩后的文件是C:/temp.zip
		String baseDirName = "C:/";
		String fileName = "temp/";
		String zipFileName = "C:/temp.zip";
		zipFile(baseDirName, fileName, zipFileName);
		// 将刚创建的ZIP文件解压缩到D盘的temp目录下
		fileName = "D:/temp";
		upzipFile(zipFileName, fileName);
	}

	public static StringBuilder readFile(String filePath) throws IOException {
		StringBuilder builder = new StringBuilder();
		// 读取文件
		File file = new File(filePath);
		BufferedReader reader = null;
		String str = null;
		reader = new BufferedReader(new FileReader(file));
		while ((str = reader.readLine()) != null) {
			if (!str.equals("")) {
				builder.append(str + "\r\n");
			}
		}
		reader.close();
		return builder;
	}

}
