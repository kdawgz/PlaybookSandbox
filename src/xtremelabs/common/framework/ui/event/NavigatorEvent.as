package xtremelabs.common.framework.ui.event
{
	import flash.events.Event;
	
	public class NavigatorEvent extends Event
	{
		public static const ADDED_TO_NAVIGATOR:String = "added to navigator";
		public static const REMOVING_FROM_NAVIGATOR:String = "removing from navigator";
		public static const REMOVED_FROM_NAVIGATOR:String = "removed from navigator";
		
		public static const VIEW_PUSHED:String = "view pushed";
		public static const VIEW_POPPED:String = "view popped";
		
		public function NavigatorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}