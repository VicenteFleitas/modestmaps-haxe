package com.modestmaps.core.painter;

import com.modestmaps.core.Tile;

class TileQueue
{
// Tiles we want to load:
private var queue:Array<Dynamic>;

public function new()
{
	queue = [];
}

public var length(getLength, null):Float;
 	private function getLength():Float 
{
	return queue.length;
}

public function contains(tile:Tile):Bool
{
	return queue.indexOf(tile) >= 0;
}

public function remove(tile:Tile):Void
{
	var index:Int = queue.indexOf(tile); 
	if (index >= 0) { 
	queue.splice(index, 1);
	}
}

public function push(tile:Tile):Void
{
	queue.push(tile);
}

public function shift():Tile
{
	return cast(queue.shift(), Tile);
}

public function sortTiles(callback:Dynamic):Void
{
	queue = queue.sort(callback);
}

public function retainAll(tiles:Array<Dynamic>):Array<Dynamic>
{
	var removed:Array = [];
	for (i in queue.length - 1...0)
	{
		var tile:Tile = cast(queue[i], Tile);
		if (tiles.indexOf(tile) < 0)
		{
			removed.push(tile);
			queue.splice(i, 1);
		} 
	}
	return removed;
}

public function clear():Void
{
	queue = [];
}
}