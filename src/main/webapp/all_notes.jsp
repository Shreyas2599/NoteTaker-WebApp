<%@page import="java.text.DateFormat"%>
<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link href="css/style.css" rel="stylesheet">
<title>Show Notes : Note Taker</title>
</head>
<body>
	<div class="container-fluid p-0 m-0 text-center">

		<%@include file="navbar.jsp"%>
		

		<div class="row">
			<div class=" col-12">
				<%
				Session s = FactoryProvider.getFactory().openSession();

				//HQL query
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();

				for (Note note : list) {
				%>
				<div class="card mt-3" >
					<img class="card-img-top m-4 mx-auto" style="max-width:100px;" alt="Card image cap" src="img/notes.png">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle() %></h5>
						<p class="card-text"><%=note.getContent() %></p>
						<p><b><%=DateFormat.getDateTimeInstance().format(note.getAddeddate()) %></b></p>
						<div class="container text-center mt-3">
						<a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
						<a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
						</div>
					</div> 
				</div>


				<%
				}

				s.close();
				%>

			</div>


		</div>





	</div>















	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
</body>
</html>