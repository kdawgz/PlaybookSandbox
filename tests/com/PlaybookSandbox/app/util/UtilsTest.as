package com.PlaybookSandbox.app.util
{
	
	import flashx.textLayout.debug.assert;
	import flashx.textLayout.tlf_internal;
	
	import org.flexunit.Assert;

	public class UtilsTest
	{
		private var utilsInstance:Utils;
		private var utilsInstance2:Utils;

		[BeforeClass]
		public static function runBeforeClass():void {   
			// run for one time before all test cases   
		}   
		
		[AfterClass]  
		public static function runAfterClass():void {   
			// run for one time after all test cases   
		}   
		
		[Before(order=1)]
		public function runBeforeEveryTest():void {   
			utilsInstance = new Utils();   
		}   
		
		[Before(order=2)]
		public function alsoRunBeforeEveryTest():void {   
			utilsInstance2 = new Utils();   
		}   
		
		[After]  
		public function runAfterEveryTest():void {   
			utilsInstance = null;   
			utilsInstance2 = null;   
		} 
		
		[Test]
		public function testTwoNumbers():void {
			Assert.assertEquals(12, Utils.addTwoNumbers(5,7));
		}
		
		[Test(expects="TypeError")]  
		public function divisionWithException():void {   
			utilsInstance.divide( 11, 0 );
		}
		
		[Test]
		public function testSampleFailure() : void {
//			Assert.fail("FAIL! - This is a sample test that will fail.");
			Assert.assertTrue(true);
		}
		
		[Test(expects="Error")]
		public function testSampleError() : void {
			throw new Error("ERROR! - This is an error");
		}
		
		[Ignore("Not Ready to Run")]
		[Test]
		public function testSampleIgnore() : void {
			
		}

		[Test]  
		public function testAdditionOfTwoNumbers():void {   
			Assert.assertEquals(Utils.addTwoNumbers(10,20),35);
		}
	}
}