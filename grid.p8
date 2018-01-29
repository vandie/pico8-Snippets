pico-8 cartridge // http://www.pico-8.com
version 15
__lua__
-- g controls the size of the isometric gird panels. defualts to 20
-- ox is the offset of the x axis. Is automattically decreased to avoid extra draw calls. defualts to 0
-- oy is the offset of the y axis. Is automattically decreased to avoid extra draw calls. defualts to 0
-- col 1-16 controlls the color of the grid defaults to 2
-- height and width default to 128 as this is the screensize to draw to
function drawgrid(g,ox,oy,col,height,width)
 -- ensure valid props and such
 local g = g > 5 and g or 20
 local col = ( col >= 0 and col <= 16 ) and col or 2
 local ox = ox != nil and ox or 0
 local oy = oy != nil and oy or 0
 local height = height > 0 and height or 128
 local width = width > 0 and width or 128
 
 -- draw horizontal lines
 for y = 0, height/g + 3 do
   line(0,y*g-(g/2)-(oy%g),width,y*g-(g/2)-(oy%g),col)
   line(0,y*g-(oy%g),width,y*g-(oy%g),col)
 end
 --draw diagonal lines
 for x = -4, width/g + 2 do
  line( (g*x)-(ox%g), -(oy%g), (g*x)-(ox%g)+(128*2), -(oy%g)+(128*2),col)
 end
end

-- demo code
x = 0
y = 0

function _update()
 if btn(0,p-1) then x-=1 end
 if btn(1,p-1) then x+=1 end
 if btn(2,p-1) then y-=1 end
 if btn(3,p-1) then y+=1 end
end

function _draw()
 drawgrid(20,x,y)
end