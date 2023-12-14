def store(id, bleeding, media, trigger, play)
  p id.class
end

class Task

  def initialize (params)
    bleeding = params[:bleeding] ||= false
    media = params[:media] ||= :a0
    trigger = params[:trigger] ||= :mouseclick
    play = params[:play] ||= 0
    id = params[:id] ||= "id_#{rand}"
    store(id, bleeding, media, trigger, play)
  end

end

# Task.new({
#            media: nil, # send media Id
#            trigger: :mousedown,
#            id: :my_action,
#            play: { after: 10, from: 2, to: 50, trig: [:video1] },
#            pause: { after: 0, from: 0 },
#            stop: { after: 80, trig: [:a80] },
#            bleeding: 5,
#            markers: { m01: { at: 50, trig: :a45 },
#                       m02: { at: 70, trig: :a80 } } })
# trim: {in: 5, out: 33},
# mousedown: [{ from: 5, to: 40, play: :a_41 }, { from: 55, to: 60, play: :a_43 }],
# mouseup: { from: 5, to: 20, stop: :a_41 })
# Limitation impossible to send some params to the distant run task :
# play: { after: 10, from: 2, to: 50, start: %i[self my_video a06], transition: { type: :fade, duration: 5 } },
# => the effect fade wint be send to : my_video a06
# or            markers: { m01: { at: 50, start: [:a45] }, m02: { at: 70, start: [:a80] , transition: {type: :fade, duration: 5} } } } # action on markers
Task.new({
           author: 'mylene',
           id: :my_action, # current ID
           data: nil,
           mousedown: { start: [self, :a71] }, # arm targeted  new_schedule ids
           mouseup: { start: [self, :a71], stop: [self, :a77] }, # arm targeted  new_schedule ids
           mouseclick: { start: [self, :a71] }, # arm targeted  new_schedule ids
           drag: { send: { a80: { volume: {event: :x} } } }, # arm targeted  new_schedule ids
           play: { after: 10, from: 2, to: 50, start: %i[self my_video a06], transition: { type: :fade, duration: 5 }, send: {a80: {volume: 30, }} }, # play action params
           pause: { after: 0, from: 0 }, # pause action params
           stop: { after: 80, start: [:next_action] }, stop: [:my_video], # stop action params, note that it also stop the video
           # (do we have to stop all run medias suing something like : stop: [:all])
           bleeding: 5, # when a new action stop the current one  ()
           markers: { m01: { at: 50, start: :a45 }, m02: { at: 70, start: :a80, mouseclick: { start: [self, :a71] } } } } # action on markers
)

Task.new({
           id: :my_video, # current ID
           data: './medias/videos/super.mp4',
           mousedown: { start: [self, :a71] }, # arm targeted  new_schedule ids
           mouseup: { start: [self, :a71], stop: [self, :a71] }, # arm targeted  new_schedule ids
           mouseclick: { start: [self, :a71] }, # arm targeted  new_schedule ids
           play: { after: 10, from: 2, to: 50, start: %i[self a06], stop: %i[prev a32] }, # play action params
           pause: { after: 0, from: 0 }, # pause action params
           stop: { after: 80, start: [:next_action] }, # stop action params
           repeat: 3,
           bleeding: {duration: :end, transition: {type: :fade, duration: 5}}, # when a new action stop the current one  ()
           markers: { m01: { at: 50, start: [:a45] }, m02: { at: 70, stop: [:a80 ]}, mousedown: { start: [self, :a71] } } } # action on markers
)

Task.new({
           id: :next_action, # current ID
           data: './medias/videos/super.mp4',
           mousedown: { start: [self, :a71] }, # arm targeted  new_schedule ids
           mouseup: { start: [self, :a71], stop: [self, :a71] }, # arm targeted  new_schedule ids
           mouseclick: { start: [self, :a71] }, # arm targeted  new_schedule ids
           play: { after: 10, from: 2, to: 50, start: %i[self a06], stop: %i[prev a32] }, # play action params
           pause: { after: 0, from: 0 }, # pause action params
           stop: { after: 80, start: [:a80] }, # stop action params
           bleeding: 5, # when a new action stop the current one  ()
           markers: { m01: { at: 50, start: [:a45] }, m02: { at: 70, start: [:a80] , transition: {type: :fade, duration: 5} } } } # action on markers
)





