<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>뉴스 관리 앱</title>
</head>
<body>
	<div class="container w-75 mt-5 mx-auto">
	<h2 style = "text-align: center"><b>뉴스 목록</b></h2>
	<hr>
	<ul class="list-group">
		<c:forEach var="news" items="${newslist}" varStatus="status">
			<li class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
				<a href="news.nhn?action=getNews&aid=${news.aid}" class="text-decoration-none">
				[${status.count}] ${news.title}, ${news.date}
				</a>
				<a href="news.nhn?action=deleteNews&aid=${news.aid}">
				<span class="badge bg-secondary">&times;</span>
				</a>
			</li>
		</c:forEach>
	</ul>
	<!-- 에러 출력부 -->
	<hr>
	<c:if test="${error != null }">
		<div class="alert alert-danger alert-dismissible fade show mt-3">
			에러 발생: ${error}
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		</div>
	</c:if>
	<button class="btn btn-outline-info mb-3" type="button" data-bs-toggle="collapse"
	data-bs-target="#addForm" aria-expanded="false" aria-controls="addForm">
	뉴스 등록
	</button>
	
	<div class="collapse" id="addForm">
		<div class="card card-body">
			<form method="post" action = "/mybook/news.nhn?action=addNews"
			enctype="multipart/form-data">
				<label class="form-label">제목</label>
				<input type="text" name="title" class="form-control">
				<label class="form-label">이미지</label>
				<input type="file" name="file" class="form-control">
				<label class="form-label">기사 내용</label>
				<textarea cols="50" rows="5" name="content" class="form-control"></textarea>
				<button type="submit" class="btn btn-success mt-3">저장</button>
			</form>
		</div>
	</div>
	
	</div>
</body>
</html>
