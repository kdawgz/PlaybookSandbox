package com.PlaybookSandbox.app.util
{
	public class Utils
	{
		public function Utils()
		{
		}
		
		public static function addTwoNumbers(n1:int, n2:int):int {
			return n1+n2;
		}
		
		public function divide( n1:Number, n2:Number ):Number {
			if ( n2 == 0 ) {
				throw new TypeError("Cannot divide by 0");
			}
			return (n1/n2);
		}
		
		public static function failingToAddTwoNumbers(n1:int, n2:int):int {
			return n1+n2;
		}
		
		public static function testSubtractionofTwoNumbers(n1:int, n2:int):int {
			return n1-n2;
		}
	}
}