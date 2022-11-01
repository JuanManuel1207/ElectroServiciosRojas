/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pdf;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import java.awt.Color;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import modelo.Ventas;

/**
 *
 * @author juanm
 */
public class VentasPDF {
    private List<Ventas> ventas;

    public VentasPDF() {
    }

    public VentasPDF(List<Ventas> ventas) {
        this.ventas = ventas;
    }
    
    public void writeHeader(PdfPTable pdfTable){
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(new Color(191, 70, 17));
       
        
        cell.setPhrase(new Phrase("Id Venta"));
        pdfTable.addCell(cell);
        
        cell.setPhrase(new Phrase("Cliente"));
        pdfTable.addCell(cell);
        
        cell.setPhrase(new Phrase("Fecha Venta"));
        pdfTable.addCell(cell);
        
        cell.setPhrase(new Phrase("Valor Total"));
        pdfTable.addCell(cell);
        
    }
    
    
    public void writeTableData(PdfPTable pTable){
        for (Ventas venta : ventas) {
            pTable.addCell(venta.getIdVenta());
            pTable.addCell(venta.getCliente());
            pTable.addCell(venta.getFecha());
            pTable.addCell(venta.getPriceProduct()+"");
        }
    }
    
    public void export(HttpServletResponse response) throws DocumentException{
        
        Document document = new Document(PageSize.LETTER.rotate());
        
        try {
            PdfWriter.getInstance(document, response.getOutputStream());
        } catch (IOException ex) {
            Logger.getLogger(ServiciosPDF.class.getName()).log(Level.SEVERE, null, ex);
        }
            document.open();
            
       /*     com.lowagie.text.Image header = com.lowagie.text.Image.getInstance("Electro.jpg");
            header.scaleToFit(650, 1000);
            header.setAlignment(header.ALIGN_CENTER);
            document.add(header);
        */    
            Paragraph paragraph = new Paragraph("Reporte Ventas");
            paragraph.setAlignment(paragraph.ALIGN_CENTER);
            document.add(paragraph);
            
            PdfPTable table = new PdfPTable(4);
            table.setWidthPercentage(100);
            table.setWidths(new float[]{3.5f, 3.5f, 3.5f, 3.5f});
            table.setSpacingAfter(10);
            
            writeHeader(table);
            writeTableData(table);
        
            document.add(table);
        
            
            document.close();
        }
}
