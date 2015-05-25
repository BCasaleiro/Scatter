<<<<<<< HEAD
﻿﻿﻿package  {		import flash.display.Loader;	import flash.display.MovieClip;	import flash.display.SimpleButton;	import flash.display.Sprite;	import flash.events.MouseEvent;	import flash.events.Event;	import flash.text.TextField;	import flash.text.TextFormat;		public class Map extends MovieClip {		var game : Main;		var walkableMap : Vector.<Vector.<int>>;		var objects : Vector.<SimpleButton>;		var zombies : Vector.<Zombie>;		var soldiers : Vector.<Soldier>;		var scientist : Scientist;		var imageLoader : Loader;		var mapWidth;		var mapHeight;		var verdanaBoldFont ;				var confirm;		var cancel;		var info;		var background;		var nPersons;		var probSucess;		var probEspecial;						public function Map(game : Main, imageLoader : Loader) {			this.game = game;			this.imageLoader = imageLoader;			verdanaBoldFont = new Font2();			this.objects = new Vector.<SimpleButton>;			this.zombies = new Vector.<Zombie>;			this.soldiers = new Vector.<Soldier>;		}		public function generateMap(level : Level) {			trace("generating map: " + level.id + " " + level.mapWidth + " " + level.mapHeight);						trace((game.stage.stageWidth - level.mapWidth) * 0.5 + " " + (game.stage.stageHeight - level.mapHeight) * 0.5);						game.x = (game.stage.stageWidth - level.mapWidth) * 0.5;			game.y = (game.stage.stageHeight - level.mapHeight) * 0.5;						walkableMap = new Vector.<Vector.<int>>(level.mapWidth);			for (var i = 0; i < level.mapWidth; i++) {				walkableMap[i] = new Vector.<int>(level.mapHeight);			}						for(i = 0; i < level.objects.length; i++) {				setWalkable(level.objects[i]);				drawInMap(level.objects[i]);			}		}		public function setWalkable(object : MapObjects) {			for(var i = 0; i < object.sizeX; i++) {				walkableMap[object.posX + i][object.posY] = object.walkable;			}						for(i = 0; i < object.sizeY; i++) {				walkableMap[object.posX][object.posY + i] = object.walkable;			}		}		public function drawInMap(object : MapObjects) {			createMapObject(object.imageSrc, object.posX, object.posY, object.sizeX, object.sizeY, object.walkable, object.info, object.nPersons, object.probSucess, object.probEspecial);		}				public function createMapObject(src : String, x : int, y : int, width : int, height : int, walkable : int, info : String, nPersons : int, probSucess : int, probEspecial : int) {			trace("drawing: " + x + " " + y + " " + width + " " + height);			switch (src) {				case "edificio1":					var ed1 : edificio1 = new edificio1();					ed1.width = width;					ed1.height = height;					ed1.x = x;					ed1.y = y;					ed1.mouseEnabled = walkable;					ed1.addEventListener(MouseEvent.CLICK, pressBuilding);										ed1.info = info;					ed1.nPersons = nPersons;					ed1.probSucess = probSucess;					ed1.probEspecial = probEspecial;										game.addChild(ed1);					this.objects.push(ed1);					break;				case "edificio3":					var ed3 : edificio3 = new edificio3();					ed3.width = width;					ed3.height = height;					ed3.x = x;					ed3.y = y;					ed3.mouseEnabled = walkable;					ed3.addEventListener(MouseEvent.CLICK, pressBuilding);										ed3.info = info;					ed3.nPersons = nPersons;					ed3.probSucess = probSucess;					ed3.probEspecial = probEspecial;										game.addChild(ed3);					this.objects.push(ed3);					break;				case "labEdificio":					var lab : labEdificio = new labEdificio();					lab.width = width;					lab.height = height;					lab.x = x;					lab.y = y;					lab.mouseEnabled = walkable;					lab.addEventListener(MouseEvent.CLICK, pressBuilding);										lab.info = info;					lab.nPersons = nPersons;					lab.probSucess = probSucess;					lab.probEspecial = probEspecial;										game.addChild(lab);					this.objects.push(lab);					break;				case "heloEdificio":					var helo : heloEdificio = new heloEdificio();					helo.width = width;					helo.height = height;					helo.x = x;					helo.y = y;					helo.mouseEnabled = walkable;					helo.addEventListener(MouseEvent.CLICK, pressBuilding);										helo.info = info;					helo.nPersons = nPersons;					helo.probSucess = probSucess;					helo.probEspecial = probEspecial;										game.addChild(helo);					this.objects.push(helo);					break;				case "uniEdificio":					var uni : uniEdificio = new uniEdificio();					uni.width = width;					uni.height = height;					uni.x = x;					uni.y = y;					uni.mouseEnabled = walkable;					uni.addEventListener(MouseEvent.CLICK, pressBuilding);										uni.info = info;					uni.nPersons = nPersons;					uni.probSucess = probSucess;					uni.probEspecial = probEspecial;										game.addChild(uni);					this.objects.push(uni);					break;				case "armazemEdificio":					var arm : armazemEdificio = new armazemEdificio();					arm.width = width;					arm.height = height;					arm.x = x;					arm.y = y;					arm.mouseEnabled = walkable;					arm.addEventListener(MouseEvent.CLICK, pressBuilding);										arm.info = info;					arm.nPersons = nPersons;					arm.probSucess = probSucess;					arm.probEspecial = probEspecial;										game.addChild(arm);					this.objects.push(arm);					break;				case "apartEdificio":					var apart : apartEdificio = new apartEdificio();					apart.width = width;					apart.height = height;					apart.x = x;					apart.y = y;					apart.mouseEnabled = walkable;					apart.addEventListener(MouseEvent.CLICK, pressBuilding);										apart.info = info;					apart.nPersons = nPersons;					apart.probSucess = probSucess;					apart.probEspecial = probEspecial;										game.addChild(apart);					this.objects.push(apart);					break;				case "militarEdificio":					var militar : militarEdificio = new militarEdificio();					militar.width = width;					militar.height = height;					militar.x = x;					militar.y = y;					militar.mouseEnabled = walkable;					militar.addEventListener(MouseEvent.CLICK, pressBuilding);										militar.info = info;					militar.nPersons = nPersons;					militar.probSucess = probSucess;					militar.probEspecial = probEspecial;										game.addChild(militar);					this.objects.push(militar);					break;				case "estradah":					var esh : estradah = new estradah();					esh.width = width;					esh.height = height;					esh.x = x;					esh.y = y;					esh.mouseEnabled = walkable;					game.addChild(esh);					break;				case "estradav":					var esv : estradav = new estradav();					esv.width = width;					esv.height = height;					esv.x = x;					esv.y = y;					esv.mouseEnabled = walkable;					game.addChild(esv);					break;				case "interseccao":					var inte : interseccao = new interseccao();					inte.width = width;					inte.height = height;					inte.x = x;					inte.y = y;					inte.mouseEnabled = walkable;					game.addChild(inte);					break;				case "erva":					var erv : erva = new erva();					erv.width = width;					erv.height = height;					erv.x = x;					erv.y = y;					erv.mouseEnabled = walkable;					game.addChild(erv);					break;				case "arvore1":					var arv : arvore1 = new arvore1();					arv.width = width;					arv.height = height;					arv.x = x;					arv.y = y;					arv.mouseEnabled = walkable;					game.addChild(arv);					break;				case "arvore2":					var arvo : arvore2 = new arvore2();					arvo.width = width;					arvo.height = height;					arvo.x = x;					arvo.y = y;					arvo.mouseEnabled = walkable;					game.addChild(arvo);					break;				case "arvore3":					var arvor : arvore3 = new arvore3();					arvor.width = width;					arvor.height = height;					arvor.x = x;					arvor.y = y;					arvor.mouseEnabled = walkable;					game.addChild(arvor);					break;				default:					trace("error");			}					}				public function createSoldier(x : int, y : int, width : int, height : int) {			trace("Soldier: " + x + " " + y + " " + width + " " + height);			var type = generateRandomInt(10, 0);			trace("soldier type " + type);			var soldier;						if (type < 5) {				soldier = new DefaultSoldier(game, this);			} else {				if (Math.pow(-1, soldiers.length) == -1) {					soldier = new Pro(game, this);				} else {					soldier = new Rambo(game, this);				}						}						soldier.x = x;			soldier.y = y;			soldier.width = width;			soldier.height = height;			this.game.addChild(soldier);						this.soldiers.push(soldier);		}				public function createZombie(x : int, y : int, width : int, height : int) {			var zombie;			var type = generateRandomInt(10, 0);			var auxX = generateRandomInt(70, 30);			var auxY = generateRandomInt(70, 30);						trace("zombie type: " + type);						if (type < 6) {				zombie = new Default(game, this);			} else {				if (Math.pow(-1, zombies.length) == -1) {					zombie = new Roger(game, this);				} else {					zombie = new Tank(game, this);				}			}						if(generateRandomInt(0, 10) <= 5) {				zombie.x = x + auxX;				zombie.constX = auxX;			} else {				zombie.x = x + auxX * -1;				zombie.constX = auxX * -1;			}			if(generateRandomInt(0, 10) <= 5) {				zombie.y = y + auxY;				zombie.constY = auxY;			} else {				zombie.y = y + auxY * -1;				zombie.constY = auxY * -1;			}						trace("Zombie: " + zombie.x + " " + zombie.y + " " + zombie.width + " " + zombie.height);			zombie.width = width;			zombie.height = height;			this.game.addChild(zombie);						this.zombies.push(zombie);		}				public function pressBuilding(evt : Event) {			trace(evt.target.info);			game.stage.frameRate = 0;			background = addBackgroundAlert(evt.target.x, evt.target.y);			info = addInfo(evt.target.x, evt.target.y, evt.target.info);						confirm = addConfirmBtn(evt.target.x, evt.target.y);			nPersons = evt.target.nPersons;			probSucess = evt.target.probSucess;			probEspecial = evt.target.probEspecial;			confirm.addEventListener(MouseEvent.CLICK, alertConfirm);						cancel = addCancelBtn(evt.target.x, evt.target.y);			cancel.addEventListener(MouseEvent.CLICK, alertCancel);		}				public function alertConfirm(evt : Event) {			trace(nPersons + " " + probSucess + " " + probEspecial);						cleanAlert();		}				public function alertCancel(evt : Event) {			cleanAlert()		}				public function cleanAlert() {			//confirm.removeListener(MouseEvent.CLICK, alertConfirm);			game.removeChild(background);			game.removeChild(info);			game.removeChild(confirm);			game.removeChild(cancel);			game.stage.frameRate = 60;		}		public function addBackgroundAlert (auxX, auxY) : Sprite {			var buttonSprite : Sprite = new Sprite();				buttonSprite.graphics.beginFill(0x291500);				buttonSprite.graphics.drawRect(auxX - 75, auxY - 75,150,150);				buttonSprite.graphics.endFill();				buttonSprite.buttonMode = false;				buttonSprite.alpha = 0.7;				game.addChild(buttonSprite);			return buttonSprite;		}				public function addInfo (auxX : int, auxY : int, info : String) : TextField {			var titleText : TextField = new TextField();			titleText.text = info;			titleText.textColor = 0xDBCDAB;// Cor			titleText.embedFonts = true;			titleText.antiAliasType = "advanced";			titleText.border = false;			titleText.wordWrap = true;			titleText.width = 360;						titleText.x = auxX - 60;			titleText.y = auxY - 50;			titleText.selectable = false;			var titleTextFormat : TextFormat = new TextFormat();			titleTextFormat.size = 10;			titleTextFormat.font = verdanaBoldFont.fontName;			titleTextFormat.bold = true;			titleTextFormat.align = "left";			titleText.setTextFormat(titleTextFormat);			game.addChild(titleText);			return titleText;		}				public function addConfirmBtn(auxX, auxY) : Sprite {			return addButtonSpecial(auxX - 65, auxY + 25, 50, 25, "Confirm");		}				public function addCancelBtn(auxX, auxY) : Sprite {			return addButtonSpecial(auxX + 15, auxY + 25, 50, 25, "Cancel");		}				public function addButtonSpecial(x:Number,y:Number, width:Number, height:Number, text:String):Sprite		{			var textbox : TextField = new TextField();			textbox.mouseEnabled = false;			textbox.text = text;			textbox.x = x;			textbox.y = y;			textbox.width = width;			textbox.height = height;			textbox.textColor = 0xFFFFFF;			textbox.embedFonts = true;			textbox.border = false;			textbox.wordWrap = true;			textbox.antiAliasType = "advanced";			var textboxFormat : TextFormat = new TextFormat();			textboxFormat.align = "center";			textboxFormat.font = verdanaBoldFont.fontName;			textboxFormat.bold = true;			textboxFormat.size = 10;			textbox.setTextFormat(textboxFormat);			var buttonSprite : Sprite = new Sprite();			buttonSprite.graphics.beginFill(0x291500);			buttonSprite.graphics.drawRect(x,y,width,height);			buttonSprite.graphics.endFill();			buttonSprite.buttonMode = true;			buttonSprite.alpha = 0.8;			buttonSprite.addChild(textbox);			game.addChild(buttonSprite);			return buttonSprite;		}				public function generateRandomInt(max : int, min : int) : int {			return min + (max - min) * Math.random();		}	}	}
=======
﻿﻿﻿package  {
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	
	public class Map extends MovieClip {
		var game : Main;
		var walkableMap : Vector.<Vector.<int>>;
		var objects : Vector.<SimpleButton>;
		var zombies : Vector.<Zombie>;
		var soldiers : Vector.<Soldier>;
		var scientist : Scientist;
		var imageLoader : Loader;
		var mapWidth;
		var mapHeight;
		
		public function Map(game : Main, imageLoader : Loader) {
			this.game = game;
			this.imageLoader = imageLoader;
			this.objects = new Vector.<SimpleButton>;
			this.zombies = new Vector.<Zombie>;
			this.soldiers = new Vector.<Soldier>;
		}

		public function generateMap(level : Level) {
			trace("generating map: " + level.id + " " + level.mapWidth + " " + level.mapHeight);
			
			trace((game.stage.stageWidth - level.mapWidth) * 0.5 + " " + (game.stage.stageHeight - level.mapHeight) * 0.5);
			
			game.x = (game.stage.stageWidth - level.mapWidth) * 0.5;
			game.y = (game.stage.stageHeight - level.mapHeight) * 0.5;
			
			walkableMap = new Vector.<Vector.<int>>(level.mapWidth);
			for (var i = 0; i < level.mapWidth; i++) {
				walkableMap[i] = new Vector.<int>(level.mapHeight);
			}
			
			for(i = 0; i < level.objects.length; i++) {
				setWalkable(level.objects[i]);
				drawInMap(level.objects[i]);
			}
			

		}

		public function setWalkable(object : MapObjects) {
			for(var i = 0; i < object.sizeX; i++) {
				walkableMap[object.posX + i][object.posY] = object.walkable;
			}
			
			for(i = 0; i < object.sizeY; i++) {
				walkableMap[object.posX][object.posY + i] = object.walkable;
			}
		}

		public function drawInMap(object : MapObjects) {
			createMapObject(object.imageSrc, object.posX, object.posY, object.sizeX, object.sizeY, object.walkable);
		}
		
		public function createMapObject(src : String, x : int, y : int, width : int, height : int, walkable : int) {
			trace("drawing: " + x + " " + y + " " + width + " " + height);
			
			switch (src) {
				case "edificio1":
					var ed1 : edificio1 = new edificio1();
					ed1.width = width;
					ed1.height = height;
					ed1.x = x;
					ed1.y = y;
					ed1.mouseEnabled = walkable;
					game.addChild(ed1);
					this.objects.push(ed1);
					break;
				case "edificio3":
					var ed3 : edificio3 = new edificio3();
					ed3.width = width;
					ed3.height = height;
					ed3.x = x;
					ed3.y = y;
					ed3.mouseEnabled = walkable;
					game.addChild(ed3);
					this.objects.push(ed3);
					break;
				case "labEdificio":
					var lab : labEdificio = new labEdificio();
					lab.width = width;
					lab.height = height;
					lab.x = x;
					lab.y = y;
					lab.mouseEnabled = walkable;
					game.addChild(lab);
					this.objects.push(lab);
					break;
				case "heloEdificio":
					var helo : heloEdificio = new heloEdificio();
					helo.width = width;
					helo.height = height;
					helo.x = x;
					helo.y = y;
					helo.mouseEnabled = walkable;
					game.addChild(helo);
					this.objects.push(helo);
					break;
				case "uniEdificio":
					var uni : uniEdificio = new uniEdificio();
					uni.width = width;
					uni.height = height;
					uni.x = x;
					uni.y = y;
					uni.mouseEnabled = walkable;
					game.addChild(uni);
					this.objects.push(uni);
					break;
				case "armazemEdificio":
					var arm : armazemEdificio = new armazemEdificio();
					arm.width = width;
					arm.height = height;
					arm.x = x;
					arm.y = y;
					arm.mouseEnabled = walkable;
					game.addChild(arm);
					this.objects.push(arm);
					break;
				case "apartEdificio":
					var apart : apartEdificio = new apartEdificio();
					apart.width = width;
					apart.height = height;
					apart.x = x;
					apart.y = y;
					apart.mouseEnabled = walkable;
					game.addChild(apart);
					this.objects.push(apart);
					break;
				case "militarEdificio":
					var militar : militarEdificio = new militarEdificio();
					militar.width = width;
					militar.height = height;
					militar.x = x;
					militar.y = y;
					militar.mouseEnabled = walkable;
					game.addChild(militar);
					this.objects.push(militar);
					break;
				case "estradah":
					var esh : estradah = new estradah();
					esh.width = width;
					esh.height = height;
					esh.x = x;
					esh.y = y;
					esh.mouseEnabled = walkable;
					game.addChild(esh);
					break;
				case "estradav":
					var esv : estradav = new estradav();
					esv.width = width;
					esv.height = height;
					esv.x = x;
					esv.y = y;
					esv.mouseEnabled = walkable;
					game.addChild(esv);
					break;
				case "interseccao":
					var inte : interseccao = new interseccao();
					inte.width = width;
					inte.height = height;
					inte.x = x;
					inte.y = y;
					inte.mouseEnabled = walkable;
					game.addChild(inte);
					break;
				case "erva":
					var erv : erva = new erva();
					erv.width = width;
					erv.height = height;
					erv.x = x;
					erv.y = y;
					erv.mouseEnabled = walkable;
					game.addChild(erv);
					break;
				case "arvore1":
					var arv : arvore1 = new arvore1();
					arv.width = width;
					arv.height = height;
					arv.x = x;
					arv.y = y;
					arv.mouseEnabled = walkable;
					game.addChild(arv);
					break;
				case "arvore2":
					var arvo : arvore2 = new arvore2();
					arvo.width = width;
					arvo.height = height;
					arvo.x = x;
					arvo.y = y;
					arvo.mouseEnabled = walkable;
					game.addChild(arvo);
					break;
				case "arvore3":
					var arvor : arvore3 = new arvore3();
					arvor.width = width;
					arvor.height = height;
					arvor.x = x;
					arvor.y = y;
					arvor.mouseEnabled = walkable;
					game.addChild(arvor);
					break;
				case "linhah":
					var lh : linhah = new linhah();
					lh.width = width;
					lh.height = height;
					lh.x = x;
					lh.y = y;
					lh.mouseEnabled = walkable;
					game.addChild(lh);
					this.objects.push(lh);
					break;
				default:
					trace("error");
			}
			
		}
		
		public function createSoldier(x : int, y : int, width : int, height : int) {
			trace("Soldier: " + x + " " + y + " " + width + " " + height);
			var type = generateRandomInt(10, 0);
			trace("soldier type " + type);
			var soldier;
			
			if (type < 5) {
				soldier = new DefaultSoldier(game, this);
			} else {
				if (Math.pow(-1, soldiers.length) == -1) {
					soldier = new Pro(game, this);
				} else {
					soldier = new Rambo(game, this);
				}			
			}
			
			soldier.x = x;
			soldier.y = y;
			soldier.width = width;
			soldier.height = height;
			this.game.addChild(soldier);
			
			this.soldiers.push(soldier);
		}
		
		public function createZombie(x : int, y : int, width : int, height : int) {
			var zombie;
			var type = generateRandomInt(10, 0);
			var auxX = generateRandomInt(70, 30);
			var auxY = generateRandomInt(70, 30);
			
			trace("zombie type: " + type);
			
			if (type < 6) {
				zombie = new Default(game, this);
			} else {
				if (Math.pow(-1, zombies.length) == -1) {
					zombie = new Roger(game, this);
				} else {
					zombie = new Tank(game, this);
				}
			}
			
			if(generateRandomInt(0, 10) <= 5) {
				zombie.x = x + auxX;
				zombie.constX = auxX;
			} else {
				zombie.x = x + auxX * -1;
				zombie.constX = auxX * -1;
			}
			if(generateRandomInt(0, 10) <= 5) {
				zombie.y = y + auxY;
				zombie.constY = auxY;
			} else {
				zombie.y = y + auxY * -1;
				zombie.constY = auxY * -1;
			}
			
			trace("Zombie: " + zombie.x + " " + zombie.y + " " + zombie.width + " " + zombie.height);
			zombie.width = width;
			zombie.height = height;
			this.game.addChild(zombie);
			
			this.zombies.push(zombie);
		}
		
		public function generateRandomInt(max : int, min : int) : int {
			return min + (max - min) * Math.random();
		}
	}
	
}
>>>>>>> 1ce0cfc732e35c110f1f5376791f7240e1d154c8
