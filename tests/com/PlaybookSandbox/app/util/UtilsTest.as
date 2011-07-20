package com.PlaybookSandbox.app.util
{
	
	import org.flexunit.Assert;

	public class UtilsTest
	{
		public function UtilsTest()
		{
		}
		
		[Test]
		public function testTwoNumbers():void {
			Assert.assertEquals(12, Utils.addTwoNumbers(5,7));
		}
	}
}