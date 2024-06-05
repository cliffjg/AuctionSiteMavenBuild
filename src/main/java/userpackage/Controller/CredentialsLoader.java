package userpackage.Controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Properties;

import javax.print.DocFlavor.URL;

//import org.eclipse.jdt.internal.compiler.batch.Main;

public class CredentialsLoader {
    private Properties properties = new Properties();


    public CredentialsLoader() {

//        FileInputStream path = null;
//        try {
//            path = new FileInputStream("src/main/resources/credentials.properties");
//        } catch (FileNotFoundException e) {
//            throw new RuntimeException(e);
//        }

//        InputStream path = getClass().getClassLoader().getResourceAsStream("credentials.properties");
//        String path = CredentialsLoader.class.getClassLoader().getResource("");
//        java.net.URL path = CredentialsLoader.class.getClassLoader().getResource("");
        java.net.URL path = CredentialsLoader.class.getClassLoader().getResource("credentials.properties");
        String modified = String.valueOf(path);

        System.out.println("Path: " + modified);



//        modified = modified.replace(".metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/", "");
//        modified = modified.replace("WEB-INF/classes/", "src/main/resources/credentials.properties");
        modified = modified.replace("file:","");

        System.out.println("Input: " + modified);

        System.out.println("Path: " + modified);


        try (InputStream input = new FileInputStream(modified)) {

            // Load the properties file
            properties.load(input);

            // Print properties for debugging
            properties.forEach((key, value) -> System.out.println(key + ": " + value));

        } catch (IOException ex) {
            ex.printStackTrace();
            System.out.println("Sorry, unable to find credentials.properties");
        }
    }

    public String getProperty(String key) {
        return properties.getProperty(key);
    }
}
