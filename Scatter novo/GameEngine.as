package  {
	
	public class GameEngine {
		var game : Main; //pequeno
		var map : Map; //grande
		var level : Level;
		var scientist : Scientist;

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
