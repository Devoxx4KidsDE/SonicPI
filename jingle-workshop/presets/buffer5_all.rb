use_bpm 120
use_sample_pack "C:/devoxx4kids/samples"

#Lead
in_thread do
  sample :lead, amp: 1.5
end

#Drums
in_thread do
  3.times do
    sample :drum_loop
    sleep 4
  end
  sample :drum_break
end

#Vocoder
in_thread do
  sleep 12
  sample :vocoder, amp: 2
end

#Acoustic Guitar
in_thread do
  2.times do
    with_fx :reverb, room: 0.7, amp: 2 do
      with_fx :echo, phase: 0.5, decay: 1, mix: 0.2 do
        sample :acoustic
      end
    end
    sleep 8
  end
end

#Synth bass
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






