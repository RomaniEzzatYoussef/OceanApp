package com.app.ocean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "AddNewEmp")
public class AddNewEmp extends HttpServlet
{
    Connection conn = null;
    Emp emp = new Emp();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        emp.setEmp_name(request.getParameter("emp_name"));
        emp.setEmp_image(request.getParameter("emp_image"));
        emp.setBase_salary(Double.parseDouble(request.getParameter("base_salary")));
        emp.setChanging(Double.parseDouble(request.getParameter("changing")));
        emp.setAllowance(Double.parseDouble(request.getParameter("allowance")));
        emp.setSalary(Double.parseDouble(request.getParameter("salary")));
        emp.setAdditional(Double.parseDouble(request.getParameter("additional")));
        emp.setCompany_insurance(Double.parseDouble(request.getParameter("company_insurance")));
        emp.setEmp_insurance(Double.parseDouble(request.getParameter("emp_insurance")));
        emp.setWork_days(Integer.parseInt(request.getParameter("work_days")));
        emp.setAdvances(Double.parseDouble(request.getParameter("advances")));
        emp.setSalary_deduction(Double.parseDouble(request.getParameter("salary_deduction")));
        emp.setTotal_salary(Double.parseDouble(request.getParameter("total_salary")));
        emp.setDept_location_id(Integer.parseInt(request.getParameter("dept_location_id")));


        try
        {
            Class.forName("org.sqlite.JDBC");
            conn = DriverManager.getConnection("jdbc:sqlite:E:/work/IntelliJ IDEA Projects/OceanApp/web/WEB-INF/classes/myDB.db");
//            conn = DriverManager.getConnection("jdbc:sqlite:"+ this.getClass().getResource(  "/myDB.db"));
            conn.setAutoCommit(true);

            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery("select count(emp_id) from employees;");

            while (resultSet.next())
                emp.setEmp_id(resultSet.getInt(1)+1);


            final String SQL = "INSERT INTO employees  VALUES  (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(SQL);

            ps.setInt(1 ,emp.getEmp_id());
            ps.setString(2 ,emp.getEmp_name());
            ps.setString(3 ,emp.getEmp_image());
            ps.setDouble(4 ,emp.getBase_salary());
            ps.setDouble(5 ,emp.getChanging());
            ps.setDouble(6 ,emp.getAllowance());
            ps.setDouble(7 ,emp.getSalary());
            ps.setDouble(8 ,emp.getAdditional());
            ps.setDouble(9 ,emp.getEmp_insurance());
            ps.setDouble(10 ,emp.getCompany_insurance());
            ps.setInt(11 ,emp.getWork_days());
            ps.setDouble(12 ,emp.getAdvances());
            ps.setDouble(13 ,emp.getSalary_deduction());
            ps.setDouble(14 ,emp.getTotal_salary());
            ps.setInt(15 ,emp.getDept_location_id());

            int i = ps.executeUpdate();

            if (i != 0)
            {
                System.err.println("Record has been inserted");
            } else {
                System.err.println("failed to insert the data");
            }

            request.setAttribute("message" , emp.getEmp_name() + " has been inserted");
            String url = "/emps.jsp";
            getServletContext().getRequestDispatcher(url).forward(request, response);


        } catch (SQLException | ClassNotFoundException e) {
            e.getStackTrace();
            System.err.println(e.getStackTrace());
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }


    }

}
