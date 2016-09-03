# Final outcome for the advanced samples workshop

d4k =  '/devoxx4Kids/workshop-sonic-pi/samples/'

use_bpm 116

live_loop :synthi1 do
  sync :bass
  sample d4k, "synthi1", amp: 4, rate: [1,1,1,1,0.5,0.5].tick
  sample d4k, "synthi1", amp: 5, rate: 0.5 if rand < 0.1
  sample d4k, "synthi1", amp: 5, rate: 2 if rand < 0.25
  sleep sample_duration(d4k, "synthi1")
end

live_loop :synth2 do
  sync :bass
  with_fx :flanger, phase: 0.25 do
    sample d4k, "synthi2", amp: [0,2,4,0,0].choose
  end
  sleep sample_duration(d4k, "synthi2")
end

live_loop :bass do
  use_bpm (ring 116, 232).choose
  8.times do
    sample :bd_fat, amp: 8
    sleep 1
    sample d4k, "clap0", amp: (ring 3,3,3,3,3,0,3,0).tick(:tamp), rate: (ring 1,1,1,1,-1,10,-1,10).tick(:trate)
    sleep 1
  end
end

live_loop :piano do
  sync :bass
  sample d4k, "piano2", amp: 5
  sleep sample_duration(d4k, "piano2")
  
end

live_loop :tubed_bass do
  sync :bass
  sample d4k, "tubedBass2", amp: 10, rate: (ring 1, 1.1).tick
  sleep sample_duration(d4k, "tubedBass2")
end




