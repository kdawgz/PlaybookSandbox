package
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.Context;

	public class PlaybookSandboxContext extends Context
	{
		public function PlaybookSandboxContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void {
		}
	}
}