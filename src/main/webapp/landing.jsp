<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Central Service</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>

<!-- Header -->
<header class="header">
    <div class="container d-flex align-items-center">
        <img src="${pageContext.request.contextPath}/img/cf-logo.png" alt="Logo" class="header-logo">
    </div>
</header>

<!-- Main Content -->
<main class="container text-center my-5 main-content">
    <h1 class="mb-5">Κεντρική Υπηρεσία Coding Factory</h1>
    <a class="custom-button-green" href="${pageContext.request.contextPath}/inspect-request?username=thanassis">Συνέχεια</a>
</main>

<!-- Footer -->
<footer>
    <div class="footer">
        <span>&copy; 2024 Coding Factory. All rights reserved.</span>
    </div>
</footer>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>