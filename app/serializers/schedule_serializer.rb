class ScheduleSerializer
  include JSONAPI::Serializer
  attributes :title, :date, :user_id, :show_id

  def self.all_schedules(schedules)
    schedules.map { |title, date| { title: title, date: date } }
  end

  # def self.show_schedule(schedule)
  #   {
  #     data: schedule.map do |show|
  #       {
  #         type: "schedule",
  #         id: schedule.id,
  #           attributes: {
  #             first_name: show.user.first_name,
  #             last_name: show.user.last_name,
  #             show: show.show.title,
  #             artist: show.show.artist,
  #             date: show.date
  #           }
  #       }
  #     end
  #   }
  # end
end