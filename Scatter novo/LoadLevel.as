<<<<<<< HEAD
﻿package  {	import flash.events.Event;	import flash.events.IEventDispatcher;	import flash.net.URLLoader;	import flash.net.URLRequest;	import flash.display.MovieClip;	import flash.text.TextField;			public class LoadLevel extends MovieClip{		var levelId : int;		var levelObjects : Vector.<MapObjects>;		var urlRequest : URLRequest;		var urlLoader : URLLoader;		var levelInfo : Object;		var largura:int = 720;		var altura:int = 480;				var level : Level;		public function LoadLevel(levelId : int) {			this.levelId = levelId;			trace("loadlevel");		}		public function loadLevelFromFile() {						var fileSrc = "levels/" + this.levelId + ".txt";			urlRequest  = new URLRequest(fileSrc);			urlLoader = new URLLoader();			urlLoader.addEventListener(Event.COMPLETE, loadComplete);					try{				urlLoader.load(urlRequest);			} catch (error:Error) {				trace("Cannot load : " + error.message);			}		}				public function loadComplete(evt : Event) {			var loader:URLLoader = URLLoader(evt.target);			trace("completeHandler: " + loader.data);					levelInfo = JSON.parse(loader.data);			trace("parse: " + levelInfo.objects);			levelObjects = new Vector.<MapObjects>(levelInfo.nObjects);						for(var i = 0; i < levelInfo.objects.length; i++) {				trace(levelInfo.objects[i].walkable + " " + levelInfo.objects[i].src + " " + levelInfo.objects[i].x + " " + levelInfo.objects[i].y + " " + levelInfo.objects[i].width + " " + levelInfo.objects[i].height + " " + levelInfo.objects[i].info);				levelObjects[i] = new MapObjects(levelInfo.objects[i].walkable, levelInfo.objects[i].src, levelInfo.objects[i].x, levelInfo.objects[i].y, levelInfo.objects[i].width, levelInfo.objects[i].height, levelInfo.objects[i].info, levelInfo.objects[i].nPersons, levelInfo.objects[i].probSucess, levelInfo.objects[i].probEspecial);			}						trace(levelInfo.id + " " + levelInfo.mapWidth + " " + levelInfo.mapHeight);						this.level = new Level(levelInfo.id, levelInfo.mapWidth, levelInfo.mapHeight,  levelObjects);			dispatchEvent(new Event("loadComplete"));		}		public function setLevel(level : int) {			this.levelId = level;		}				public function getLevel() {			return this.level;		}			}	}
=======
﻿package  {
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	
	public class LoadLevel extends MovieClip{
		var levelId : int;
		var levelObjects : Vector.<MapObjects>;
		var urlRequest : URLRequest;
		var urlLoader : URLLoader;
		var levelInfo : Object;
		var largura:int = 720;
		var altura:int = 480;
		
		var level : Level;

		public function LoadLevel(levelId : int) {
			this.levelId = levelId;
			trace("loadlevel");
		}

		public function loadLevelFromFile() {
			
			var fileSrc = "levels/" + this.levelId + ".txt";
			urlRequest  = new URLRequest(fileSrc);

			urlLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, loadComplete);
		
			try{
				urlLoader.load(urlRequest);
			} catch (error:Error) {
				trace("Cannot load : " + error.message);
			}
		}
		
		public function loadComplete(evt : Event) {
			var loader:URLLoader = URLLoader(evt.target);
			trace("completeHandler: " + loader.data);
		
			levelInfo = JSON.parse(loader.data);
			trace("parse: " + levelInfo.objects);
			levelObjects = new Vector.<MapObjects>(levelInfo.nObjects);
			
			for(var i = 0; i < levelInfo.objects.length; i++) {
				trace(levelInfo.objects[i].walkable + " " + levelInfo.objects[i].src + " " + levelInfo.objects[i].x + " " + levelInfo.objects[i].y + " " + levelInfo.objects[i].width + " " + levelInfo.objects[i].height + " " + levelInfo.objects[i].info);
				levelObjects[i] = new MapObjects(levelInfo.objects[i].walkable, levelInfo.objects[i].src, levelInfo.objects[i].x, levelInfo.objects[i].y, levelInfo.objects[i].width, levelInfo.objects[i].height, levelInfo.objects[i].info);
			}
			
			trace(levelInfo.id + " " + levelInfo.mapWidth + " " + levelInfo.mapHeight);
			
			this.level = new Level(levelInfo.id, levelInfo.mapWidth, levelInfo.mapHeight,  levelObjects);
			dispatchEvent(new Event("loadComplete"));
		}

		public function setLevel(level : int) {
			this.levelId = level;
		}
		
		public function getLevel() {
			return this.level;
		}
		
	}
	
}
>>>>>>> 1ce0cfc732e35c110f1f5376791f7240e1d154c8
