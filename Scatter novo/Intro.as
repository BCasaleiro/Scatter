﻿package 
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
		var game:Main;
		var imgLoader : Loader = new Loader();
		var verdanaBoldFont = new Font2();
		var largura:int = 720;// Variavel de largura usado para a imagem e para o texto
		var altura:int = 480;// Variavel de altura usado para a imagem e para o texto

		public function Intro(game : Main)
		{
			this.game = game;
			//Background
			game.addChild(this);
			imgLoader.contentLoaderInfo.addEventListener(Event.INIT,loadIntroAndTitle);
			imgLoader.load(new URLRequest("intro.jpg"));
		}
		function loadIntroAndTitle(e:Event):void
		{
			loadIntro(e);
			loadIntroTitle();
		}
		function loadIntro(e:Event):void
		{
			//var scatterTitle : TextField;
			var img:DisplayObject = e.target.loader;
			img.x =  -  (((1.15 * largura) - largura) / 2);// Isto foi feito para centrar a imagem sem a distorcer, o valor calculado aqui é a parte da imagem que fica à direita da janela sem aparecer
			img.y = 0;
			img.width = 1.15 * largura;// A percentagem da imagem que fica de fora é 15% para não distorcer
			img.height = altura;
			game.addChild(img);
			//scatterTitle = loadIntroTitle();
			loadButtons();
		}
		function loadIntroTitle():void
		{
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
			game.addChild(scatterTitle);
		}
		/*function removeIntroTitle():void{
		if(this.contains(scatterTitle)){
		removeChild(scatterTitle);
		}
		}*/
		public function loadButtons():void
		{
			var newGameButton : Sprite = new Sprite();
			newGameButton = addButtonSpecial(30,200,190,40,"New Game");
			//newGameButton.addEventListener(MouseEvent.CLICK,newGameButtonPressed);
			var loadGameButton : Sprite = new Sprite();
			loadGameButton = addButtonSpecial(30,245,190,40,"Load Game");
			//loadGameSprite.addEventListener(MouseEvent.CLICK,loadGameButtonPressed)
			var highscoresButton : Sprite = new Sprite();
			highscoresButton = addButtonSpecial(30,290,190,40,"High Scores");
			highscoresButton.addEventListener(MouseEvent.CLICK,highscoresButtonPressed)
			var helpButton : Sprite = new Sprite();
			helpButton = addButtonSpecial(30,335,190,40,"Help");
			helpButton.addEventListener(MouseEvent.CLICK,helpButtonPressed);
			var optionsButton : Sprite = new Sprite();
			optionsButton = addButtonSpecial(30,380,190,40,"Options");
			optionsButton.addEventListener(MouseEvent.CLICK,optionsButtonPressed);
		}
		function loadBackButton():void
		{
			var back : Sprite = new Sprite();
			back = addButtonSpecial(600,380,95,40,"Back");// Botão back está alinhado com o Options e tem metade da largura
		}
		/*function addButton(x:Number,y:Number, width:Number, height:Number, text:String):Button
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
		}*/
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
			game.addChild(buttonSprite);
			return buttonSprite;
		}
		/*function newGameButtonPressed(event:MouseEvent):void
		{
		
		}*/
		/*function loadGameButtonPressed(event:MouseEvent):void
		{
		
		}*/
		function highscoresButtonPressed(event:MouseEvent):void
		{
			game.clean();
			var highscoresWindow : HighScores = new HighScores(game);
			game.addChild(highscoresWindow);
		}
		function helpButtonPressed(event:MouseEvent):void
		{
			game.clean();
			var helpWindow : Help = new Help(game);
			game.addChild(helpWindow);
		}
		function optionsButtonPressed(event:MouseEvent):void
		{
			game.clean();
			var optionsWindow : Options = new Options(game);
			game.addChild(optionsWindow);
		}
	}
}