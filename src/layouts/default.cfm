<cfoutput>
	<cfcontent reset="true" />
	<!DOCTYPE HTML>
	<html>
		<head>
			<title>Journal</title>
			<meta http-equiv="X-UA-Compatible" content="IE=10; IE=9; IE=8; IE=7; IE=EDGE" />
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<!--- Adding this so we no longer cache hopefully---->
			<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
			<META HTTP-EQUIV="Expires" CONTENT="-1">

			<link href="#application.clientLib#/bootstrap-4.1.1/bootstrap.min.css" rel="stylesheet" media="screen,print">
			<link href="#application.clientLib#/fontawesome-5.0.13/fontawesome-all.min.css" rel="stylesheet" type="text/css" />

			<script type="text/javascript" src="#application.clientLib#/jquery-3.3.1/jquery.min.js"></script>
			<script type="text/javascript" src="#application.clientLib#/bootstrap-4.1.1/bootstrap.min.js"></script>
		</head>

		<body class="bodyCompliant">
			<a class="sr-only skip-content" href="##main">Skip to Content</a>

			<div class="navbar navbar-inverse navbar-static-top" id="topNav">
				<div class="container">
					<div class="row">
						<div class="brand">
							<div class="navbar-text">
								<h2>My Journal</h2>
							</div>
						</div>
					</div>
				</div>
			</div><!--- navbar --->

			<!--- navigation links navbar --->
			<div class="navbar navbar-inverse navbar-static-top" id="topMenu" role="navigation">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
								<ul class="nav navbar-nav">
									<li>
										<a title="New Entry" href="#buildUrl("journal.newentry")#">
											<i class="fa fa-pencil-alt fa-lg" aria-hidden="true"></i> New Entry
										</a>
									</li>
								</ul>
						</div>
					</div>
				</div>
			</div><!--- navbar --->

			<div class="container" id="main">
				#body#
			</div>
		</body>
	</html>
</cfoutput>