package userpackage.Controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.S3Object;

/**
 * Servlet implementation class AWSDownloadServlet
 */
@WebServlet("/AWSDownloadServlet")
public class AWSDownloadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AWSDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        System.out.println("In AWSDownloadServlet");

        CredentialsLoader credentialsLoader = new CredentialsLoader();

        //BucketName
        String bucketName = credentialsLoader.getProperty("AWS_BUCKET");


        String key = request.getParameter("key");

        if (key == null || key.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing image key");
            return;
        }

        AmazonS3 s3Client = AmazonS3ClientBuilder.standard().build();

        try {
            S3Object s3Object = s3Client.getObject(new GetObjectRequest(bucketName, key));
            InputStream in = s3Object.getObjectContent();

            // Set the content type based on the image type
            String contentType = s3Object.getObjectMetadata().getContentType();
            response.setContentType(contentType);
            response.setContentLengthLong(s3Object.getObjectMetadata().getContentLength());

            OutputStream out = response.getOutputStream();

            // Copy image data from S3 object stream to servlet response output stream
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
            in.close();
            out.flush();
            out.close();
        } catch (Exception e) {
            // Handle exceptions
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving image from S3");
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
