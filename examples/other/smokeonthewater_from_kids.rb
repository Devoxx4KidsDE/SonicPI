# Jan und Tim Smoke on the water

live_loop :smoke_on_the_water do
  use_bpm 110
  with_fx :distortion, distort: 0.9, amp: 4 do
    use_synth :dsaw
    play_chord [:c4, 65]
    sleep 1
    play_chord [63, 68]
    sleep 1
    play_chord [:f4, 70]
    sleep 1.5
    
    play_chord [:c4, 65]
    sleep 1
    play_chord [63, 68]
    sleep 1
    play_chord [66, 71]
    sleep 0.5
    play_chord [:f4, 70]
    sleep 2
    
    play_chord [:c4, 65]
    sleep 1
    play_chord [63, 68]
    sleep 1
    play_chord [:f4, 70]
    sleep 1.5
    play_chord [63, 68]
    sleep 1
    play_chord [:c4, 65]
    sleep 3.5
  end
end
live_loop :bassssssss do
  use_bpm 220
  use_synth :fm
  play :f2, amp:4
  sleep 1
end

live_loop :drums do
  use_bpm 220
  sample :drum_bass_hard, amp: 8
  sleep 4
  sample :drum_bass_hard, amp: 4
  sample :drum_snare_hard, amp: 8
  sleep 4
end