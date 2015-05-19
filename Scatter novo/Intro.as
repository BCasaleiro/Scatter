package 
{
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

	public class Intro extends MovieClip
	{
		var imgLoader : Loader = new Loader();
		var stageRef:Stage;
		var verdanaBoldFont = new Font2();

		public function Intro(stageRef:Stage)
		{
			stop();
			this.stageRef = stageRef;
			//Background
			imgLoader.contentLoaderInfo.addEventListener(Event.INIT,loadIntro);
			imgLoader.load(new URLRequest("intro.jpg"));
		}

		function loadIntro(e:Event):void
		{
			var largura:int = 720;// Variavel de largura usado para a imagem e para o texto
			var altura:int = 480;// Variavel de altura usado para a imagem e para o texto
			var cont:DisplayObject = e.target.loader;
			cont.x =  -  (((1.15 * largura) - largura) / 2);// Isto foi feito para centrar a imagem sem a distorcer, o valor calculado aqui é a parte da imagem que fica à direita da janela sem aparecer
			cont.y = 0;
			cont.width = 1.15 * largura;// A percentagem da imagem que fica de fora é 15% para não distorcer
			cont.height = altura;
			addChild(cont);

			var scatterTitle : TextField = new TextField();
			scatterTitle.text = "Scatter";
			scatterTitle.textColor = 0xDBCDAB;// Cor
			scatterTitle.embedFonts = true;
			scatterTitle.antiAliasType = "advanced";
			scatterTitle.border = false;
			scatterTitle.wordWrap = true;
			scatterTitle.width = largura;
			scatterTitle.height = altura;
			scatterTitle.x = 0.4 * largura;
			scatterTitle.y = 0.09 * altura;
			scatterTitle.selectable = false;
			var scatterTitleFormat : TextFormat = new TextFormat();
			scatterTitleFormat.size = 55;
			scatterTitleFormat.font = verdanaBoldFont.fontName;
			scatterTitleFormat.bold = true;
			scatterTitle.setTextFormat(scatterTitleFormat);
			addChild(scatterTitle);

			var newGameButton : Sprite = new Sprite();
			newGameButton = addButtonSpecial(40,200,190,40,"New Game");
			newGameButton.addEventListener(MouseEvent.CLICK,newGameButtonPressed);
			var loadGameButton : Sprite = new Sprite();
			loadGameButton = addButtonSpecial(40,245,190,40,"Load Game");
			//loadGameSprite.addEventListener(MouseEvent.CLICK,loadGameButtonPressed)
			var highscoresButton : Sprite = new Sprite();
			highscoresButton = addButtonSpecial(40,290,190,40,"High Scores");
			//highscoresButton.addEventListener(MouseEvent.CLICK,highscoresButtonPressed)
			var helpButton : Sprite = new Sprite();
			helpButton = addButtonSpecial(40,335,190,40,"Help");
			helpButton.addEventListener(MouseEvent.CLICK,helpButtonPressed);
			var optionsButton : Sprite = new Sprite();
			optionsButton = addButtonSpecial(40,380,190,40,"Options");
			//stageRef.addEventListener(KeyboardEvent.KEY_DOWN, nextWindow);
		}
		public function addButton(x:Number,y:Number, width:Number, height:Number, text:String):Button
		{
			var button : Button = new Button();
			button.move(x,y);
			button.width = width;
			button.height = height;
			button.label = text;
			//button.emphasized = true;
			button.addEventListener(MouseEvent.CLICK,newGameButtonPressed);

			addChild(button);
			return button;
		}
		public function addButtonSpecial(x:Number,y:Number, width:Number, height:Number, text:String):Sprite
		{
			var textbox : TextField = new TextField();
			textbox.mouseEnabled = false;
			textbox.text = text;
			textbox.x = x;
			textbox.y = y;
			textbox.width = width;
			textbox.height = height + 10;
			textbox.textColor = 0xFFFFFF;
			textbox.embedFonts = true;
			textbox.border = false;
			textbox.wordWrap = true;
			textbox.antiAliasType = "advanced";
			var textboxFormat : TextFormat = new TextFormat();
			textboxFormat.align = "center";
			textboxFormat.font = verdanaBoldFont.fontName;
			textboxFormat.bold = true;
			textboxFormat.size = 25;
			textbox.setTextFormat(textboxFormat);

			var buttonSprite : Sprite = new Sprite();
			buttonSprite.graphics.beginFill(0x291500);
			buttonSprite.graphics.drawRect(x,y,width,height);
			buttonSprite.graphics.endFill();
			buttonSprite.buttonMode = true;
			buttonSprite.alpha = 0.7;
			buttonSprite.addChild(textbox);
			addChild(buttonSprite);
			return buttonSprite;
		}
		function newGameButtonPressed(event:MouseEvent):void
		{
			stageRef.removeChild(this);
			stageRef.removeEventListener(MouseEvent.CLICK, newGameButtonPressed);
		}
		function helpButtonPressed(event:MouseEvent):void
		{
			stop();
			var window : Help = new Help(stageRef);
			stageRef.addChild(window);
		}
	}
}