package
{
	import com.bit101.components.Label;
	import com.bit101.components.Slider;
	import com.thelab.Cube;
	import com.thelab.Side;
	
	import flash.display.*;
	import flash.events.Event;
	import flash.text.TextField;
	
	import net.hires.debug.Stats;
	
	[SWF(width="1000", height="475", frameRate="45", backgroundColor="#ffffff")]
	public class Main extends Sprite
	{
		
		//doubles: 598x258
		//singles: 299x258
		private var _cube:Cube;
		
		
		private var _fovTxt:TextField;
		private var _focalTxt:TextField;
		private var _zTxt:TextField;
		private var _rotateTxt:TextField;
		
		public function Main()
		{
			//root.transform.perspectiveProjection.fieldOfView = 120;
			root.transform.perspectiveProjection.fieldOfView = 60;
			trace('focalLength == ' +root.transform.perspectiveProjection.focalLength)
			root.transform.perspectiveProjection.focalLength = 500
			
			this.addChild(new Stats());
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			_cube = new Cube();
			addChild(_cube);
			_cube.y = -400;
			_cube.z = 1300;
			
			
			var fovLabel:Label = new Label(this,0,80,'fov');
			var fovSlider:Slider = new Slider('horizontal',this,0,100,fovHandler);
			_fovTxt = new TextField();
			addChild(_fovTxt);
			_fovTxt.text  =String(root.transform.perspectiveProjection.fieldOfView);
			
			
			_fovTxt.y = fovSlider.y+fovSlider.height+5;
			var focLabel:Label = new Label(this,0,180,'foc');
			var focalSlider:Slider = new Slider('horizontal',this,0,200,focalHandler);
			_focalTxt = new TextField();
			addChild(_focalTxt);
			_focalTxt.text = String(root.transform.perspectiveProjection.focalLength);
			
			_focalTxt.y = focalSlider.y+focalSlider.height+5;
			
			var zLabel:Label = new Label(this,0,280,'z');
			var zSlider:Slider =new Slider('horizontal',this,0,300,zHandler);
			_zTxt = new TextField();
			addChild(_zTxt);
			_zTxt.text = String(_cube.z);
			_zTxt.y = zSlider.y+zSlider.height+5;
			
			
			var rotateLabel:Label = new Label(this,0,380,'rotate');
			var rotationSlider:Slider = new Slider('horizontal',this,0,400,rotationHandler);
			_rotateTxt = new TextField();
			addChild(_rotateTxt);
			_rotateTxt.y = rotationSlider.y+rotationSlider.height+5;
			
		}
		
		private function rotationHandler(e:Event):void
		{
			var result:Number= (360*(e.currentTarget.value*.01));
			trace('rot = '+result);
			_cube.rotateCube(result);
			
			_rotateTxt.text = String(result)
		}
		
		private function fovHandler(e:Event):void
		{
			trace('fov slider '+e.currentTarget.value);
			//0/180
			//[ 45 / 180 ] x 100 = 0.25 x 100 = 25%
			
			
			//180*.5 = 90
			
			trace('value = '+(180*(e.currentTarget.value*.01)));
			
			var result:Number= (180*(e.currentTarget.value*.01));
			
			if(result<180 && result>0)
			{
				root.transform.perspectiveProjection.fieldOfView =result;
				_fovTxt.text = String(result);
			}
			
		}
		private function focalHandler(e:Event):void
		{
			trace('focal slider '+e.currentTarget.value);
			if(e.currentTarget.value *100>0)
			{
				root.transform.perspectiveProjection.focalLength = e.currentTarget.value *100;
				_focalTxt.text = String(e.currentTarget.value *100);
			}
		}
		private function zHandler(e:Event):void
		{
			trace('z slider '+e.currentTarget.value);
			_cube.z = e.currentTarget.value*100;
			_zTxt.text = String(_cube.z);
		}
	}
}