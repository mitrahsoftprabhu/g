<cfoutput>
<form class="form-horizontal" action="#buildurl('userGroup_AdminMenu.save')#" method="post" role="form">
	<fieldset>
		<cfif val(url.xID)>
		<legend>Edit userGroup_AdminMenu</legend>
		<cfelse>
		<legend>Add userGroup_AdminMenu</legend>
		</cfif>
		<input type="hidden" id="xID" name="xID"  class="" value="#rc.qData.xID#">

<div class="form-group">
	<label class="control-label col-sm-2" for="userGroup_id">userGroup_id</label>
	<div class="col-sm-6 controls">
		<select id="userGroup_id" name="userGroup_id"  class="form-control " >
			<option  value="">-- Select userGroup_id--</option>
			
		</select>
	</div>
</div>
<div class="form-group">
	<label class="control-label col-sm-2" for="AdminMenu_id">AdminMenu_id</label>
	<div class="col-sm-6 controls">
		<select id="AdminMenu_id" name="AdminMenu_id"  class="form-control " >
			<option  value="">-- Select AdminMenu_id--</option>
			
		</select>
	</div>
</div>
		
		<div class="form-group form-actions">
			<div class="col-sm-offset-2 col-sm-10">
				<input class="btn btn-primary" type="submit" name="AddEdit" value="Save changes" />
				<input class="btn btn-default" type="button" value="Cancel" />
			</div>
		</div>
		
	</fieldset>
</form>
</cfoutput>
