package  {
	import flash.display.Stage;
	import flash.display.Sprite;
	import flash.text.TextField;
	import fl.controls.Button;
	import flash.display.Loader;
	import flash.display.DisplayObject;
	import flash.net.URLRequest;
	
	public class Help extends Sprite {
		var imgLoader : Loader = new Loader();
		var descricao : String = "Help evil scientist Doctor Hanzsel Stein take revenge against the world and scatter the synthetic plague he created by controlling his affected followers and manage those “human” resources effectively enough to doom humanity. Grow your zombie horde, plan your fights, infect the enemy soldiers that try to contain the epidemic and transmit 0D3EI to other continents.";
		var stageRef : Stage;
		var botaoSair : Button;
		public function Help(stageRef:Stage) {
			this.stageRef = stageRef;
			imgLoader.load(new URLRequest("intro.jpg"));
		}
		
	}
	
}
