component extends="testbox.system.BaseSpec" {
	
	// Executes once before all tests
	function beforeTests() {
		// Create an empty mock user persistence service
		userPersistenceMock = createEmptyMock("src.services.persistence.userPersistence");
		
		// Create the user service to be tested. It is not empty, just decorated for mocking
		userService = createMock("src.services.userService");
		userService.$property(propertyName="userPersistence", mock=userPersistenceMock);
	}
	
	// Executes once after all tests
	function afterTests() {
	}
	
	// Executes before each individual test case
	function setup(currentMethod) {
	}
	
	// Executes after each individual test case
	function teardown(currentMethod) {
	}
	
	function loadUserTest() {
		// Create an empty mock user object
		userModelMock = createEmptyMock("src.models.database.user");
		userModelMock.$property(propertyName="userId", mock="2");
		userModelMock.$property(propertyName="username", mock="testuser");
		userModelMock.$property(propertyName="firstName", mock="Test");
		userModelMock.$property(propertyName="lastName", mock="User");
		
		// Set the persistence service to return the user mock when passed 2
		userPersistenceMock.$("getUserById").$args(2).$results(userModelMock);
		
		expect(userService.getUserById(2).$getProperty("userId"))
			.toBe(userModelMock.$getProperty("userId"));
	}
	
	function loadMissingUserTest() {
		// Set the persistence service to return null when passed 3
		userPersistenceMock.$("getUserById").$args(3).$results();
		
		try {
			userService.getUserById(3);
		}
		catch (any e) {
			if (e.type != "missingUser") {
				fail("The error type was invalid #e.type#");
			}
		}
	}
}