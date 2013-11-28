package com.myhappycloud.shapes.views
{
	import com.myhappycloud.shapes.views.utils.SliderMC;
	import com.myhappycloud.shapes.events.ModelEvent;
	import flash.display.MovieClip;
	import assets.shapes.AdjustmentsScreen;

	import com.myhappycloud.shapes.events.ViewEvent;
	import com.myhappycloud.utils.Screen;

	import flash.events.MouseEvent;

	/**
	 * @author Eder
	 */
	public class AdjustmentsView extends Screen
	{
		private var mc : AdjustmentsScreen;
		private var currentLang : String;
		private var volumeAmbient : Number;
		private var volumeFx : Number;
		private var sliderFx : SliderMC;
		private var sliderMusic : SliderMC;

		public function init() : void
		{
			mc = new AdjustmentsScreen();
			addChild(mc);

			onClick(mc.back_btn, goBack);
		}

		private function clickedEsp(e : MouseEvent) : void
		{
			trace("AdjustmentsView.clickedEsp(e)");
			currentLang = "es";
			updateLang();
			dispatchEvent(new ModelEvent(ModelEvent.LANGUAGE_CHANGE, {language:"es"}));
		}

		private function clickedEng(e : MouseEvent) : void
		{
			trace("AdjustmentsView.clickedEng(e)");
			currentLang = "en";
			updateLang();
			dispatchEvent(new ModelEvent(ModelEvent.LANGUAGE_CHANGE, {language:"en"}));
		}

		private function goBack(e : MouseEvent) : void
		{
			trace("AdjustmentsView.goBack(e)");
			dispatchEvent(new ViewEvent(ViewEvent.RETURN_TO_LAST_SCREEN));
		}

		public function setAudio(volumeAmbient : Number, volumeFx : Number) : void
		{
			this.volumeFx = volumeFx;
			this.volumeAmbient = volumeAmbient;

			sliderFx = new SliderMC(mc.slider_fx);
			sliderMusic = new SliderMC(mc.slider_music);
		}

		public function setLanguage(lang : String) : void
		{
			currentLang = lang;
			updateLang();
			onClick(mc.btn_en, clickedEng);
			onClick(mc.btn_es, clickedEsp);
		}

		private function updateLang() : void
		{
			mc.btn_es.gotoAndStop(2);
			mc.btn_en.gotoAndStop(2);
			MovieClip(mc.getChildByName("btn_"+currentLang)).gotoAndStop(1);
		}
	}
}
