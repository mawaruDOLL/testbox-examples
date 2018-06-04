component extends="testbox.system.BaseSpec" {
	
	// Executes once before all tests
	function beforeTests() {
		// Create the user service to be tested. It is not empty, just decorated for mocking
		userService = createMock("src.services.userService");
	}
	
	// Executes once after all tests
	function afterTests() {
	}
	
	// Executes before each individual test case
	function setup(currentMethod) {
		// Create a new empty mock user persistence service for each test
		userPersistenceMock = createEmptyMock("src.services.persistence.userPersistence");
		userService.$property(propertyName="userPersistence", mock=userPersistenceMock);
	}
	
	// Executes after each individual test case
	function teardown(currentMethod) {
	}
	
	function loadUserTest() {
		// Create an empty mock user object
		userModelMock = createEmptyMock("src.models.database.user")
			.$property(propertyName="userId", mock="2")
			.$property(propertyName="username", mock="testuser")
			.$property(propertyName="firstName", mock="Test")
			.$property(propertyName="lastName", mock="User");
		
		// Set the persistence service to return the user mock when passed 2
		userPersistenceMock.$("getUserById").$args(2).$results(userModelMock);
		
		expect(userService.getUserById(2).$getProperty("userId"))
			.toBe(userModelMock.$getProperty("userId"));
	}
	
	function loadMissingUserTest() {
		// Set the persistence service to return null when passed 3
		userPersistenceMock.$("getUserById").$args(3).$results();
		
		expect(function() {
			userService.getUserById(3);
		}).toThrow("missingUser");
	}
}