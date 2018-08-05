###################################################################
# 
# Sound similar to Ayreons "Computer Eyes"
#
# credits go to G. Martin Butz
# see https://groups.google.com/forum/#!topic/sonic-pi/2RtDcST5PHQ
#
###################################################################

use_bpm 194
live_loop :test do
  with_fx :echo, phase: 0.5, mix: 0.25, decay: 1 do |rev|
    control rev, mix_slide: 0.125, mix: 0.5
    s = synth :dpulse, note: :a1, release: 1.0, amp: 1, env_curve: 4,
      pulse_width: 0.25, dpulse_width: 0.01, cutoff: 130, detune: 0.25
    control s, amp_slide: 0.5, amp: 0.5, cutoff: 80, cutoff_slide:
      0.125, pulse_width: 0.85, pulse_width_slide: 0.25, dpulse_width: 0.75,
      dpulse_width_slide: 0.75
  end
  sleep 1
end