# Violin Example from Eli: https://groups.google.com/forum/#!topic/sonic-pi/bGMcvi3PfAw
use_bpm 60
xl = 0.25
l = 0.5
m = 0.75
s = 1
xs = 2

strings = (ring :c,:c3,:c,:c2,:c1,:c )
strings1 = (ring :r, :r, :c,:c3,:c,:c2,:c1,:c )


chords = [(chord :C, :minor7), (chord :Ab, :major7), (chord :Eb, :major7), (chord :Bb, "7")].ring
c = chords[0]

tracker = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
volume = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

# Bring in a loop.
define :start_loop do |i|
  tracker[i] = 1
end

# Remove a loop.
define :stop_loop do |i|
  tracker[i] = 0
end

# Reduce any particular sound loop's volume
define :decrease do |i, n |
  if volume[i] - n > 0 then
    volume[i] = volume[i] - n
  end
end

# Increase any particular sound loop's volume
define :increase do |i, n |
  if volume[i] + n < 10 then
    volume[i] = volume[i] + n
  else
  end
end

live_loop :background_strings do
  sync :piano_tinkle
  if tracker[0] > 0 then
    with_fx :echo do
      with_fx :flanger do
        use_synth_defaults amp: volume[0]*0.5, attack: 0.5, sustain: 2, release: 2
        use_synth :blade
        use_transpose 12
        play strings.tick
      end
    end
    
    sleep m
  else
    sleep 0.1
  end
end

live_loop :background_strings1 do
  sync :piano_tinkle
  if tracker[1] > 0 then
    with_fx :echo do
      with_fx :flanger do
        use_synth_defaults amp: volume[1]*0.5, attack: 0.5, sustain: 2, release: 2
        use_synth :blade
        use_transpose 36
        play strings1.tick
      end
    end
    
    sleep m
  else
    sleep 0.1
  end
end
comment do
  
  live_loop :piano_tinkle do
    if tracker[2] > 0 then
      use_octave 0
      use_synth :piano
      3.times do
        play c[0], decay: 1, sustain: 4, amp: volume[2]*0.5# play the first note of the chord
        sleep 1
      end
      play c[2],decay: 1, sustain: 4, amp: volume[2]*0.5 #if one_in(2)# play the third note of the chord
      sleep 0.5
      play c[1],decay: 1, sustain: 4, amp: volume[2]*0.5 #if one_in(3)# # play the second note of the chord
      sleep 0.5
      c = chords.tick
    else
      sleep 0.1
    end
  end
end

live_loop :piano_tinkle do
  r = [0.5, 0.6, 0.7, 0.6].choose
  if tracker[2] > 0 then
    
    use_synth :sine
    with_fx :flanger do
      with_fx :reverb do
        use_octave +2
        3.times do
          play c[0], release: 0.1, amp: volume[2], decay: 0.0125+r, sustain: r/2# play the first note of the chord
          sleep 1
        end
        play c[2], release: 0.1, amp: volume[2], decay: 0.0125+r, sustain: r/2 # play the third note of the chord
        sleep 0.5
        play c[1], release: 0.1, amp: volume[2], decay: 0.0125+r, sustain: r/2 # # play the second note of the chord
        sleep 0.5
        c = chords.tick
      end
    end
    
  end
  sleep 0.1
end




live_loop :piano_highlight do
  if tracker[3] > 0 then
    sync :piano_tinkle
    use_synth :sine
    with_fx :flanger do
      with_fx :reverb do
        use_octave +2
        r = [0.25, 0.25, 0.5, 1].choose
        with_transpose 0 do
          #   play c.choose, attack: 0, decay: 1, sustain: 2, amp: volume[3]
          play c.choose, release: 0.1, amp: volume[3], decay: 0.0125+r, sustain: r/2
          sleep 2
        end
      end
    end
  else
    sleep 0.1
  end
end

live_loop :light_drums do
  sync :piano_tinkle
  if tracker[4] > 0 then
    1. times do
      with_fx :reverb, room:1, damp: 0.7 do
        sample :drum_tom_lo_hard, rate: s, pitch_dis: 0.001, amp: volume[4]*0.5
        sleep m
        sample :drum_tom_lo_hard, rate: l, pitch_dis: 0.001, amp: volume[4]*0.5
        sleep xs
      end
      sleep m
    end
  else
    sleep 0.1
  end
end

#__________________________________________________________________________________________________
#Code ends here...
#__________________________________________________________________________________________________

tracker = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
volume = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

start_loop 0
increase 0,1
sleep 8
start_loop 1
increase 1,1
sleep 8
start_loop 3
increase 3,0.5
sleep 4
increase 3,0.5
sleep 4
start_loop 4
increase 4,1
sleep 4
increase 4,1
sleep 4
increase 4,1
sleep 4
increase 4,1
sleep 4
start_loop 2
increase 2,0.5
decrease 3,0.5
sleep 4
increase 2,0.5
sleep 8
decrease 4,1
sleep 4
decrease 4,1
sleep 4
decrease 4,1
decrease 3,0.5
sleep 4
decrease 4,1
decrease 3,0.5
sleep 32
decrease 4,1
decrease 3,0.5
sleep 4
decrease 4,1
decrease 3,0.5
decrease 2,0.5
sleep 4
stop_loop 4
decrease 3,0.5
decrease 2,0.5
sleep 4
decrease 3,0.5
sleep 4
stop_loop 3
decrease 1,1
sleep 12
stop_loop 2
decrease 1,1
sleep 8
stop_loop 1
sleep 4
stop_loop 0
