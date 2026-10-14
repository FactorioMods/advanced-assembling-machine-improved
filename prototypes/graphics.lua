local sheets={
[20]={width=206,height=222,shift={0.0,-0.25552040787262376},shadow={width=177,height=111,scale=0.6285714285714286,shift={0.3633928571428572,0.28662244927023367}}},
[40]={width=206,height=205,shift={0.0,-0.1386454078726237},shadow={width=172,height=111,scale=0.6285714285714286,shift={0.3142857142857143,0.28662244927023367}}},
[80]={width=206,height=205,shift={0.0,-0.1386454078726237},shadow={width=172,height=111,scale=0.6285714285714286,shift={0.3142857142857143,0.28662244927023367}}},
[160]={width=206,height=205,shift={0.0,-0.1386454078726237},shadow={width=172,height=111,scale=0.6285714285714286,shift={0.3142857142857143,0.28662244927023367}}},
[320]={width=206,height=205,shift={0.0,-0.1386454078726237},shadow={width=172,height=111,scale=0.6285714285714286,shift={0.3142857142857143,0.28662244927023367}}},
}
return function(tier)
local s=sheets[tier]
local p="__advanced-assembling-machine-improved__/graphics/"..(tier==20 and "" or tostring(tier).."/")
local g={animation={layers={
{filename=p.."machine-working.png",width=s.width,height=s.height,shift=s.shift,scale=.44,frame_count=48,line_length=8,animation_speed=.5},
{filename=p.."machine-shadow.png",width=s.shadow.width,height=s.shadow.height,shift=s.shadow.shift,scale=s.shadow.scale,draw_as_shadow=true,frame_count=1,repeat_count=48}
}}}
g.idle_animation={layers={{filename=p.."machine-idle.png",width=s.width,height=s.height,shift=s.shift,scale=.44,frame_count=1,repeat_count=48},{filename=p.."machine-shadow.png",width=s.shadow.width,height=s.shadow.height,shift=s.shadow.shift,scale=s.shadow.scale,draw_as_shadow=true,frame_count=1,repeat_count=48}}}
local colors={[40]={1,.32,.08},[80]={.25,.48,1},[160]={.3,.65,1},[320]={.55,.15,1}}
if colors[tier] then g.working_visualisations={{fadeout=true,light={intensity=.18,size=3,color=colors[tier],shift={0,-.5}}}} end
return g
end