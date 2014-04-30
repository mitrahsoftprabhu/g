<h1>Users</h1><hr>
<cfoutput>
<div class="row">
	<p class="col-sm-12">
		<a href="#buildurl('users.addEdit')#" class="btn btn-success pull-right"  rel="bootTip" title="Add New User">

			<span class="glyphicon glyphicon-plus"></span> Add User
		</a>
	</p>
</div>
</cfoutput>	

<table class="table table-striped table-bordered table-condensed tablesorter">
	<thead>
		<tr>
			<th>Name</th>
			<th>username</th>
			<th>password</th>
			<th>email</th>
			<th>photo</th>
			<th>summary</th>
			<th>detailed Bio</th>
			<th class="nosort">Actions</th>
		</tr>
	</thead>
	<tbody>
		<cfoutput query="rc.qlist">
			<tr>
				<td>#nam#</td>
				<td>#username#</td>
				<td>#password#</td>
				<td>#email#</td>
				<td><img src="../assets/thumbnail/#photo#" height=30 width=30></td>
				<td>#summary#</td>
				<td>#detailedBio#</td>
				<td><a class="glyphicon glyphicon-pencil" rel="bootTip" title="Edit User"href="#buildurl('users.addEdit')#&id=#id#"></a>  
				<a class="glyphicon glyphicon-trash" rel="bootTip" title="Delete User"  href="javascript:void(0);" onclick="javascript:confirmDelete('#id#')" ></a></td>
			</tr>
		</cfoutput>
	</tbody>
</table>
