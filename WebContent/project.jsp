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
			<h1 class="h2">Create project</h1>

		</div>

		<!--  Multi step form starts here -->
		<link
			href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
			rel="stylesheet" id="bootstrap-css">
		<script
			src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>




		<div class="container">
			<div class="row form-group">
				<div class="col-xs-12">
					<ul class="nav nav-pills nav-justified thumbnail setup-panel">
						<li class="active"><a href="#step-1">
								<h4 class="list-group-item-heading">Step 1</h4>
								<p class="list-group-item-text">Project Details</p>
						</a></li>
						<li class="disabled"><a href="#step-2">
								<h4 class="list-group-item-heading">Step 2</h4>
								<p class="list-group-item-text">Client Details</p>
						</a></li>
						<li class="disabled"><a href="#step-3">
								<h4 class="list-group-item-heading">Step 3</h4>
								<p class="list-group-item-text">Defect Configurations</p>
						</a></li>
						<li class="disabled"><a href="#step-4">
								<h4 class="list-group-item-heading">Step 4</h4>
								<p class="list-group-item-text">Assign Peoples</p>
						</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row setup-content" id="step-1">
				<div class="col-xs-12">
					<div class="col-md-12 well ">


		<%
		if(request.getParameter("msg")!=null){
			String msg = request.getParameter("msg");
			if (msg.equals("success") ){
				out.print("<div class='alert alert-success' role='alert'>Successfully Inserted!</div>");
			}else if (msg.equals("notvalid") ){
				out.print("<div class='alert alert-warning' role='alert'>Please Fill All the Values!</div>");
			}else{
				out.print("<div class='alert alert-dnager' role='alert'>Some thing went wrong</div>");
			}
		}
		%>

						<form action="/Defect-Tracker/project" method="POST">
							<div class="form-group">
								<label for="id_projectName">Project Name</label> 
								<input
									type="text" class="form-control" id="id_projectName"
									placeholder="" name="projectName">
							</div>
							
							<div class="form-group">
								<label for="id_projectDescription">Project Description
									</label>
								<textarea class="form-control" id="id_projectDescription"
									rows="3" name="projectDescription"></textarea>
							</div>
							
							<input type='submit' value='save' class="btn btn-primary" /> 
						</form>

						
					</div>
				</div>
			</div>

		</div>

		<form class="container">

			<div class="row setup-content" id="step-2">
				<div class="col-xs-12">
					<div class="col-md-12 well text-center">
						<h1 class="text-center">STEP 2</h1>

						<!--<form></form> -->

						<button id="activate-step-3" class="btn btn-primary btn-md">Activate
							Step 3</button>
					</div>
				</div>
			</div>

		</form>

		<form class="container">

			<div class="row setup-content" id="step-3">
				<div class="col-xs-12">
					<div class="col-md-12 well text-center">
						<h1 class="text-center">STEP 3</h1>

						<!--<form></form> -->

						<button id="activate-step-4" class="btn btn-primary btn-md">Activate
							Step 4</button>
					</div>
				</div>
			</div>

		</form>

		<form class="container">

			<div class="row setup-content" id="step-4">
				<div class="col-xs-12">
					<div class="col-md-12 well text-center">
						<h1>STEP 1</h1>

						<!-- <form> -->

						<div class="container col-xs-12">
							<div class="row clearfix">
								<div class="col-md-12 column">
									<table class="table table-bordered table-hover" id="tab_logic">
										<thead>
											<tr>
												<th class="text-center">#</th>
												<th class="text-center">Name</th>
												<th class="text-center">Surname</th>
												<th class="text-center">Email</th>

												<th class="text-center">Gender</th>

											</tr>
										</thead>
										<tbody>
											<tr id='addr0'>
												<td>1</td>
												<td><input type="text" name='name0' placeholder='Name'
													class="form-control" /></td>
												<td><input type="text" name='sur0'
													placeholder='Surname' class="form-control" /></td>
												<td><input type="text" name='email0'
													placeholder='Email' class="form-control" /></td>
												<td><select type="text" name="gender0"
													class="form-control">
														<option name="male" value="male">Male</option>
														<option name="Female" value="Female">Female</option>
														<option name="3rdgen" value="none">None</option>
												</select></td>
											</tr>
											<tr id='addr1'></tr>
										</tbody>
									</table>
								</div>
							</div>
							<a id="add_row" class="btn btn-success pull-left">Add Row</a><a
								id='delete_row' class="btn btn-danger pull-right">Delete Row</a>
						</div>

						<!-- </form> -->

						<button id="activate-step-2" class="btn btn-primary btn-md">Activate
							Step 2</button>
					</div>
				</div>
			</div>


		</form>




		<!--  Multi step form ends here --> </main>
	</div>
</div>

<jsp:include page="fragments/footer.jsp" />