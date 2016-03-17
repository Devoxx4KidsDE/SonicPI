#
# Dies ist mehr oder weniger das Ergebnis, wenn man die verschiedene Buffer des Workshops kombiniert
# This is more or less the final outcome of the workshop if you combine the buffers together
#
# produced by Stefan Höhn und Irene Höppner for the devoxx4kids Wiesbaden @ AOE GmbH
#

live_loop :melodie do
  sample :guit_em9
  sleep 2
end

live_loop :schlagzeug do
  use_bpm 120
  sample :bd_haus
  sleep 1
  sample :sn_zome
  sleep 1
end

live_loop :diddel do
  use_bpm 240
  play scale(:e4, :minor).choose, amp: 2
  sleep 1
end

live_loop :tonleiter do
  use_bpm 480
  use_synth :piano
  play_pattern scale(:e4, :minor), amp: 1
  play_pattern scale(:e4, :minor).reverse, amp: 1
end