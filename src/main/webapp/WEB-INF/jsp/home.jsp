<%-- Done By: Mainak Adhikary --%>
<%-- Student ID: 2024EB01235 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Health Care System</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #003340;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 650px;
            padding: 40px 0;
            margin: 0;
        }

        .container {
            width: 700px;
            background-color: rgb(240, 240, 240);
            padding: 25px 40px;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            color: #003340;
            margin-bottom: 25px;
        }

        label {
            font-weight: bold;
            color: #003340;
            position: relative;
            left: -10px;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin: 6px 0px 20px 0px;
            border: 1px solid #aaa;
            border-radius: 6px;
            position: relative;
            left: -10px;
            background-color: rgb(230, 230, 230);
            color: #696969;
            box-sizing: border-box;
        }

        .error {
            color: red;
            font-size: 16px;
            margin-top: -10px;
            margin-bottom: 10px;
            text-align: center;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #003340;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            position: relative;
            margin-top: 15px;
            margin-bottom: 10px;
        }

        button:hover {
            background-color: #00222b;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #aaa;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #003340;
            color: white;
        }

        a {
            color: #003340;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>Add A New Doctor</h2>

        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>

        <form action="/addDoctor" method="post">
            <label for="name">Name of the Doctor:</label>
            <input type="text" id="name" name="name" placeholder="Doctor's Full Name" required>

            <label for="specialization">Specialization:</label>
            <input type="text" id="specialization" name="specialization" placeholder="Doctor's specialization" required>

            <label for="hospital">Hospital To Assign:</label>
            <select id="hospital" name="hospital.id" required>
                <option value="" selected disabled>Choose the Hospital</option>
                <c:forEach var="hosp" items="${hospitals}">
                    <option value="${hosp.id}">${hosp.name} (${hosp.location})</option>
                </c:forEach>
            </select>

            <button type="submit">Submit</button>
        </form>

        <hr style="margin: 40px 0; border: 1px solid #ccc;">

        <h2>Database Entries For Doctors</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Specialization</th>
                <th>Hospital</th>
                <th>Update</th>
            </tr>
            <c:forEach var="doc" items="${doctors}">
                <tr>
                    <td>${doc.id}</td>
                    <td>${doc.name}</td>
                    <td>${doc.specialization}</td>
                    <td>${doc.hospital.name}</td>
                    <td><a href="/editDoctor/${doc.id}">Update</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>