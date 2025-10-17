<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form action="verify-reserve-otp" method="post">
    <input type="text" name="otp" placeholder="Nhập mã OTP" required>
    <button type="submit">Xác nhận</button>

    <c:if test="${not empty error}">
        <p style="color:red;">${error}</p>
    </c:if>
</form>
