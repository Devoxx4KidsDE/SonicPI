# Run like Floyd
# Guitar samples by Stefan Hoehn
#

d4k = '/devoxx4Kids/workshop-sonic-pi/samples'

use_bpm  117
define :heart do
  sample d4k, "heartbeat", beat_stretch: 8, amp: 32
  sleep 8
end

heart

live_loop :beat do
  sample :drum_heavy_kick, amp:4
  
  sleep 1
  sample :drum_snare_soft, amp:4
  sleep 0.5
  sample :drum_heavy_kick, amp:4
  sleep 0.5
  sample :drum_heavy_kick, amp:4
  sleep 1
  sample :drum_snare_soft, amp:4
  sleep 1
  sample :drum_heavy_kick, amp:4
  sleep 1
  sample :drum_snare_soft, amp:4
  sleep 1
  sample :drum_heavy_kick, amp:4
  sleep 1
  sample :drum_snare_soft, amp:4
  sleep 1
end


live_loop :guit do
  sync :beat
  10.times do
    sample d4k, "runguitar", start: 0.3, attack: 0, sustain: 0, release: 32, amp: 4
    sleep 32
  end
end

live_loop :guit2 do
  sync :beat
  sample d4k, "runchords", start: 0.0221, attack: 0, sustain: 0, release: 32, amp: 3
  sleep 32
end