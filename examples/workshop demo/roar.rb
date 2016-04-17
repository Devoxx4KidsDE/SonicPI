# ROAR - Katie Perry
# no copyright infringement intended - it is only meant as example for the devoxx4Kids - kids
#

d4k = '/devoxx4Kids/workshop-sonic-pi/samples'
use_bpm 90

live_loop :beat1 do
  sample :drum_bass_soft, amp: 5
  sleep 0.5
  sample :drum_bass_soft
  sleep 0.5
  
  sample :drum_bass_soft
  with_fx :hpf, cutoff: 80  do
    sample :drum_snare_soft, amp: 5
  end
  sleep 0.5
  sample :drum_bass_soft, amp: 5
  sleep 0.5
  
  sample :drum_bass_soft
  sleep 0.5
  sample :drum_bass_soft
  sleep 0.5
  
  sample :drum_bass_soft, amp: 5
  with_fx :hpf, cutoff: 80  do
    sample :drum_snare_soft, amp: 5
  end
  sleep 0.5
  sample :drum_bass_soft
  sleep 0.5
end

live_loop :beat2 do
  sleep 2.25
  
  with_fx :hpf, cutoff: 40  do
    sample :drum_bass_hard, amp: 1
    sleep 0.25
    sample :drum_bass_hard, amp: 3
    sleep 0.25
    sample :drum_bass_hard, amp: 1
    sleep 0.25
    sample :drum_bass_hard, amp: 1
    sample :drum_snare_soft, amp: 1
  end
  sleep 1
end


define :verse1 do
  use_synth :piano
  vverse1 = 3
  
  1.times do
    play_pattern_timed [:F5, :F5, :F5, :F5], [0.25,0.25,0.25,0.5], amp: vverse1
    play_pattern_timed [:D5, :D5], [0.5, 0.5], amp: vverse1
    play_pattern_timed [:C5, :C5], [0.25, 0.5], amp: vverse1
    play_pattern_timed [:As4, :As4], [0.25, 0.5], amp: vverse1
    sleep 0.25
  end
  1.times do
    sleep 0.25
    play_pattern_timed [:As4, :As4, :C5, :D5, :F5, :D5], [0.5, 0.5, 0.25, 0.5, 0.25, 1.25], amp: vverse1
  end
end

define :verse2 do
  use_synth :piano
  vverse2 = 3
  
  2.times do
    play_pattern_timed [:D5, :F5, :G5, :F5], [0.25,0.5,0.5,0.75], amp: vverse2
    play_pattern_timed [:D5, :F5, :G5, :F5], [0.25,0.5,0.5,0.25], amp: vverse2
    sample d4k, "hey"
    sleep 1.25
    play_pattern_timed [:G5, :F5, :F5, :D5, :D5, :F5, :G5, :F5], [0.5, 0.25,0.25,0.25,0.25, 0.5, 0.5, 0.5], amp: vverse2
    sleep 0.25
    play_pattern_timed [:D5, :F5, :G5, :F5], [0.25,0.5,0.5,0.75], amp: vverse2
    play_pattern_timed [:D5, :F5, :G5, :F5], [0.25,0.5,0.5,0.25], amp: vverse2
    sample d4k, "hey"
    sleep 1.25
    play_pattern_timed [:G5, :F5, :F5, :D5, :D5, :C5, :As4, :As4], [0.5, 0.25,0.25,0.25,0.25, 0.5, 0.5, 0.5], amp: vverse2
    sleep 0.25
  end
end

live_loop :back do
  use_synth :fm
  
  with_fx :distortion, distort: 0.99, amp: 0.2 do
    play :As3, release: 6
    sleep 6
    play :C4, release: 2.5
    sleep 2
    play :G3, release: 8
    sleep 8
  end
end


live_loop :pling do
  use_synth :piano
  play :F5
  play :As5
  sleep 0.5
  play :F5
  play :As5
  sleep 0.5
  play :F5
  play :As5
  sleep 0.5
  play :F5
  play :As5
  sleep 0.5
  
  play :F5
  play :c6
  sleep 0.5
  play :F5
  play :c6
  sleep 0.5
  play :F5
  play :c6
  sleep 0.5
  play :F5
  play :c6
  sleep 0.5
  
end

sleep 32
sleep 0.25
verse1
sleep 0.5
verse1
verse2