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

end

function game.update()

end

function game.draw()
	cls()
	print("hello world",1,1)
end
__gfx__
0000000099999999ffffffffddddddddffddddddfd44444454444544776666770000000000000000000000000000000000000000000000000000000000000000
000000005cccc2e2fffffeff54545444ed545444ed54544454545444766666670000000000000000000000000000000000000000000000000000000000000000
007007005cccb2e2ffffe7ef44544454fd544454fd54445444544454776666770000000000000000000000000000000000000000000000000000000000000000
000770005ccb42e2fffffeff44444454fd444454fd44445444444454777ee8880000000000000000000000000000000000000000000000000000000000000000
00077000533c42e2ffffffff44445454fd445454fd4454544444545477ee88880000000000000000000000000000000000000000000000000000000000000000
007007005bb332e2efffffff45445454fd445454fd445454454454547ee888870000000000000000000000000000000000000000000000000000000000000000
00000000533b32227efffffe45445454fd445454fd44545445445454788888870000000000000000000000000000000000000000000000000000000000000000
0000000055555555efffffff45454444fd454444fd45444445454444788888870000000000000000000000000000000000000000000000000000000000000000
00000000000000000000600000000000055500600077770005555550000555500000000000000000000000000000000000000000000000000000000000000000
05555555066000000006060000000000500600700766667056666660005677750000000000000000000000000000000000000000000000000000000000000000
05775775606000000005550000000000006660707577776755557770005666650000000000000000000000000000000000000000000000000000000000000000
05765765000000000005550000000000000000705575756756665560005666650000000000000000000000000000000000000000000000000000000000000000
05655565677776000000000077000000000000705575756756776560005555550000000000000000000000000000000000000000000000000000000000000000
05665665067760000500050066576666500000707577576756666560056767500000000000000000000000000000000000000000000000000000000000000000
05555555005000007566657055557666000000700566567005566560567675000000000000000000000000000000000000000000000000000000000000000000
00500005550000000500050050000765677776000577570000055560555550000000000000000000000000000000000000000000000000000000000000000000
09999999000000000000600000000000055500600077770004444440000555500000000000000000000000000000000000000000000000000000000000000000
09ff9ff9066000000006060000000000500600a00766667046666660005c66650000000000000000000000000000000000000000000000000000000000000000
09f49f49606000000008880000000000006660a0757bbb6744447770005c11150000000000000000000000000000000000000000000000000000000000000000
0949994900000000000888000000000000c000a0557575674eee4460005c11150000000000000000000000000000000000000000000000000000000000000000
094494497cccc7000000000077000000000000a0554545674e77e460005555550000000000000000000000000000000000000000000000000000000000000000
09999999076670000d000d00665788885000c0a0754457674eeee460056161500000000000000000000000000000000000000000000000000000000000000000
00900009005000007d666d705555788800c000a005665670044ee460561615000000000000000000000000000000000000000000000000000000000000000000
00000000550000000d000d0050000785677776000577570000044460555550000000000000000000000000000000000000000000000000000000000000000000
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
__map__
0000000202020202020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000201020202020010001100120013003033373b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000202020202020000000000000000003134383c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000403030307030014001500160017003235390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000005060606060600200021002200230000363a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000506060606060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000506060606060024002500260027000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000506060606060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
010400000bb500bb500bb500bb500bb5014b5016b5017b5019b5019b5018b5017b500ab500ab500ab500ab5018b501db5021b5023b5024b5024b5024b5020b501fb5009b5009b5009b5009b5009b5009b5009b50
__music__
00 00424344

