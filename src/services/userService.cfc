component accessors=true {
	property userPersistence;
	
	/*
	 * Gets the user with the specified id, throws an error if the user does not exist
	 * @id The user's id
	*/
	public component function getUserById(required numeric id) {
		var user = variables.userPersistence.getUserById(arguments.id);
		if (!local.keyExists("user")) {
			throw(message="The specified user does not exist.", type="missingUser");
		}
		
		return user;
	}
}