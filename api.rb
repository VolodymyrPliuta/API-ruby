class AplicationController
end
class TimeLogsController < AplicationController
    #Params:
    #user_id, lotitude, longitude
    def create
        user = User.find(params[:user_id])
        clocked_in = BuildingLocation.in_buinding?(params[:latitude], params[:longitude])
        TiemLog.create(
            user: user,
            long: params[:longitude],
            lat: params[:latitude]
            current_time: DateTime.now,
            clocked_in: clocked_in
            )
        render json: {clocked_in: clocked_in}
    end
end