#Acoustic Guitar

use_bpm 120
use_sample_pack "C:/devoxx4kids/samples"

2.times do
  with_fx :reverb, room: 0.7, amp: 2 do
    with_fx :echo, phase: 0.5, decay: 1, mix: 0.2 do
      sample :acoustic
    end
  end
  sleep 8
end