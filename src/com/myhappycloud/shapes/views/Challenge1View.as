package com.myhappycloud.shapes.views
{
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import com.myhappycloud.shapes.views.activities.ShapeAct1;

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
		private var SHAPE_POOL : uint = 10;
		private var mc : Challenge1Screen;
		private var distance : int;
		private var speed : int = 20;
		private var movement : Number;
		private var rootArray : Array;
		private var onScreenShapes : Array = [];
		private var currentShape : MovieClip;
		private var correctShapeId : uint;
		private var NUM_CORRECT_SHAPES : int = 10;
		private var NUM_WRONG_SHAPES : int = 10;
		private var shapesIDs : Array = [];
		private var currentShapeId : int = 0;
		private var basketWidth : Number = 110;
		// private var basketWidth:Number = 120-230;
		private var shapesRemoved : Number = 0;
		private var basketContainer : Sprite;

		public function Challenge1View()
		{
			mc = new Challenge1Screen();
			addChild(mc);
			basketContainer = Sprite(mc.kamy_mc.getChildByName("container"));
			onClick(mc.back_btn, goBack);
			
			mc.kamy_mc.cacheAsBitmap = true;
			mc.globe.cacheAsBitmap = true;
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
			assignShapesIDs();
			generateShapes();
			appearShapes();
			mc.addEventListener(Event.ENTER_FRAME, update);
		}

		private function assignShapesIDs() : void
		{
			// save the correct shapeId
			correctShapeId = Math.ceil(Math.random() * 10);
			MovieClip(mc.globe.getChildByName("shape_mc")).gotoAndStop(correctShapeId);

			for (var i : int = 0; i < NUM_CORRECT_SHAPES; i++)
			{
				// populate array with correct ids
				shapesIDs.push(correctShapeId);
			}

			var wrongId : uint;
			for (var j : int = 0; j < NUM_WRONG_SHAPES; j++)
			{
				do
				{
					// calculate a random number until its different from correctId
					wrongId = Math.ceil(Math.random() * 10);
				}
				while (wrongId == correctShapeId);
				// populate array with wrong ids
				shapesIDs.push(wrongId);
			}
			// shuffle array
			shapesIDs = ArrUtils.randomizeArray(shapesIDs);

			trace("Challenge1View.assignShapes()");
			trace(shapesIDs);
		}

		private function generateShapes() : void
		{
			trace("Challenge1View.generateShapes()");
			// make the necessary number of shapes
			rootArray = [];
			for (var i : int = 0; i < SHAPE_POOL; i++)
			{
				rootArray.push(new ShapeChallenge1());
			}
		}

		private function appearShapes() : void
		{
			// get a shape movieclip
			currentShape = rootArray.pop();
			// sets the shape from the randomized array
			currentShape.gotoAndStop(shapesIDs[currentShapeId]);
			trace('shapesIDs: ' + (shapesIDs[currentShapeId]));

			// creates aux class for shape
			var shape : ShapeAct1 = new ShapeAct1(currentShape, currentShapeId);
			shape.removeSignal.addOnce(removeShape);
			shape.checkBasketSignal.addOnce(checkBasket);
			onScreenShapes.push(shape);

			mc.addChild(shape.mc);

			currentShapeId++;
			if (currentShapeId < shapesIDs.length)
			{
				setTimeout(appearShapes, 2000);
			}
			else
			{
				// all done, no more shapes appearing
				return;
			}
		}

		private function checkBasket(shape:ShapeAct1) : void
		{
			var startX:Number = mc.kamy_mc.x+120;
			var endX:Number = startX+basketWidth;
			if(shape.mc.x>startX&&shape.mc.x<endX)
			{
				//shape going in
				var shapeIndex : int = onScreenShapes.indexOf(shape);
				onScreenShapes.splice(shapeIndex, 1);
				basketContainer.addChild(shape.mc);
				shape.mc.x-=mc.kamy_mc.x;
				shape.mc.y-=mc.kamy_mc.y;
				shape.animateIn();
			}
			else
			{
				//shape going out
				
			}
		}

		private function update(e : Event) : void
		{
			// globe following kammy
			var globeX : Number = mc.globe.x + mc.globe.width;
			var globeMove : Number = mc.kamy_mc.x - globeX;
			mc.globe.x += globeMove / 7;

			// moves falling shapes
			var shape : ShapeAct1;
			for (var i : int = onScreenShapes.length - 1; i >= 0; i--)
			{
				shape = onScreenShapes[i];
				shape.moveDown(4);
			}
		}

		private function removeShape(shape : ShapeAct1) : void
		{
			var shapeIndex : int = onScreenShapes.indexOf(shape);
			if(shapeIndex>-1)
				onScreenShapes.splice(shapeIndex, 1);
			shape.mc.parent.removeChild(shape.mc);
			rootArray.push(shape.mc);
			shape.destroy();

			shapesRemoved++;
			trace('shapesRemoved: ' + (shapesRemoved));
			if (shapesRemoved == shapesIDs.length)
				gameOver();
		}

		private function gameOver() : void
		{
			dispatchEvent(new ViewEvent(ViewEvent.SET_CONGRATS_SCREEN));
		}

		private function startMoving(e : MouseEvent) : void
		{
			addEventListener(Event.ENTER_FRAME, move);
		}

		private function move(e : Event) : void
		{
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
