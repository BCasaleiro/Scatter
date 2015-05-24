﻿package  {		import flash.display.MovieClip;	import flash.ui.Keyboard;	import flash.events.KeyboardEvent;	import flash.events.Event;	import flash.display.FrameLabel;	import flash.events.MouseEvent;	import flash.ui.Mouse;	import flash.geom.Point;		public class Scientist extends Person {				var nZombies : int;		var inerCircle : int = 8;		var incZombies : int = 0.5;		var nCircles : int = 1;		var destX : Number = 0;		var destY : Number = 0;				public function Scientist(game : Main, map : Map) {			this.game = game;			this.map = map;			this.speed = 2;			this.mouseEnabled = false;						map.stage.addEventListener(MouseEvent.CLICK, mouseHandler);			map.stage.addEventListener(Event.ENTER_FRAME, frameHandler);		}				private function mouseHandler(event:MouseEvent) : void {			trace("define dest: " + parent.mouseX + " " + parent.mouseY);		 			destX = parent.mouseX;			destY = parent.mouseY;						rotatePlayer();		}		private function frameHandler(event:Event):void {			trace("destx: " + destX + " desty: " + destY);			trace("x: " + x + " y: " + y);					if(destX != Math.round(this.x) && destX != 0 && destY != Math.round(this.y) && destX != 0  && hittest()) {				this.x = this.x+Math.cos((Math.atan2(destY - y, destX - x) / Math.PI * 180)/180*Math.PI)*speed;				this.y = this.y+Math.sin((Math.atan2(destY - y,destX - x) / Math.PI * 180)/180*Math.PI)*speed;				game.x = game.x-Math.cos((Math.atan2(destY - y, destX - x) / Math.PI * 180)/180*Math.PI)*speed;				game.y = game.y-Math.sin((Math.atan2(destY - y,destX - x) / Math.PI * 180)/180*Math.PI)*speed;				for(var i = 0; i < map.zombies.length; i++) {					map.zombies[i].updatePosition(destX, destY);										if(map.zombies[i].hitSoldier(destX, destY)) {						map.createZombie(this.x, this.y, 35, 25);					}								}			}		}        private function rotatePlayer() : void {			var radians:Number = Math.atan2(destY - this.y, destX - this.x);            var degrees:Number = radians / (Math.PI / 180) - 90;            this.rotation = degrees;        }				private function hittest() {			var aux : MovieClip = new MovieClip();			aux.graphics.drawCircle(this.x+(4*Math.cos((Math.atan2(destY - y, destX - x) / Math.PI * 180)/180*Math.PI)*speed) , this.y + (4*Math.sin((Math.atan2(destY - y,destX - x) / Math.PI * 180)/180*Math.PI)*speed), this.width/4);			game.addChild(aux);						for (var i = 0; i < map.objects.length; i++) {				if (!aux.hitTestObject(map.objects[i])){					return true;				}			}		}			}	}