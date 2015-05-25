﻿package {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Bullet1 extends MovieClip {
		var game : Main;
		var map : Map;
		var speed: int;
		var xVel: int;
		var yVel: int;
		var range : int;
		var auxX : int;
		var auxY : int;
		var rotationInRadians: int = 0;
		
		
		public function Bullet1(game : Main, map : Map, x: int, y: int, rotationInDegrees:Number) {
			this.game = game;
			this.map = map;
			this.x = x;
			this.y = y;
			this.width = 20;
			this.height = 10;
			this.auxX = x;
			this.auxY = y;
			this.range = 20;
			this.speed = 5;
			this.rotation = rotationInDegrees;
			this.rotationInRadians = rotationInDegrees * Math.PI / 180;
			//game.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		public function loop():void //we don't need to include the "e:Event" because we aren't using an EventListener
    	{
			trace("loop bullet");
        	for(var b=0; b<this.map.zombies.length; ++b)
        	{	
            	if(map.zombies[b].hitTestObject(this)){
               		trace("bullet hit baddie " + b);
					map.zombies[b].health = map.zombies[b].health - 1;
               		game.removeChild(this);
					
					
					if(map.zombies[b].isDead()) {
						game.removeChild(map.zombies[b]);
					}
					return;
               	}
        	}
			trace("ola");
       		xVel = Math.cos((Math.atan2(-10, 0) / Math.PI * 180)/180*Math.PI) * speed; //uses the cosine to get the xVel from the speed and rotation
        	yVel = Math.sin((Math.atan2(-10, 0) / Math.PI * 180)/180*Math.PI) * speed; //uses the sine to get the yVel
			trace("adeus");
        	this.x += xVel; //updates the position
        	this.y += yVel;
			trace("vaitomanocu");
        	//if the bullet goes off the edge of the screen...
        	if(this.x > auxX + range || this.x < auxX - range || this.y > auxY + range || this.y < auxY - range) {
				game.removeChild(this);
			}
			
			trace("fds crl piça cona merda");
    	}
		
	}
	
}