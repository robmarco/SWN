module TrainningsHelper
  # ==========================================================
  # NAME: volumen_by_micro
  # RETURNS: array of foo objects (date, volumen, carga, hash)
  #   Devuelve un array con el volumen de cada microciclo 
  # PARAMETERS:
  #   trainnings - Array with Trainings 
  # ==========================================================
  def volumen_by_micro(trainnings)
    foo = Struct.new(:date, :volumen, :carga, :vol_ex, :car_ex )
    
    if trainnings == []
      return []
    else
      # Initialize
      a = []

      # Return an array with trainnings by week
      t = trainnings.group_by { |tr| tr.date_trainning.beginning_of_week }.sort
      
      # Each date could contain 1..many trainnings. 
      t.sort.each do |date, trainings|
        volumen = trainning_volumen(trainings)
        carga = trainning_carga(trainings)
        vol_ex = volumen_by_exercise(trainings)
        car_ex = carga_by_exercise(trainings)
        a.push foo.new(date, volumen, carga, vol_ex, car_ex)
      end

      (t.first[0].beginning_of_week..a.last.date.beginning_of_week).step(7) do |date|
        # Anade un micro con volumen 0 si previamente ese micro no existe en el array
        a.push( foo.new(date,0, 0, volumen_by_exercise([]), carga_by_exercise([])) ) if a.find_all { |e| e.date==date }.empty?
      end
      
      a.map { |v| v.date=v.date.to_datetime.to_i*1000 }
      a.sort_by(&:date)
    end
  end
# ==========================================================
# NAME: volumen_of_micro_by_day
# RETURNS: Returns an array with current micro volumen by day
# => and by exercise
# PARAMETERS: 
# ==========================================================
  def volumen_of_micro_by_day(trainnings_of_micro)
    foo = Struct.new(:date, :volumen, :vol_ex)
    a = []
    t = trainnings_of_micro.group_by(&:date_trainning)
    t.sort.each do |date, trainings|
      volumen = trainning_volumen(trainings)
      vol_ex = volumen_by_exercise(trainings)
      a.push foo.new(date.cwday, volumen, vol_ex)
    end
    a
  end

  # ==========================================================
  # NAME: trainning_volumen/carga
  # RETURNS: total volumen/carga of a training list
  # PARAMETERS:
  #   entrenos - training list
  # ==========================================================
  # Volumen for a training list
  def trainning_volumen(entrenos)
    entrenos.map(&:volumen).reduce(:+) || 0
  end
  
  # Carga for a training list
  def trainning_carga(entrenos)
    entrenos.map(&:carga).reduce(:+) || 0
  end

  def volumen_by_exercise(trainings)
    h = Hash.new
    ex = ExerciseType.select(:id).map(&:id).each {|v| h[v]=0 }

    ex.each do |ex_id|
      trainings.each do |t|
        h[ex_id] += t.trainning_exercises.find_by_exercise_type(ex_id).map(&:volumen).reduce(:+) || 0
      end
    end
    h
  end

  def carga_by_exercise(trainings)
    h = Hash.new
    ex = ExerciseType.select(:id).map(&:id).each {|v| h[v]=0 }

    ex.each do |ex_id|
      trainings.each do |t|
        h[ex_id] += t.trainning_exercises.find_by_exercise_type(ex_id).map(&:carga).reduce(:+) || 0
      end
    end
    h
  end

  # ==========================================================
  # NAME: percent_of
  # RETURNS: Percent of a num
  # PARAMETERS:
  #   num - numerator ; div - divided by (total)
  # ==========================================================
  def percent_of(num, div)
    if num==0 or div==0
      "0%"
    else
      "#{(num/div.to_f*100).round(2)}%"
    end
  end

  # ========================================== NOT USED =====
  # NAME: array_date_volumen_carga
  # RETURNS: array with [day in secs, volumen_by_date, carga_by_date]
  # PARAMETERS:
  #   none
  # ========================================================== 
  # def array_date_volumen_carga
  #   a = []
  #   first_day = Trainning.first_trainning(current_user).date_trainning
  #   last_day  = Trainning.last_trainning(current_user).date_trainning

  #   first_day.upto(last_day) do |day|
  #     a.push [  (day.to_datetime.to_i) * 1000, 
  #               Trainning.volumen_by_date(current_user,day),
  #               Trainning.carga_by_date(current_user,day)
  #             ]
  #   end 
  #   a
  # end
end
