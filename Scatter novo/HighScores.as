﻿package  {
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
	
	public class HighScores extends MovieClip {
		var game : Main;
		var imgLoader : Loader = new Loader();
		var contadorHighscores : int = 1;
		var verdanaBoldFont = new Font2();
		var largura:int = 720;// Variavel de largura usado para a imagem e para o texto
		var altura:int = 480;// Variavel de altura usado para a imagem e para o texto
		public function HighScores(game : Main) {
			this.game = game;
			game.addChild(this);
			imgLoader.contentLoaderInfo.addEventListener(Event.INIT,loadIntro);
			imgLoader.load(new URLRequest("intro.jpg"));
		}
		function loadIntro(e:Event):void
		{
			var img : DisplayObject = e.target.loader;
			img.x =  -  (((1.15 * largura) - largura) / 2); // Isto foi feito para centrar a imagem sem a distorcer, o valor calculado aqui é a parte da imagem que fica à direita da janela sem aparecer
			img.y = 0;
			img.width = 1.15 * largura; // A percentagem da imagem que fica de fora é 15% para não distorcer
			img.height = altura;
			game.addChild(img);
			loadButtons();
			loadHighScores();
		}
		function loadHighScores(){
			var buttonSprite : Sprite = new Sprite();
			buttonSprite.graphics.beginFill(0x291500);
			buttonSprite.graphics.drawRect(230,20,360,430);
			buttonSprite.graphics.endFill();
			buttonSprite.buttonMode = true;
			buttonSprite.alpha = 0.7;
			game.addChild(buttonSprite);
			loadTitle("High Scores","center",28,230,20,true);
			loadHighScore("Rui Mendes Campeão", 69420);
			loadHighScore("Bolacha da LCS", 69420);
			loadHighScore("Casaleiro", -1);
			// NOTAS: QUANDO SE PEDIR NOME AO USER TEMOS DE PROTEGER ENTRADAS A 17 CARACTERES MAIS OU MENOS
			loadBackButton();
		}
		function loadHighScore(nome : String, pontos : int){
			loadTitle(pontos.toString()+" "+nome,"left",20,250,40+(20*contadorHighscores),false);
			contadorHighscores++;
			// No fim temos de ver qual é o maximo de high scores que cabem na janela e depois quando for para ler do ficheiro
			// Vemos quantas linhas tem o ficheiro e depois passamos cada nome e pontuaçao para um array e depois vemos quais os X melhores
			// ^ X sendo o numero de linhas que cabem na janela
		}
		function loadTitle(texto : String, align : String, size : int, x : int, y : int, underline : Boolean){
			var titleText : TextField = new TextField();
			titleText.text = texto;
			titleText.textColor = 0xDBCDAB;// Cor
			titleText.embedFonts = true;
			titleText.antiAliasType = "advanced";
			titleText.border = false;
			titleText.wordWrap = true;
			titleText.width = 360;
			//titleText.height = altura;
			titleText.x = x;
			titleText.y = y;
			titleText.selectable = false;
			var titleTextFormat : TextFormat = new TextFormat();
			titleTextFormat.size = size;
			titleTextFormat.underline = underline;
			titleTextFormat.font = verdanaBoldFont.fontName;
			titleTextFormat.bold = true;
			titleTextFormat.align = align;
			titleText.setTextFormat(titleTextFormat);
			game.addChild(titleText);
		}
		public function loadButtons():void{
			var newGameButton : Sprite = new Sprite();
			newGameButton = addButtonSpecial(30,200,190,40,"New Game");
			//newGameButton.addEventListener(MouseEvent.CLICK,newGameButtonPressed);
			var loadGameButton : Sprite = new Sprite();
			loadGameButton = addButtonSpecial(30,245,190,40,"Load Game");
			//loadGameSprite.addEventListener(MouseEvent.CLICK,loadGameButtonPressed);
			var highscoresButton : Sprite = new Sprite();
			highscoresButton = addButtonSpecial(30,290,190,40,"High Scores");
			var helpButton : Sprite = new Sprite();
			helpButton = addButtonSpecial(30,335,190,40,"Help");
			helpButton.addEventListener(MouseEvent.CLICK,helpButtonPressed);
			var optionsButton : Sprite = new Sprite();
			optionsButton = addButtonSpecial(30,380,190,40,"Options");
			optionsButton.addEventListener(MouseEvent.CLICK,optionsButtonPressed);
		}
		function loadBackButton():void{
			var back : Sprite = new Sprite();
			back = addButtonSpecial(600,380,95,40,"Back"); // Botão back está alinhado com o Options e tem metade da largura
			back.addEventListener(MouseEvent.CLICK,backButtonPressed);
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
			game.addChild(buttonSprite);
			return buttonSprite;
		}
		function backButtonPressed(event:MouseEvent):void
		{
			game.clean();
			var intro : Intro = new Intro(game);
			//helpWindow.help();
		}
		/*function newGameButtonPressed(event:MouseEvent):void
		{
		
		}*/
		/*function loadGameButtonPressed(event:MouseEvent):void
		{
		
		}*/
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
