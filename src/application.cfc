component extends="framework.one" {
	variables.absoluteDirectoryPath = getDirectoryFromPath(getCurrentTemplatePath());
	this.name="#cgi.server_name##reReplaceNoCase(ReplaceNoCase(cgi.script_name, Replace('/' & Replace(Replace(ExpandPath('.\'), variables.absoluteDirectoryPath, ''), '\', '/', 'all') & '/', '//', '/', 'all') & GetFileFromPath(GetTemplatePath()), ''), '[\W\s]+', '_', 'all')#";
	this.applicationTimeout = createTimeSpan(1, 0, 0, 0);
	this.clientManagement = true;
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0, 0, 40, 0);

	this.mappings["/models"] = "#variables.absoluteDirectoryPath#models\";
	this.mappings["/services"] = "#variables.absoluteDirectoryPath#services\";
	this.mappings["/controllers"] = "#variables.absoluteDirectoryPath#controllers\";
	this.mappings["/assets"] = "#variables.absoluteDirectoryPath#assets\";

	this.ormSettings.cfclocation = "#this.mappings["/models"]#database";
	this.ormenabled = true;
	this.ormSettings.useDBForMapping = false;
	this.ormSettings.flushAtRequestEnd = false;
	this.datasource = "testbox";

	variables.framework = {
		action = "fuseaction",
		diConfig = {
			initMethod: "afterWiring",
			omitTypedProperties: true
		}
	};

	public void function setupApplication() {
		var relativeURL = "#ReplaceNoCase(cgi.script_name, Replace('/' & Replace(Replace(ExpandPath('.\'), variables.absoluteDirectoryPath, ''), '\', '/', 'all') & '/', '//', '/', 'all') & GetFileFromPath(GetTemplatePath()), '')#/";
		application.clientLib = "#application.clientAssets#/lib";
	}

	public void function setupSession() {
		var userService = getBeanFactory().getBean("userService");
		session.user = userService.getUserById(1);
	}

	public void function onSessionEnd(required struct sessionScope, required struct appScope) {
	}

	public void function setupRequest() {
		if (isAjax()) {
			setting enableCFOutputOnly=false showDebugOutput=false;
			setLayout('ajax');
		}
		else {
			setting enableCFOutputOnly=false showDebugOutput=false;
		}
	}

	public void function before(required struct rc) {
	}

	public void function onMissingView() {
		redirect(action="main.unauthorized");
	}

	public boolean function isAjax(){
		headers = GetHttpRequestData().headers;
		if(structKeyExists( headers, "X-Requested-With" ) && headers["X-Requested-With"] EQ "XMLHttpRequest"){
			return true;
		}
		return false;
	}
}