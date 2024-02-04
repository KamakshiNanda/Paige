/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.http.Part;

/**
 *
 * @author KAMAKSHI
 */
public class CompressImage {
    public static ByteArrayOutputStream compress(Part filePart) throws IOException
    {
        float compressionQuality=0.1f;
        long size=filePart.getSize();
        String content=filePart.getContentType();
        System.out.print("size="+size+" content="+content);
        if(size<1000000)
        {
            compressionQuality=0.9f;
            System.out.println("compressionQuality=0.9f;");
        }
        else if(size<=2054792)
        {
            compressionQuality=0.3f;
            System.out.println("compressionQuality=0.3f;");
        }
        else if(size<=2492789)
        {
            compressionQuality=0.205f;
            System.out.println("compressionQuality=0.205f;");
        }
        else if(size<=3255514)
        {
            compressionQuality=0.2f;
            System.out.println("compressionQuality=0.2f;");
        }
        else if(size<=4259840)
        {
            compressionQuality=0.15f;
            System.out.println("compressionQuality=0.15f;");
        }
        InputStream is=filePart.getInputStream();
        BufferedImage image = ImageIO.read(is);
        System.out.println("image="+image);
        System.out.println("is="+is);
       
        File output = new File("C:\\Users\\KAMAKSHI NANDA\\Desktop\\tmp\\compressFunction.jpg");
        //File output = new File("\\compressFunction.jpg");
        OutputStream out2 = new FileOutputStream(output);

        ImageWriter writer =  ImageIO.getImageWritersByFormatName("jpg").next();
        ImageOutputStream ios = ImageIO.createImageOutputStream(out2);
        writer.setOutput(ios);

        ImageWriteParam param = writer.getDefaultWriteParam();
        if (param.canWriteCompressed())
        {
            param.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
            param.setCompressionQuality(compressionQuality);
        }

        writer.write(null, new IIOImage(image, null, null), param);

        out2.close();
        ios.close();
        writer.dispose();
            
        BufferedImage image2 = ImageIO.read(output);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(image2, "jpg", baos);
            
        return baos;
    }
    
}
