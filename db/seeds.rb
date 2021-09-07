User.create!( { name: 'sample', email: 'sample@sample.com'} )

User.all.each do |exercise|
  user.exercises.create!( name: 'dumbel press', count: 12)
  user.exercises.create!( name: 'dumbel press', count: 12)
  user.exercises.create!( name: 'arm curl', count: 12)
  user.exercises.create!( name: 'triceps extension', count: 12)
end

Exercise.all.each do |record|
  exercise.records.create!( name_id: 'dumbel press', 
                             weight: 12,
                         reps_count: 12,
                               note: 'Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod ',
                                 RM: 12,
                               date: 2021-09-05
                          )
end
