module TrainningsHelper
 
 # array_date_volumen: Return an array with [day in secs, volumen_by_date]
  def array_date_volumen_carga
    a = []
    first_day = Trainning.first_trainning(current_user).date_trainning
    last_day  = Trainning.last_trainning(current_user).date_trainning

    first_day.upto(last_day) do |day|
      a.push [  (day.to_datetime.to_i) * 1000, 
                Trainning.volumen_by_date(current_user,day),
                Trainning.carga_by_date(current_user,day)
              ]
    end 
    a
  end

  # ---------------------------------------------------------

  def last_micro_volumen
    t = current_user.trainnings.last_micro
    total=0
    t.each do |tr|
      total+= tr.volumen
    end
    total    
  end
  
  def last_micro_carga
    t = current_user.trainnings.last_micro
    total= 0
    t.each do |tr|
      total+= tr.carga
    end
    total
  end
  
  def last_macro_volumen
    t = current_user.trainnings.last_macro
    total= 0
    t.each do |tr|
      total+= tr.volumen
    end
    total
  end
  
  def last_macro_carga
    t = current_user.trainnings.last_macro
    total=0
    t.each do |tr|
      total+= tr.carga
    end
    total
  end
  
  # Trainning list volumen --------------
  def trainning_volumen(entrenos)
    total = 0
    entrenos.each do |e|
      total+= e.volumen
    end
    total
  end
  
  # Trainning list carga ----------------
  def trainning_carga(entrenos)
    total = 0
    entrenos.each do |e|
      total+= e.carga
    end
    total
  end
  
  def volumen_or_carga_by_exercise(date, exercise_type_id, vol_or_car)
    total = 0
    current_user.trainnings.find_by_date(date).each do |t|
      if vol_or_car == "volumen"
        total += trainning_volumen(t.trainning_exercises.find_by_exercise_type(exercise_type_id))
      else
        total += trainning_carga(t.trainning_exercises.find_by_exercise_type(exercise_type_id))
      end
    end
    total
  end
  
end
