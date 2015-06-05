package ;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Hit extends FlxSprite
{

	private var _pos:FlxPoint;
	private var _player:FlxSprite;
	private var _rnd:FlxRandom;
	
	public function new(P:Player) 
	{
		super(0, 0);
		loadGraphic(AssetPaths.hit__png, true, 9, 9);
		animation.add("hit", [0, 1, 2], 12,false);
		_pos = FlxPoint.get();
		_player = P;
		_rnd = new FlxRandom();
	}
	
	public function hit():Void
	{
		_pos.x = Std.int(_rnd.float( -4, _player.width - 4));
		_pos.y = Std.int(_rnd.float( -4, _player.height - 4));
		reset(_player.x + _pos.x, _player.y + _pos.y);
		animation.play("hit");
	}
	
	override public function draw():Void 
	{
	
		
		x = _player.x + _pos.x;
		y = _player.y + _pos.y;
		super.draw();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (alive)
		{			
			if (animation.finished)
			{
				kill();
			}
			
		}
		
	}
	
}