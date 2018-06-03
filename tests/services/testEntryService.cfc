component extends="testbox.system.BaseSpec" {
	function run() {
		describe("The entry service", function() {
			entryService = createMock("src.services.entryService");
			
			describe("validates journal entries", function() {
				it("have entry text", function() {
					entryMock = createMock("src.models.beans.entry");
					entryMock.$property(propertyName="title", mock="title");

					expect(entryService.validate(entryMock))
						.toHaveLength(1);
				});
				
				it("do not exceed 2000 characters", function() {
					testString = "";
					for (i = 1; i <= 2001; ++i) {
						testString &= "a";
					}
					
					entryMock = createMock("src.models.beans.entry");
					entryMock.$property(propertyName="title", mock="title");
					entryMock.$property(propertyName="entryText", mock=testString);
					
					expect(entryService.validate(entryMock))
						.toHaveLength(1);
				});
				
				it("have a title that does not exceed 200 characters", function() {
					testString = "";
					for (i = 1; i <= 201; ++i) {
						testString &= "a";
					}
					
					entryMock = createMock("src.models.beans.entry");
					entryMock.$property(propertyName="title", mock=testString);
					entryMock.$property(propertyName="entryText", mock="Entry");
					
					expect(entryService.validate(entryMock))
						.toHaveLength(1);
				});
			});
		});
	}
}