package com.myhappycloud.shapes.views.utils
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	/**
	 * @author Eder
	 */
	public class SliderMC extends Sprite
	{
		private var mc : MovieClip;
		private var btnSlider : MovieClip;
		private var sliderWidth : Number;

		public function SliderMC(mc : MovieClip)
		{
			this.mc = mc;
			
			var widthMc : MovieClip = MovieClip(mc.getChildByName("road_mc"));
			sliderWidth = widthMc.width;
			widthMc.visible = false;
			btnSlider = MovieClip(mc.getChildByName("btn_slider"));
			
			btnSlider.addEventListener(MouseEvent.MOUSE_DOWN, onDown, false, 0, true);
		}

		private function onDown(e : MouseEvent) : void
		{
			btnSlider.startDrag(false,new Rectangle(0,0,sliderWidth, 0));
			btnSlider.stage.addEventListener(MouseEvent.MOUSE_UP, onUp, false, 0, true);
		}

		private function onUp(e : MouseEvent) : void
		{
			btnSlider.stopDrag();
		}
	}
}
