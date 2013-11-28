package com.myhappycloud.shapes.views
{
	import assets.shapes.Challenge1Screen;
	import assets.shapes.ShapeChallenge1;

	import com.myhappycloud.shapes.events.ViewEvent;
	import com.myhappycloud.shapes.views.utils.ArrUtils;
	import com.myhappycloud.utils.Screen;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;

	/**
	 * @author Eder
	 */
	public class Challenge1View extends Screen
	{
		private var mc : Challenge1Screen;
		private var distance : int;
		private var speed : int = 10;
		private var movement : Number;
		private var globex : int;
		private var rootArray : Array;
		private var onScreenShapes : Array = [];
		private var currentShape : MovieClip;
		private var correctNumber : Number;
		private var finalNumber : Number;
		private var ammountShapes : int = 10;
		private var framesArray : Array = [];
		private var incorrectNumber : Number;
		private var finalNumberIncorrect : Number;
		private var currentShapeId : int = 0;

		public function Challenge1View()
		{
			mc = new Challenge1Screen();
			addChild(mc);

			onClick(mc.back_btn, goBack);
		}

		private function goBack(e : MouseEvent) : void
		{
			dispatchEvent(new ViewEvent(ViewEvent.RETURN_TO_LAST_SCREEN));
		}

		public function init() : void
		{
			trace("Challenge1View.init()");

			stage.addEventListener(MouseEvent.MOUSE_DOWN, startMoving);
			stage.addEventListener(MouseEvent.MOUSE_UP, stopMoving);
			assignShapes();
			generateShapes();
			appearShapes();
			mc.addEventListener(Event.ENTER_FRAME, update);
		}

		private function assignShapes() : void
		{
			correctNumber = Math.random() * 10;
			finalNumber = Math.ceil(correctNumber);
			for (var i : int = 0; i < ammountShapes; i++)
			{
				framesArray.push(finalNumber);
			}

			for (var j : int = 0; j < ammountShapes; j++)
			{
				do
				{
					incorrectNumber = Math.random() * 10;
					finalNumberIncorrect = Math.ceil(incorrectNumber);
				}
				while (finalNumberIncorrect == finalNumber);
				framesArray.push(finalNumberIncorrect);
			}
			framesArray = ArrUtils.randomizeArray(framesArray);

			trace("Correct Shapes: " + framesArray);
		}

		private function generateShapes() : void
		{
			rootArray = [];
			for (var i : int = 0; i < ammountShapes; i++)
			{
				rootArray.push(new ShapeChallenge1());
			}
			trace("Shapes Array: " + rootArray);
		}

		private function appearShapes() : void
		{
			currentShape = rootArray.pop();
			currentShape.gotoAndStop(framesArray[currentShapeId]);
			onScreenShapes.push(currentShape);
			trace("Shapes Screen: " + onScreenShapes);
			mc.addChild(currentShape);
			currentShape.y = 0;
			currentShape.x = Math.random()*700+250;
			if (currentShapeId < 19)
			{
				currentShapeId++;
				setTimeout(appearShapes, 2000);
			}
			else
			{
				return;
			}
		}

		private function update(e : Event) : void
		{
			globex = mc.globe.x + mc.globe.width;
			var globeMove : Number = mc.kamy_mc.x - globex;
			mc.globe.x += globeMove / 7;
			var shape:MovieClip;
			for (var i : int = onScreenShapes.length - 1; i >= 0; i--)
			{
				shape = onScreenShapes[i];
				shape.y += 4;
				removeShapes(i);
			}
		}

		private function removeShapes(i : int) : void
		{
			var shape:MovieClip = onScreenShapes[i];			
			if (shape.y > 766)
			{
				mc.removeChild(onScreenShapes[i]);
				var outShape : MovieClip = onScreenShapes[i];
				onScreenShapes.splice(i, 1);
				rootArray.push(outShape);
				trace("Removed: " + onScreenShapes.length + "Added: " + rootArray.length);
				if (currentShape.y > 766)
				{
					dispatchEvent(new ViewEvent(ViewEvent.SET_CONGRATS_SCREEN));
					trace("GAME OVER");
				}
			}
		}

		private function startMoving(e : MouseEvent) : void
		{
			addEventListener(Event.ENTER_FRAME, move);
		}

		private function move(e : Event) : void
		{
			trace("Clicked");
			distance = mouseX - 174;
			movement = distance - mc.kamy_mc.x;
			if (movement > speed)
			{
				mc.kamy_mc.x += speed;
			}
			else if (movement < -speed)
			{
				mc.kamy_mc.x -= speed;
			}
			else
			{
				mc.kamy_mc.x = distance;
			}
		}

		private function stopMoving(e : MouseEvent) : void
		{
			removeEventListener(Event.ENTER_FRAME, move);
		}

	}
}
