pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--snake ii
--by liconaj
version="1.0"

function _init()
	cartdata("liconaj_snakeii")
	dat={spd=1,hs=2,col=3,inv=4}
	local oldver=tostr(dget(0))
	if oldver[1]!=version[1] then
		resetall()
		dset(0,version)
	end
	
	grid_x=1
	grid_y=3
	grid_width=14
	grid_height=12
	
	speeds={7,6,5,4,3}
	speed=dget(dat.spd)
	if (speed==0) speed=3
	
	titleimg="`ト`◆`ナ`ナ`ogc`おge`⬅️`lgh`egd`hge`ggd`gge`lgj`qgg`q`lgh`egd`hge`ggd`gge`lgj`qgg`q`jgj`cgf`fgg`fgf`egf`hgc`agk`jgg`egc`o`jgj`cgf`fgg`fgf`egf`hgc`agk`jgg`egc`o`igk`agh`fgg`dgh`cgh`fgf`bgi`cgh`kgc`o`igk`agh`fgg`dgh`cgh`fgf`bgi`cgh`kgc`o`hgl`agh`egh`dgh`cgh`dgh`bgd`ege`qgc`o`hgl`agh`egh`dgh`cgh`dgh`bgd`ege`qgc`o`fgl`cgh`egf`egi`egf`dgg`age`fgb`tgc`o`fgl`cgh`egf`egi`egf`dgg`age`fgb`tgc`o`fgi`fgj`cgf`cgl`ege`cgf`bgc`igb`igc`cgf`q`fgi`fgj`cgf`cgl`ege`cgf`bgc`igb`igc`cgf`q`dgh`igj`cgf`cge`cgd`bgc`bgl`bgc`igb`cga`dgd`cgc`t`dgh`igj`cgf`cge`cgd`bgc`bgl`bgc`igb`cga`dgd`cgc`t`dgg`jgk`bgf`bgf`egi`agj`age`igf`dga`bga`cgc`t`cgf`ngi`bgf`bgf`egi`agh`cgk`egd`dga`bga`cgc`t`cgf`ngi`bgf`bgf`cgk`agh`cgk`egd`dga`bga`cgc`t`cgf`egf`cge`agk`bgf`cgi`cgf`ggg`jga`dga`bga`cgc`t`cgf`egf`cge`agk`bgf`cgi`cgf`ggg`jga`dga`bga`cgc`t`cgr`bge`agk`bgo`egi`egf`cgc`ega`dga`bga`cgc`t`cgr`bge`agk`bgo`egi`egf`cgc`ega`dga`bga`cgc`t`cgr`bge`cgh`agq`cgm`cgf`bgd`ega`dga`bga`cgf`q`cgr`bge`cgh`agq`cgm`cgf`bgd`ega`dga`bga`cgf`q`dgg`dgf`bge`cgh`agi`dgf`agf`bgf`bgl`ega`dga`bga`cgh`o`dgg`dgf`bge`cgh`agi`dgf`agf`bgf`bgl`ega`dga`bga`cgh`o`ngg`bge`dge`bgg`ggf`agf`dgd`bgk`fga`dga`bga`cgb`dgb`o`ngg`bge`dge`bgg`ggf`agf`dgd`bgk`fga`dga`bga`cgb`dgb`o`kgi`agg`dgc`dgg`pgd`egc`bgg`jga`dgc`jgb`o`jgj`agg`dgc`dgg`pgd`egc`bgg`jga`dgc`jgb`o`igk`age`✽gc`kgc`kgc`pgc`o`igk`age`✽gc`ygc`pgc`o`cgo`すge`lgh`o`cgl`たgb`lgh`r`cgl`たgb`lgh`r`dgj`ちgb`hgg`w`dgj`ちgb`hgg`w`fge`とgb`cgh`{`fge`とgb`cgh`{`まgi`○`まgi`○`むgd`🐱`むgd`🐱`ナ`ナ`ナ"
	labelimg="`ト`ト`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`xgc`おge`🐱`ugh`egd`hge`ggd`gge`lgj`qgg`h`ugh`egd`hge`ggd`gge`lgj`qgg`h`sgj`cgf`fgg`fgf`egf`hgc`agk`jgg`egc`f`sgj`cgf`fgg`fgf`egf`hgc`agk`jgg`egc`f`rgk`agh`fgg`dgh`cgh`fgf`bgi`cgh`kgc`f`rgk`agh`fgg`dgh`cgh`fgf`bgi`cgh`kgc`f`qgl`agh`egh`dgh`cgh`dgh`bgd`ege`qgc`f`qgl`agh`egh`dgh`cgh`dgh`bgd`ege`qgc`f`ogl`cgh`egf`egi`egf`dgg`age`fgb`tgc`f`ogl`cgh`egf`egi`egf`dgg`age`fgb`tgc`f`ogi`fgj`cgf`cgl`ege`cgf`bgc`igb`igc`cgf`h`ogi`fgj`cgf`cgl`ege`cgf`bgc`igb`igc`cgf`h`mgh`igj`cgf`cge`cgd`bgc`bgl`bgc`igb`cga`dgd`cgc`k`mgh`igj`cgf`cge`cgd`bgc`bgl`bgc`igb`cga`dgd`cgc`k`mgg`jgk`bgf`bgf`egi`agj`age`igf`dga`bga`cgc`k`lgf`ngi`bgf`bgf`egi`agh`cgk`egd`dga`bga`cgc`k`lgf`ngi`bgf`bgf`cgk`agh`cgk`egd`dga`bga`cgc`k`lgf`egf`cge`agk`bgf`cgi`cgf`ggg`jga`dga`bga`cgc`k`lgf`egf`cge`agk`bgf`cgi`cgf`ggg`jga`dga`bga`cgc`k`lgr`bge`agk`bgo`egi`egf`cgc`ega`dga`bga`cgc`k`lgr`bge`agk`bgo`egi`egf`cgc`ega`dga`bga`cgc`k`lgr`bge`cgh`agq`cgm`cgf`bgd`ega`dga`bga`cgf`h`lgr`bge`cgh`agq`cgm`cgf`bgd`ega`dga`bga`cgf`h`mgg`dgf`bge`cgh`agi`dgf`agf`bgf`bgl`ega`dga`bga`cgh`f`mgg`dgf`bge`cgh`agi`dgf`agf`bgf`bgl`ega`dga`bga`cgh`f`wgg`bge`dge`bgg`ggf`agf`dgd`bgk`fga`dga`bga`cgb`dgb`f`wgg`bge`dge`bgg`ggf`agf`dgd`bgk`fga`dga`bga`cgb`dgb`f`tgi`agg`dgc`dgg`pgd`egc`bgg`jga`dgc`jgb`f`sgj`agg`dgc`dgg`pgd`egc`bgg`jga`dgc`jgb`f`rgk`age`}ge`cgc`kgc`kgc`pgc`f`rgk`age`}ge`cgc`ygc`pgc`f`lgo`xgc`igc`cgb`zge`lgh`f`lgl`ygb`cgc`cgc`cgc`bgh`rgb`lgh`i`lgl`ygb`cgc`cgc`cgc`bgh`rgb`lgh`i`mgj`yga`cgb`cgc`dgb`bgc`ggb`qgb`hgg`n`mgj`yga`cgb`cgc`dgb`bgc`ggb`qgb`hgg`n`oge`|gd`kgb`cgc`ggb`qgb`cgh`r`oge`|gd`kgb`cgc`ggb`qgb`cgh`r`🅾️gc`bga`jgg`kgb`ogi`v`🅾️gc`bga`jgg`kgb`ogi`v`█gs`igb`igf`cgc`pgd`y`█gs`igb`igf`cgc`pgd`y`{ge`bga`bga`bga`bgc`|ga`ggc`⬅️`{ge`bga`bga`bga`bgc`|ga`ggc`⬅️`wgd`bga`bgb`agb`agb`agb`agp`lgp`☉`tgc`agb`agb`agb`bga`bga`bga`bga`bgb`lgb`cgl`bga`bga`bga`bga`♥`tgc`agb`agb`agb`bga`bga`bga`bga`bgb`lgb`cgl`bga`bga`bga`bga`♥`rgc`bga`bga`bga`bgp`agb`kgf`dgb`agd`agb`agb`agb`agb`✽`rgc`bga`bga`bga`bgp`agb`kgf`dgb`agd`agb`agb`agb`agb`✽`qgc`agb`agb`agh`mga`bgk`agc`fgb`dgb`bgo`○`qgc`agb`agb`agh`mga`bgk`agc`fgb`dgb`bgo`○`ogc`agb`bga`bgc`sga`bga`cgc`bgb`aga`ggc`dgd`ogc`ggc`r`ogc`agb`bga`bgc`sga`bga`cgc`bgb`aga`ggc`dgd`ogc`ggc`r`ogb`agb`agb`agc`vgc`cgc`dgb`egc`egb`ugb`cgb`cgc`o`ogb`agb`agb`agc`vgc`cgc`dgb`egc`egb`ugb`cgb`cgc`o`mgb`bga`bgf`|gc`cgb`fgc`dgb`ygf`ega`n`mgb`bga`bgf`|gc`cgb`fgc`dgb`ygf`ega`n`mgg`age`zgb`agb`agb`fgc`dgb`hgm`ggb`bgc`dgb`l`mgg`age`zgb`agb`agb`fgc`dgb`ggn`ggb`bgc`dgb`l`igi`bga`bga`bgf`yga`fgd`dgb`hgb`lga`fgb`bgd`cgb`l`iga`bga`bga`dga`bga`bgf`wgc`fgb`fgb`fgd`lga`fgb`bgd`cgc`k`ggc`bga`bga`bgh`agg`ugb`fgc`egb`ggb`ogb`dgh`cgc`k`ggb`bga`bga`bgb`fgb`bga`bgb`tga`ggb`ggb`egb`fgh`bgc`dgh`cgb`agb`i`ggb`bga`bga`bgb`fgb`bga`bgb`tga`ggb`ggb`egb`fgh`bgc`dgh`cgb`agb`i`ggj`agc`cgk`qgb`fgc`fgb`fgb`dgf`cge`fgj`fga`h`ggj`agc`cgk`qgb`fgc`fgb`fgb`dgf`cge`fgj`fga`h`fgc`bgb`bgc`bgg`bga`bgb`agc`mga`fgd`cgc`agb`dgb`egc`dgn`bgb`age`dgc`h`fgc`bgb`bgc`bgg`bga`bgb`agc`mga`fgd`cgc`agb`dgb`egc`dgn`bgb`age`dgc`h`fga`bgb`bgb`bgc`agb`agb`agb`agb`bga`bgc`igb`fgc`cge`agb`dgb`ega`bga`tgb`bgd`cgb`i`fga`bgb`bgb`bgc`agb`agb`agb`agb`bga`bgc`igb`fgc`cge`agb`dgb`ega`bga`tgb`bgd`cgb`i`ggk`bga`bga`bga`bgl`fgb`fgc`dgg`bgb`dgb`cgc`agb`qgb`agf`cgb`i`ggk`bga`bga`bga`bgl`fgb`fgc`dgg`bgb`dgb`cgc`agb`qgb`agf`cgb`i`qgi`agb`agb`bga`bga`bga`fgb`fgb`cgi`cgb`dgb`cgb`age`ige`agh`cgb`i`qgi`agb`agb`bga`bga`bga`fgb`fgb`cgi`cgb`dgb`cgb`age`ige`agh`cgb`i`tge`bgc`bgb`agb`agc`egb`ggb`agm`cgb`dgb`cga`egi`egb`agf`cgb`i`xga`bgc`bgb`agb`agc`egb`ggb`agm`cgc`cgc`bgc`cgi`egb`agf`cgb`i`jgh`fga`bgm`fgb`ggb`egj`cgb`ega`cgb`rgh`cgb`i`ggn`cga`bgj`agb`fgb`igc`qgb`cgc`cgc`igg`agb`agc`cgb`i`ggn`cga`bgj`agb`fgb`igc`qgb`dgb`cgc`igg`agb`agc`cgb`i`fgq`agc`egb`bgb`hgb`lgq`fgc`bga`bgi`cgb`agd`cga`cgb`i`fgq`agc`egb`bgb`hgb`lgq`fgc`bga`bgi`cgb`agd`cga`cgb`i`fgq`ggb`bgb`kgd`🐱ga`bga`pgc`bgg`k`fgq`ggb`bgb`kgd`🐱ga`bga`pgc`bgg`k`ggt`vgc`○gc`bgd`hge`nga`h`ggt`vgc`○gc`bgd`hge`nga`h`ig█`jga`○gb`fgi`ggl`i`ig█`jga`○gb`fgi`ggl`i`lg○`igc`vgf`cgc`mgn`l`lg○`igc`vgf`cgc`mgn`l`wgw`hgw`hgt`w`wgk`gge`hgw`hgt`w`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ`ナ"
	
	highscore=dget(dat.hs)
		
	--colors
	poke(0x5f2e,1)
	col=dget(dat.col)
	if (col==0) then
		col=4
		dset(dat.col,col)
	end
	inv=dget(dat.inv)
	cols1={0,129,131}
	cols2={7,139,12,13,14,15}
	colors={}
	for i in all(cols1) do
		for j in all(cols2) do
			add(colors,{j,i})
		end
	end
		
	dirs={[0]=vec2(-1,0),vec2(1,0),vec2(0,-1),vec2(0,1)}
	pwfood={}
	for i=0,4 do
		add(pwfood,{n=i*2+33,val=2})
	end
	start_menu()
end

function _update()
	_upd()
end

function _draw()
	cls()
	_drw()
	palette()
end

function start_game()
	_upd=update_game
	_drw=draw_game
	--?"\as5i5...f1e2b2bbbb"
	?"\as5i5...e1g2.ggggg"
	game={
		t=0,
		score=0,
		stats={0,0,0,0,0,0},
		lose=false,
		started=false
	}
	food={}
	restartpwfood()
	swallow={}
	dirqu={dirs[1]}
	snek={
		vec2(3,0),
		vec2(2,0),
		vec2(1,0),
		vec2(0,0),
		reach=false,
		blinks=0,
		blinked=false,
	}
end

function restartpwfood()
	food.pw=false
	food.pwt=0
	food.pwcn=flr(rnd(3))+4
	for f in all(food) do
		if (f.val==2) del(food,f)
	end
end

function start_gameover()
	_upd=update_gameover
	_drw=draw_gameover	
	if game.score>highscore then
		highscore=game.score
		dset(dat.hs,game.score)
	end
end

function vec2(x,y)
	return {x=x,y=y}
end

function getpos(obj,dx,dy)
	local dx=dx or 0
	local dy=dy or 0
	local x=8*(obj.x%grid_width)+grid_x*8+dx
	local y=8*(obj.y%grid_height)+grid_y*8+dy
	return x,y
end

function start_menu()
	_upd=update_menu
	_drw=draw_menu
end

function start_colormenu()
	_upd=update_colormenu
	_drw=draw_colormenu
	
	dirqu={dirs[1]}
	snek={
		vec2(8,5),
		vec2(7,5),
		vec2(6,5),
		vec2(5,5),
		reach=false
	}
end

function insnek(obj)
	for i,s in ipairs(snek) do
		if s.x%grid_width==obj.x and s.y%grid_height==obj.y then
			return true,i
		end
	end
	return false
end

function getswal(s)
	for w in all(swallow) do
		if s.x%grid_width==w.x
		and s.y%grid_height==w.y then
			return w
		end
	end
end

function swald(w)
	if (w.dx!=nil) then
		return w.dx,w.dy
	end
	local cdx,cdy=0,0
	for i,s in ipairs(snek) do
		if s.x%grid_width==w.x
		and s.y%grid_height==w.y then
			if (i==1 or i==#snek) return
			local ns=snek[i-1]
			local bs=snek[i+1]
			local dx,dy=ns.x-bs.x,ns.y-bs.y
			local corn=false
			local dir=dirqu[1]
			--clockwise
			if dx>0 and dy>0 and dir.y>0 then
				cdx,cdy=-1,1
			elseif (dx<0 and dy>0 and dir.x<0) then
				cdx,cdy=-1,-1
			elseif (dx<0 and dy<0 and dir.y<0) then
				cdx,cdy=1,-1
			elseif (dx>0 and dy<0 and dir.x>0) then
				cdx,cdy=1,1
			--anticlockwise
			elseif (dx<0 and dy<0 and dir.x<0) then
				cdx,cdy=-1,1
			elseif (dx<0 and dy>0 and dir.y>0) then
				cdx,cdy=1,1
			elseif (dx>0 and dy>0 and dir.x>0) then
				cdx,cdy=1,-1
			elseif (dx>0 and dy<0 and dir.y<0) then
				cdx,cdy=-1,-1
			end
			break
		end
	end
	return cdx,cdy
end

function addfood(ispw)
	local f,x,y
	local dx=ispw and 1 or 0
	local cnt=0
	while x==nil
	or insnek(vec2(x,y))
	or insnek(vec2(x+dx,y))
	or insnek(vec2(x-dx,y)) do
		if (cnt>4*grid_width*grid_height) then
			return
		end
		x,y=flr(rnd(grid_width)),flr(rnd(grid_height))
		for mf in all(food) do
			if (x==mf.x and y==mf.y)
			or (x+dx==mf.x and y==mf.y)
			or (x-dx==mf.x and y==mf.y) then
				x=nil
				break
			end
		end
		if ispw and (x==0 or x==grid_width-1) then
			x=nil
		end
		cnt+=1
	end
	local n=ispw and ceil(rnd(5))+1 or 1
	local val=ispw and 2 or 1
	add(food,{show=true,n=n,x=x,y=y,val=val})
	if ispw then
		food.pw=true
		add(food,{show=false,n=n,x=x-1,y=y,val=val})
		add(food,{show=false,n=n,x=x+1,y=y,val=val})
	end
end

function rle1(s,x0,y,tr)
 local x,mw=x0,x0+ord(s,2)-96
 for i=5,#s,2do
  local col,len=ord(s,i)-96,ord(s,i+1)-96
  if(col!=tr) line(x,y,x+len-1,y,col)
  x+=len if(x>mw) x=x0 y+=1
 end
end

function start_stats()
	_upd=update_stats
	_drw=draw_stats
end

function resetall()
	for i=0,64 do
		dset(i,0)
	end
end

function palette()
	pal()
	palt(0,false)
	palt(11,true)
	pal(0,colors[col][(inv)%2+1],1)
	pal(7,colors[col][(1+inv)%2+1],1)
end

function beep()
	--?"\a"..rnd{"e","f"}.."1"
	?"\ae1"
end
-->8
--update functions
function update_game()
	game.t+=1
	--food
	if #food==0 then
		addfood()
		if not food.pw and food.pwcn==0 then
			addfood(true)
		end
	end
	--starting
	if not game.started then
		if game.t<15 then
			return
		end
		game.started=true
		game.t=0
	end
	--snek
	if game.t>=speeds[speed]
	and not game.lose then
		game.t=0
		move_snek()
	end
	if snek.blinks==3 then
		--?"\as5i5...g2e2eee.cccc"
		start_gameover()
	end
	if (game.lose) return
	
	--controls
	for k=0,3 do
		local dir=dirs[k]
		local opts={[0]=1,0,3,2}
		local lastdir=dirqu[#dirqu]
		if btn(k) and lastdir!=dir
		and lastdir!=dirs[opts[k]]
		and #dirqu<2 then
			--beep()
			add(dirqu,dir)
		end 
	end
	--pwfood
	if food.pw then
		if food.pwt>20*speeds[speed] then
			restartpwfood()
		end
		food.pwt+=1
	end
	snek.reach=false
	local dir=dirqu[1]
	local head=snek[1]
	for f in all(food) do
		local h=snek[1]
		local dx,dy=f.x-h.x%grid_width,f.y-h.y%grid_height
		if (dx==dir.x and dir.y*dy>0 and abs(dy)<5)
		or (dy==dir.y and dir.x*dx>0 and abs(dx)<5) then
			snek.reach=true
		end
		local h=snek[1]
		if f.x==h.x%grid_width
		and f.y==h.y%grid_height then
			game.score+=f.val*5
			game.stats[f.n]+=1
			if (f.val==1) food.pwcn-=1
			if (f.val==2) restartpwfood()
			add(swallow,f)
			del(food,f)
			if f.val==1 then
				?"\ai7c3"
			else
				?"\ai7g3c"
			end
		end
	end
	--swallow
	for w in all(swallow) do
		w.dx,w.dy=swald(w)
	end
end

function update_gameover()
	if btnp(❎) then
		beep()
		start_game()
	elseif btnp(➡️) then
		beep()
		start_stats()
	elseif btnp(🅾️) then
		beep()
		start_menu()
	end
end

function move_snek()
	if #dirqu>1 then
		deli(dirqu,1)
	end
	local nx=snek[1].x+dirqu[1].x
	local ny=snek[1].y+dirqu[1].y
	for s in all(snek) do
		if nx%grid_width==s.x%grid_width
		and ny%grid_height==s.y%grid_height
		and s!=snek[#snek] then
			?"\ai4v3s3d2f#1.b0.b.v1b.bb"
			game.lose=true
			game.t=0
		end
	end
	local dels=snek[#snek]
	add(snek,vec2(nx,ny),1)
	--swallow
	local grow=false
	for w in all(swallow) do
		local t=snek[#snek]
		if w.x==t.x%grid_width and w.y==t.y%grid_height then
			grow=true
			del(swallow,w)
		end
	end
	if not grow then
	 deli(snek)
	end
end

function update_menu()
	if btnp(❎) then
		beep()
		start_game()
	end
	local lastspeed=speed
	if (btnp(🅾️)) beep() start_colormenu()
	if (btnp(⬅️)) speed-=1
	if (btnp(➡️)) speed+=1
	speed=mid(speed,1,5)
	if speed!=lastspeed then
		dset(dat.spd,speed)
		beep()
	end
end

function update_colormenu()
	if btnp(❎) then
		beep()
		start_menu()
	elseif btnp(🅾️) then
		beep()
		inv=(inv+1)%2
		dset(dat.inv,inv)
	end
	if btnp(⬅️) and col>1 then
		beep()
		col-=1
		dset(dat.col,col)
	end
	if btnp(➡️) and col<#colors then
		beep()
		col+=1
		dset(dat.col,col)
	end
end

function update_stats()
	if (btnp(⬅️)) beep() start_gameover()
end

-->8
--draw functions

function draw_game()	
	--snake
	if not game.lose
	or (snek.blinks<=3 and flr(game.t/10)%2==0) then
		drwsnek()
		snek.blinked=false
	elseif not snek.blinked then
		snek.blinked=true
		snek.blinks+=1
	end
	--food
	drwfood()
	--score
	local score=tostr(game.score)
	local scoretxt="\*"..4-#score.."0"..score
	?"\^w\^t"..scoretxt,4,5,7
	--pwtimer
	if food.pw then
		local pwt=tostr(20-flr(food.pwt/speeds[speed]))
		?"\^w\^t"..zfill(pwt,2),110,5,7
	end
	map(0,0,0,0,16,16)
end

function draw_gameover()
	bprint("gameover",18,18,7,3)
	?"\^w\^t"..zfill(game.score,4),49,44,7
	?"\^w\^thighscore",29,78,7
	?"\^w\^t"..zfill(highscore,4),49,90,7
	?"\^w\^t❎retry",4,114,7
	?"\^w\^tmenu🅾️",78,114,7
	?"\^w\^tstats➡️",40,61,7
end

function draw_stats()
	bprint("stats",35,18,7,3)
	local x,y,gap=12,52,63
	printstat(1,x,y)
	printstat(2,x,y+16)
	printstat(3,x,y+32)
	printstat(4,x+gap,y)
	printstat(5,x+gap,y+16)
	printstat(6,x+gap,y+32)
	?"\^w\^t⬅️return",4,114,7
end

function draw_colormenu()
	bprint("colors",29,18,7,3)
	if (col>1) ?"\^w\^t⬅️",12,63,7
	if (col<#colors) ?"\^w\^t➡️",102,63,7
	?"\^w\^t❎menu",4,114,7
	?"\^w\^tinv🅾️",86,114,7
	map(16,0,32,48,8,5)
	drwsnek()
end

function draw_menu()
	rle1(titleimg,7,7,0)
	?"\^w\^tspeed",20,60,7
	if speed>1 then
		?"\^w\^t⬅️",68,60,7
	end
	if speed<5 then
		?"\^w\^t➡️",92,60,7
	end
	?"\^w\^t"..speed,84,60,7
	?"\^w\^thighscore",29,78,7
	?"\^w\^t"..zfill(highscore,4),49,90,7
	?"\^w\^t❎start",4,114,7
	?"\^w\^tcolor🅾️",70,114,7
end

function printstat(n,x,y)
	if (n==1) then
		spr(32,x+4,y+2)
	else
		spr(29+n*2,x,y+2,2,1)
	end
	?"\^t\^w"..zfill(game.stats[n],3," "),x+19,y,7
end

function zfill(txt,n,f)
	f=f or "0"
	txt=tostr(txt)
	return "\*"..n-#txt..f..txt
end

function toflip(n,b)
	return ((b.y==n.y or b.x==n.x) and (n.x<0 or n.y<0))
			or (b.y<0 and n.x<0)
			or (n.y<0 and b.x<0)
			or (b.x>0 and n.y>0)
			or (n.x>0 and b.y>0)
end

function drwfood()
	for f in all(food) do
		if (not f.show) return
		local x,y=getpos(f,f.val==2 and -4)
		local n=f.n==1 and 32 or f.n*2+29
		spr(n,x,y,f.val,1)
	end
end

function bprint(str,x,y,c,scale)
	memcpy(0x4300,0x0,0x0200)
	memset(0x0,0,0x0200)
	poke(0x5f55,0x00)
	print(str,0,0,7)
	poke(0x5f55,0x60)
	
	local w,h=#str*4,5
	pal(7,c)
	palt(0,true)
	sspr(0,0,w,h,x,y,w*scale,h*scale)
	pal()
	palette()
	memcpy(0x0,0x4300,0x0200)
end

function drwsnek()
	local dir=dirqu[1]
	local nh=dir.y==0 and 17 or 21
	for i,s in ipairs(snek) do
		local x,y=getpos(s)
		if i==1 then --head
			local nx,ny=getpos(s,-dir.x*4,-dir.y*4)
			local m=16
			if snek.reach then
				m=dir.y==0 and 22 or 23
			end
			spr(m,x,y,1,1,dir.x<0,dir.y<0)
			spr(nh,nx,ny,1,1,dir.x<0,dir.y<0)
		elseif i==#snek then --tail
			local ns=snek[i-1]
			local n=ns.y-s.y==0 and 19 or 20
			spr(n,x,y,1,1)
		else --body
			local ns=snek[i-1]
			local bs=snek[i+1]
			local n=vec2(ns.x-s.x,ns.y-s.y)
			local b=vec2(bs.x-s.x,bs.y-s.y)
			local bx,by=getpos(s,b.x*4,b.y*4)
			local nx,ny=getpos(s,n.x*4,n.y*4)
			local hastoflip=toflip(n,b)
			spr(16,bx,by)
			spr(ns==snek[1] and nh or 16,nx,ny,1,1,dir.x<0,dir.y<0)
			spr(18,x,y,1,1,hastoflip)
			--swallow
			local w=getswal(s)
			if w and w.dx then
				local wx,wy=getpos(w,w.dx*4,w.dy*4)
				local ss=w.dx!=0 and 18 or 24
				spr(ss,wx,wy,1,1,hastoflip)
			end
		end
	end
end

__gfx__
00000000bbbb77000077bbbbbbbbbbbb00000000bbbbbbbbbbbbbbbbbbbb77000077bbbb00007777777700007777777700000000000000000000000000000000
00000000bbbb77000077bbbbbbbbbbbb00000000bbbbbbbbbbbbbbbbbbbb77000077bbbb00007777777700007777777700000000000000000000000000000000
00700700bbbb77000077bbbbbbbbbbbb77777777bbbbbbbbbbbbbbbbbbbb77777777bbbb00007777777700007777777700000000000000000000000000000000
00077000bbbb77000077bbbbbbbbbbbb77777777bbbbbbbbbbbbbbbbbbbb77777777bbbb00007777777700007777777700000000000000000000000000000000
00077000bbbb77000077bbbb77777777bbbbbbbbbbbb77777777bbbbbbbbbbbbbbbbbbbb00007777777700000000000077777777000000000000000000000000
00700700bbbb77000077bbbb77777777bbbbbbbbbbbb77777777bbbbbbbbbbbbbbbbbbbb00007777777700000000000077777777000000000000000000000000
00000000bbbb77000077bbbb00000000bbbbbbbbbbbb77000077bbbbbbbbbbbbbbbbbbbb00007777777700000000000077777777000000000000000000000000
00000000bbbb77000077bbbb00000000bbbbbbbbbbbb77000077bbbbbbbbbbbbbbbbbbbb00007777777700000000000077777777000000000000000000000000
bbbbbbbbbbbb77bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb77bbbbbbbbbbbb7777bb00007777777700000000000000000000000000000000000000000000
bbbbbbbbbbbb77bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb77bbbbbbbbbbbb7777bb00007777777700000000000000000000000000000000000000000000
bb7777bbbb77bbbbbb77bbbbbbbbbbbbbbbb77bbbb7777bbbb77bbbbbb7777bb77bbbb7700007777777700000000000000000000000000000000000000000000
bb7777bbbb77bbbbbb77bbbbbbbbbbbbbbbb77bbbb7777bbbb77bbbbbb7777bb77bbbb7700007777777700000000000000000000000000000000000000000000
bb7777bbbb7777bbbbbb77bbbb7777bbbbbb77bbbb77bb77bb77bbbb77bbbb7777bbbb7700000000000000000000777777770000000000000000000000000000
bb7777bbbb7777bbbbbb77bbbb7777bbbbbb77bbbb77bb77bb77bbbb77bbbb7777bbbb7700000000000000000000777777770000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb77bbbbbbbbbbbb7777bb00000000000000000000777777770000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb77bbbbbbbbbbbb7777bb00000000000000000000777777770000000000000000000000000000
bbbbbbbbbbbbbbbb7777bbbbbb777777777777bb7777bbbbbb77bbbbbb77bb77bb77bbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000
bbb77bbbbbbbbbbb7777bbbbbb777777777777bb7777bbbbbb77bbbbbb77bb77bb77bbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000
bbb77bbb77bbbb7777bb77bb77777777777777777777bbbb777777bb77bb7777777777bb77bbbbbbbbbbbbbb0000000000000000000000000000000000000000
b77bb77b77bbbb7777bb77bb77777777777777777777bbbb777777bb77bb7777777777bb77bbbbbbbbbbbbbb0000000000000000000000000000000000000000
b77bb77b77bb7777777777bb77bb77777777bb77bbbb777777777777777777777777777777777777777777770000000000000000000000000000000000000000
bbb77bbb77bb7777777777bb77bb77777777bb77bbbb777777777777777777777777777777777777777777770000000000000000000000000000000000000000
bbb77bbbbb7777777777777777bb77bbbb77bb77bbbbbbbb77bb77bbbbbbbb77bb77bbbbbb77bb77bb77bb770000000000000000000000000000000000000000
bbbbbbbbbb7777777777777777bb77bbbb77bb77bbbbbbbb77bb77bbbbbbbb77bb77bbbbbb77bb77bb77bb770000000000000000000000000000000000000000
__label__
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddd000dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd00000dddddddddddddddddddddddddddddddddd
ddddddddddddddddddddd00000000ddddd0000dddddddd00000ddddddd0000ddddddd00000dddddddddddd0000000000ddddddddddddddddd0000000dddddddd
ddddddddddddddddddddd00000000ddddd0000dddddddd00000ddddddd0000ddddddd00000dddddddddddd0000000000ddddddddddddddddd0000000dddddddd
ddddddddddddddddddd0000000000ddd000000dddddd0000000dddddd000000ddddd000000dddddddd000d00000000000dddddddddd0000000ddddd000dddddd
ddddddddddddddddddd0000000000ddd000000dddddd0000000dddddd000000ddddd000000dddddddd000d00000000000dddddddddd0000000ddddd000dddddd
dddddddddddddddddd00000000000d00000000dddddd0000000dddd00000000ddd00000000dddddd000000dd000000000ddd00000000ddddddddddd000dddddd
dddddddddddddddddd00000000000d00000000dddddd0000000dddd00000000ddd00000000dddddd000000dd000000000ddd00000000ddddddddddd000dddddd
ddddddddddddddddd000000000000d00000000ddddd00000000dddd00000000ddd00000000dddd00000000dd0000ddddd00000ddddddddddddddddd000dddddd
ddddddddddddddddd000000000000d00000000ddddd00000000dddd00000000ddd00000000dddd00000000dd0000ddddd00000ddddddddddddddddd000dddddd
ddddddddddddddd000000000000ddd00000000ddddd000000ddddd000000000ddddd000000dddd0000000d00000dddddd00dddddddddddddddddddd000dddddd
ddddddddddddddd000000000000ddd00000000ddddd000000ddddd000000000ddddd000000dddd0000000d00000dddddd00dddddddddddddddddddd000dddddd
ddddddddddddddd000000000dddddd0000000000ddd000000ddd000000000000ddddd00000ddd000000dd000ddddddddd00ddddddddd000ddd000000dddddddd
ddddddddddddddd000000000dddddd0000000000ddd000000ddd000000000000ddddd00000ddd000000dd000ddddddddd00ddddddddd000ddd000000dddddddd
ddddddddddddd00000000ddddddddd0000000000ddd000000ddd00000ddd0000dd000dd000000000000dd000ddddddddd00ddd0dddd0000ddd000ddddddddddd
ddddddddddddd00000000ddddddddd0000000000ddd000000ddd00000ddd0000dd000dd000000000000dd000ddddddddd00ddd0dddd0000ddd000ddddddddddd
ddddddddddddd0000000dddddddddd00000000000dd000000dd000000ddddd000000000d0000000000d00000ddddddddd000000dddd0dd0ddd000ddddddddddd
dddddddddddd000000dddddddddddddd000000000dd000000dd000000ddddd000000000d00000000ddd00000000000ddddd0000dddd0dd0ddd000ddddddddddd
dddddddddddd000000dddddddddddddd000000000dd000000dd000000ddd00000000000d00000000ddd00000000000ddddd0000dddd0dd0ddd000ddddddddddd
dddddddddddd000000ddddd000000ddd00000d00000000000dd000000ddd000000000ddd000000ddddddd0000000dddddddddd0dddd0dd0ddd000ddddddddddd
dddddddddddd000000ddddd000000ddd00000d00000000000dd000000ddd000000000ddd000000ddddddd0000000dddddddddd0dddd0dd0ddd000ddddddddddd
dddddddddddd000000000000000000dd00000d00000000000dd000000000000000ddddd000000000ddddd000000ddd000ddddd0dddd0dd0ddd000ddddddddddd
dddddddddddd000000000000000000dd00000d00000000000dd000000000000000ddddd000000000ddddd000000ddd000ddddd0dddd0dd0ddd000ddddddddddd
dddddddddddd000000000000000000dd00000ddd00000000d00000000000000000ddd0000000000000ddd000000dd0000ddddd0dddd0dd0ddd000000dddddddd
dddddddddddd000000000000000000dd00000ddd00000000d00000000000000000ddd0000000000000ddd000000dd0000ddddd0dddd0dd0ddd000000dddddddd
ddddddddddddd0000000dddd000000dd00000ddd00000000d000000000dddd000000d000000dd000000dd000000000000ddddd0dddd0dd0ddd00000000dddddd
ddddddddddddd0000000dddd000000dd00000ddd00000000d000000000dddd000000d000000dd000000dd000000000000ddddd0dddd0dd0ddd00000000dddddd
ddddddddddddddddddddddd0000000dd00000dddd00000dd0000000ddddddd000000d000000dddd0000dd00000000000dddddd0dddd0dd0ddd00dddd00dddddd
ddddddddddddddddddddddd0000000dd00000dddd00000dd0000000ddddddd000000d000000dddd0000dd00000000000dddddd0dddd0dd0ddd00dddd00dddddd
dddddddddddddddddddd000000000d0000000dddd000dddd0000000dddddddddddddddd0000ddddd000dd0000000dddddddddd0dddd000dddddddddd00dddddd
ddddddddddddddddddd0000000000d0000000dddd000dddd0000000dddddddddddddddd0000ddddd000dd0000000dddddddddd0dddd000dddddddddd00dddddd
dddddddddddddddddd00000000000d00000ddddddddddddddddddddddddddddd00000ddd000ddddddddddd000ddddddddddd000dddddddddddddddd000dddddd
dddddddddddddddddd00000000000d00000ddddddddddddddddddddddddddddd00000ddd000ddddddddddddddddddddddddd000dddddddddddddddd000dddddd
dddddddddddd000000000000000dddddddddddddddddddddddd000ddddddddd000ddd00dddddddddddddddddddddddddd00000dddddddddddd00000000dddddd
dddddddddddd000000000000ddddddddddddddddddddddddd00ddd000ddd000ddd000dd00000000dddddddddddddddddd00dddddddddddd00000000ddddddddd
dddddddddddd000000000000ddddddddddddddddddddddddd00ddd000ddd000ddd000dd00000000dddddddddddddddddd00dddddddddddd00000000ddddddddd
ddddddddddddd0000000000ddddddddddddddddddddddddd0ddd00ddd000dddd00dd000ddddddd00ddddddddddddddddd00dddddddd0000000dddddddddddddd
ddddddddddddd0000000000ddddddddddddddddddddddddd0ddd00ddd000dddd00dd000ddddddd00ddddddddddddddddd00dddddddd0000000dddddddddddddd
ddddddddddddddd00000dddddddddddddddddddddddddddd0000ddddddddddd00ddd000ddddddd00ddddddddddddddddd00ddd00000000dddddddddddddddddd
ddddddddddddddd00000dddddddddddddddddddddddddddd0000ddddddddddd00ddd000ddddddd00ddddddddddddddddd00ddd00000000dddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddd000dd0dddddddddd0000000ddddddddddd00ddddddddddddddd000000000dddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddd000dd0dddddddddd0000000ddddddddddd00ddddddddddddddd000000000dddddddddddddddddddddd
dddddddddddddddddddddddddddddddd0000000000000000000ddddddddd00ddddddddd000000ddd000dddddddddddddddd0000ddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddd0000000000000000000ddddddddd00ddddddddd000000ddd000dddddddddddddddd0000ddddddddddddddddddddddddd
ddddddddddddddddddddddddddd00000dd0dd0dd0dd000dddddddddddddddddddddddddddd0ddddddd000ddddddddddddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddddd00000dd0dd0dd0dd000dddddddddddddddddddddddddddd0ddddddd000ddddddddddddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddd0000dd0dd00d00d00d00d0000000000000000dddddddddddd0000000000000000dddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddd000d00d00d00dd0dd0dd0dd0dd00dddddddddddd00ddd000000000000dd0dd0dd0dd0ddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddd000d00d00d00dd0dd0dd0dd0dd00dddddddddddd00ddd000000000000dd0dd0dd0dd0ddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddd000dd0dd0dd0dd0000000000000000d00ddddddddddd000000dddd00d0000d00d00d00d00ddddddddddddddddddddddddddddddddddddd
dddddddddddddddddd000dd0dd0dd0dd0000000000000000d00ddddddddddd000000dddd00d0000d00d00d00d00ddddddddddddddddddddddddddddddddddddd
ddddddddddddddddd000d00d00d00000000ddddddddddddd0dd00000000000d000dddddd00dddd00dd000000000000000ddddddddddddddddddddddddddddddd
ddddddddddddddddd000d00d00d00000000ddddddddddddd0dd00000000000d000dddddd00dddd00dd000000000000000ddddddddddddddddddddddddddddddd
ddddddddddddddd000d00dd0dd000ddddddddddddddddddd0dd0ddd000dd00d0ddddddd000dddd0000ddddddddddddddd000ddddddd000dddddddddddddddddd
ddddddddddddddd000d00dd0dd000ddddddddddddddddddd0dd0ddd000dd00d0ddddddd000dddd0000ddddddddddddddd000ddddddd000dddddddddddddddddd
ddddddddddddddd00d00d00d000dddddddddddddddddddddd000ddd000dddd00ddddd000ddddd00ddddddddddddddddddddd00ddd00ddd000ddddddddddddddd
ddddddddddddddd00d00d00d000dddddddddddddddddddddd000ddd000dddd00ddddd000ddddd00ddddddddddddddddddddd00ddd00ddd000ddddddddddddddd
ddddddddddddd00dd0dd000000dddddddddddddddddddddddddddd000ddd00dddddd000dddd00ddddddddddddddddddddddddd000000ddddd0dddddddddddddd
ddddddddddddd00dd0dd000000dddddddddddddddddddddddddddd000ddd00dddddd000dddd00ddddddddddddddddddddddddd000000ddddd0dddddddddddddd
ddddddddddddd0000000d00000dddddddddddddddddddddddddd00d00d00dddddd000dddd00dddddddd0000000000000ddddddd00dd000dddd00dddddddddddd
ddddddddddddd0000000d00000dddddddddddddddddddddddddd00d00d00dddddd000dddd00ddddddd00000000000000ddddddd00dd000dddd00dddddddddddd
ddddddddd000000000dd0dd0dd000000ddddddddddddddddddddddddd0dddddd0000dddd00dddddddd00dddddddddddd0dddddd00dd0000ddd00dddddddddddd
ddddddddd0dd0dd0dddd0dd0dd000000ddddddddddddddddddddddd000dddddd00dddddd00dddddd0000dddddddddddd0dddddd00dd0000ddd000ddddddddddd
ddddddd000dd0dd0dd00000000d0000000ddddddddddddddddddddd00dddddd000ddddd00ddddddd00ddddddddddddddd00dddd00000000ddd000ddddddddddd
ddddddd00dd0dd0dd00dddddd00dd0dd00dddddddddddddddddddd0ddddddd00ddddddd00ddddd00dddddd00000000dd000dddd00000000ddd00d00ddddddddd
ddddddd00dd0dd0dd00dddddd00dd0dd00dddddddddddddddddddd0ddddddd00ddddddd00ddddd00dddddd00000000dd000dddd00000000ddd00d00ddddddddd
ddddddd0000000000d000ddd00000000000ddddddddddddddddd00dddddd000dddddd00dddddd00dddd000000ddd00000dddddd0000000000dddddd0dddddddd
ddddddd0000000000d000ddd00000000000ddddddddddddddddd00dddddd000dddddd00dddddd00dddd000000ddd00000dddddd0000000000dddddd0dddddddd
dddddd000dd00dd000dd0000000dd0dd00d000ddddddddddddd0dddddd0000ddd000d00dddd00ddddd000dddd00000000000000dd00d00000dddd000dddddddd
dddddd000dd00dd000dd0000000dd0dd00d000ddddddddddddd0dddddd0000ddd000d00dddd00ddddd000dddd00000000000000dd00d00000dddd000dddddddd
dddddd0dd00dd00dd000d00d00d00d00dd0dd000ddddddddd00dddddd000ddd00000d00dddd00ddddd0dd0dddddddddddddddddddd00dd0000ddd00ddddddddd
dddddd0dd00dd00dd000d00d00d00d00dd0dd000ddddddddd00dddddd000ddd00000d00dddd00ddddd0dd0dddddddddddddddddddd00dd0000ddd00ddddddddd
ddddddd00000000000dd0dd0dd0dd000000000000dddddd00dddddd000dddd0000000dd00dddd00ddd000d00ddddddddddddddddd00d000000ddd00ddddddddd
ddddddd00000000000dd0dd0dd0dd000000000000dddddd00dddddd000dddd0000000dd00dddd00ddd000d00ddddddddddddddddd00d000000ddd00ddddddddd
ddddddddddddddddd000000000d00d00dd0dd0dd0dddddd00dddddd00ddd000000000ddd00dddd00ddd00d00000ddddddddd00000d00000000ddd00ddddddddd
ddddddddddddddddd000000000d00d00dd0dd0dd0dddddd00dddddd00ddd000000000ddd00dddd00ddd00d00000ddddddddd00000d00000000ddd00ddddddddd
dddddddddddddddddddd00000dd000dd00d00d000ddddd00ddddddd00d0000000000000ddd00dddd00ddd0ddddd000000000ddddd00d000000ddd00ddddddddd
dddddddddddddddddddddddd0dd000dd00d00d000ddddd00ddddddd00d0000000000000ddd000ddd000dd000ddd000000000ddddd00d000000ddd00ddddddddd
dddddddddd00000000dddddd0dd0000000000000dddddd00ddddddd00ddddd0000000000ddd00ddddd0ddd00dddddddddddddddddd00000000ddd00ddddddddd
ddddddd00000000000000ddd0dd0000000000d00dddddd00ddddddddd000ddddddddddddddddd00ddd000ddd000ddddddddd0000000d00d000ddd00ddddddddd
ddddddd00000000000000ddd0dd0000000000d00dddddd00ddddddddd000ddddddddddddddddd00dddd00ddd000ddddddddd0000000d00d000ddd00ddddddddd
dddddd00000000000000000d000ddddd00dd00dddddddd00dddddddddddd00000000000000000dddddd000dd0dd000000000ddd00d0000ddd0ddd00ddddddddd
dddddd00000000000000000d000ddddd00dd00dddddddd00dddddddddddd00000000000000000dddddd000dd0dd000000000ddd00d0000ddd0ddd00ddddddddd
dddddd00000000000000000ddddddd00dd00ddddddddddd0000dddddddddddddddddddddddddddddddddd0dd0dddddddddddddddd000dd0000000ddddddddddd
dddddd00000000000000000ddddddd00dd00ddddddddddd0000dddddddddddddddddddddddddddddddddd0dd0dddddddddddddddd000dd0000000ddddddddddd
ddddddd00000000000000000000dddddddddddddddddddddd000ddddddddddddddddddddddddddddddd000dd0000dddddddd00000dddddddddddddd0dddddddd
ddddddd00000000000000000000dddddddddddddddddddddd000ddddddddddddddddddddddddddddddd000dd0000dddddddd00000dddddddddddddd0dddddddd
ddddddddd00000000000000000000000000000000dddddddddd0ddddddddddddddddddddddddddddddd00dddddd000000000ddddddd000000000000ddddddddd
ddddddddd00000000000000000000000000000000dddddddddd0ddddddddddddddddddddddddddddddd00dddddd000000000ddddddd000000000000ddddddddd
dddddddddddd0000000000000000000000000000000ddddddddd000dddddddddddddddddddddd000000ddd000ddddddddddddd00000000000000dddddddddddd
dddddddddddd0000000000000000000000000000000ddddddddd000dddddddddddddddddddddd000000ddd000ddddddddddddd00000000000000dddddddddddd
ddddddddddddddddddddddd00000000000000000000000dddddddd00000000000000000000000dddddddd00000000000000000000ddddddddddddddddddddddd
ddddddddddddddddddddddd00000000000ddddddd00000dddddddd00000000000000000000000dddddddd00000000000000000000ddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd

__gff__
0000000000000000000101010100000000000000000000000001010101000000000000000000000000000000000000000000000000000000000000000000000001010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000005030303030303060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000001000000000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0503030303030303030303030303030601000000000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000201000000000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000207040404040404080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0704040404040404040404040404040800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00050000115501c5502355023550235501f5001f5001e500215001a50024500245000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500
