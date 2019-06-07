package cn.edu.tjpu.utils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.POIXMLDocument;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PushbackInputStream;
import java.util.Date;

/**
 * @描述 : Excel简单操作工具类
 * @创建者：liushengsong
 * @创建时间： 2014-6-6上午9:49:08
 */
public class ExcelUtils {

    private static final Log LOG = LogFactory.getLog(ExcelUtils.class);
    private static final String DATEFORMAT = "yyyy-MM-dd HH:mm:ss";
    private static final String DOUBLEFORMAT = " #,##0.00 ";
    private Workbook workbook;
    private Sheet sheet;
    private Row row;

    public ExcelUtils() {
        this.workbook = new XSSFWorkbook();
        this.sheet = workbook.createSheet();
    }

    public Workbook getWorkbook() {
        return this.workbook;
    }


    public void exportXLS(String fileName) {
        FileOutputStream out = null;
        try {
            out = new FileOutputStream(fileName);
            workbook.write(out);
        } catch (IOException e) {
            LOG.error(e.getMessage(), e);
        } finally {
            CloseUtils.close(out);
        }
    }


    public void createRow(int index) {
        this.row = this.sheet.createRow(index);
    }


    public void setCell(int index, String value) {
        Cell cell = this.row.createCell(index);
        cell.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell.setCellValue(value);
    }


    public void setCell(int index, Date value) {
        Cell cell = this.row.createCell(index);
        cell.setCellValue(value);
        CellStyle cellStyle = workbook.createCellStyle(); // 建立新的cell样式
        cellStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat(DATEFORMAT)); // 设置cell样式为定制的日期格式
        cell.setCellStyle(cellStyle); // 设置该cell日期的显示格式
    }


    public void setCell(int index, int value) {
        Cell cell = this.row.createCell(index);
        cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
        cell.setCellValue(value);
    }

    public void setCell(int index, double value) {
        Cell cell = this.row.createCell(index);
        cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
        cell.setCellValue(value);
        CellStyle cellStyle = workbook.createCellStyle(); // 建立新的cell样式
        cellStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat(DOUBLEFORMAT)); // 设置cell样式为定制的浮点数格式
        cell.setCellStyle(cellStyle); // 设置该cell浮点数的显示格式
    }

    public Sheet getSheet(InputStream inputStream, int pageAt) {
        try {
            Workbook workbook = null;
            if (!inputStream.markSupported()) {
                inputStream = new PushbackInputStream(inputStream, 10);
            }
            if (POIFSFileSystem.hasPOIFSHeader(inputStream)) {// 判断是否为2003
                workbook = new HSSFWorkbook(inputStream);
                return workbook.getSheetAt(pageAt);
            }
            if (POIXMLDocument.hasOOXMLHeader(inputStream)) {// 判断是否为2007
                workbook = new XSSFWorkbook(OPCPackage.open(inputStream));
                return workbook.getSheetAt(pageAt);
            }
            if(workbook == null){
                return null;
            }
            return workbook.getSheetAt(pageAt);
        } catch (InvalidFormatException | IOException e) {
            LOG.error(e.getMessage(), e);
            return null;
        } finally {
            CloseUtils.close(inputStream);
        }
    }

    public String getValue(Cell cell) {
        if (cell != null) {
            switch (cell.getCellType()) {
                case Cell.CELL_TYPE_BOOLEAN:
                    return String.valueOf(cell.getBooleanCellValue());
                case Cell.CELL_TYPE_NUMERIC:
                    return String.valueOf((long)cell.getNumericCellValue());
                default:
                    return String.valueOf(cell.getStringCellValue());
            }
        } else {
            return null;
        }
    }

    public void createSheet() {
        Sheet sheet = this.workbook.createSheet();
        this.sheet = sheet;
    }

}
