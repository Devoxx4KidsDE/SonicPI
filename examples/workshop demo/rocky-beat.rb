#
# Rocky Beat by Stefan H?hn
# - Strong Beat with Guitar Power Chord -

#
# The idea was to produce a strong bass line with a random melody
# The I noticed I would love to add a bit of a rock guitar which I sampled myself with my guitar for the  :guitar block.
# (for the record here the setup: Luke 3, Kemper Amp)
#
# feel free to use the sample yourself :d4k__eguit_c
#
use_sample_pack_as '/devoxx4Kids/workshop-sonic-pi/samples', :d4k
use_debug false
use_bpm 250

song = (ring :c3,:c3,:c3,:c3, :e4,:e4, :c4,:c4, :g4, :g4,:c3,:c3)
note = :c3
live_loop :song do
  note = song.tick
  sleep 8
end

with_fx :reverb do
  live_loop :main do
    r = 0.5
    use_synth :tb303

    with_fx :lpf, cutoff: 85 do
      play_chord [note, note-12, note-24], attack: 0, release: r, amp: 2

      sleep 1
      play_chord [note, note-12, note-24], attack: 0, release: r, amp: 2
      sleep 1
    end
  end

end

live_loop :beat do
  sample :bd_haus
  sleep 2
end

live_loop :splash do
  sync :beat
  sleep 8
  with_fx :reverb, room: 0.9 do
    sample :drum_snare_hard
  end
end

with_fx :reverb, room: 0.9 do
  sync :beat
  live_loop :melody do
    use_synth :tb303

    play scale([note+12].choose, :minor, num_octaves: 2).choose, amp: 0.5, release: 0.5
    sleep 0.5

  end
end

live_loop :guitar do
  sync :beat
  with_fx :reverb, room: 0.5 do
    sample :d4k__eguit_c, start: 0.08, finish: 0.09, amp: 2
    sleep 0.5
    sample :d4k__eguit_c, start: 0.08, finish: 0.09, amp: 2
    sleep 1
    sample :d4k__eguit_c, start: 0.08, finish: 0.09, amp: 2
    sleep 0.5
    sample :d4k__eguit_c, start: 0.08, finish: 0.09, amp: 2
    sleep 0.5
    sample :d4k__eguit_c, start: 0.08, finish: 0.09, amp: 2
    sleep 0.5
    sample :d4k__eguit_c, start: 0.08, finish: 0.09, amp: 2
    sleep 0.5
    sample :d4k__eguit_c, start: 0.08, finish: 0.09, amp: 2
    sleep 1.5

    sleep 11

  end
  with_fx :reverb, room: 0.9 do
    sample :d4k__eguit_c, start: 0.08, finish: 0.2, amp: 2
    sleep 16
    sample :d4k__eguit_c, start: 0.08, finish: 0.2, amp: 3, pitch: 4
    sleep 16
    sample :d4k__eguit_c, start: 0.08, finish: 0.2, amp: 2
    sleep 16
    sample :d4k__eguit_c, start: 0.08, finish: 0.2, amp: 4, pitch: 7
    sleep 16
    sample :d4k__eguit_c, start: 0.08, finish: 0.2, amp: 2
    sleep 16
  end
end