package {
	import flash.display.*;
	import flash.events.*;
	import flash.events.TimerEvent;
	import flash.ui.*;
	import flash.utils.*;
	import flash.geom.*;
	import fl.controls.*;
	import flash.media.*;
	import flash.text.*;
	import fl.managers.*;
	public class Traxx extends Sprite {
		//spawn coordinates for tank1
		public var dTankX:Number=stage.stageWidth-150;
		public var dTankY:Number=100;
		//spawn coordinates for tank2
		public var dTank2X:Number=150;
		public var dTank2Y:Number=stage.stageHeight-175;
		//speed for bullet moving
		public var dSpeed_x:Number;
		public var dSpeed_y:Number;
		public var dSpeed_x2:Number;
		public var dSpeed_y2:Number;
		//speed of bullets
		public var dSpeed:Number=1.25;
		public var dSpeed2:Number=1.25;
		//tanks
		public var tank:Tank1;
		public var tank2:Tank2;
		//rotation of tanks in a number
		public var dTankRotation:Number;
		public var dTankRotaion2:Number;
		//ALL of the layers of the ground/ boundaries
		public var wall:leftBorder = new leftBorder();
		public var wall2:blObstacle = new blObstacle();
		public var wall3:trObstacle = new trObstacle();
		public var wall4:rightBorder = new rightBorder();
		public var wall5:centerBlock = new centerBlock();
		public var wall6:tlObstacle = new tlObstacle();
		public var wall7:ctObstacle = new ctObstacle();
		public var wall8:cbObstacle = new cbObstacle();
		public var wall9:cbObstacle2 = new cbObstacle2();
		public var wall10:ctObstacle2 = new ctObstacle2();
		public var wall11:brObstacle = new brObstacle();
		public var wall12:tlObstacle2 = new tlObstacle2();
		public var wall13:brObstacle2 = new brObstacle2();
		public var wall14:topBorder = new topBorder();
		public var wall15:trObstacle2 = new trObstacle2();
		public var wall16:bottomBorder = new bottomBorder();
		public var wall17:blObstacle2 = new blObstacle2();
		//bullets
		public var bullet = new Bullet();
		public var bullet2 = new Bullet2();
		//key codes for space bar and control
		public var nFire:int;
		public var nFire2:int;
		//timers for bullets moving
		public var tmrShoot:Timer=new Timer(0);
		public var tmrShoot2:Timer=new Timer(0);
		//bullet arrays
		public var arBullet:Array=new Array();
		public var arBullet2:Array = new Array();
		//count integer for arrays
		public var nCount:int;
		public var nCount2:int;
		//the time it takes to reload the bullet
		public var nReloadTime:int;
		public var nReloadTime2:int;
		//outline of the health bar
		public var healthbarOutline:HealthBarOutline = new HealthBarOutline();
		public var healthbarOutline2:HealthBarOutline2 = new HealthBarOutline2();
		//fill for the health bar
		public var healthbar:HealthBarFill = new HealthBarFill();
		public var healthbar2:HealthBarFill2 = new HealthBarFill2();
		//array for walls
		public var arWall:Array=new Array  ;
		public var nI:int;
		public var r;
		//sound of tank firing
		public var audio1:shotmp3 = new shotmp3();
		public var transform1:SoundTransform=new SoundTransform();
		//floor pattern
		public var Floor:floor=new floor  ;
		//buttons
		public var btnStartButton:Button = new Button();
		public var StartButton:startbutton = new startbutton();
		public var ControlsButton:controlsbutton = new controlsbutton();
		public var btnControlsButton:Button = new Button();
		public var BackButton:backbutton = new backbutton();
		public var btnBackButton:Button = new Button();
		//Traxx logo
		public var TraxxLogo:traxxtitle = new traxxtitle();
		//timer for health check
		public var tmrHealthCheck:Timer=new Timer(1);
		//background
		public var TitleBG:titlebg = new titlebg();
		//controls text
		public var ControlsText:controlstext = new controlstext();
		//text for refreshing
		public var txtRefresh:txtrefresh = new txtrefresh();
		public var txtRefresh2:txtrefresh2 = new txtrefresh2();
		//tank ammo
		public var nAmmo:int=0;
		public var nAmmo2:int=0;
		public var tmrAmmo:Timer=new Timer(0);
		//damage
		public var dDamage:Number=22.8;
		public var dDamage2:Number=22.8;
		public function Traxx():void {
			tank=new Tank1(dTankX,dTankY);
			tank2=new Tank2(dTank2X,dTank2Y);
			arWall.push(wall);
			arWall.push(wall2);
			arWall.push(wall3);
			arWall.push(wall4);
			arWall.push(wall5);
			arWall.push(wall6);
			arWall.push(wall7);
			arWall.push(wall8);
			arWall.push(wall9);
			arWall.push(wall10);
			arWall.push(wall11);
			arWall.push(wall12);
			arWall.push(wall13);
			arWall.push(wall14);
			arWall.push(wall15);
			arWall.push(wall16);
			arWall.push(wall17);
			
			for (nI = 0; nI < (arWall.length); nI++) {
				addChild(arWall[nI]);
				removeChild(arWall[nI]);
			}
			addChild(TitleBG);
			addChild(bullet);
			addChild(bullet2);
			removeChild(bullet);
			removeChild(bullet2);
			addChild(btnStartButton);
			addChild(StartButton);
			addChild(btnControlsButton);
			addChild(ControlsButton);
			addChild(TraxxLogo);
			tmrHealthCheck.start();
			tank.rotation=180;
			tank.x=10000;
			tank.y=10000;
			tank2.x=10000;
			tank2.y=10000;
			transform1.volume=0;
			flash.media.SoundMixer.soundTransform=transform1;
			//health bar outline for right tank
			healthbarOutline.x=stage.stageWidth-350;
			healthbarOutline.y=stage.stageHeight-25;
			healthbarOutline.height=250;
			healthbarOutline.width=375;
			//health bar outline for left tank
			healthbarOutline2.x=25;
			healthbarOutline2.y=stage.stageHeight-25;
			healthbarOutline2.height=250;
			healthbarOutline2.width=375;
			//health bar colour for right tank
			healthbar.x=stage.stageWidth-275;
			healthbar.y=stage.stageHeight-32.5;
			healthbar.height=19;
			healthbar.width=114;
			//health bar colour for left tank
			healthbar2.x=100;
			healthbar2.y=stage.stageHeight-32.5;
			healthbar2.height=19;
			healthbar2.width=114;
			//position of start button
			btnStartButton.x=stage.stageWidth/2;
			btnStartButton.y=stage.stageHeight/2;
			StartButton.x=stage.stageWidth/2;
			StartButton.y=stage.stageHeight/2;
			//position of controls button
			btnControlsButton.x=stage.stageWidth/2;
			btnControlsButton.y=stage.stageHeight/2+120;
			ControlsButton.x=stage.stageWidth/2;
			ControlsButton.y=stage.stageHeight/2+75;
			//position of back button
			btnBackButton.x=40;
			btnBackButton.y=stage.stageHeight-110;
			btnBackButton.width=143;
			btnBackButton.height=75;
			btnBackButton.alpha=0;
			//event listeners
			tmrShoot.addEventListener(TimerEvent.TIMER, bang);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, fire);
			tmrShoot2.addEventListener(TimerEvent.TIMER, bang2);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, fire2);
			btnStartButton.addEventListener(MouseEvent.CLICK, startgame);
			StartButton.addEventListener(MouseEvent.CLICK, startgame);
			ControlsButton.addEventListener(MouseEvent.CLICK, controls);
			btnControlsButton.addEventListener(MouseEvent.CLICK, controls);
			BackButton.addEventListener(MouseEvent.CLICK, back);
			btnBackButton.addEventListener(MouseEvent.CLICK, back);
			tmrHealthCheck.addEventListener(TimerEvent.TIMER, health);
		}
		public function startgame(e:MouseEvent):void {
			addChild(Floor);
			for (nI = 0; nI < (arWall.length); nI++) {
				addChild(arWall[nI]);
			}
			addChild(tank);
			tank.x=dTankX;
			tank.y=dTankY;
			addChild(tank2);
			tank2.x=dTank2X;
			tank2.y=dTank2Y;
			tank.alpha=100;
			tank2.alpha=100;
			tank.rotation=180;
			tank2.rotation=0;
			transform1.volume=1;
			flash.media.SoundMixer.soundTransform=transform1;
			addChild(healthbarOutline);
			addChild(healthbarOutline2);
			addChild(healthbar);
			addChild(healthbar2);
			healthbar.width=114;
			healthbar2.width=114;
			removeChild(TraxxLogo);
			removeChild(StartButton);
			removeChild(btnStartButton);
			removeChild(ControlsButton);
			removeChild(btnControlsButton);
			removeChild(TitleBG);
			tmrHealthCheck.start();
		}
		public function controls(e:MouseEvent):void {
			removeChild(StartButton);
			removeChild(btnStartButton);
			removeChild(ControlsButton);
			removeChild(btnControlsButton);
			addChild(btnBackButton);
			addChild(BackButton);
			addChild(ControlsText);
		}
		public function back(e:MouseEvent):void {
			addChild(btnStartButton);
			addChild(StartButton);
			addChild(btnControlsButton);
			addChild(ControlsButton);
			removeChild(btnBackButton);
			removeChild(BackButton);
			removeChild(ControlsText);
		}
		public function fire(event:KeyboardEvent):void {
			nFire=event.keyCode;
			if (nFire==17&&nReloadTime<=0) {
				tmrShoot.start();
				bullet=new Bullet  ;
				bullet.x=tank.x;
				bullet.y=tank.y;
				arBullet.push(bullet);
				nReloadTime=400;
				dTankRotation=tank.rotation;
				audio1.play();
			}
		}
		public function bang(event:TimerEvent) {
			addChild(bullet);
			nReloadTime-=1;
			for (nCount = 0; nCount < (arBullet.length); nCount++) {
				for (nI = 0; nI < (arWall.length); nI++) {
					if (arWall[nI].hitTestObject(arBullet[nCount])) {
						arBullet[nCount].x=0;
						arBullet[nCount].y=10;
						arBullet[nCount].splice();
						arBullet.removeChild(nCount);
						//arBullet[nCount].alpha=0;
						try {
						} finally {
						}
					}
				}
			}
			for (nCount = 0; nCount < (arBullet.length); nCount++) {
				try {
					if (arBullet[nCount].hitTestObject(tank2)) {
						addChild(arBullet[nCount]);
						removeChild(arBullet[nCount]);
						arBullet[nCount].x=0;
						arBullet[nCount].y=10;
						arBullet[nCount].alpha=0;
						healthbar2.width-=dDamage;
					} else {
						bullet.rotation=dTankRotation;
						arBullet[nCount].rotation=dTankRotation;
						var dSpeed_x:Number=Math.sin(bullet.rotation*0.0174532925)*dSpeed;
						var dSpeed_y:Number=- Math.cos(bullet.rotation*0.0174532925)*dSpeed;
						arBullet[nCount].x+=dSpeed_x;
						arBullet[nCount].y+=dSpeed_y;
					}
				} finally {
				}
			}
		}
		public function fire2(event:KeyboardEvent):void {
			nFire2=event.keyCode;
			if (nFire2==32&&nReloadTime2<=0) {
				tmrShoot2.start();
				bullet2=new Bullet2  ;
				bullet2.x=tank2.x;
				bullet2.y=tank2.y;
				arBullet2.push(bullet2);
				nReloadTime2=400;
				dTankRotaion2=tank2.rotation;
				audio1.play();
			}
		}
		public function bang2(event:TimerEvent):void {
			addChild(bullet2);
			nReloadTime2-=1;
			for (nCount2 = 0; nCount2 < (arBullet2.length); nCount2++) {
				for (nI = 0; nI < (arWall.length); nI++) {
					if (arWall[nI].hitTestObject(arBullet2[nCount2])) {
						arBullet2[nCount2].x=0;
						arBullet2[nCount2].y=10;
						arBullet2[nCount2].alpha=0;
						try {
						} finally {
						}
					}
				}
			}
			for (nCount2 = 0; nCount2 < (arBullet2.length); nCount2++) {
				try {
					if (arBullet2[nCount2].hitTestObject(tank)) {
						addChild(arBullet2[nCount2]);
						removeChild(arBullet2[nCount2]);
						arBullet2[nCount2].x=0;
						arBullet2[nCount2].y=10;
						arBullet2[nCount2].alpha=0;
						healthbar.width-=dDamage2;
					} else {
						bullet2.rotation=dTankRotaion2;
						arBullet2[nCount2].rotation=dTankRotaion2;
						var dSpeed_x2:Number=Math.sin(bullet2.rotation*0.0174532925)*dSpeed2;
						var dSpeed_y2:Number=- Math.cos(bullet2.rotation*0.0174532925)*dSpeed2;
						arBullet2[nCount2].x+=dSpeed_x2;
						arBullet2[nCount2].y+=dSpeed_y2;
					}
				} finally {
				}
			}
		}
		public function health(event:TimerEvent):void {
			if (healthbar.width<22) {
				tank.alpha=0;
				tank2.alpha=0;
				flash.media.SoundMixer.soundTransform=transform1;
				transform1.volume=0;
				tmrHealthCheck.stop();
				stage.removeChild(tank);
				stage.removeChild(tank2);
				tank.rotation=0;
				tank2.rotation=0;
				for (nI = 0; nI < (arWall.length); nI++) {
					addChild(arWall[nI]);
					removeChild(arWall[nI]);
				}
				removeChild(Floor);
				addChild(TitleBG);
				addChild(txtRefresh);
			} else if (healthbar2.width<22) {
				tank.alpha=0;
				tank2.alpha=0;
				flash.media.SoundMixer.soundTransform=transform1;
				transform1.volume=0;
				tmrHealthCheck.stop();
				stage.removeChild(tank);
				stage.removeChild(tank2);
				tank.rotation=0;
				tank2.rotation=0;
				for (nI = 0; nI < (arWall.length); nI++) {
					addChild(arWall[nI]);
					removeChild(arWall[nI]);
				}
				removeChild(Floor);
				addChild(TitleBG);
				addChild(txtRefresh2);
			}
		}
	}
}