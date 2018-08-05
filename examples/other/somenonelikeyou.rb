
use_bpm 100
use_synth :hollow
use_synth_defaults amp: 3

sleep 4

live_loop :someonelikeyou do
  2.times do
    verse1
  end
  2.times do
    prechorus
  end
  2.times do
    play_chord chord(:d3,:major), release: 4
    sleep 2
  end
  2.times do
    chorus
  end
end

define :chorus do
  6.times do
    2.times do
      play_chord chord(:a3,:major), release: 4
      sleep 2
    end
    2.times do
      play_chord chord(:e3,:major), release: 4
      sleep 2
    end
    2.times do
      play_chord chord(:fs3,:minor), release: 4
      sleep 2
    end
    2.times do
      play_chord chord(:d3,:major), release: 4
      sleep 2
    end
  end
  
end

define :prechorus do
  2.times do
    play_chord chord(:e3,:major), release: 4
    sleep 2
  end
  2.times do
    play_chord chord(:fs3,:minor), release: 4
    sleep 2
  end
  4.times do
    play_chord chord(:d3,:major), release: 4
    sleep 2
  end
end

define :verse1 do
  4.times do
    play_chord chord(:a3,:major), release: 4
    sleep 2
  end
  4.times do
    play_chord [:gs2, :b3, :e4], release: 4
    sleep 2
  end
  4.times do
    play_chord chord(:fs3,:minor), release: 4
    sleep 2
  end
  4.times do
    play_chord chord(:d3,:major), release: 4
    sleep 2
  end
end

