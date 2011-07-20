package xtremelabs.common.patterns.mvc.view
{
	import caurina.transitions.Tweener;
	
	import flash.display.DisplayObject;
	
	import qnx.ui.progress.ActivityIndicator;

	public class LoadableView extends View
	{
		protected var _loadingView:View;
		protected var _spinner:ActivityIndicator;
		private var _loadingAlpha:Number = 1.0;
		
		public function LoadableView()
		{
			super();
			_loadingView = new View();
			_spinner = new ActivityIndicator();
		}
		
		override public function initView():void
		{
			_loadingView.addChild(_spinner);
			//this.addChild(_loadingView);
			super.initView();
		}
		
		override public function layoutView():void
		{
			if(this.parent != null && this.parent != stage)
			{
				this.width = this.parent.width;
				this.height = this.parent.height;
			}else{
				this.width = stage.stageWidth;
				this.height = stage.stageHeight;
			}
			
			_loadingView.width = this.width;
			_loadingView.height = this.height;
			_spinner.x = this.width / 2;
			_spinner.y = this.height / 2;
			_spinner.size = 40;
			_spinner.animate(true);
			_loadingView.alpha = this.loadingAlpha;
			super.layoutView();
		}
		
		public function displayLoadingView():void{
			super.addChild(_loadingView);
			_loadingView.paintView();
		}
		
		override public function setChildIndex(child:DisplayObject, index:int):void
		{
			if(this.contains(_loadingView) && index > 0)
			{
				super.setChildIndex(child,index-1);
			}else{
				super.setChildIndex(child,index);
			}
		}
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			if(this.contains(_loadingView))
			{
				return super.addChildAt(child,this.numChildren-1);
			}else{
				return super.addChild(child);
			}
		}
		
		public function removeLoadingView():void{
			if(this.contains(_loadingView))
			{
				this.removeChild(_loadingView);
			}
		}
		

		protected function get loadingAlpha():Number
		{
			return _loadingAlpha;
		}

		protected function set loadingAlpha(value:Number):void
		{
			_loadingAlpha = value;
		}


	}
}