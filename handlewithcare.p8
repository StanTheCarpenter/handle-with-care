pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
--credits
credits = {}

function credits.init()
	cls()
end

function credits.update()
		if btn(❎) then set_state(game) end
end

function credits.draw()
	cls()
		spr(80,56+5,71)
		spr(81,64+5,71)

		spr(86,40+5,71)
		spr(87,48+5,71)

		i = flr(2*time()%2)
if i == 0 then

 		--stan
   spr(64,56+5,63)
   spr(65,64+5,63)

   --krampus
   spr(70,40+5,63)
   spr(71,48+5,63)

elseif i == 1 then

		--stan
  spr(66,56+5,63)
  spr(67,64+5,63)

  --krampus
		spr(72,40+5,63)
  spr(73,48+5,63)

end

	local s = 128/3+5
	local t = 128/3+2
	print("made by",s+1,t+1)
	print("krampus",s+1,t+7)
	print(" & stan",s+1,t+13)

end
-->8
--main

state = credits

function set_state(new_state)
	state = new_state
	state.init()
end

function _init()
state.init()
end

function _update()
state.update()
end

function _draw()
state.draw()
end
-->8
--game
game = {}

function game.init()
	player.init()
end

function game.update()
	local gx = player.x
	local gy = player.y
	if btn(⬅️) then
		gx = player.x - 1
	elseif btn(➡️) then
		gx = player.x + 1
	elseif btn(⬆️) then
		gy = player.y - 1
	elseif btn(⬇️) then
		gy = player.y + 1
	end
	
	local item_prsd = false
	for k,v in pairs(items) do
		local l, a = len(v.x,v.y,gx,gy)
		if l < 8 then
			if v.mode == 1 
			and player.spoons > 0 then
				v.act()
				v.mode = 2
				player.spoons -= 1
			end
			item_prsd = true		
		end
	end
	
	if not item_prsd and
	gx > 1 and gx < 120 and
	gy > 3*8 and gy < 128-5*8 then
		player.x = gx
		player.y = gy
	end
end

function game.draw()
	cls()
	map(0,0)
	spr(player.img,player.x,player.y)
	for k,v in pairs(items) do
		spr(v.img[v.mode],v.x,v.y)
	end
	
	for i=1, player.spoons do
		spr(11,i*8,128-36)
	end
	
	print("water: " .. player.water .. "%",8,128-8*3)
	print("food: " .. player.food .. "%",8,128-8*2)
	print("hygiene: " .. player.hygiene .. "%",8,128-8)
	print("sport: " .. player.sport .. "%",64,128-8*3)
	print("study: " .. player.study .. "%",64,128-8*2)
end
-->8
--items

items = {}

items[1] = {
	img = {17,33},
	x = 1,
	y = 3*8,
	mode = 1,
	act = function() player.water = 100 end
	}
items[2] = {
	img = {18,34},
	x = 1,
	y = 6*8,
	mode = 1,
	act = function() player.sport = 100 end
	}
items[3] = {
	img = {20,36},
	x = 1,
	y = 9*8,
	mode = 1,
	act = function() player.hygiene = 100 end
	}
items[4] = {
	img = {21,37},
	x = 120,
	y = 3*8,
	mode = 1,
	act = function() player.food = 100 end
	}
items[5] = {
	img = {22,38},
	x = 120,
	y = 6*8,
	mode = 1,
	act = function() player.study = 100 end
	}
-->8
--player
player = {}
function player.init()
	player.x = 8*8
	player.y = 8*8
	player.img = 12
	player.water = 25
	player.food = 25
	player.hygiene = 25
	player.sport = 0
	player.study = 0
	player.max_spoons = 3
	player.spoons = player.max_spoons
end

-->8
--util
function len(ax,ay,bx,by)
	local dx = ax-bx
	local dy = ay-by
	return sqrt(dx*dx+dy*dy),atan2(dy,dx)
end
__gfx__
0000000099999999ffffffffddddddddffddddddfd4444445444454477666677f4ff4fff7ddd7ddd7ddd7ddd0660000000999900066666666666666666666660
000000005cccc2e2fffffeff54545444ed545444ed5454445454544476666667444444447ddd7ddd7ddd7ddd6dd6000009999990611111111111111111111115
007007005cccb2e2ffffe7ef44544454fd544454fd5444544454445477666677ff4fffff7ddd7ddd7ddd7ddd6dd6000099599599611111111111111111111115
000770005ccb42e2fffffeff44444454fd444454fd44445444444454777ee888fff4ffff7ddd7ddd7ddd7ddd055d600099999999611111111111111111111115
00077000533c42e2ffffffff44445454fd445454fd4454544444545477ee8888444444447ddd7ddd7ddd7ddd0005d60099999999611111111111111111111115
007007005bb332e2efffffff45445454fd445454fd445454454454547ee88887f4ffffff7ddd7ddd7ddd7ddd00005d6099555599611111111111111111111115
00000000533b32227efffffe45445454fd445454fd4454544544545478888887444444447ddd7ddd7ddd7ddd000005d609999990611111111111111111111115
0000000055555555efffffff45454444fd454444fd4544444545444478888887fffff4ff111111117ddd7ddd0000005d00999900611111111111111111111115
00000000000000000000600000000000055500600077770005555550000555505555555500000000000000000000000000000000611111111111111111111115
05555555066000000006060000000000500600700766667056666660005677755667666500000000000000000000000000000000611111111111111111111115
05775775606000000005550000000000006660707577776755557770005666655555555500000000000000000000000000000000611111111111111111111115
05765765000000000005550000000000600000705575756756665560005666655667666500000000000000000000000000000000611111111111111111111115
05655565677776000000000077000000560000705575756756776560005555555555555500000000000000000000000000000000611111111111111111111115
05665665067760000500050066576666600000707577576756666560056767505667666500000000000000000000000000000000611111111111111111111115
05555555005000007566657055557666000000700566567005566560567675005555555500000000000000000000000000000000611111111111111111111115
00500005550000000500050050007765677776000577570000055560555550000500000500000000000000000000000000000000611111111111111111111115
09999999000000000000600000000000055500600077770004444440000555500000000000000000000000000000000000000000611111111111111111111115
09ff9ff9066000000006060000000000500600a00766667046666660005c66650000000000000000000000000000000000000000611111111111111111111115
09f49f49606000000008880000000000006660a0757bbb6744447770005c11150000000000000000000000000000000000000000611111111111111111111115
0949994900000000000888000000000000c000a0557575674eee4460005c11150000000000000000000000000000000000000000611111111111111111111115
094494497cccc7000000000077000000000000a0554545674e77e460005555550000000000000000000000000000000000000000611111111111111111111115
09999999076670000d000d00665788885000c0a0754457674eeee460056161500000000000000000000000000000000000000000611111111111111111111115
00900009005000007d666d705555788800c000a005665670044ee460561615000000000000000000000000000000000000000000611111111111111111111115
00000000550000000d000d0050000785677776000577570000044460555550000000000000000000000000000000000000000000055555555555555555555550
00000000000000000000b000000070000000bb000008800000007000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000b0b000007a700000bbe000008e8000070a070000000c0000aa000020e0200070707000000330000000000000000000000000000000000
000000000000b000000b0a000000700000bb0e00000b8e00000aaa000c00c0c700a99a00002e20000033300033038b0000000000000000000000000000000000
00000000000b0000003b0000003bb00000eb0700003b00000000b00007c0c0b00090b900002e2020073b30700b330b80070a0700000000000000000000000000
000b0000003b000000bb3000000b3000007b3000000b30000033b33000b0b7b0000b3000000200e2003bb3000003000000777000000000000000000000000000
500b3005500b0005500b0005500b0005500b0005500b00055300300550bb00b5500b0005500b0b05573bb3755003000550333305000000000000000000000000
5444444554444445544444455444444554444445544444455444444554444445544444455444444554444445544444455cc3ccc5000000000000000000000000
05555550055555500555555005555550055555500555555005555550055555500555555005555550055555500555555005555550000000000000000000000000
00000000000550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000050000000000000050a0000000000000000000000000880000000000000000000000000000000000000000000000000000000000000000000000000
00000000554400000000000050000000000000000000000000000888000000000000000000000000000000000000000000000000000000000000000000000000
000000000504400000000a0054444400000000000000000000000084400000000000090000440000000000000000000000000000000000000000000000000000
00000000000044000000000550000400000000000000000000000000444000000080000044400000000000000000000000000000000000000000000000000000
00000009900000000000a009900a0000000000000000000000055000004400000005508440000000000000000000000000000000000000000000000000000000
000000a99a000000000000a99a000000000000000000000000005500000000000090588800000000000000000000000000000000000000000000000000000000
00000aa99aa0000000000aa99aa00000000000000000000000005666000000000000588608000000000000000000000000000000000000000000000000000000
00000a9999a000000000000000000000000000000000000000006699999000000000000000000000000000000000000000000000000000000000000000000000
0000aaaaaaaa0000000000000000000000000000000000000000699fff9000000000000000000000000000000000000000000000000000000000000000000000
00000ffffff0000000000000000000000000000000000000000009fdfd9000000000000000000000000000000000000000000000000000000000000000000000
00000ff55ff0000000000000000000000000000000000000000009ffff9000000000000000000000000000000000000000000000000000000000000000000000
000000ffff00000000000000000000000000000000000000000009ffff9000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000010000000000000101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a13003033373b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090909090909090909090900003134383c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0808080808080808080808080808080817003235390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08080808080808080808080808080808230000363a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0808080808080808080808080808080800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0808080808080808080808080808080827000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0808080808080808080808080808080800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0808080808080808080808080808080800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0808080808080808080808080808080800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0808080808080808080808080808080800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0e0e0e0e0e0e0e0e0e0e0e0e0e0e0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d1e1e1e1e1e1e1e1e1e1e1e1e1e1e1f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d1e1e1e1e1e1e1e1e1e1e1e1e1e1e1f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d1e1e1e1e1e1e1e1e1e1e1e1e1e1e1f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2d2e2e2e2e2e2e2e2e2e2e2e2e2e2e2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
010400000bb500bb500bb500bb500bb5014b5016b5017b5019b5019b5018b5017b500ab500ab500ab500ab5018b501db5021b5023b5024b5024b5024b5020b501fb5009b5009b5009b5009b5009b5009b5009b50
__music__
00 00424344

