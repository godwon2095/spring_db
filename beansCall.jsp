<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<jsp:useBean id="bTest" class="BTest.BTest" scope="page"></jsp:useBean>
  <p><%= bTest.getMsg() %></p>
  <p>Cnt : <%= bTest.getCnt() %></p>
</html>
