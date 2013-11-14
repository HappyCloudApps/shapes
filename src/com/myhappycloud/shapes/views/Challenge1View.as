package com.myhappycloud.shapes.views
{
	import com.greensock.easing.Linear;
	import com.greensock.TweenLite;
	import com.myhappycloud.shapes.events.ViewEvent;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import shapes.Reto1;
	import flash.display.Sprite;
	/**
	 * @author Eder
	 */
	public class Challenge1View extends Sprite
	{
		private var mc : Reto1;
		private var distance : int;
		private var speed : int = 10;
		private var movement:Number;
		private var globex:int;
		private var rootArray:Array;
		private var onScreenShapes:Array=[];
		private var currentShape: MovieClip;
		private var correctNumber:Number;
		private var finalNumber:Number;
		private var ammountShapes: int = 10;
		private var framesArray:Array = [];
		private var incorrectNumber:Number;
		private var finalNumberIncorrect:Number;
		private var j: int = 0;
		public function init() : void
		{
			trace("Challenge1View.init()");
			mc = new Reto1();
			addChild(mc);
			mc.back_btn.addEventListener(MouseEvent.CLICK, goBack);
			mc.addEventListener(MouseEvent.MOUSE_DOWN, kamyMove);
			mc.addEventListener(MouseEvent.MOUSE_UP, stopMoving);
			assignShapes();
			generateShapes();
			appearShapes();
			mc.addEventListener(Event.ENTER_FRAME, globalEvent);
		}
		
		private function goBack(e:MouseEvent):void 
		{
			dispatchEvent(new ViewEvent(ViewEvent.RETURN_TO_LAST_SCREEN));
		}
		
		function randomizeArray(array:Array):Array{
			var newArray:Array = new Array();
			while(array.length > 0){
				newArray.push(array.splice(Math.floor(Math.random()*array.length), 1));
			}
			return newArray;
		}
		
		private function assignShapes():void 
		{
			correctNumber = Math.random() * 10;
			finalNumber = Math.ceil(correctNumber);
			for (var i:int = 0; i < ammountShapes; i++) 
			{
				framesArray.push(finalNumber);
			}
			
			for (var j:int = 0; j < ammountShapes; j++) 
			{
				do
				{
					incorrectNumber = Math.random() * 10
					finalNumberIncorrect = Math.ceil(incorrectNumber);
				}while (finalNumberIncorrect == finalNumber);
				framesArray.push(finalNumberIncorrect);
			}
			framesArray = randomizeArray(framesArray);
			
			trace("Correct Shapes: " + framesArray);
		}
		
		private function generateShapes():void 
		{
			rootArray = [];
			for (var i:int = 0; i < ammountShapes; i++) 
			{
				rootArray.push(new shapesReto1());		
			}
			trace("Shapes Array: " + rootArray);
		}
		
		private function appearShapes():void 
		{
			currentShape = rootArray.pop();
			currentShape.gotoAndStop(framesArray[j]);
			onScreenShapes.push(currentShape);
			trace("Shapes Screen: " + onScreenShapes);
			mc.addChild(currentShape);
			currentShape.y = 0;
			if (j<19) 
			{
				j++;
				setTimeout(appearShapes, 2000);
			}
			else
			{
				return;
			}
		}
		
		private function globalEvent(e:Event):void 
		{
			globex = mc.globe.x + mc.globe.width;
			var globeMove : Number = mc.kamy_mc.x - globex;
			mc.globe.x += globeMove / 10;
			for (var i:int = onScreenShapes.length-1; i >=0 ; i--) 
			{
				onScreenShapes[i].y += 4;
				removeShapes(i);
			}
			
		}
		
		private function removeShapes(i:int):void 
		{
			if (onScreenShapes[i].y > 766) 
			{
				mc.removeChild(onScreenShapes[i]);
				var outShape: MovieClip = onScreenShapes[i];
				onScreenShapes.splice(i,1);
				rootArray.push(outShape);
				trace("Removed: " + onScreenShapes.length + "Added: " + rootArray.length);
				if (currentShape.y>766) 
				{
					dispatchEvent(new ViewEvent(ViewEvent.SET_CONGRATS_SCREEN));
					trace("GAME OVER");
				}
			}
		}
		
		private function kamyMove(e:MouseEvent):void 
		{
			addEventListener(Event.ENTER_FRAME, move);
		}
		
		private function move(e:Event):void 
		{
			trace("Clicked");
			distance = mouseX - 174;
			movement =  distance - mc.kamy_mc.x;
			if (movement>speed) 
			{
				mc.kamy_mc.x += speed;
			}
			else if (movement<-speed) 
			{
				mc.kamy_mc.x -= speed;
			}
			else 
			{
				mc.kamy_mc.x = distance;
			}
		}
		
		private function stopMoving(e:MouseEvent):void 
		{
			removeEventListener(Event.ENTER_FRAME, move);
		}
	}
}
