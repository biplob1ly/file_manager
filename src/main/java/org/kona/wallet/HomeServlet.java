package org.kona.wallet;

import org.kona.wallet.model.KonaFile;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.StringTokenizer;

/**
 * Created by lenovo_pc on 5/5/2016.
 */
@WebServlet(name = "kona-home-servlet", urlPatterns = "/")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("list", getKonaFiles());
        request.setAttribute("message", "List of Kona File");
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
}