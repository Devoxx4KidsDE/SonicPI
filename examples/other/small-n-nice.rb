live_loop :melody do
  use_synth [:blade, :saw, :pluck, :piano ].choose
  play scale(:c4, :major).choose, release: 0.5, amp: 3
  sleep 0.125
end

live_loop :beat do
  sync :melody
  sample :bd_haus, amp: 0
  sleep 0.5
end

live_loop :garzul do
  sync :beat
  sample :loop_garzul, amp: 2, cutoff: 90, rate: 1
  sleep 4
end

live_loop :machine do
  sync :beat
  sample :bass_hard_c, amp: 1
  sleep 1
end