package Conducting;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Iterator;
import javafx.util.Pair;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ReadFile {

    String filepath=null;
    public ReadFile(String path) {
        this.filepath=path;
    }
    
    ArrayList<Pair<String,String>> fileread()
    {       
        ArrayList<Pair<String,String>> al=new ArrayList<>();
        try{
            FileInputStream file;
            file = new FileInputStream(new File(filepath));

            //Create Workbook instance holding reference to .xlsx file
            XSSFWorkbook workbook = new XSSFWorkbook(file);

            //Get first/desired sheet from the workbook
            XSSFSheet sheet = workbook.getSheetAt(0);

            //Iterate through each rows one by one
            Iterator<Row> rowIterator = sheet.iterator();
            while (rowIterator.hasNext()){
            Row row = rowIterator.next();
            //For each row, iterate through all the columns
            Iterator<Cell> cellIterator = row.cellIterator();
            
            while (cellIterator.hasNext()){
                Cell cell = cellIterator.next();
                String s1=cell.getStringCellValue();
                cell=cellIterator.next();
                String s2 = cell.getStringCellValue();
                al.add(new Pair(s1,s2));
                if(cellIterator.hasNext())
                    return null;
            }
            }
            file.close();
        } 
            catch (Exception e) 
            {
                e.printStackTrace();
                return null;
            }
            return al;
    }
}
