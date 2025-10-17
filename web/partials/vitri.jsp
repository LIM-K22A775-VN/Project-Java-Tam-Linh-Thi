<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="inner-position">
  <p>Bạn đang ở đây: =></p>
  <a href="<c:url value='/templates/intro.jsp' />">Trang chủ</a>
  <span style="color: black; margin-left: 1px;">${breadcrumb}</span>
</div>
