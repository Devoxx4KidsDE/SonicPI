use_bpm 120
d4k = "/devoxx4kids/workshop-sonic-pi/samples/jingle"

#Lead
in_thread do
  sample d4k, "lead", amp: 1.5
end

#Drums
in_thread do
  3.times do
    sample d4k, "drum_loop"
    sleep 4
  end
  sample d4k, "drum_break"
end

#Vocoder
in_thread do
  sleep 12
  sample d4k, "vocoder", amp: 4
end

#Acoustic Guitar
in_thread do
  2.times do
    with_fx :reverb, room: 0.7, amp: 2 do
      with_fx :echo, phase: 0.5, decay: 1, mix: 0.2 do
        sample d4k, "acoustic"
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






