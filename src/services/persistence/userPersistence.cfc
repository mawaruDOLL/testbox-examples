component accessors=true {

	/*
	 * Loads the specified user from the database, returns null if the user doesn't exist
	 * @id The user's id
	*/
	public any function getUserById(required numeric id) {
		return entityLoadByPk("user", arguments.id);
	}
}