component extends="testbox.system.BaseSpec" {
	function run() {
		describe("The entry service", function() {
			entryService = createMock("src.services.entryService");
			
			describe("validates journal entries", function() {
				it("have entry text", function() {
					entryMock = createMock("src.models.beans.entry");

					expect(entryService.validate(entryMock))
						.toHaveLength(1);
				});
				
				it("have a title that does not exceed 200 characters
					and text that does not exceed 2000 characters",
				function() {
					testTitle = "";
					for (i = 1; i <= 201; ++i) {
						testTitle &= "a";
					}
					
					testText = "";
					for (i = 1; i <= 2001; ++i) {
						testText &= "a";
					}
					
					entryMock = createMock("src.models.beans.entry");
					entryMock.$property(propertyName="title", mock=testTitle)
						.$property(propertyName="entryText", mock=testText);
					
					expect(entryService.validate(entryMock))
						.toHaveLength(2);
				});
			});
			
			describe("searches journal entries", function() {
				it("by date", function() {
					fail("Not implemented");
				});
				
				it("by keyword", function() {
					fail("Not implemented");
				});
			});
		});
	}
}