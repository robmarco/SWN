module TrainningsHelper
  
  def last_micro_volumen
<<<<<<< HEAD
    t = current_user.trainnings.last_micro
=======
    t = current_user.trainnings.where("micro = ?", current_user.trainnings.maximum("micro"))
>>>>>>> origin/master
    total=0
    t.each do |tr|
      total+= tr.volumen
    end
    total    
  end
  
  def last_micro_carga
<<<<<<< HEAD
    t = current_user.trainnings.last_micro
    total= 0
=======
    t = current_user.trainnings.where("micro = ?", current_user.trainnings.maximum("micro"))
    total=0
>>>>>>> origin/master
    t.each do |tr|
      total+= tr.carga
    end
    total
  end
  
  def last_macro_volumen
<<<<<<< HEAD
    t = current_user.trainnings.last_macro
    total= 0
=======
    t = current_user.trainnings.where("macro = ?", current_user.trainnings.maximum("macro"))
    total=0
>>>>>>> origin/master
    t.each do |tr|
      total+= tr.volumen
    end
    total
  end
  
  def last_macro_carga
<<<<<<< HEAD
    t = current_user.trainnings.last_macro
=======
    t = current_user.trainnings.where("macro = ?", current_user.trainnings.maximum("macro"))
>>>>>>> origin/master
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
  
<<<<<<< HEAD
  def volumen_or_carga_by_exercise(date, exercise_type_id, vol_or_car)
    total = 0
    current_user.trainnings.find_by_date(date).each do |t|
      if vol_or_car == "volumen"
        total += trainning_volumen(t.trainning_exercises.find_by_exercise_type(exercise_type_id))
      else
        total += trainning_carga(t.trainning_exercises.find_by_exercise_type(exercise_type_id))
=======
  def vol_trainnig_for_exercise(date, type_exercise_id, length, vol_car)
    trs = current_user.trainnings.where(:date_trainning => date).order(:date_trainning).last(length)
    total = 0
    trs.each do |t|
      if vol_car == "volumen"
        total += trainning_volumen(t.trainning_exercises.where(:exercise_type_id => type_exercise_id))
      else
        total += trainning_carga(t.trainning_exercises.where(:exercise_type_id => type_exercise_id))
>>>>>>> origin/master
      end
    end
    total
  end
  
end
