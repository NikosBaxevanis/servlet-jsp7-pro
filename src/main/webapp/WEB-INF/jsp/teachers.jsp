<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teachers Found</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.7.2/css/fontawesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.7.2/js/all.min.js"></script>
    <style>
        .outer {
            width: 100%;
            margin-left: auto;
            margin-right: auto;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        table {
            width: 70%;
            border: 1px solid black;
            border-collapse: collapse;
        }

        th, td {
            text-align:center;
            border: 1px solid black;
        }

        .filters {
            margin-top: 2rem;
            margin-bottom: 2rem;
            padding: 50px;
            border: 1px solid black;
            border-radius: 15px;
         }

         button {
             background-color: green;
             color: white;
             padding: 10px 20px;
             border: none;
             cursor: pointer;
             font-size: 16px;
             transition: background-color 0.3s ease; /* Smooth transition */
         }

         button:hover {
             background-color: darkblue; /* Change color on hover */
         }

         input {
             width: 150px;
             padding: 10px;
             border: 2px solid #ccc;
             border-radius: 5px;
             font-size: 16px;
             transition: all 0.3s ease;
         }

         /* Change border color on focus */
         input:focus {
             border-color: #9988AA;
             outline: none; /* Removes default outline */
         }

    </style>
</head>
<body>
<div class="outer">
    <h1>Welcome, ${sessionScope.username}!</h1>
    <p>You are now logged in.</p>

    <c:if test="${sessionScope.role eq 'TEACHER'}">
        <button type="button">Insert new Teacher</button>
    </c:if>

    <!--<% if ("TEACHER".equals((String) session.getAttribute("role"))) { %>
            <button type="button">Insert new Teacher</button>
    <% } %> -->

    <form id="filterForm" class="filters" method="get" action="${pageContext.request.contextPath}/school-app/teachers">
        <input type="text" name="id" placeholder="Enter ID" />
        <input type="text" name="firstname" placeholder="Enter Firstname" />
        <input type="text" name="lastname" placeholder="Enter Lastname" />
        <button type="submit">Search</button>
        <button id="resetBtn" type="button" onclick="reset()">Reset</button>
    </form>

    <h1 style="margin-bottom: 2.5rem">Καθηγητές Coding Factory</h1>
    <table>
        <c:if test="${not empty requestScope.teachers}">
            <tr>
                <th>Κωδικός</th><th>Όνομα</th><th>Επώνυμο</th><th colspan="2">Ενέργεια</th>
            </tr>
        </c:if>

        <c:forEach var = "teacher" items = "${requestScope.teachers}">
            <tr>
                <td>${teacher.id}</td>
                <td>${teacher.firstname}</td>
                <td>${teacher.lastname}</td>
                <td colspan="2"><a href=""><i class="fa-solid fa-floppy-disk" style="color: black; margin-right: 15px;"></i></a>
                <a href=""><i class="fa-solid fa-trash" style="color: black"></i></a></td>
            </tr>
        </c:forEach>
    </table>

</div>
<div style="text-align: center">
    <p>${requestScope.message}</p>
</div>

<script>
    document.getElementById("resetBtn").addEventListener("click", function(event) {
        // Prevent any default action of the button
        event.preventDefault();

        // Clear all input fields in the form
        document.getElementById("filterForm").reset();

        // Submit the form
        document.getElementById("filterForm").submit();
    });
</script>
</body>
</html>
