local sheets={
[20]={width=166,height=214,scale=0.5,shift={-0.004893867924528302,-0.1972222222222223},has_light=false,shadow={width=251,height=146,scale=0.5,shift={0.6994756280346036,0.8098366964325192}}},
[40]={width=169,height=231,scale=0.5,shift={0.0,-0.326171875},has_light=true,shadow={width=248,height=142,scale=0.5,shift={0.6661345943480244,0.5799081932266267}}},
[80]={width=166,height=214,scale=0.5,shift={0.0,-0.1972222222222222},has_light=true,shadow={width=246,height=136,scale=0.5,shift={0.662218883734546,0.6588132471857292}}},
[160]={width=166,height=215,scale=0.5,shift={0.0,-0.204441713483146},has_light=true,shadow={width=247,height=142,scale=0.5,shift={0.6635119394860038,0.5815705158469854}}},
[320]={width=166,height=215,scale=0.5,shift={0.0,-0.20506733425414359},has_light=true,shadow={width=246,height=158,scale=0.5,shift={0.662642181645043,0.7105220444439049}}},
}
return function(tier)
  local s=sheets[tier]
  local p="__advanced-assembling-machine-improved__/graphics/"..(tier==20 and "" or tostring(tier).."/")
  local function shadow(repeats)
    return {filename=p.."machine-shadow.png",width=s.shadow.width,height=s.shadow.height,
      shift=s.shadow.shift,scale=s.shadow.scale,draw_as_shadow=true,frame_count=1,repeat_count=repeats}
  end
  local g={animation={layers={
    {filename=p.."machine-working.png",width=s.width,height=s.height,shift=s.shift,scale=s.scale,
      frame_count=48,line_length=8,animation_speed=.5},shadow(48)
  }}}
  g.idle_animation={layers={{filename=p.."machine-idle.png",width=s.width,height=s.height,
    shift=s.shift,scale=s.scale,frame_count=1,repeat_count=48},shadow(48)}}
  local colors={[40]={1,.32,.08},[80]={.55,.48,1},[160]={.3,.65,1},[320]={.55,.15,1}}
  g.working_visualisations={}
  if s.has_light then
    g.working_visualisations[#g.working_visualisations+1]={fadeout=true,constant_speed=false,secondary_draw_order=1,
      animation={filename=p.."machine-light.png",width=s.width,height=s.height,shift=s.shift,
        scale=s.scale,frame_count=48,line_length=8,animation_speed=.5,draw_as_glow=true,blend_mode="additive"}}
  end
  if colors[tier] then
    g.working_visualisations[#g.working_visualisations+1]={fadeout=true,
      light={intensity=.18,size=3,color=colors[tier],shift={0,-.5}}}
  end
  return g
end
