package  {
	import flash.events.Event;
	
	public class Soldier extends Person{

		var shootingRange : int;
		var shootingRate : int;
		var auxRate: int = 0;
		var destX: int;
		var destY: int;
		var bulletList: Array = []
	

		public function Soldier(game : Main, map : Map) {
			this.game = game;
			this.map = map;
			this.shootingRate = 40;
			this.health = 1;
			game.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		public function loop (evt:Event) {
			trace("isdead: " + this.isDead());
			 if(!this.isDead()) {
				 auxRate++;
				 if (auxRate == shootingRate){
					shootBullet();
					auxRate = 0;
				 }
			 }
			 
			 if(bulletList.length > 0){
            	for(var i:int = bulletList.length-1; i >= 0; i--){
                	bulletList[i].loop();
            	}
        	}
		 }
		 
		 public function rotatePlayer() : void {
			var radians:Number = Math.atan2(destY - this.y, destX - this.x);
            var degrees:Number = radians / (Math.PI / 180) - 90;

            this.rotation = degrees;
        }
		 
		 public function shootBullet(){
			 var bullet: Bullet1 = new Bullet1(game,map,this.x + (this.width/2),this.y,this.rotation +90);
			 game.addEventListener(Event.REMOVED_FROM_STAGE,bulletRemove);
			 bulletList.push(bullet);
			 game.addChild(bullet);
		 }
		 
		 public function bulletRemove(evt:Event){
			 evt.currentTarget.removeEventListener(Event.REMOVED_FROM_STAGE,bulletRemove);
			 bulletList.splice(bulletList.indexOf(evt.currentTarget),1);
			 
		 }
		

	}
	
}
