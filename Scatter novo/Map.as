﻿package  {		import flash.display.Loader;	import flash.display.MovieClip;	import flash.display.SimpleButton;	import flash.display.Sprite;		public class Map extends MovieClip {		var game : Main;		var walkableMap : Vector.<Vector.<int>>;		var objects : Vector.<SimpleButton>;		var zombies : Vector.<Zombie>;		var soldiers : Vector.<Soldier>;		var imageLoader : Loader;		var mapWidth;		var mapHeight;				public function Map(game : Main, imageLoader : Loader) {			this.game = game;			this.imageLoader = imageLoader;			this.objects = new Vector.<SimpleButton>;			this.zombies = new Vector.<Zombie>;			this.soldiers = new Vector.<Soldier>;		}		public function generateMap(level : Level) {			trace("generating map: " + level.id + " " + level.mapWidth + " " + level.mapHeight);						trace((game.stage.stageWidth - level.mapWidth) * 0.5 + " " + (game.stage.stageHeight - level.mapHeight) * 0.5);						game.x = (game.stage.stageWidth - level.mapWidth) * 0.5;			game.y = (game.stage.stageHeight - level.mapHeight) * 0.5;						walkableMap = new Vector.<Vector.<int>>(level.mapWidth);			for (var i = 0; i < level.mapWidth; i++) {				walkableMap[i] = new Vector.<int>(level.mapHeight);			}						for(i = 0; i < level.objects.length; i++) {				setWalkable(level.objects[i]);				drawInMap(level.objects[i]);			}		}		public function setWalkable(object : MapObjects) {			for(var i = 0; i < object.sizeX; i++) {				walkableMap[object.posX + i][object.posY] = object.walkable;			}						for(i = 0; i < object.sizeY; i++) {				walkableMap[object.posX][object.posY + i] = object.walkable;			}		}		public function drawInMap(object : MapObjects) {			createMapObject(object.imageSrc, object.posX, object.posY, object.sizeX, object.sizeY, object.walkable);		}				public function createMapObject(src : String, x : int, y : int, width : int, height : int, walkable : int) {			trace("drawing: " + x + " " + y + " " + width + " " + height);						switch (src) {				case "edificio1":					var ed1 : edificio1 = new edificio1();					ed1.width = width;					ed1.height = height;					ed1.x = x;					ed1.y = y;					ed1.mouseEnabled = walkable;					game.addChild(ed1);					this.objects.push(ed1);					break;				case "edificio3":					var ed3 : edificio3 = new edificio3();					ed3.width = width;					ed3.height = height;					ed3.x = x;					ed3.y = y;					ed3.mouseEnabled = walkable;					game.addChild(ed3);					this.objects.push(ed3);					break;				case "estradah":					var esh : estradah = new estradah();					esh.width = width;					esh.height = height;					esh.x = x;					esh.y = y;					esh.mouseEnabled = walkable;					game.addChild(esh);					break;				case "estradav":					var esv : estradav = new estradav();					esv.width = width;					esv.height = height;					esv.x = x;					esv.y = y;					esv.mouseEnabled = walkable;					game.addChild(esv);					break;								default:					trace("error");			}					}				public function createSoldier(x : int, y : int, width : int, height : int) {			trace("Soldier: " + x + " " + y + " " + width + " " + height);						var soldier = new DefaultSoldier(game, this);			soldier.x = x;			soldier.y = y;			soldier.width = width;			soldier.height = height;			this.game.addChild(soldier);						this.soldiers.push(soldier);		}				public function createZombie(x : int, y : int, width : int, height : int) {			var zombie = new Default(game, this);			var auxX = generateRandomInt(20, 50);			var auxY = generateRandomInt(20, 50);			if(generateRandomInt(0, 10) <= 5) {				zombie.x = x + auxX;				zombie.constX = auxX;			} else {				zombie.x = x + auxX * -1;				zombie.constX = auxX * -1;			}			if(generateRandomInt(0, 10) <= 5) {				zombie.y = y + auxY;				zombie.constY = auxY;			} else {				zombie.y = y + auxY * -1;				zombie.constY = auxY * -1;			}						trace("Zombie: " + zombie.x + " " + zombie.y + " " + zombie.width + " " + zombie.height);			zombie.width = width;			zombie.height = height;			this.game.addChild(zombie);						this.zombies.push(zombie);		}				public function generateRandomInt(max : int, min : int) : int {			return min + (max - min) * Math.random();		}	}	}