<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shopping Cart | Savory Whisper</title>

        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" />

    </head>
    <body>

        <jsp:include page="inc/header.jsp" />

        <div class="container py-5">
            <div class="cart-header">
                <h1 class="mb-2 display-5"><i class="fas fa-shopping-cart me-3 text-gold"></i>Your Shopping Cart</h1>
                <p class="mb-0 opacity-75">Review and adjust your exquisite selections before checkout.</p>
            </div>

            <!-- Alert Message -->
            <c:if test="${not empty sessionScope.message}">
                <div class="alert alert-${sessionScope.messageType != null ? sessionScope.messageType : 'info'} alert-dismissible fade show mb-4" role="alert">
                    <i class="fas ${sessionScope.messageType == 'success' ? 'fa-check-circle' : sessionScope.messageType == 'danger' ? 'fa-exclamation-triangle' : 'fa-info-circle'} me-2"></i>
                    ${sessionScope.message}
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <c:remove var="message" scope="session"/>
                <c:remove var="messageType" scope="session"/>
            </c:if>

            <c:if test="${empty cartItems}">
                <div class="text-center py-5 cart-card">
                    <i class="fas fa-shopping-basket fa-7x empty-icon mb-4"></i>
                    <h3 class="text-white mb-3">Your Cart is Empty</h3>
                    <p class="text-muted">Start adding your favorite dishes from our menu!</p>
                    <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-warning btn-lg mt-3"> Browse Menu
                    </a>
                </div>
            </c:if>

            <c:if test="${not empty cartItems}">
                <!-- This form submits the final quantities to the server. -->
                <form id="cartForm" action="${pageContext.request.contextPath}/cart" method="post" class="cart-card mb-4">
                    <!-- This hidden input determines the servlet's action upon form submission. -->
                    <input type="hidden" name="action" id="cartFormAction" value="updateMultiple" />
                    <div class="table-responsive">
                        <table class="table align-middle text-center">
                            <thead>
                                <tr>
                                    <th class="text-start" style="width: 10%;">Image</th>
                                    <th class="text-start" style="width: 25%;">Name</th>
                                    <th class="text-start d-none d-lg-table-cell" style="width: 25%;">Description</th>
                                    <th style="width: 10%;">Price</th>
                                    <th style="width: 10%;">Quantity</th>
                                    <th style="width: 10%;">Subtotal</th>
                                    <th style="width: 10%;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="total" value="0" />
                                <c:forEach var="item" items="${cartItems}">
                                    <c:set var="subtotal" value="${item.price * item.quantity}" />
                                    <c:set var="total" value="${total + subtotal}" />
                                    <tr>
                                        <td data-label="Image:"><img src="${item.product.image}" alt="${item.product.name}" class="img-cart" 
                                                                     onerror="this.onerror=null; this.src='https://placehold.co/60x60/1e1e1e/d4af37?text=Food';" /></td>
                                        <td data-label="Product:" class="name-cell text-start">${item.product.name}</td>
                                        <td data-label="Desc:" class="description-cell small text-start d-none d-lg-table-cell">${item.product.description}</td>
                                        <td data-label="Price:" class="fw-bold text-warning" data-unit-price="${item.price}"><fmt:formatNumber value="${item.price}" type="currency" currencySymbol="$" /></td>
                                        <td data-label="Qty:">
                                            <!-- Custom Quantity Control -->
                                            <div class="input-group input-group-sm quantity-control" style="margin: 0 auto;">
                                                <button type="button" class="btn btn-outline-secondary" onclick="changeQuantity(this, -1)">
                                                    <i class="fas fa-minus"></i>
                                                </button>
                                                <!-- Using a readonly text input to enforce button usage for quantity changes. -->
                                                <input type="text" 
                                                       name="quantity_${item.id}" 
                                                       value="${item.quantity}" 
                                                       class="form-control quantity-input text-center"
                                                       data-item-id="${item.id}"
                                                       data-min="1" data-max="99"
                                                       readonly />
                                                <button type="button" class="btn btn-outline-secondary" onclick="changeQuantity(this, 1)">
                                                    <i class="fas fa-plus"></i>
                                                </button>
                                            </div>
                                        </td>
                                        <td data-label="Subtotal:" class="fw-bold text-success subtotal-cell" id="subtotal_${item.id}">
                                            <fmt:formatNumber value="${subtotal}" type="currency" currencySymbol="$" />
                                        </td>
                                        <td data-label="Action:">
                                            <a href="${pageContext.request.contextPath}/cart?action=remove&id=${item.id}" class="btn btn-danger btn-sm">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="4" class="text-end text-white">Grand Total:</th>
                                    <th colspan="3" class="fw-bold text-warning h4 text-center" id="grand-total"><fmt:formatNumber value="${total}" type="currency" currencySymbol="$" /></th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>

                    <div class="card-body border-top bg-dark p-4 d-flex justify-content-between align-items-center flex-wrap">
                        <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-secondary mb-3 mb-lg-0">
                            <i class="fas fa-arrow-left me-2"></i>Continue Shopping
                        </a>

                        <!-- Newly added button to update cart quantities. -->
                        <button type="submit" class="btn btn-warning mb-3 mb-lg-0" id="updateCartButton">
                            <i class="fas fa-sync-alt me-2"></i>Update Cart
                        </button>
                        <!-- This button submits the form to ensure latest quantities are saved before redirecting. -->
                        <button type="button" class="btn btn-success btn-lg" onclick="setCheckoutAction();">
                            <i class="fas fa-credit-card me-2"></i>Proceed to Checkout
                        </button>
                    </div>
                </form>

            </c:if>
        </div>

        <jsp:include page="./inc/footer.jsp" />
        <style>
            .cart-card {
                border-radius: 18px !important;
                background-color: #1a1a1a !important;
                border: 1px solid rgba(212, 175, 55, 0.08);
            }
            .quantity-control .btn {
                border-color: #d4af37 !important;
                color: #d4af37 !important;
            }

            .quantity-control .btn:hover {
                background-color: #d4af37 !important;
                color: #000 !important;
            }
            .img-cart {
                width: 60px;
                height: 60px;
                object-fit: cover;
                border-radius: 8px;
            }
            #grand-total {
                font-size: 1.6rem !important;
                letter-spacing: 0.5px;
            }
            .table tfoot tr th {
                border-top: 2px solid rgba(212, 175, 55, 0.25) !important;
            }


        </style>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                            // Formatter for USD currency.
                            const formatter = new Intl.NumberFormat('en-US', {
                                style: 'currency',
                                currency: 'USD',
                                minimumFractionDigits: 2,
                                maximumFractionDigits: 2
                            });

                            // Calculates and updates the subtotal for a single item.
                            function updateSubtotal(row) {
                                const quantityInput = row.querySelector('.quantity-input');
                                const priceCell = row.querySelector('[data-unit-price]');
                                const subtotalCell = row.querySelector('.subtotal-cell');

                                if (!quantityInput || !priceCell || !subtotalCell) {
                                    console.error("Error: Could not find elements needed to update subtotal.", row);
                                    return;
                                }

                                const quantity = parseInt(quantityInput.value, 10) || 0;
                                const unitPrice = parseFloat(priceCell.getAttribute('data-unit-price')) || 0;

                                const subtotal = unitPrice * quantity;

                                if (!isNaN(subtotal)) {
                                    subtotalCell.textContent = formatter.format(subtotal);
                                } else {
                                    subtotalCell.textContent = 'Calculation Error';
                                    console.error("Error: Invalid subtotal result (NaN). Price: ", unitPrice, "Qty: ", quantity);
                                }
                            }

                            // Calculates and updates the grand total for the entire cart.
                            function updateGrandTotal() {
                                let grandTotal = 0;
                                let calculationError = false;

                                document.querySelectorAll('tbody tr').forEach(row => {
                                    const quantityInput = row.querySelector('.quantity-input');
                                    const priceCell = row.querySelector('[data-unit-price]');

                                    if (quantityInput && priceCell) {
                                        const quantity = parseInt(quantityInput.value, 10) || 0;
                                        const unitPrice = parseFloat(priceCell.getAttribute('data-unit-price')) || 0;

                                        const itemTotal = quantity * unitPrice;

                                        if (!isNaN(itemTotal)) {
                                            grandTotal += itemTotal;
                                        } else {
                                            calculationError = true;
                                            console.error("Error: Product total calculation failed while computing grand total.");
                                        }
                                    }
                                });

                                const grandTotalElement = document.getElementById('grand-total');
                                if (grandTotalElement) {
                                    if (calculationError || isNaN(grandTotal)) {
                                        grandTotalElement.textContent = 'Calculation Error';
                                    } else {
                                        grandTotalElement.textContent = formatter.format(grandTotal);
                                    }
                                }
                            }

                            // Function to send an AJAX request to update the cart servlet.
                            function sendUpdateToCartServlet(itemId, newQuantity) {
                                const url = '${pageContext.request.contextPath}/cart';

                                // Use the Fetch API to send an asynchronous POST request.
                                fetch(url, {
                                    method: 'POST',
                                    headers: {
                                        'Content-Type': 'application/x-www-form-urlencoded',
                                    },
                                    // Send the action, item ID, and quantity.
                                    body: `action=update&id=${itemId}&quantity=${newQuantity}`
                                })
                                        .then(response => {
                                            // Check the HTTP response.
                                            if (!response.ok) {
                                                throw new Error(`HTTP error! status: ${response.status}`);
                                            }
                                            return response.json(); // Assuming the servlet returns JSON (e.g., {success: true}).
                                        })
                                        .then(data => {
                                            // Process the server's response.
                                            if (data && data.success) {
                                                console.log(`Cart updated successfully for Item ID: ${itemId}, New Quantity: ${newQuantity}`);
                                            } else {
                                                console.error("Update failed (Servlet logic error).", data);
                                                // Notify the user of the error.
                                            }
                                        })
                                        .catch(error => {
                                            console.error('Error sending cart update request:', error);
                                            // Notify the user of a connection or server error.
                                        });
                            }

                            // Handles clicks on the '+' and '-' quantity buttons.
                            function changeQuantity(buttonElement, delta) {
                                const inputGroup = buttonElement.closest('.input-group');
                                if (!inputGroup) {
                                    console.error("Error: Could not find input group.");
                                    return;
                                }

                                const inputElement = inputGroup.querySelector('.quantity-input');
                                const row = buttonElement.closest('tr');

                                if (!inputElement || !row) {
                                    console.error("Error: Could not find input or row.");
                                    return;
                                }

                                let currentValue = parseInt(inputElement.value, 10);
                                if (isNaN(currentValue))
                                    currentValue = 1;

                                const min = parseInt(inputElement.getAttribute('data-min'), 10);
                                const max = parseInt(inputElement.getAttribute('data-max'), 10);
                                const itemId = inputElement.getAttribute('data-item-id');

                                let newValue = currentValue + delta;

                                // Apply min/max limits.
                                newValue = Math.max(min, Math.min(max, newValue));

                                if (newValue !== currentValue) {
                                    inputElement.value = newValue;

                                    // 1. Update the subtotal and grand total on the client side.
                                    updateSubtotal(row);
                                    updateGrandTotal();

                                    // 2. Send the update to the server immediately via AJAX.
                                    sendUpdateToCartServlet(itemId, newValue);
                                }
                            }

                            // Sets the action to 'checkout' and submits the form to ensure the server has the latest data before redirecting.
                            function setCheckoutAction() {
                                const form = document.getElementById('cartForm');
                                const actionInput = document.getElementById('cartFormAction');

                                // 1. Change the action to notify the servlet of a checkout request.
                                actionInput.value = 'updateAndCheckout'; // The servlet needs to be configured to handle this action.

                                // 2. Submit the form to the server.
                                form.submit();

                                // 3. Redirect to the checkout page. The servlet should handle the redirection after updating.
                                window.location.href = '${pageContext.request.contextPath}/checkout';
                            }

                            // Initialize: Ensure the grand total is correct on page load.
                            document.addEventListener('DOMContentLoaded', updateGrandTotal);
        </script>

        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    </body>
</html>