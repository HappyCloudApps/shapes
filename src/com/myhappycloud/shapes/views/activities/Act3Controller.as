package com.myhappycloud.shapes.views.activities
{
	import org.osflash.signals.Signal;
	import flash.geom.Point;
	import assets.shapes.Challenge3Screen;
	import flash.display.MovieClip;
	/**
	 * @author Eder
	 */
	public class Act3Controller
	{
		private static const DIST_TOLERANCE : Number = 50;
		private var shapeContainer : MovieClip;
		private var holders : MovieClip;
		private var bg : MovieClip;
		private var shapes : Array = [];
		private var shapeHolders : Array = [];
		private var numPieces : int = 0;
		private var _gameOverSignal : Signal;

		public function Act3Controller(mc:Challenge3Screen, shapeContainer : MovieClip, holders : MovieClip, bg : MovieClip)
		{
			this.bg = bg;
			this.holders = holders;
			this.shapeContainer = shapeContainer;
			
			_gameOverSignal= new Signal();
			
			setShapes();
			shapeContainer.visible = true;
			holders.visible = true;
			
			mc.addChild(holders);
			mc.addChild(shapeContainer);
		}

		private function setShapes() : void
		{
			var shape:MovieClip;
			var id:uint;
			var slot:uint;
			for (var i : int = 0; i < shapeContainer.numChildren; i++) 
			{
				if(shapeContainer.getChildAt(i) is MovieClip)
				{
					shape = MovieClip(shapeContainer.getChildAt(i));
					id = shape.name.split("_")[1];
					slot = shape.name.split("_")[2];
					
					var shapeAct3 :ShapeAct3 =new ShapeAct3(shape, id, slot);
					shapeAct3.dropSignal.add(dropedShape);
					shapes.push(shapeAct3);
					
					numPieces++;
				}
			}
			
			for (i = 0; i < holders.numChildren; i++) 
			{
				if(holders.getChildAt(i) is MovieClip)
				{
					shape = MovieClip(holders.getChildAt(i));
					id = shape.name.split("_")[1];
					slot = shape.name.split("_")[2];
					
					var shapeHolder : ShapeHolderAct3 = new ShapeHolderAct3(shape, id, slot);
					shapeHolders.push(shapeHolder);
				}
			}
		}

		private function dropedShape(shape:ShapeAct3) : void
		{
			var p1:Point = shape.getPosition();
			var p2:Point;
			var auxShape:ShapeHolderAct3;
			var dist:Number;
			for (var i : int = 0; i < shapeHolders.length; i++) 
			{
				auxShape = shapeHolders[i];
				if(auxShape.slot==shape.slot)
				{
					trace("Act3Controller.dropedShape(shape)");
					//if they fit in
					p2 = auxShape.getPosition();
					dist = Point.distance(p1, p2);
					trace('dist: ' + (dist));
					if(dist<DIST_TOLERANCE)
					{
						shape.lockOn(p2);
						numPieces--;
						if(numPieces==0)
							gameOver();
						return;
					}
				}
			}
			
			shape.returnToPosition();
		}

		private function gameOver() : void
		{
			trace("Act3Controller.gameOver()");
			_gameOverSignal.dispatch();
		}

		public function get gameOverSignal() : Signal
		{
			return _gameOverSignal;
		}
	}
}
