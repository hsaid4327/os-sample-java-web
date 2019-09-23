import javax.servlet.http.HttpServlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
        name = "myServlet",
        urlPatterns = "/myServlet"
)
public class MyServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			// absolute path on server outside the war
			// where properties files are stored

			Properties properties = new Properties();
			String absolutePath = "/tmp/schools-first/application.properties";
			File file = new File(absolutePath);
			properties.load(new FileInputStream(file));
			String value = properties.getProperty("test");
			req.setAttribute("test", value);
			RequestDispatcher view = req.getRequestDispatcher("index.jsp");
			view.forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
