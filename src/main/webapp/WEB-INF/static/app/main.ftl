<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Mosaddek">
<meta name="keyword"
	content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>Bottle</title>

<!-- Bootstrap core CSS -->
<link href="${BASE_PATH}/static/manage/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${BASE_PATH}/static/manage/css/bootstrap-reset.css"
	rel="stylesheet">
<!--external css-->
<link
	href="${BASE_PATH}/static/manage/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="${BASE_PATH}/static/manage/css/style.css" rel="stylesheet">
<link href="${BASE_PATH}/static/manage/css/style-responsive.css"
	rel="stylesheet" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
<!--[if lt IE 9]>
    <script src="${BASE_PATH}/static/manage/js/html5shiv.js"></script>
    <script src="${BASE_PATH}/static/manage/js/respond.min.js"></script>
    <![endif]-->
<script src="${BASE_PATH}/static/manage/js/jquery.js"></script>
<script src="${BASE_PATH}/static/manage/js/jquery.form.min.js"></script>
<style type="text/css">
p.error {
	color: #DE5959;
}

.form-signin input[type="text"].error, .form-signin input[type="password"].error
	{
	border-color: #b94a48;
	color: #b94a48;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
}

input.error:focus {
	border-color: #953b39;
	color: #b94a48;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px
		#d59392;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
}
</style>
</head>

<body class="login-body">

	<div class="container">

		<form class="form-signin" id="adminForm"
			action="${BASE_PATH}/app/update" autocomplete="off"
			method="post">
			<h2 class="form-signin-heading">
				<img src="${TEMPLATE_BASE_PATH}/images/logo.png"
					style="height: 38px;" />
			</h2>
			<div class="login-wrap">
				<div class="form-group">
                                      <label for="exampleInputEmail1">当前状态</label>
                                      <label id="status">&nbsp&nbsp&nbsp&nbsp未登录</label>
                                  </div>
 				<div class="form-group">
                                      <input type="button" name="startBtn" class="form-control" value="启动投瓶" style="*width: 250px;">
                                      <br/>
                                      <input type="button" name="stopBtn" class="form-control" value="停止投瓶" style="*width: 250px;">
                                  </div>	                                 	
				
				<div class="clearfix"></div>
				<div>
					<p class="error" for="captcha" style="display: none;"></p>
				</div>
				<div>
					<img src="http://localhost:8080/Bottle_CloudServer/static/images/ID.jpg" style="height: 250px;">
				</div>
							
			</div>
		</form>

	</div>
</body>

<script type="text/javascript">
		alert(123);
		var my_interval = setInterval(function () {
            $('#adminForm')
					.ajaxForm(
							{
								dataType : 'json',
								success : function(data) {
									if (data.result) {
										location.href = "${BASE_PATH}/app/update";
									} else {
										
									}
								}
							});
        }, 5000);		
	</script>
</html>