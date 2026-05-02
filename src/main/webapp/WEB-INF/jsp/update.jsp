<%-- Done By: Mainak Adhikary --%>
<%-- Student ID: 2024EB01235 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>UPdate Doctor</title>
    <style>
        body{
            font-family: Arial, Helvetica, sans-serif;
            background-color: #003340;
            display: flex;
            justify-content: center;
            padding: 40px 0;
        }

        .container{
            width: 500px;
            background-color: rgb(240, 240, 240);
            padding: 25px 40px;
            border-radius: 6px;
            left: -10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15);
        }

        h2{
            text-align: center;
            color: #003340;
            margin-bottom: 25px;
        }

        label{
            font-weight: bold;
            color: #003340;
            left: -10px;
            position: relative;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin: 6px 0px 20px 0px;
            border: 1px solid #aaa;
            border-radius: 6px;
            left: -10px;
            position: relative;
            background-color: rgb(230, 230, 230);
            color: #696969;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #003340;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 15px;
        }

        button:hover {
            background-color: #00222b;
        }

        .error {
            color: red;
            text-align: center;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #003340;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Doctor Details</h2>

        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>

        <form action="/updateDoctor/${doctor.id}" method="post">
            <label for="name">Name of the Doctor:</label>
            <input type="text" id="name" name="name" value="${doctor.name}" required>

            <label for="specialization">Specialization:</label>
            <input type="text" id="specialization" name="specialization" value="${doctor.specialization}" required>

            <label for="hospital">Hospital To Assign:</label>
            <select id="hospital" name="hospital.id" required>
                <c:forEach var="hosp" items="${hospitals}">
                    <option value="${hosp.id}" <c:if test="${hosp.id == doctor.hospital.id}">selected</c:if>>${hosp.name}</option>
                </c:forEach>
            </select>
            <button type="submit">Submit</button>
        </form>
        <a href="/">Return</a>
    </div>
</body>
</html>