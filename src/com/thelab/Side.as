package com.thelab
{
	import flash.display.Sprite;
	
	import org.osflash.signals.natives.INativeDispatcher;

	public class Side extends Sprite
	{
		private static const ROWS:Number = 3;
		private static const COLS:Number = 4;
		private static const PADDING:Number = 10;
		private static const OFFSET_X:int = -616;
		private static const WIDTH:int = 1232;
		
		private var _tiles:Array;
		
		public function Side()
		{
			init();
		}
		private function init():void
		{
			draw();
			addTiles();
			doLayout();
		}
		
		private function doLayout():void
		{
			/*
			var inc:int = 0;
			for(var i:int=0;i<_tiles.length;i++)
			{
				if(i==0)
				{
					_tiles[i].x = OFFSET_X;
					_tiles[i].y = 0;
					continue;
				}
				else
				{
					_tiles[i].x = 
				}
				
			}
			*/
			
			
			
			for (var i:int = 0; i<_tiles.length; i++) {
				
				_tiles[i].x = OFFSET_X + ((_tiles[i].width+PADDING) * (i % COLS));
				_tiles[i].y = (_tiles[i].height+PADDING) * int(i / COLS)+PADDING;
				//trace('i == '+i+', (i % COLS) == '+(i % COLS)+' COLS = '+COLS);
				
				trace(i+' % '+COLS+ ' == '+i%COLS);
			}
			
			
		
		}
		
		private function addTiles():void
		{
			_tiles=[];
			
			var num:int = 12;
			for(var i:int=0;i<num;i++)
			{
				_tiles.push(new Tile('kia'+i+'.png',false));
			}
			for(var j:int=0;j<_tiles.length;j++)
			{
				this.addChild(_tiles[j]);
			}
			
		}
	
		
		private function draw():void
		{
			this.graphics.beginFill(Math.random()*0xff0000,0);
			this.graphics.drawRect(OFFSET_X,0,WIDTH,ROWS*(258+PADDING));
			this.graphics.endFill();
		}
	}
}