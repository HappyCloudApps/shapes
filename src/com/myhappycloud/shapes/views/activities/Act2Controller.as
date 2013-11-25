package com.myhappycloud.shapes.views.activities
{
	import flash.geom.Point;
	import org.osflash.signals.Signal;
	import com.greensock.TweenLite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.display.MovieClip;

	import assets.shapes.ShapeChallenge2;
	import assets.shapes.Challenge2Screen;

	/**
	 * @author Eder
	 */
	public class Act2Controller
	{
		private static const NUM_SHAPES_POOL : uint = 10;
		private static const NUM_CORRECT_SHAPES : uint = 4;
		private static const SHAPES_DIVERSITY : uint = 2;
		private static const SHAPES_AVERAGE_SPEED : uint = 3;
		private static const SHUFFLE_TIME : Number = 1000;
		private var mc : Challenge2Screen;
		private var onScreenShapes : Array;
		private var correctShape : uint;
		private var shapeContainer : Sprite;
		private var correctClicks : Number;
		private var _gameOverSignal : Signal;

		public function Act2Controller(mc : Challenge2Screen)
		{
			this.mc = mc;
			mc.mitta_mc.sign_mc.stop();
			mc.mitta_mc.mouseEnabled = mc.mitta_mc.mouseChildren = false;
			shapeContainer = new Sprite();

			mc.addChild(shapeContainer);
			mc.addChild(mc.back_btn);
			mc.addChild(mc.help_btn);
			mc.addChild(mc.mitta_mc);

			onScreenShapes = [];
			correctClicks = 0;
			_gameOverSignal = new Signal();

			fillShapePool();
		}

		private function fillShapePool() : void
		{
			trace("Act1Controller.fillShapePool()");
			var shape : ShapeAct2;
			var randAngle : Number;
			for (var i : int = 0; i < NUM_SHAPES_POOL; i++)
			{
				shape = new ShapeAct2(new ShapeChallenge2());
				shape.addEventListener(MouseEvent.MOUSE_DOWN, onPressDown, false, 0, true);

				randAngle = Math.random() * 360;
				shape.velX = Math.cos(randAngle) * SHAPES_AVERAGE_SPEED;
				shape.velY = Math.sin(randAngle) * SHAPES_AVERAGE_SPEED;

				onScreenShapes.push(shape);
			}

			correctShape = Math.ceil(Math.random() * 10);
			trace('correctShape: ' + (correctShape));
			mc.mitta_mc.sign_mc.gotoAndStop(correctShape);

			for (i = 0; i < NUM_CORRECT_SHAPES; i++)
			{
				ShapeAct2(onScreenShapes[i]).id = correctShape;
			}

			var rand : uint;
			var wrongShapes : Array = [];
			for (i = 0; i < SHAPES_DIVERSITY; i++)
			{
				do
				{
					rand = Math.ceil(Math.random() * 10);
				}
				while (rand == correctShape || wrongShapes.indexOf(rand) != -1);
				wrongShapes.push(rand);
			}
			trace('wrongShapes: ' + (wrongShapes));

			for (i = NUM_CORRECT_SHAPES; i < NUM_SHAPES_POOL; i++)
			{
				rand = Math.floor(Math.random() * SHAPES_DIVERSITY);
				ShapeAct2(onScreenShapes[i]).id = wrongShapes[rand];
			}
		}

		private function onPressDown(e : MouseEvent) : void
		{
			var shape : ShapeAct2 = ShapeAct2(e.currentTarget);
			if (shape.id == correctShape)
			{
				killShape(shape);
			}
		}

		private function killShape(shape : ShapeAct2) : void
		{
			shape.removeEventListener(MouseEvent.CLICK, onPressDown);
			onScreenShapes.splice(onScreenShapes.indexOf(shape),1);
			shape.setOnKillPosition();
			shapeContainer.addChild(shape);
			var dist:Number = Point.distance(new Point(shape.x,shape.y), new Point(150,600));
			TweenLite.to(shape, .3, {scaleY:1.2,scaleX:1.2});
			TweenLite.to(shape, dist*.001, {delay:.3, scaleY:.5,scaleX:.5, x:150, y:600, onComplete:killedShape, onCompleteParams:[shape]});
		}
		private function killedShape(shape:ShapeAct2) : void
		{
			shapeContainer.removeChild(shape);
			correctClicks++;
			if(correctClicks==NUM_CORRECT_SHAPES)
			{
				gameOver();
			}
		}

		private function gameOver() : void
		{
			_gameOverSignal.dispatch();
		}

		public function startGame() : void
		{
			var shape : MovieClip;
			for (var i : int = NUM_SHAPES_POOL-1; i >= 0; i--)
			{
				shape = onScreenShapes[i];
				shapeContainer.addChild(shape);
				shape.x = i % 5 * 150;
				shape.y = Math.floor(i / 5) * 150;
			}
			
			for (i = 0; i < SHUFFLE_TIME; i++) 
			{
				update();
			}

			mc.addEventListener(Event.ENTER_FRAME, onTick);
		}

		private function onTick(e : Event) : void
		{
			update();
		}

		private function update() : void
		{
			var shape : ShapeAct2;
			for (var i : int = 0; i < onScreenShapes.length; i++)
			{
				shape = onScreenShapes[i];
				shape.x += shape.velX;
				shape.y += shape.velY;

				checkLimits(shape);
			}
		}

		private function checkLimits(shape : ShapeAct2) : void
		{
			if (shape.x < 0)
			{
				shape.velX *= -1;
				shape.x = 0;
			}
			else if (shape.x + shape.width > 1024)
			{
				shape.velX *= -1;
				shape.x = 1024 - shape.width;
			}

			if (shape.y < 120)
			{
				shape.velY *= -1;
				shape.y = 120;
			}
			else if (shape.y + shape.height > 768)
			{
				shape.velY *= -1;
				shape.y = 768 - shape.height;
			}
		}

		public function get gameOverSignal() : Signal
		{
			return _gameOverSignal;
		}
	}
}
