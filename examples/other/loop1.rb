d4k = '/devoxx4Kids/workshop-sonic-pi/samples'

use_synth :tb303
live_loop :squelch do
  n = (ring :e1, :e2, :e3, :e4).tick
  play n, release: 0.25
  sleep 0.125
end

live_loop :bass do
  with_fx :distortion, distort: 0.9 do
    sample d4k, "bassc3", rate: 1.25 ,attack: 0.01, sustain: 0, release: 0.35
    sleep 0.25
  end
end

live_loop :drums do
  sample :drum_bass_hard, amp: 4
  sleep 1
  sample :drum_snare_hard
  sleep 1
end