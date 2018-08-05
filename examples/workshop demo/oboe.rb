use_bpm 60
set_volume! 10

live_loop :chords do
  sleep 0.25
end

// from https://groups.google.com/d/msg/sonic-pi/bGMcvi3PfAw/xee3sMYZCwAJ

live_loop :oboe do
  sync :chords
  with_fx(:bpf, amp: 3, pre_amp: 3, mix: 1, centre: 90, res: 0.9) do
    use_synth :beep
    with_transpose -24 do
      use_synth_defaults cutoff: 5, mod_range: 0.4, sustain: 1, mod_phase: 0.025, mod_wave: 3
      nd = [2,0.75,0.25,3] + [2,0.75,0.25,2.75] + [2,0.75,0.25,3] + [0.25,0.75,0.25,0.75,0.75,0.25,0.25,3,0.25]
      np = [:g5,:e5,:d5,:c5, :g5,:e5,:g5,:a5, :g5,:e5,:d5,:c5, :d5,:e5,:f5,:e5,:d5,:c5,:b4,:c5,:d5]
      np.zip(nd).each do |p,d|
        play p, amp: 5, cutoff: 70, decay: d/2.5, sustain: 0.05, attack: 0.25, sustain_level: 0.125, decay_level: 0.125, release: 0.05
        sleep d
      end
    end
  end
end