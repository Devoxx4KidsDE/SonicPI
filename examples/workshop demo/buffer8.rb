meinton = 50
hoch = 1
live_loop :immerwieder do
  if (hoch == 1) then
    meinton = meinton + 1
  end
  if (hoch == 0) then
    meinton = meinton -1
  end
  
  play meinton
  sleep 1
  
  if (meinton==55) then
    hoch = 0
  end
  if (meinton==50) then
    hoch = 1
  end
  
end


