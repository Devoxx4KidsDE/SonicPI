# Drums
use_bpm 120
d4k = "/devoxx4kids/samples/jingle"

3.times do
  sample d4k, "drum_loop"
  sleep 4
end
sample :drum_break

