/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pdf;

import com.lowagie.text.Chunk;
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
import modelo.Servicio;

/**
 *
 * @author juanm
 */
public class ServiciosPDF {
    private List<Servicio> servicios;

    public ServiciosPDF() {
    
    }

    public ServiciosPDF(List<Servicio> servicios) {
        this.servicios = servicios;
    }
    
    public void writeHeader(PdfPTable pdfTable){
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(new Color(191, 70, 17));
       
        
        cell.setPhrase(new Phrase("ID"));
        pdfTable.addCell(cell);
        
        cell.setPhrase(new Phrase("Tipo Servicio"));
        pdfTable.addCell(cell);
        
        cell.setPhrase(new Phrase("Cliente"));
        pdfTable.addCell(cell);
        
        cell.setPhrase(new Phrase("Estado"));
        pdfTable.addCell(cell);
        
        cell.setPhrase(new Phrase("Ingreso"));
        pdfTable.addCell(cell);
        
        cell.setPhrase(new Phrase("Salida"));
        pdfTable.addCell(cell);
        
        cell.setPhrase(new Phrase("Descripción"));
        pdfTable.addCell(cell);
        
        cell.setPhrase(new Phrase("Precio"));
        pdfTable.addCell(cell);
        
        cell.setPhrase(new Phrase("Empleado"));
        pdfTable.addCell(cell);
    }
    
    public void writeTableData(PdfPTable pTable){
        for (Servicio servicio : servicios) {
            pTable.addCell(servicio.getId());
            String tipoServ = ( servicio.getTipoServicio().equals("1") ? "REPARACIÓN":"REVISIÓN");
            pTable.addCell(tipoServ);
            pTable.addCell(servicio.getCliente());
            String estado = (servicio.getEstado().equals("1") ? "EN PROCESO" : "TERMINADO");
            pTable.addCell(estado);
            pTable.addCell(servicio.getFechaIngreso());
            pTable.addCell(servicio.getFechaSalida());
            pTable.addCell(servicio.getDescripcion());
            pTable.addCell(servicio.getPrecio());
            pTable.addCell(servicio.getEmpleado());
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
            Paragraph paragraph = new Paragraph("Reporte Servicios");
            paragraph.setAlignment(paragraph.ALIGN_CENTER);
            document.add(paragraph);
            
            PdfPTable table = new PdfPTable(9);
            table.setWidthPercentage(100);
            table.setWidths(new float[]{1.50f, 3.0f, 3.0f, 3.0f, 3.0f, 3.0f, 3.5f, 3.0f, 3.0f});
            table.setSpacingAfter(10);
            
            writeHeader(table);
            writeTableData(table);
        
            document.add(table);
        
            
            document.close();
        }

}

