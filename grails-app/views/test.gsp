<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome to Grails</title>

		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}"/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'datepicker.css')}"/>
    	
	</head>
	<body>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.8.3.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'date.js')}"></script>
    	<script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
    	<script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap-datepicker.js')}"></script>
		<style>
			.label{
				float: left;
				margin: 6px 0px 0px 8px;
				position: relative;
			}
			.label .close{
				line-height: 14px;
			}
			.test{
				width: 364px;
				position: relative;
				float:left;
				min-height: 22px;
				background-color: #ffffff;
				border: 1px solid #cccccc;
				-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
				-moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
				box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
				-webkit-transition: border linear 0.2s, box-shadow linear 0.2s;
				-moz-transition: border linear 0.2s, box-shadow linear 0.2s;
				-o-transition: border linear 0.2s, box-shadow linear 0.2s;
				transition: border linear 0.2s, box-shadow linear 0.2s;
				display: inline-block;
				padding-bottom: 6px;
				padding-right: 6px;
				margin-bottom: 10px;
				font-size: 14px;
				line-height: 20px;
				color: #555555;
				vertical-align: middle;
				-webkit-border-radius: 4px;
				-moz-border-radius: 4px;
				border-radius: 4px;
			}
			.date{
				float: left;
				position: relative;
			}
		</style>
		<script type="text/javascript">

		$(function() {
			$.fn.multidatepicker = function(option,val){
				var el = $(this),values = [];
				var labelArea = el.prev('.test');
				$('.test .label .close').live('click',function(){
					var date = $(this).parent('.label').attr('df');
					$(this).parent('.label').remove();
					values = $.grep(values, function(value) {
					  return value != date;
					});
					return false;
				});
				this.datepicker(option,val).on('changeDate', function(ev){
					if($.inArray(ev.date.toString("mm/dd/yyyy"),values)==-1){
						values.push(ev.date.toString("mm/dd/yyyy"));
						labelArea.append('<span class="label label-info" df="'+ev.date.toString("mm/dd/yyyy")+'">'+ev.date.toString("mm/dd/yyyy")+'<span class="close">&times;</span></span>');
					};

				});
			}
			$('#dp3').multidatepicker({format: 'mm/dd/yyyy'});
			// $('#dp3').datepicker({
			// 	format: 'mm/dd/yyyy'
			// }).on('changeDate', function(ev){
			// 	$('.test').append('<span class="label label-info">'+ev.date.toString("mm/dd/yyyy")+'<span class="close">&times;</span></span>');
			// 	console.log(ev.date.toString("mm/dd/yyyy"));
			// });

		});
		</script>
		<div class="hero-unit">
			<div class="test">
				<span class="label label-info">12-02-2012<span class="close">&times;</span></span>
				
			</div>		
			<div class="input-append date" id="dp3" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
				<span class="add-on"><i class="icon-calendar"></i></span>
			</div>
		</div>


	</body>
</html>
