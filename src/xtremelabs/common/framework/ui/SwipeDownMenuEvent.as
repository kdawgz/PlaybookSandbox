package xtremelabs.common.framework.ui
{
	import flash.events.Event;
	
	public class SwipeDownMenuEvent extends Event
	{
		public static const MENU_SHOWING:String = "menu showing";
		public static const MENU_SHOWED:String = "menu showed";
		public static const MENU_DISMISSING:String = "menu dismissing";
		public static const MENU_DISMISSED:String = "menu dismissed";
		
		public function SwipeDownMenuEvent(type:String)
		{
			super(type);
		}
	}
}