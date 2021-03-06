package com.unibosque.edu;

import java.io.IOException;
import java.time.ZoneId;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class CalcularFechaNacimiento
 */
/**@WebServlet(name = "CalcularFechaNacimiento", urlPatterns = {"/CalcularFechaNacimiento"})*/
@WebServlet("/CalcularFechaNacimiento")
public class CalcularFechaNacimiento extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public CalcularFechaNacimiento() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre = request.getParameter("nombre");
		Integer anoNac = Integer.parseInt(request.getParameter("ano"));
		Date today = new Date();
		ZoneId timeZone = ZoneId.systemDefault();
		Integer edad = today.toInstant().atZone(timeZone).toLocalDate().getYear() - anoNac;
		request.setAttribute("nombre", nombre); //envia 
		request.setAttribute("anoNac", anoNac.toString());
		request.setAttribute("edad", edad.toString());
		request.getRequestDispatcher("../Fecha.jsp").forward(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}


