package xtremelabs.common.framework.ui
{
	public class Orientation
	{
		public static const LANDSCAPGE:String = "landscape";
		public static const PORTRAIT:String = "portrait";
		
		public static function get orientation:String {
			if(Display.display.getDisplayWidth(0)==1024) {
				return LANDSCAPGE;
			}else if(Display.display.getDisplayWidth(0)==600) {
				return PORTRAIT;
			}
			return null;
		}
	}
}