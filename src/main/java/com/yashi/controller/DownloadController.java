package com.yashi.controller;

import org.apache.commons.lang.ArrayUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;

/**
 * Created by yashi on 20-07-2017.
 */
@Controller
public class DownloadController {

@RequestMapping(value = "/downloadDocx",method = RequestMethod.GET)
public void downloadDocx(HttpServletRequest request,
                         HttpServletResponse response)
{


    try
    {

        String fileName=request.getParameter("filePath");


        fileName=fileName.substring(2,fileName.length()-2);
        System.out.println(fileName);

        fileName="file:///"+fileName;
        System.out.println(fileName);



        URL url = new URL(fileName);
        final URLConnection connection = url.openConnection();

        final InputStream is = connection.getInputStream();
        OutputStream outStream = response.getOutputStream();

        String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"", fileName.substring(92)); // to get download file name, in my case eliminating path size is 92
        response.setHeader(headerKey,headerValue);

        int data;
        byte b[]=new byte[999999];
        while ((data = is.read(b)) != -1) {
            byte tmp[]= ArrayUtils.subarray(b, 0, data);
            outStream.write(tmp);
        }
    }
    catch (Exception ex) {
        ex.printStackTrace();

    }


}

}
