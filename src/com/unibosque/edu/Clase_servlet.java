package com.unibosque.edu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Clase_servlet
 */
@WebServlet("/Clase_servlet")
public class Clase_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Clase_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		
		String nombre = request.getParameter("nombre");
		String clave = request.getParameter("clave");
		if(nombre !="" && clave !="") {
			out.println(" bienvenido: " +nombre+ " al jsp");
		}
		else {
			out.println(" error nombre o calve vacios");
		}
		
		try {
			out.println("<html>");
			out.println("<head><title>Bienvenidos servlet 1 </title></head>");
			out.println("<body>");
			out.println("<h1>hola mundo</h1>");
			out.println("</body>");
			out.println("</html>");
		}finally {
			out.close();
			
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
