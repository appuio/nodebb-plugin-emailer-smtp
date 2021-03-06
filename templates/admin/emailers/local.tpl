<h1><i class="fa fa-envelope-o"></i> Emailer SMTP</h1>

<div class="row">
	<div class="col-lg-12">
		<blockquote>
			Plugin for NodeBB allowing you to send e-mail via SMTP - The APPUiO Version.
      Uses Nodemailer package.
		</blockquote>
	</div>
</div>

<hr />

<form role="form" class="emailer-local-settings">
	<fieldset>
		<div class="row">
			<div class="col-sm-12">
				<div class="form-group">
					<label for="emailer:local:host">Host</label>
					<input type="text" class="form-control" id="emailer:local:host" name="emailer:local:host" />
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label for="emailer:local:port">Port</label>
					<input type="text" class="form-control" value="25" id="emailer:local:port" name="emailer:local:port" />
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label>
						<input type="checkbox" id="emailer:local:secure" name="emailer:local:secure"/>
						 Enable secure connection
					</label>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label>
						<input type="checkbox" id="emailer:local:ignoretls" name="emailer:local:ignoretls"/>
						 Ignore TLS
					</label>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label>
						<input type="checkbox" id="emailer:local:requiretls" name="emailer:local:requiretls"/>
						 Require TLS
					</label>
				</div>
			</div>
		</div>

		<button class="btn btn-lg btn-primary" id="save">Save</button>
	</fieldset>
</form>

<script type="text/javascript">
	require(['settings'], function(Settings) {
		Settings.load('emailer-local', $('.emailer-local-settings'));
		$('#save').on('click', function() {
			Settings.save('emailer-local', $('.emailer-local-settings'), function() {
				app.alert({
					alert_id: 'emailer-local',
					type: 'info',
					title: 'Settings Changed',
					message: 'Please reload your NodeBB to apply these changes',
					timeout: 5000,
					clickfn: function() {
						socket.emit('admin.reload');
					}
				});
			});
		});
	});
</script>
