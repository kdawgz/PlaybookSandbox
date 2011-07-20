package xtremelabs.common.framework.io
{
	import flash.events.Event;
	import flash.events.SecurityErrorEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	public class FileUtility
	{
		public function FileUtility()
		{
		}
		
		public static function storeObject(object:*, path:String, sync:Boolean) {
			try {
				var byteArray:ByteArray = new ByteArray();
				byteArray.writeObject(object);
				
				var file:File = File.applicationStorageDirectory.resolvePath(path);
				var fileStream:FileStream = new FileStream();
				if(sync) {
					fileStream.open(file, FileMode.WRITE);
				}else {
					fileStream.openAsync(file, FileMode.WRITE);
				}
				fileStream.writeBytes(byteArray);
				fileStream.addEventListener(Event.COMPLETE, onWriteComplete);
				
				function onWriteComplete(event:Event):void {
					fileStream.close();
				}
			}catch(e:Error) {
				trace("ERROR: FileUtility : error ocurrs in storeObject(). ");
			}	
		}
		
		public static function loadObject(path:String, sync:Boolean):* {
			var object:Object;
			
			try {
				var byteArray:ByteArray = new ByteArray();
				
				var file:File = File.applicationStorageDirectory.resolvePath(path);
				
				if(file.exists) {
					var fileStream:FileStream = new FileStream();
					if(sync) {
						fileStream.open(file, FileMode.READ);
					}else {
						fileStream.openAsync(file, FileMode.READ);
					}
					
					fileStream.readBytes(byteArray);
					
					object = byteArray.readObject();
					
					fileStream.close();
				}
			}catch(e:Error) {
				trace("ERROR: FileUtility : error ocurrs in loadObject(). ");
			}
			
			return object;
		}
		
	}
}