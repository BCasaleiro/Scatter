﻿package  {		public class GameEngine {		var game : Main; //pequeno		var map : Map; //grande		var level : Level;		public function GameEngine(game : Main) {			this.game = game;		}		public function start() {			game.clean();			this.map.generateMap(level);			this.game.addChild(this.map);			createPlayer(787, 450, 40, 30);								}				public function createPlayer(x : int, y : int, width : int, height : int) {			trace("Player: " + x + " " + y + " " + width + " " + height);						map.scientist = new Scientist(game, map);			map.scientist.x = x;			map.scientist.y = y;			map.scientist.width = width;			map.scientist.height = height;			this.game.addChild(map.scientist);		}				public function stop() {					}				public function setMap(map : Map) {			this.map = map;		}				public function setLevel(level : Level) {			this.level = level;		}				public function setMain (game : Main) {			this.game = game;		}				public function generateRandomInt(max : int, min : int) : int {			return min + (max - min) * Math.random();		}	}	}