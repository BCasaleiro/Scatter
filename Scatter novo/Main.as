package  {
	import flash.display.MovieClip;
	import flash.net.SharedObject;
	
	public class Main extends MovieClip {
		var saveDataObject : SharedObject = SharedObject.getLocal("Scatter");
		public function Main() {
			var intro : Intro = new Intro(this, true);
			
			//addChild(intro);
		}

		public function clean()
		{
			while(this.numChildren>0)
			{
				this.removeChildAt(0);
			}
		}
	}
	
}