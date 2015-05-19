package  {
	import flash.display.Loader;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import flash.net.URLRequest;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.net.URLLoader;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import fl.controls.Button;
	import flash.events.MouseEvent;
	import fl.controls.LabelButton;
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	
	public class Help extends Sprite {
		var imgLoader : Loader = new Loader();
		var descricao : String = "Help evil scientist Doctor Hanzsel Stein take revenge against the world and scatter the synthetic plague he created by controlling his affected followers and manage those “human” resources effectively enough to doom humanity. Grow your zombie horde, plan your fights, infect the enemy soldiers that try to contain the epidemic and transmit 0D3EI to other continents.";
		var stageRef : Stage;
		var botaoSair : Button;
		var verdanaBoldFont = new Font2();
		
		public function Help(stageRef:Stage) {
			this.stageRef = stageRef;
			imgLoader.contentLoaderInfo.addEventListener(Event.INIT,loadBackground);
			imgLoader.load(new URLRequest("intro.jpg"));
			loadAbout();
		}
		function loadBackground(e:Event):void
		{
			var largura:int = 720;// Variavel de largura usado para a imagem e para o texto
			var altura:int = 480;// Variavel de altura usado para a imagem e para o texto
			var cont:DisplayObject = e.target.loader;
			cont.x =  -  (((1.15 * largura) - largura) / 2);// Isto foi feito para centrar a imagem sem a distorcer, o valor calculado aqui é a parte da imagem que fica à direita da janela sem aparecer
			cont.y = 0;
			cont.width = 1.15 * largura;// A percentagem da imagem que fica de fora é 15% para não distorcer
			cont.height = altura;
			addChild(cont);
			var textoAbout : Sprite = loadAbout();
			addChild(textoAbout);
		}
		function loadAbout():Sprite{
			var textbox : TextField = new TextField();
			textbox.mouseEnabled = false;
			textbox.text = descricao;
			textbox.x = 50;
			textbox.y = 80;
			textbox.width = 600;
			textbox.height = 150;
			textbox.textColor = 0xFFFFFF;
			textbox.embedFonts = true;
			textbox.border = false;
			textbox.wordWrap = true;
			textbox.antiAliasType = "advanced";
			var textboxFormat : TextFormat = new TextFormat();
			textboxFormat.align = "center";
			textboxFormat.font = verdanaBoldFont.fontName;
			textboxFormat.bold = true;
			textboxFormat.size = 14;
			textbox.setTextFormat(textboxFormat);

			var buttonSprite : Sprite = new Sprite();
			buttonSprite.graphics.beginFill(0x291500);
			buttonSprite.graphics.drawRect(50,80,620,100);
			buttonSprite.graphics.endFill();
			buttonSprite.buttonMode = true;
			buttonSprite.alpha = 0.7;
			buttonSprite.addChild(textbox);
			addChild(buttonSprite);
			return buttonSprite;
		}
		
	}
	
}
