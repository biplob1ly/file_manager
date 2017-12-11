package org.kona.wallet;

import org.kona.wallet.model.KonaFile;

import java.io.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "kona-servlet", urlPatterns = "/upload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,    // 10 MB
        maxFileSize = 1024 * 1024 * 50,        // 50 MB
        maxRequestSize = 1024 * 1024 * 100)    // 100 MB
public class FileUploadServlet extends HttpServlet {

//    String root= getServletContext().getRealPath("/");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/upload.jsp").forward(
                request, response);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        BufferedWriter bw = null;

        File fileSaveDir = new File(Constant.uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        File infoFile = new File(Constant.log);
        if (!infoFile.exists()) {
            infoFile.createNewFile();
        }

        System.out.println("Upload KonaFile Directory=" + fileSaveDir.getAbsolutePath());

        String file_info = "";
        String sessionName = request.getParameter("sessionName");
        String date = request.getParameter("date");
        String sessionPath = Constant.uploadFilePath + File.separator + sessionName;
        File sessionDir = new File(sessionPath);
        if (!sessionDir.exists()) {
            sessionDir.mkdirs();
        }
        request.setAttribute("message", "KonaFile uploaded successfully!");
        try {

            String[] paramValues = request.getParameterValues("textFieldName");

            bw = new BufferedWriter(new FileWriter(infoFile, true));

            int count = 0;
            for (Part part : request.getParts()) {
                if (part.getName().equals("fileName")) {
                    String fileName = getFileName(part);
                    String filePath = sessionPath + File.separator + fileName;
                    part.write(filePath);

                    file_info = sessionName + "|" + paramValues[count] + "|" + date + "|" + filePath;

                    bw.write(file_info);
                    bw.newLine();
                    count++;
                }

            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(FileUploadServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", "KonaFile is not uploaded!");
        } catch (IOException ex) {
            Logger.getLogger(FileUploadServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", "KonaFile is not uploaded!");
        } finally {
            bw.close();
        }

        request.setAttribute("list", getKonaFiles());
        getServletContext().getRequestDispatcher("/filelist.jsp").forward(
                request, response);
    }

    private ArrayList<KonaFile> getKonaFiles() {
        ArrayList<KonaFile> files = new ArrayList<KonaFile>();
        BufferedReader br = null;
        File logFile;
        try {
            logFile = new File(Constant.log);
            br = new BufferedReader(new FileReader(logFile));
            String line;
            while((line = br.readLine()) != null) {
                StringTokenizer stToken = new StringTokenizer(line, "|");

                KonaFile file = new KonaFile(stToken.nextToken(),stToken.nextToken(),stToken.nextToken(),stToken.nextToken());
                files.add(file);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        Collections.reverse(files);

        return files;

    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= " + contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}