#Synth bass
use_bpm 120

in_thread do
  with_fx :level, amp: 0.6 do
    use_synth :fm
    play_pattern_timed [36,48,36,48], [0.5, 0.5, 0.5, 0.5]
    play_pattern_timed [38,50,38,50], [0.5, 0.5, 0.5, 0.5]
    play_pattern_timed [41,53,41,53], [0.5, 0.5, 0.5, 0.5]
    play_pattern_timed [36,48,36,48], [0.5, 0.5, 0.5, 0.5]
    play_pattern_timed [36,48,36,48], [0.5, 0.5, 0.5, 0.5]
    play_pattern_timed [38,50,38,50], [0.5, 0.5, 0.5, 0.5]
    play_pattern_timed [41,53,40,36], [0.5, 0.5, 0.5, 0.5]
  end
end