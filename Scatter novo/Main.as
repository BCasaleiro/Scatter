package  {
	import flash.display.MovieClip;
	public class Main extends MovieClip {
		
		public function Main() {
			var intro : Intro = new Intro(this);
			
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