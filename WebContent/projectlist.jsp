<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="fragments/htmlhead.jsp" />
<jsp:include page="fragments/topnav.jsp" />


<div class="container-fluid">
	<div class="row">

		<jsp:include page="fragments/sidebar.jsp" />
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 class="h2">Project List</h1>

		</div>

		<div class="container">
			<table class="table" >
				<thead>
					<tr>
						<th>Project Name</th>
						<th>Project Description</th>
					</tr>
				</thead>
				
				<tbody id="table_project">
				
				</tbody>
			</table>
			<!-- Json project data goes here -->
		</div>


		</main>
	</div>
</div>

<script>
	function loadDoc() {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let projects=JSON.parse(this.responseText);
				
				let tableStr="";
				projects.forEach(function(project){
					tableStr=tableStr+"<tr>";
					tableStr=tableStr+"<td>"+project.name+"</td> <td> "+project.description+"</td>";
					tableStr=tableStr+"<td><button onclick='deleteProject("+project.id+")'>Delete</button></td>"
					tableStr=tableStr+"</tr>";
				});
				
				
				console.log(tableStr);
				
				document.getElementById("table_project").innerHTML=tableStr;
			}
		};
		xhttp.open("GET", "project", true);
		xhttp.send();
	}
	function deleteProject(projectId){
		alert(projectId);
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let resObj=JSON.parse(this.responseText);
				
				if(resObj.response == "success"){
					loadDoc();
				}
			}
		}
		xhttp.open("DELETE", "project?id="+projectId, true);
		xhttp.send();
	}

	loadDoc();
</script>

<jsp:include page="fragments/footer.jsp" />
