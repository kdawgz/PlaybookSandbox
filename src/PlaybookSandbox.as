package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	public class PlaybookSandbox  extends Sprite {
		public var _playbookSandboxContext:PlaybookSandboxContext;
		public function PlaybookSandbox() {
			stage.align = StageAlign.TOP_LEFT;	
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			_playbookSandboxContext = new PlaybookSandboxContext(this);
		}
		
		public function createChildren():void {
		}
	}
}
