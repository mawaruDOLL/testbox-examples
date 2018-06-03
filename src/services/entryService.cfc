component accessors=true {
	
	/*
	 * Validates an entry can be saved to the database
	 * @entry An entry bean to be validated
	*/
	public array function validate(required component entry) {
		var errors = [];
		
		if (!isNull(entry.getTitle()) && entry.getTitle().len() > 200) {
			errors.append("The entry title cannot be longer than 200 characters.");
		}
		
		if (isNull(entry.getEntryText()) || entry.getEntryText().len() == 0) {
			errors.append("The entry must have some text.");
		}
		else if (entry.getEntryText().len() > 2000) {
			errors.append("The entry cannot be longer than 2000 characters.");
		}
		
		return errors;
	}
}