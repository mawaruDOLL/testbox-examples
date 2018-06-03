component table="tbl_users" persistent= "true" accessors="true" {

	property name="userId" column="user_id" fieldtype="id" generator="identity" ormtype="int";
	property name="username";
	property name="firstName" column="first_name";
	property name="lastName" column="last_name";
	
}