<cfcomponent output="false" extends="baseDAO">

	
	<cffunction name="create" returntype="any">
		<cfargument name="AdminMenuGroup_id" type="any" required="false" />
		<cfargument name="title" type="any" required="false" />
		<cfargument name="isHidden" type="any" required="false" default="0"/>
		<cfargument name="linkURL" type="any" required="false" />
		<cfargument name="isSuperAdmin" type="any" required="false" default="0"/>
		<cfargument name="sortOrder" type="any" required="false" />
		
		
		<cfset var qry="" />
		<cfset var ID = createUUID()>
		
		
		<cfquery name="qry" datasource="#variables.dsn#" result="result">
			INSERT INTO tAdminMenu (
				ID,AdminMenuGroup_id,title,sortOrder,isHidden,linkURL,isSuperAdmin
			) SELECT
				<cfqueryparam value = '#ID#' cfsqltype='cf_sql_varchar'>,
				<cfqueryparam value = '#arguments.AdminMenuGroup_id#' cfsqltype='cf_sql_varchar'>,
				<cfqueryparam value = '#arguments.title#' cfsqltype='cf_sql_varchar'>,
				IFNULL(MAX(sortOrder),0)+1 AS sortOrder ,
				<cfqueryparam value = '#arguments.isHidden#' cfsqltype='cf_sql_varchar'>,
				<cfqueryparam value = '#arguments.linkURL#' cfsqltype='cf_sql_varchar'>,
				<cfqueryparam value = '#arguments.isSuperAdmin#' cfsqltype='cf_sql_varchar'>
			FROM tadminmenu WHERE AdminMenuGroup_id = <cfqueryparam value='#arguments.AdminMenuGroup_id#' cfsqltype='cf_sql_varchar'>			
		</cfquery>
		
		<cfreturn ID>		
	</cffunction>
	
	
	<cffunction name="read" returntype="query">
		<cfargument name="ID" type="any" required="false" />
		
		<cfset var qry="" />
		
		
		<cfquery name="qry" datasource="#variables.dsn#">
			SELECT AM.title AS AdminName,AM.id AS AMID,AM.isHidden,
			AM.linkURL,AM.isSuperAdmin,AMG.title,AM.sortOrder,AM.adminMenuGroup_id AS AM_AMG_id   
			FROM tadminmenugroups AS AMG
			INNER JOIN tadminmenu AS AM
			ON  AMG.id=AM.adminMenuGroup_id

			where 1=1 
			
			<cfif structKeyExists(arguments,"ID")>
			AND AM.id = <cfqueryparam value='#arguments.ID#' cfsqltype='cf_sql_varchar'>
			</cfif>
			ORDER BY AM.sortOrder ASC
		</cfquery>
		
		<cfreturn qry />
	</cffunction>
			
	<cffunction name="update" returntype="void">
		<cfargument name="ID" type="any" required="false" />
		<cfargument name="AdminMenuGroup_id" type="any" required="false" />
		<cfargument name="title" type="any" required="false" />
		<cfargument name="sortOrder" type="any" required="false" />
		<cfargument name="isHidden" type="any" required="false" default="0"/>
		<cfargument name="linkURL" type="any" required="false" />
		<cfargument name="isSuperAdmin" type="any" required="false" default="0" /> 
		
		<cfset var qry="" />
		
		<cfquery name="qry" datasource="#variables.dsn#">
			UPDATE tAdminMenu 
			SET AdminMenuGroup_id = <cfqueryparam value='#arguments.AdminMenuGroup_id#' cfsqltype='cf_sql_varchar'>,
			    title = <cfqueryparam value='#arguments.title#' cfsqltype='cf_sql_varchar'>,  
			    isHidden = <cfqueryparam value='#arguments.isHidden#' cfsqltype='cf_sql_varchar'>, 
			    linkURL = <cfqueryparam value='#arguments.linkURL#' cfsqltype='cf_sql_varchar'>, 
			    isSuperAdmin = <cfqueryparam value='#arguments.isSuperAdmin#' cfsqltype='cf_sql_varchar'>
			WHERE ID = <cfqueryparam value='#arguments.ID#' cfsqltype='cf_sql_varchar'>
		</cfquery>
		
		<cfreturn />
	</cffunction>
	
	
	<cffunction name="delete" returntype="void">
		<cfargument name="ID" type="any" required="false" />
		
		<cfset var qry="" />
		
		<cfquery name="qry" datasource="#variables.dsn#">
			DELETE FROM tAdminMenu
			WHERE ID = <cfqueryparam value='#arguments.ID#' cfsqltype='cf_sql_varchar'>
		</cfquery>

		<cfreturn />
	</cffunction>
	
</cfcomponent>
