<%@ page import="java.util.ArrayList" %>
<%@ page import="com.app.ocean.User" %>
<%@ page import="com.app.ocean.Emp" %><%--
  Created by IntelliJ IDEA.
  User: Romani Ezzat
  Date: 12/29/2019
  Time: 7:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employess</title>
    <link rel="stylesheet" type="text/css" href="css/CssStyle2.css">
</head>
<body id="gradient">
<a href="index.jsp">
    <h1>Home Page</h1>
</a>
 <h1>Welcome ${fullName}</h1>

<div style="overflow-x:auto;">
    <table width="100%" class="fixed">
        <tr>
            <th>رقم القسم</th>
            <th>الاجمالى</th>
            <th>خصومات</th>
            <th>سلف</th>
            <th>ايام عمل</th>
            <th>تأمينات العامل</th>
            <th>تأمينات شركه</th>
            <th> اضافى</th>
            <th> الراتب</th>
            <th>بدلات</th>
            <th>متغير</th>
            <th>اساسى</th>
            <th>الصورة</th>
            <th>الاسم</th>
            <th>مسلسل</th>
        </tr>

        <tr style="background: aqua;">
            <td>dept_location_id</td>
            <td>total_salary</td>
            <td>salary_deduction</td>
            <td>advances</td>
            <td>work_days</td>
            <td>emp_insurance</td>
            <td>company_insurance</td>
            <td>additional</td>
            <td>salary</td>
            <td>allowance</td>
            <td>changing</td>
            <td>base_salary</td>
            <td>emp_image</td>
            <td>emp_name</td>
            <td>emp_id</td>
        </tr>


        <%
            ArrayList<Emp> emps = (ArrayList<Emp>) request.getAttribute("emps");

            for (int i = 0; i < emps.size(); i++) {
                out.println("<tr style=\"font-size:25px;\"> <td style='font-size: 15px;'> " + emps.get(i).getDept_location_id()  + "</td> <td style='font-size: 15px;'>" + emps.get(i).getTotal_salary()
                        + "</td> <td style='font-size: 15px;'>" + emps.get(i).getSalary_deduction() + "</td> <td style='font-size: 15px;'>" + emps.get(i).getAdvances()
                        + "</td> <td style='font-size: 15px;'>" + emps.get(i).getWork_days() + "</td> <td style='font-size: 15px;'>" + emps.get(i).getEmp_insurance()
                        + "</td> <td style='font-size: 15px;'>" + emps.get(i).getCompany_insurance() + "</td> <td style='font-size: 15px;'>" + emps.get(i).getAdditional()
                        + "</td> <td style='font-size: 15px;'>" + emps.get(i).getSalary()
                        + "</td> <td style='font-size: 15px;'>" + emps.get(i).getAllowance() + "</td> <td style='font-size: 15px;'>" + emps.get(i).getChanging()
                        + "</td> <td style='font-size: 15px;'>" + emps.get(i).getBase_salary() + "</td> <td style='font-size: 15px;'>" + emps.get(i).getEmp_image()
                        + "</td> <td style='font-size: 15px;'>" +  emps.get(i).getEmp_name()  + "</td> <td style='font-size: 15px;'>" + emps.get(i).getEmp_id()
                        + "</td> </tr>");
            }
        %>


    </table>
</div>

<p>${message}</p>

<div class="insert">
    <form action="AddNewEmp" method="post">

        <input value="unknown" class="emps_text" type="text" disabled name="emp_id">
        <input class="emps_text" type="text" name="emp_name" placeholder="emp_name" autofocus="on">
        <input class="emps_text" type="text" name="emp_image" placeholder="emp_image">
        <input class="emps_text" type="text" name="base_salary" placeholder="base_salary">
        <input class="emps_text" type="text" name="changing" placeholder="changing">
        <input class="emps_text" type="text" name="allowance" placeholder="allowance">
        <input class="emps_text" type="text" name="salary" placeholder="salary">
        <input class="emps_text" type="text" name="additional" placeholder="additional">
        <input class="emps_text" type="text" name="company_insurance" placeholder="company_insurance">
        <input class="emps_text" type="text" name="emp_insurance" placeholder="emp_insurance">
        <input class="emps_text" type="text" name="work_days" placeholder="work_days">
        <input class="emps_text" type="text" name="advances" placeholder="advances">
        <input class="emps_text" type="text" name="salary_deduction" placeholder="salary_deduction">
        <input class="emps_text" type="text" name="total_salary" placeholder="total_salary">
        <input class="emps_text" type="text" name="dept_location_id" placeholder="dept_location_id">  <br>

        <input style="margin: 30px" class="button" type="submit" value="Insert New Employee">
    </form>

</div>
</body>
</html>
