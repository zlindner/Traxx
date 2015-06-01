package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.utils.*;
	import flash.events.TimerEvent;
	import flash.ui.*;
	public class Tank2 extends Sprite {
		public var dTankRotation2:Number=0;
		public var dAcceleration:Number=0.4;
		public var dSpeedDecay:Number=0.96;
		public var dRotationStep:Number=2;
		public var dMaxSpeed:Number=0.9;
		public var dBackSpeed:Number=0.301;
		public var dSpeed:Number=0;
		public var bAccelerate,bBrake,bTurnLeft,bTurnRight:Boolean=false;
		
		public function Tank2(nPosx:int,nPosy:int):void {
			x=nPosx;
			y=nPosy;
			addEventListener(Event.ADDED_TO_STAGE,initialize);
		}
		public function initialize(e:Event):void {
			addEventListener(Event.ENTER_FRAME,on_enter_frame);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,on_key_down);
			stage.addEventListener(KeyboardEvent.KEY_UP,on_key_up);
		}
		public function on_enter_frame(e:Event):void {
			var dSpeed_x:Number=Math.sin(rotation*0.0174532925)*dSpeed;
			var dSpeed_y:Number=- Math.cos(rotation*0.0174532925)*dSpeed;
			var pntPointLeft:Point=new Point(-9,0);
			var pntPointRight:Point=new Point(9,0);
			var pntPointFront:Point=new Point(0,-13);
			var pntPointBack:Point=new Point(0,13);
			var par:Traxx=this.parent as Traxx;
			pntPointLeft=localToGlobal(pntPointLeft);
			pntPointRight=localToGlobal(pntPointRight);
			pntPointFront=localToGlobal(pntPointFront);
			pntPointBack=localToGlobal(pntPointBack);
			y+=dSpeed_y;
			x+=dSpeed_x;
			
			if (bAccelerate&&dSpeed<dMaxSpeed) {
				dSpeed+=dAcceleration;
			}
			if (bBrake&&dSpeed>-1) {
				dSpeed-=dBackSpeed;
			}
			if (bTurnLeft) {
				rotation -=  dRotationStep * (dSpeed / dMaxSpeed);
				dTankRotation2 -= dRotationStep * (dSpeed / dMaxSpeed);
			}
			if (bTurnRight) {
				rotation +=  dRotationStep * (dSpeed / dMaxSpeed);
				dTankRotation2 += dRotationStep * (dSpeed / dMaxSpeed);
			}
			if (dTankRotation2>=360) {
				dTankRotation2-=360;
			}
			if (dTankRotation2<=-360) {
				dTankRotation2+=360;
			}
			if (par.wall.hitTestPoint(pntPointLeft.x,pntPointLeft.y,true)||par.wall2.hitTestPoint(pntPointLeft.x,pntPointLeft.y,true)||par.wall3.hitTestPoint(pntPointLeft.x,pntPointLeft.y,true)||par.wall4.hitTestPoint(pntPointLeft.x,pntPointLeft.y,true)||par.wall5.hitTestPoint(pntPointLeft.x,pntPointLeft.y,true)||par.wall6.hitTestPoint(pntPointLeft.x,pntPointLeft.y,true)||par.wall7.hitTestPoint(pntPointLeft.x,pntPointLeft.y,true)||par.wall8.hitTestPoint(pntPointLeft.x,pntPointLeft.y,true)||par.wall9.hitTestPoint(pntPointLeft.x,pntPointLeft.y,true)||par.wall10.hitTestPoint(pntPointLeft.x,pntPointLeft.y,true)||par.wall11.hitTestPoint(pntPointLeft.x,pntPointLeft.y,true)||par.wall12.hitTestPoint(pntPointLeft.x,pntPointLeft.y,true)||par.wall13.hitTestPoint(pntPointLeft.x,pntPointLeft.y,true)||par.wall14.hitTestPoint(pntPointLeft.x,pntPointLeft.y,true)||par.wall15.hitTestPoint(pntPointLeft.x,pntPointLeft.y,true)||par.wall16.hitTestPoint(pntPointLeft.x,pntPointLeft.y,true)||par.wall17.hitTestPoint(pntPointLeft.x,pntPointLeft.y,true)) {
				dSpeed=(-1)
				;
			}
			if (par.wall.hitTestPoint(pntPointRight.x,pntPointRight.y,true)||par.wall2.hitTestPoint(pntPointRight.x,pntPointRight.y,true)||par.wall3.hitTestPoint(pntPointRight.x,pntPointRight.y,true)||par.wall4.hitTestPoint(pntPointRight.x,pntPointRight.y,true)||par.wall5.hitTestPoint(pntPointRight.x,pntPointRight.y,true)||par.wall6.hitTestPoint(pntPointRight.x,pntPointRight.y,true)||par.wall7.hitTestPoint(pntPointRight.x,pntPointRight.y,true)||par.wall8.hitTestPoint(pntPointRight.x,pntPointRight.y,true)||par.wall9.hitTestPoint(pntPointRight.x,pntPointRight.y,true)||par.wall10.hitTestPoint(pntPointRight.x,pntPointRight.y,true)||par.wall11.hitTestPoint(pntPointRight.x,pntPointRight.y,true)||par.wall12.hitTestPoint(pntPointRight.x,pntPointRight.y,true)||par.wall13.hitTestPoint(pntPointRight.x,pntPointRight.y,true)||par.wall14.hitTestPoint(pntPointRight.x,pntPointRight.y,true)||par.wall15.hitTestPoint(pntPointRight.x,pntPointRight.y,true)||par.wall16.hitTestPoint(pntPointRight.x,pntPointRight.y,true)||par.wall17.hitTestPoint(pntPointRight.x,pntPointRight.y,true)) {
				dSpeed=(-1)
				;
			}
			if (par.wall.hitTestPoint(pntPointFront.x,pntPointFront.y,true)||par.wall2.hitTestPoint(pntPointFront.x,pntPointFront.y,true)||par.wall3.hitTestPoint(pntPointFront.x,pntPointFront.y,true)||par.wall4.hitTestPoint(pntPointFront.x,pntPointFront.y,true)||par.wall5.hitTestPoint(pntPointFront.x,pntPointFront.y,true)||par.wall6.hitTestPoint(pntPointFront.x,pntPointFront.y,true)||par.wall7.hitTestPoint(pntPointFront.x,pntPointFront.y,true)||par.wall8.hitTestPoint(pntPointFront.x,pntPointFront.y,true)||par.wall9.hitTestPoint(pntPointFront.x,pntPointFront.y,true)||par.wall10.hitTestPoint(pntPointFront.x,pntPointFront.y,true)||par.wall11.hitTestPoint(pntPointFront.x,pntPointFront.y,true)||par.wall12.hitTestPoint(pntPointFront.x,pntPointFront.y,true)||par.wall13.hitTestPoint(pntPointFront.x,pntPointFront.y,true)||par.wall14.hitTestPoint(pntPointFront.x,pntPointFront.y,true)||par.wall15.hitTestPoint(pntPointFront.x,pntPointFront.y,true)||par.wall16.hitTestPoint(pntPointFront.x,pntPointFront.y,true)||par.wall17.hitTestPoint(pntPointFront.x,pntPointFront.y,true)) {
				dSpeed=(-1)
				;
			}
			if (par.wall.hitTestPoint(pntPointBack.x,pntPointBack.y,true)||par.wall2.hitTestPoint(pntPointBack.x,pntPointBack.y,true)||par.wall3.hitTestPoint(pntPointBack.x,pntPointBack.y,true)||par.wall4.hitTestPoint(pntPointBack.x,pntPointBack.y,true)||par.wall5.hitTestPoint(pntPointBack.x,pntPointBack.y,true)||par.wall6.hitTestPoint(pntPointBack.x,pntPointBack.y,true)||par.wall7.hitTestPoint(pntPointBack.x,pntPointBack.y,true)||par.wall8.hitTestPoint(pntPointBack.x,pntPointBack.y,true)||par.wall9.hitTestPoint(pntPointBack.x,pntPointBack.y,true)||par.wall10.hitTestPoint(pntPointBack.x,pntPointBack.y,true)||par.wall11.hitTestPoint(pntPointBack.x,pntPointBack.y,true)||par.wall12.hitTestPoint(pntPointBack.x,pntPointBack.y,true)||par.wall13.hitTestPoint(pntPointBack.x,pntPointBack.y,true)||par.wall14.hitTestPoint(pntPointBack.x,pntPointBack.y,true)||par.wall15.hitTestPoint(pntPointBack.x,pntPointBack.y,true)||par.wall16.hitTestPoint(pntPointBack.x,pntPointBack.y,true)||par.wall17.hitTestPoint(pntPointBack.x,pntPointBack.y,true)) {
				dSpeed=+1;
			}
			if (Math.abs(dSpeed)>0.3) {
				dSpeed*=dSpeedDecay;
			} else {
				dSpeed=0;
			}
		}
		public function on_key_down(e:KeyboardEvent):void {
			if (e.keyCode==87) {
				bAccelerate=true;
			}
			if (e.keyCode==83) {
				bBrake=true;
			}
			if (e.keyCode==65) {
				bTurnLeft=true;
			}
			if (e.keyCode==68) {
				bTurnRight=true;
			}
		}
		public function on_key_up(e:KeyboardEvent):void {
			if (e.keyCode==87) {
				bAccelerate=false;
			}
			if (e.keyCode==83) {
				bBrake=false;
			}
			if (e.keyCode==65) {
				bTurnLeft=false;
			}
			if (e.keyCode==68) {
				bTurnRight=false;
			}
		}
	}
}