##
## Meant as an example the can be put together in a live demo by switching on and off several live loops
## the switching is done with the flags provided in the control-loop.
##
## The fanfare section has been taken from https://rbnrpi.wordpress.com/project-list/fun-with-sonic-pi-2-samples/
##
d4k =  '/devoxx4Kids/workshop-sonic-pi/samples'

machineOn = 0
scaleMelodyOn = 0
scaleMelody2On = 0
heartbeatOn = 0
chordsOn = 0
drumsOn = 0
clapsOn = 0
soloOn = 0
trumpetOn = 0

live_loop :control do
  heartbeatOn = 0
  clapsOn = 0
  machineOn = 0
  drumsOn = 0
  scaleMelodyOn = 0
  scaleMelody2On = 0
  chordsOn = 0
  soloOn = 0
  trumpetOn = 0
  sleep 0.2
end

live_loop :drums do
  if drumsOn == 1
    sample :sn_zome
    sleep 1
  else
    sleep 1
  end
end

live_loop :claps do
  sync :drums
  if clapsOn == 1
    with_fx(:reverb, room: 0.1, mix: 0.4) do
      #sample d4k, "clap1", amp: 5, rate: -2
      #sleep 0.25
      sample d4k, "clap1", amp: 5, rate: 1
      sleep 1
      sample d4k, "clap1", amp: 5, rate: 0.5
      sleep 0.5
      sample d4k, "clap1", amp: 5, rate: 0.5
      sleep 0.5
    end
  else
    sleep 1
  end
end

live_loop :machine do
  sync :drums
  if machineOn == 1
    sample :bass_hard_c
    sleep 1
  else
    sleep 1
  end
end

live_loop :scaleMelody do
  sync :drums
  use_bpm 480
  if scaleMelodyOn == 1
    play_pattern scale(:C, :major), amp: 1
    play_pattern scale(:C, :major).reverse, amp: 1
  else
    sleep 1
  end
end

live_loop :scaleMelody2 do
  sync :scaleMelody
  if scaleMelody2On == 1
    use_bpm 480
    play_pattern scale(:E, :major), amp: (ring 0,1).tick
  else
    sleep 1
  end
end

live_loop :heartbeat do
  sync :drums
  if heartbeatOn == 1
    sample :bd_fat, amp: 4, rate: 1.1
    sleep 0.5
    sample :bd_fat, amp: 4, rate: 1.1
    sleep 0.5
  else
    sleep 1
  end
end

live_loop :chords do
  sync :drums
  if chordsOn == 1
    with_fx :echo, mix: ring(0,1).tick, beats: ring(0, 0.5, 0.3).choose do
      with_fx :lpf, cutoff: ring(70, 90,120).choose do
        use_synth :tb303
        play_chord chord(:c4, :major), amp: 3
        sleep 1
        play_chord chord(:f4, :major), amp: 6
        sleep 1
        play_chord chord(:g4, :major), amp: 3
        sleep 2
        
        play_chord chord(:c4, :major), amp: 3
        sleep 1
        play_chord chord(:f3, :major), amp: 3
        sleep 1
        play_chord chord(:c4, :major), amp: 3
        sleep 2
        
        play_chord chord(:c4, :major), amp: 3, release: 0.5
        sleep 0.5
        play_chord chord(:c4, :major), amp: 3, release: 0.5
        sleep 0.5
        play_chord chord(:a3, :minor), amp: 3, release: 0.5
        sleep 0.25
        play_chord chord(:c4, :major), amp: 3, release: 0.5
        sleep 0.25
        play_chord chord(:a3, :minor), amp: 3, release: 0.5
        sleep 0.25
        play_chord chord(:d4, :major), amp: 3
        sleep 1
        play_chord chord(:e4, :major), amp: 3, release: 0.5
        sleep 1.25
        
        play_chord chord(:f4, :major), amp: 3, release: 0.5
        sleep 0.25
        play_chord chord(:e4, :minor), amp: 3, release: 0.5
        sleep 0.25
        play_chord chord(:d4, :major), amp: 3, release: 0.5
        sleep 0.25
        play_chord chord(:c4, :major), amp: 3, release: 0.5
        sleep 0.25
        play_chord chord(:d4, :major), amp: 3, release: 0.5
        sleep 0.5
        
        play_chord chord(:c4, :major), amp: 3
      end
    end
    sample :drum_splash_hard, amp: 6
    
    sleep 2.5
  else
    sleep 1
  end
end

live_loop :solo do
  sync :drums
  if soloOn == 1
    with_fx(:reverb, room: 0.6, mix: 0.4) do
      3.times do
        sample :guit_e_slide, amp:5, sustain: 0.2
        sleep 1
        sample :guit_e_slide, amp:5, sustain: 1, rate: 2
        sleep 3
      end
      sample :elec_bell, amp:10
      sleep 4
    end
  else
    sleep 1
  end
end

live_loop :trumpets do
  sync :chords
  if trumpetOn == 1
    trumpetsgo
  else
    sleep 1
  end
end

#trumpet fanfare using separate samples for a stacatto and a sustained trumpet
define :fanfare do |d,p|
  use_bpm 60
  with_sample_pack "C:\\\Projekte\\devoxx4Kids\\samples" do
    sample d4k, "trumpetsSus",attack: 0,sustain: 0.8,release: 0.2,amp: 3,rate: d,pan: p
    sleep 2
    3.times do
      sample d4k, "trumpetsStac",attack: 0,sustain: 0.15,release: 0.05,amp: 1,rate: d,pan: p
      sleep 0.15
    end
    sample d4k, "trumpetsSus",attack: 0,sustain: 1,release: 0.5,amp: 3,rate: d,pan: p
    sleep 1.55
  end
end

#complete fanfare with four trumpets. One sample used with four rates
#also distrubuted in stereo spectrum using the pan parameter
define :trumpetsgo do
  #add some reverberation room: sets the amount
  with_fx :reverb, room: 0.8 do
    #play seperately...
    fanfare(1,-1)
    fanfare(1.25,1)
    fanfare(1.5,-0.5)
    fanfare(2,0.5)
    #then play together using threads...
    in_thread do
      fanfare(1,-1)
    end
    in_thread do
      fanfare(1.25,1)
    end
    in_thread do
      fanfare(1.5,-0.5)
    end
    fanfare(2,0.5)
  end
end