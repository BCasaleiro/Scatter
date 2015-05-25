package  {
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class GameEngine {
		var game : Main; //pequeno
		var map : Map; //grande
		var level : Level;
		var scientist : Scientist;
		var saveButton : Sprite = new Sprite();

		public function GameEngine(game : Main) {
			this.game = game;
		}

		public function start() {
			game.clean();
			this.map.generateMap(level);
			this.game.addChild(this.map);
			createPlayer(720, 480, 40, 30);
			
			map.createZombie(scientist.x, scientist.y, 35, 25);
			map.createZombie(scientist.x, scientist.y, 35, 25);
			map.createZombie(scientist.x, scientist.y, 35, 25);
			map.createZombie(scientist.x, scientist.y, 35, 25);
			map.createZombie(scientist.x, scientist.y, 35, 25);
			map.createZombie(scientist.x, scientist.y, 35, 25);
			map.createZombie(scientist.x, scientist.y, 35, 25);
			
			map.createSoldier(scientist.x + 200, scientist.y + 200, 35, 25);
			map.createSoldier(scientist.x + 250, scientist.y + 250, 35, 25);
			map.createSoldier(scientist.x + 300, scientist.y + 300, 35, 25);
			map.createSoldier(scientist.x + 350, scientist.y + 350, 35, 25);
			map.createSoldier(scientist.x + 400, scientist.y + 400, 35, 25);
			map.createSoldier(scientist.x + 450, scientist.y + 450, 35, 25);
			saveButton = addSaveButton(550,440,190,40,"Save Game");
			saveButton.addEventListener(MouseEvent.CLICK,saveButtonPressed);
		}
		public function saveButtonPressed(evt : Event){
			this.game.saveDataObject.data.savedGame = game;
			this.game.saveDataObject.flush();
		}
		public function addSaveButton(x:Number,y:Number, width:Number, height:Number, text:String):Sprite
		{
			var verdanaBoldFont = new Font2();
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
			buttonSprite.alpha = 0.9;
			buttonSprite.addChild(textbox);
			game.parent.addChild(buttonSprite);
			return buttonSprite;
		}
		
		public function createPlayer(x : int, y : int, width : int, height : int) {
			trace("Player: " + x + " " + y + " " + width + " " + height);
			
			scientist = new Scientist(game, map);
			scientist.x = x;
			scientist.y = y;
			scientist.width = width;
			scientist.height = height;
			this.game.addChild(scientist);
		}
		
		public function stop() {
			
		}
		
		public function setMap(map : Map) {
			this.map = map;
		}
		
		public function setLevel(level : Level) {
			this.level = level;
		}
		
		
		public function generateRandomInt(max : int, min : int) : int {
			return min + (max - min) * Math.random();
		}
	}
	
}
