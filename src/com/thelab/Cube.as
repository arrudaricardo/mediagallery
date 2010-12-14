package com.thelab
{
	import com.greensock.TweenMax;
	import com.theflashblog.fp10.SimpleZSorter;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Cube extends Sprite
	{
		private var _front:Side;
		private var _back:Side;
		private var _left:Side;
		private var _right:Side;
		
		private var _cubeHolder:Sprite;
		private var _mainHolder:Sprite;
		
		public function Cube()
		{
			super();
			if(this.stage)
			{
				init();
			}
			else
			{
				this.addEventListener(Event.ADDED_TO_STAGE,init);
			}
		}
		
		private function init(e:Event=null):void
		{
			
			
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			_cubeHolder = new Sprite();
			_mainHolder = new Sprite();
			
			_mainHolder.x = this.stage.stageWidth/2;
			_mainHolder.y = this.stage.stageHeight/2;
			
			_mainHolder.addChild(_cubeHolder);
			
			_front = new Side();
			_back = new Side();
			_left = new Side();
			_right = new Side();
			
			_cubeHolder.addChild(_front);
			_cubeHolder.addChild(_back);
			_cubeHolder.addChild(_left);
			_cubeHolder.addChild(_right);
			
			_back.z = 616;
			_front.z = -616;
			_right.x = 616;
			_right.rotationY = 90;
			_left.x = -616;
			_left.rotationY = -90;
			
			SimpleZSorter.sortClips(_cubeHolder);
			_mainHolder.addChild(_cubeHolder);
		
			addChild(_mainHolder);
			_mainHolder.rotationX=0;
			
			this.addEventListener(Event.ENTER_FRAME,onEnterFrame);

			this.stage.addEventListener(MouseEvent.MOUSE_DOWN,dragCube);
			
		}
		private function onEnterFrame(e:Event):void
		{
		//	this.rotate();
		}
		
		private function rotate():void
		{
			if(_mainHolder.rotationY<360)
			{
				_mainHolder.rotationY+=1;
			}
			SimpleZSorter.sortClips(_cubeHolder);
		}
		/*
		private function advance(e:MouseEvent):void
		{
			if(_mainHolder.rotationY<360)
			{
				_mainHolder.rotationY+=5;
				trace('_mainHolder.rotationY == '+_mainHolder.rotationY);
				//com.greensock.TweenMax.to(_mainHolder,2,{rotationY:40});
			}
			SimpleZSorter.sortClips(_cubeHolder);
		}
		*/
		public function rotateCube(value:Number):void
		{
			_mainHolder.rotationY = value;
			SimpleZSorter.sortClips(_cubeHolder);
		}
		
		private var _mouseDown:Boolean;
		private function dragCube(e:MouseEvent):void
		{
			_mouseDown = true;
			this.addEventListener(MouseEvent.MOUSE_MOVE,handleDragCube);
			this.addEventListener(MouseEvent.MOUSE_UP,stopDragCube);
			
			e.stopPropagation();
			
			trace(mouseX);
		}
		
		private function stopDragCube(e:Event):void
		{
			_mouseDown = false;
			removeEventListener(MouseEvent.MOUSE_MOVE,handleDragCube);
			removeEventListener(MouseEvent.MOUSE_UP,stopDragCube);
			
		}
		
		private function handleDragCube(e:MouseEvent):void
		{
			trace(e.currentTarget.mouseX%360);
			this.rotateCube(e.currentTarget.mouseX%360);
		}
	}
}