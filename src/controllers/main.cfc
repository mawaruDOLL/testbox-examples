component accessors=true {
	public void function default(required struct rc) {
	}
	
	public void function unauthorized(required struct rc) {
	}
	
	public void function error(required struct rc) {
		writedump(request.exception);abort;
	}
}