package {
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
	
	public class Intro extends MovieClip {
		var imgLoader : Loader = new Loader();
		//var stageRef : Stage;
		
		public function Intro(stageRef:Stage){
			stop();
			//this.stageRef = stage;
			//Background
			imgLoader.contentLoaderInfo.addEventListener(Event.INIT,loadIntro);
			imgLoader.load(new URLRequest("intro.jpg"));
		}
		
		function loadIntro(e:Event):void
		{
			var largura:int = 720; // Variavel de largura usado para a imagem e para o texto
			var altura:int = 480; // Variavel de altura usado para a imagem e para o texto
			var cont : DisplayObject = e.target.loader;
			cont.x = -(((1.15 * largura) - largura)/2); // Isto foi feito para centrar a imagem sem a distorcer, o valor calculado aqui é a parte da imagem que fica à direita da janela sem aparecer
			cont.y = 0;
			cont.width = 1.15 * largura; // A percentagem da imagem que fica de fora é 15% para não distorcer
			cont.height = altura;
			addChild(cont);
			
			var myText : TextField = new TextField();
			myText.text = "Scatter";
			myText.textColor = 0xDBCDAB;
			
			var myFormat : TextFormat = new TextFormat();
			var myFont = new Font2();
			myFormat.size = 55;
			//myFormat.align = TextFormatAlign.CENTER;
			myFormat.font = myFont.fontName;
			myFormat.bold = true;
			myText.setTextFormat(myFormat);
			
			myText.embedFonts = true;
			//myText.antiAliasType = AntiAliasType.ADVANCED;
			myText.border = false;
			myText.wordWrap = true;
			myText.width = largura;
			myText.height = altura;
			myText.x = 55;
			myText.y = 50;
			addChild(myText);
			
			//stageRef.addEventListener(KeyboardEvent.KEY_DOWN, nextWindow);
		}
		/*function nextWindow(event:KeyboardEvent):void{
			stageRef.removeChild(this);
			stageRef.removeEventListener(KeyboardEvent.KEY_DOWN, nextWindow);
			nextFrame();
		}*/
	}
}