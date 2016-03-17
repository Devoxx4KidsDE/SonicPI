# Run like Floyd
# Guitar samples by Stefan Höhn
#

use_sample_pack_as '/devoxx4Kids/workshop-sonic-pi/samples', :d4k

use_bpm  117
define :heart do
  sample :d4k__heartbeat, beat_stretch: 8, amp: 32
  sleep 8
  sample :d4k__heartbeat, beat_stretch: 8, amp: 32
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
    sample :d4k__runguitar, start: 0.3, attack: 0, sustain: 0, release: 32, amp: 4
    sleep 32
  end
end

live_loop :guit2 do
  sync :beat
  sample :d4k__runchords, start: 0.0221, attack: 0, sustain: 0, release: 32, amp: 4
  sleep 32
end