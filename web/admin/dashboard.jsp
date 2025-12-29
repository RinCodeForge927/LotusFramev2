<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Admin - Dashboard</title>

        <link href="./assets/admin/static/css/app.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">

        <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>

        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />

    </head>
    <body>
        <div class="wrapper">
            <%@include file="./inc/sidebar.jsp"%>

            <div class="main">
                <%@include file="./inc/navbar.jsp"%>

                <main class="content">
                    <div class="container-fluid p-3">
                        <h1 class="h3 mb-3"><strong>Analytics</strong> Dashboard</h1>

                        <div class="row">
                            <div class="col-xl-6 col-xxl-5 d-flex">
                                <div class="w-100">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col mt-0"><h5 class="card-title">Sales</h5></div>
                                                        <div class="col-auto"><div class="stat text-primary"><i class="align-middle" data-feather="truck"></i></div></div>
                                                    </div>
                                                    <h1 class="mt-1 mb-3"><c:choose><c:when test="${not empty totalSales}">${totalSales}</c:when><c:otherwise>2.382</c:otherwise></c:choose></h1>
                                                            <div class="mb-0"><span class="text-danger"> <i class="mdi mdi-arrow-bottom-right"></i> -3.65% </span><span class="text-muted">Since last week</span></div>
                                                        </div>
                                                    </div>
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col mt-0"><h5 class="card-title">Visitors</h5></div>
                                                                <div class="col-auto"><div class="stat text-primary"><i class="align-middle" data-feather="users"></i></div></div>
                                                            </div>
                                                                <h1 class="mt-1 mb-3"><c:choose><c:when test="${not empty totalVisitors}">${totalVisitors}</c:when><c:otherwise>14.212</c:otherwise></c:choose></h1>
                                                            <div class="mb-0"><span class="text-success"> <i class="mdi mdi-arrow-bottom-right"></i> 5.25% </span><span class="text-muted">Since last week</span></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col mt-0"><h5 class="card-title">Earnings</h5></div>
                                                                <div class="col-auto"><div class="stat text-primary"><i class="align-middle" data-feather="dollar-sign"></i></div></div>
                                                            </div>
                                                                <h1 class="mt-1 mb-3"><c:choose><c:when test="${not empty totalEarnings}">${totalEarnings}</c:when><c:otherwise>$21.300</c:otherwise></c:choose></h1>
                                                            <div class="mb-0"><span class="text-success"> <i class="mdi mdi-arrow-bottom-right"></i> 6.65% </span><span class="text-muted">Since last week</span></div>
                                                        </div>
                                                    </div>
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col mt-0"><h5 class="card-title">Orders</h5></div>
                                                                <div class="col-auto"><div class="stat text-primary"><i class="align-middle" data-feather="shopping-cart"></i></div></div>
                                                            </div>
                                                                <h1 class="mt-1 mb-3"><c:choose><c:when test="${not empty totalOrders}">${totalOrders}</c:when><c:otherwise>64</c:otherwise></c:choose></h1>
                                                            <div class="mb-0"><span class="text-danger"> <i class="mdi mdi-arrow-bottom-right"></i> -2.25% </span><span class="text-muted">Since last week</span></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-6 col-xxl-7">
                                        <div class="card flex-fill w-100">
                                            <div class="card-header"><h5 class="card-title mb-0">Recent Movement</h5></div>
                                            <div class="card-body py-3">
                                                <div class="chart chart-sm"><canvas id="chartjs-dashboard-line"></canvas></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Bottom Row -->
                                <div class="row">
                                    <div class="col-12 col-md-6 col-xxl-3 d-flex">
                                        <div class="card flex-fill w-100">
                                            <div class="card-header"><h5 class="card-title mb-0">Browser Usage</h5></div>
                                            <div class="card-body d-flex">
                                                <div class="align-self-center w-100">
                                                    <div class="py-3"><div class="chart chart-xs"><canvas id="chartjs-dashboard-pie"></canvas></div></div>
                                                    <table class="table mb-0">
                                                        <tbody>
                                                            <tr><td>Chrome</td><td class="text-end">4306</td></tr>
                                                            <tr><td>Firefox</td><td class="text-end">3801</td></tr>
                                                            <tr><td>IE</td><td class="text-end">1689</td></tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-12 col-xxl-6 d-flex">
                                        <div class="card flex-fill w-100">
                                            <div class="card-header">
                                                <h5 class="card-title mb-0">Real-Time Visitors</h5>
                                            </div>
                                            <div class="card-body p-0">
                                                <div id="world_map"></div>
                                            </div>
                                            <div class="card-footer text-center py-2">
                                                <small class="text-muted">Live visitor locations worldwide</small>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-6 col-xxl-3 d-flex">
                                        <div class="card flex-fill">
                                            <div class="card-header"><h5 class="card-title mb-0">Today</h5></div>
                                            <div class="card-body text-center py-5">
                                                <h1 class="display-3 fw-bold text-primary">
                                            <jsp:useBean id="now" class="java.util.Date"/>
                                            <fmt:formatDate value="${now}" pattern="dd"/>
                                        </h1>
                                        <p class="text-muted fs-4 mb-0">
                                            <fmt:formatDate value="${now}" pattern="MMMM yyyy"/>
                                        </p>
                                        <p class="text-muted">
                                            <fmt:formatDate value="${now}" pattern="EEEE"/>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 col-lg-4 col-xxl-3 d-flex">
                                <div class="card flex-fill w-100">
                                    <div class="card-header"><h5 class="card-title mb-0">Monthly Sales</h5></div>
                                    <div class="card-body d-flex w-100">
                                        <div class="align-self-center chart chart-lg w-100">
                                            <canvas id="chartjs-dashboard-bar"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>

                <%@include file="./inc/footer.jsp"%>
            </div>
        </div>
        <style>
            #world_map {
                width: 100%;
                height: 320px;
                border-radius: 10px;
            }
        </style>

        <script src="./assets/admin/static/js/app.js"></script>

        <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                feather.replace();

                new Chart(document.getElementById("chartjs-dashboard-line"), {
                    type: "line",
                    data: {
                        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                        datasets: [{
                                label: "Sales",
                                fill: true,
                                backgroundColor: "rgba(59,125,221,0.1)",
                                borderColor: window.theme.primary,
                                data: [2115, 1562, 1584, 1892, 1587, 1923, 2566, 2448, 2805, 3438, 2917, 3327]
                            }]
                    },
                    options: {maintainAspectRatio: false, plugins: {legend: {display: false}}}
                });

                new Chart(document.getElementById("chartjs-dashboard-pie"), {
                    type: "pie",
                    data: {
                        labels: ["Chrome", "Firefox", "IE"],
                        datasets: [{data: [4306, 3801, 1689], backgroundColor: [window.theme.primary, window.theme.warning, window.theme.danger], borderWidth: 5}]
                    },
                    options: {responsive: true, maintainAspectRatio: false, plugins: {legend: {display: false}}, cutout: "75%"}
                });

                new Chart(document.getElementById("chartjs-dashboard-bar"), {
                    type: "bar",
                    data: {
                        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                        datasets: [{data: [54, 67, 41, 55, 62, 45, 55, 73, 60, 76, 48, 79], backgroundColor: window.theme.primary}]
                    },
                    options: {maintainAspectRatio: false, plugins: {legend: {display: false}}}
                });

                // Initialize Leaflet map.
                if (document.getElementById("world_map")) {
                    const map = L.map('world_map').setView([20, 0], 2);

                    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        attribution: '&copy; OpenStreetMap contributors'
                    }).addTo(map);

                    // Add 10 random markers (can be replaced with real data later).
                    const markers = [
                        [31.23, 121.47, "Shanghai"],
                        [28.70, 77.10, "Delhi"],
                        [6.52, 3.38, "Lagos"],
                        [35.69, 139.69, "Tokyo"],
                        [23.13, 113.26, "Guangzhou"],
                        [40.71, -74.01, "New York"],
                        [34.05, -118.24, "Los Angeles"],
                        [41.88, -87.63, "Chicago"],
                        [51.51, -0.13, "London"],
                        [40.42, -3.70, "Madrid"]
                    ];

                    markers.forEach(m => {
                        L.circleMarker([m[0], m[1]], {
                            radius: 8,
                            fillColor: "#e74c3c",
                            color: "#fff",
                            weight: 3,
                            opacity: 1,
                            fillOpacity: 0.8
                        }).addTo(map).bindPopup(`<b>${m[2]}</b><br>Active visitors`);
                    });

                    // Automatically fit map bounds to markers.
                    const group = new L.featureGroup(
                            markers.map(m =>
                                L.circleMarker([m[0], m[1]])
                            )
                            );
                    map.fitBounds(group.getBounds().pad(0.5));

                }
            });
        </script>
    </body>
</html>