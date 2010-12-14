package com.thelab
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.ImageLoader;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import org.osmf.media.LoadableMediaElement;
	
	public class Tile extends Sprite
	{
		private static const HEIGHT:Number = 258;
		private static const NORMAL_WIDTH:Number = 298;
		private static const DOUBLE_WIDTH:Number = 598;
		private var _width:Number;
		private var _msg:String
		
		public function Tile(msg:String,double:Boolean=false)
		{
			super();
			
			_msg = msg;
			_width = NORMAL_WIDTH;
			
			if(double)
			{
				_width = DOUBLE_WIDTH;
			}
			
			var t:TextField = new TextField();
			t.text = msg;
			t.autoSize = 'left';
			t.selectable = false;
			addChild(t);
			
			init();
			
			this.addEventListener(MouseEvent.CLICK,handleClick);
		}
		
		private function init():void
		{
			draw();
			load();
			
		}
		private function load():void
		{
			var loader:ImageLoader = new ImageLoader('../assets/'+_msg);
			loader.addEventListener(LoaderEvent.COMPLETE,handleLoaded);
			loader.load();
		}
		private function handleLoaded(e:LoaderEvent):void
		{
			var bg:Shape = new Shape();
			bg.graphics.beginFill(0xcccccc,1);
			bg.graphics.drawRect(0,0,_width,HEIGHT);
			bg.graphics.endFill();
			this.addChildAt(bg,0);
			this.addChild(e.currentTarget.content);
		}
		private function draw():void
		{
			
			this.graphics.beginFill(Math.random()*0xffffff,1);
			this.graphics.drawRect(0,0,_width,HEIGHT);
			this.graphics.endFill();
		}
		
		private function handleClick(e:MouseEvent):void
		{
			trace(e.currentTarget._msg);
		}
	}
}