use_bpm 400

live_loop :immerwieder do
  
  with_fx :distortion, distort: 0.9 do
    for meinton in 50..65
      play meinton
      sleep 1
    end
    
    for meinton in 55..70
      play meinton
      sleep 1
    end
    
    for meinton in 60..75
      play meinton
      sleep 1
    end
    
    for meinton in 65..80
      play meinton
      sleep 1
    end
    
    for meinton in 70..85
      play meinton
      sleep 1
    end
    
    for meinton in 75..90
      play meinton
      sleep 1
    end
    
    for meinton in 80..95
      play meinton
      sleep 1
    end
    
    for meinton in 85..95
      play meinton
      sleep 1
    end
    
    for meinton in 90..100
      play meinton
      sleep 1
    end
  end
end
