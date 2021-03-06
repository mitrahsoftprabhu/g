<cfoutput>
	
	<form class="form-horizontal" action="#buildurl('AdminMenu.save')#" method="post" role="form">
	    <fieldset>
			<cfif len(rc.ID)>
			  <legend>Edit Admin Menu</legend>
			<cfelse>
			  <legend>Add Admin Menu</legend>
			</cfif>
			<input type="hidden" ID="ID" name="ID"  class="" value="#rc.qData.AMid#">

			<div class="form-group">
				<label class="control-label col-sm-2" for="AdminMenuGroup_id">AdminMenuGroup</label>
				<div class="col-sm-6 controls">
					<select ID="AdminMenuGroup_id" name="AdminMenuGroup_id"  class="form-control required" >
						<option  value="">Select Admin Menu Group</option>
						<cfloop query="rc.qAdminMenuGroups">
							<option <cfif rc.qAdminMenuGroups.id EQ rc.qData.AM_AMG_id>selected</cfif> value="#rc.qAdminMenuGroups.id#">#rc.qAdminMenuGroups.title#</option>
						</cfloop>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="title">Title</label>
				<div class="col-sm-6 controls">
					<input type="text" ID="title" maxlength="30" name="title" placeholder="title" class="form-control required" value="#rc.qData.adminname#">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-2">
				   <div class="checkbox">
					  <label  for="isHidden">
					     <input type="checkbox" ID="isHidden" name="isHidden"  value="1" <cfif rc.qData.isHidden EQ 1>checked</cfif>>  Is Hidden
					  </label>
				   </div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="linkURL">LinkURL</label>
				<div class="col-sm-6 controls">
					<input type="text" ID="linkURL" name="linkURL" maxlength="30" placeholder="linkURL" class="form-control required" value="#rc.qData.linkURL#">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-2">
				   <div class="checkbox">
					  <label  for="isSuperAdmin">
					  <input type="checkbox" ID="isSuperAdmin" name="isSuperAdmin"  value="1" <cfif rc.qData.isSuperAdmin EQ 1>checked</cfif>>  Is Super Admin
					  </label>
				   </div>
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
