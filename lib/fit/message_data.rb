module Fit
  module MessageData

    @@fields = Hash.new{ |h,k| h[k]= {} }
    @@names  = Hash.new

    class << self
      def add_field(global_msg_num, field_def_num, name, options = {})
        @@fields[global_msg_num][field_def_num] = options.merge(:name => name)
      end

      def get_field(global_msg_num, field_def_num)
        @@fields[global_msg_num][field_def_num]
      end

      def add_name(global_msg_num, name)
        @@names[global_msg_num] = name
      end

      def get_name(global_msg_num)
        @@names[global_msg_num]
      end
    end

  end
end

# DATA
Fit::MessageData.add_name 0, "file_id"
Fit::MessageData.add_field 0, 0, "type", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 0, 1, "manufacturer", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 0, 2, "product", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 0, 2, "garmin_product", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 0, 3, "serial_number", :type => 12, :scale => 1, :offset => 0
Fit::MessageData.add_field 0, 4, "time_created", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 0, 5, "number", :type => 4, :scale => 1, :offset => 0

Fit::MessageData.add_name 49, "file_creator"
Fit::MessageData.add_field 49, 0, "software_version", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 49, 1, "hardware_version", :type => 2, :scale => 1, :offset => 0

Fit::MessageData.add_name 35, "software"
Fit::MessageData.add_field 35, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 35, 3, "version", :type => 4, :scale => 100, :offset => 0
Fit::MessageData.add_field 35, 5, "part_number", :type => 7, :scale => 1, :offset => 0

Fit::MessageData.add_name 1, "capabilities"
Fit::MessageData.add_field 1, 0, "languages", :type => 10, :scale => 1, :offset => 0
Fit::MessageData.add_field 1, 1, "sports", :type => 10, :scale => 1, :offset => 0
Fit::MessageData.add_field 1, 21, "workouts_supported", :type => 12, :scale => 1, :offset => 0

Fit::MessageData.add_name 37, "file_capabilities"
Fit::MessageData.add_field 37, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 37, 0, "type", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 37, 1, "flags", :type => 10, :scale => 1, :offset => 0
Fit::MessageData.add_field 37, 2, "directory", :type => 7, :scale => 1, :offset => 0
Fit::MessageData.add_field 37, 3, "max_count", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 37, 4, "max_size", :type => 6, :scale => 1, :offset => 0, :units => "bytes"

Fit::MessageData.add_name 38, "mesg_capabilities"
Fit::MessageData.add_field 38, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 38, 0, "file", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 38, 1, "mesg_num", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 38, 2, "count_type", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 38, 3, "count", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 38, 3, "num_per_file", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 38, 3, "max_per_file", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 38, 3, "max_per_file_type", :type => 4, :scale => 1, :offset => 0

Fit::MessageData.add_name 39, "field_capabilities"
Fit::MessageData.add_field 39, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 39, 0, "file", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 39, 1, "mesg_num", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 39, 2, "field_num", :type => 2, :scale => 1, :offset => 0
Fit::MessageData.add_field 39, 3, "count", :type => 4, :scale => 1, :offset => 0

Fit::MessageData.add_name 2, "device_settings"
Fit::MessageData.add_field 2, 1, "utc_offset", :type => 6, :scale => 1, :offset => 0

Fit::MessageData.add_name 3, "user_profile"
Fit::MessageData.add_field 3, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 3, 0, "friendly_name", :type => 7, :scale => 1, :offset => 0
Fit::MessageData.add_field 3, 1, "gender", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 3, 2, "age", :type => 2, :scale => 1, :offset => 0, :units => "years"
Fit::MessageData.add_field 3, 3, "height", :type => 2, :scale => 100, :offset => 0, :units => "m"
Fit::MessageData.add_field 3, 4, "weight", :type => 4, :scale => 10, :offset => 0, :units => "kg"
Fit::MessageData.add_field 3, 5, "language", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 3, 6, "elev_setting", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 3, 7, "weight_setting", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 3, 8, "resting_heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::MessageData.add_field 3, 9, "default_max_running_heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::MessageData.add_field 3, 10, "default_max_biking_heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::MessageData.add_field 3, 11, "default_max_heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::MessageData.add_field 3, 12, "hr_setting", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 3, 13, "speed_setting", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 3, 14, "dist_setting", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 3, 16, "power_setting", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 3, 17, "activity_class", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 3, 18, "position_setting", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 3, 21, "temperature_setting", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 3, 22, "local_id", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 3, 23, "global_id", :type => 13, :scale => 1, :offset => 0

Fit::MessageData.add_name 4, "hrm_profile"
Fit::MessageData.add_field 4, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 4, 0, "enabled", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 4, 1, "hrm_ant_id", :type => 11, :scale => 1, :offset => 0

Fit::MessageData.add_name 5, "sdm_profile"
Fit::MessageData.add_field 5, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 5, 0, "enabled", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 5, 1, "sdm_ant_id", :type => 11, :scale => 1, :offset => 0
Fit::MessageData.add_field 5, 2, "sdm_cal_factor", :type => 4, :scale => 10, :offset => 0, :units => "%"
Fit::MessageData.add_field 5, 3, "odometer", :type => 6, :scale => 100, :offset => 0, :units => "m"
Fit::MessageData.add_field 5, 4, "speed_source", :type => 0, :scale => 1, :offset => 0

Fit::MessageData.add_name 6, "bike_profile"
Fit::MessageData.add_field 6, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 6, 0, "name", :type => 7, :scale => 1, :offset => 0
Fit::MessageData.add_field 6, 1, "sport", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 6, 2, "sub_sport", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 6, 3, "odometer", :type => 6, :scale => 100, :offset => 0, :units => "m"
Fit::MessageData.add_field 6, 4, "bike_spd_ant_id", :type => 11, :scale => 1, :offset => 0
Fit::MessageData.add_field 6, 5, "bike_cad_ant_id", :type => 11, :scale => 1, :offset => 0
Fit::MessageData.add_field 6, 6, "bike_spdcad_ant_id", :type => 11, :scale => 1, :offset => 0
Fit::MessageData.add_field 6, 7, "bike_power_ant_id", :type => 11, :scale => 1, :offset => 0
Fit::MessageData.add_field 6, 8, "custom_wheelsize", :type => 4, :scale => 1000, :offset => 0, :units => "m"
Fit::MessageData.add_field 6, 9, "auto_wheelsize", :type => 4, :scale => 1000, :offset => 0, :units => "m"
Fit::MessageData.add_field 6, 10, "bike_weight", :type => 4, :scale => 10, :offset => 0, :units => "kg"
Fit::MessageData.add_field 6, 11, "power_cal_factor", :type => 4, :scale => 10, :offset => 0, :units => "%"
Fit::MessageData.add_field 6, 12, "auto_wheel_cal", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 6, 13, "auto_power_zero", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 6, 14, "id", :type => 2, :scale => 1, :offset => 0
Fit::MessageData.add_field 6, 15, "spd_enabled", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 6, 16, "cad_enabled", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 6, 17, "spdcad_enabled", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 6, 18, "power_enabled", :type => 0, :scale => 1, :offset => 0

Fit::MessageData.add_name 7, "zones_target"
Fit::MessageData.add_field 7, 1, "max_heart_rate", :type => 2, :scale => 1, :offset => 0
Fit::MessageData.add_field 7, 2, "threshold_heart_rate", :type => 2, :scale => 1, :offset => 0
Fit::MessageData.add_field 7, 3, "functional_threshold_power", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 7, 5, "hr_calc_type", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 7, 7, "pwr_calc_type", :type => 0, :scale => 1, :offset => 0

Fit::MessageData.add_name 12, "sport"
Fit::MessageData.add_field 12, 0, "sport", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 12, 1, "sub_sport", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 12, 3, "name", :type => 7, :scale => 1, :offset => 0

Fit::MessageData.add_name 8, "hr_zone"
Fit::MessageData.add_field 8, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 8, 1, "high_bpm", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::MessageData.add_field 8, 2, "name", :type => 7, :scale => 1, :offset => 0

Fit::MessageData.add_name 9, "power_zone"
Fit::MessageData.add_field 9, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 9, 1, "high_value", :type => 4, :scale => 1, :offset => 0, :units => "watts"
Fit::MessageData.add_field 9, 2, "name", :type => 7, :scale => 1, :offset => 0

Fit::MessageData.add_name 10, "met_zone"
Fit::MessageData.add_field 10, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 10, 1, "high_bpm", :type => 2, :scale => 1, :offset => 0
Fit::MessageData.add_field 10, 2, "calories", :type => 4, :scale => 10, :offset => 0, :units => "kcal / min"
Fit::MessageData.add_field 10, 3, "fat_calories", :type => 2, :scale => 10, :offset => 0, :units => "kcal / min"

Fit::MessageData.add_name 15, "goal"
Fit::MessageData.add_field 15, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 15, 0, "sport", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 15, 1, "sub_sport", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 15, 2, "start_date", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 15, 3, "end_date", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 15, 4, "type", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 15, 5, "value", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 15, 6, "repeat", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 15, 7, "target_value", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 15, 8, "recurrence", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 15, 9, "recurrence_value", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 15, 10, "enabled", :type => 0, :scale => 1, :offset => 0

Fit::MessageData.add_name 34, "activity"
Fit::MessageData.add_field 34, 253, "timestamp", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 34, 0, "total_timer_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::MessageData.add_field 34, 1, "num_sessions", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 34, 2, "type", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 34, 3, "event", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 34, 4, "event_type", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 34, 5, "local_timestamp", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 34, 6, "event_group", :type => 2, :scale => 1, :offset => 0

Fit::MessageData.add_name 18, "session"
Fit::MessageData.add_field 18, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 18, 253, "timestamp", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::MessageData.add_field 18, 0, "event", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 18, 1, "event_type", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 18, 2, "start_time", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 18, 3, "start_position_lat", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::MessageData.add_field 18, 4, "start_position_long", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::MessageData.add_field 18, 5, "sport", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 18, 6, "sub_sport", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 18, 7, "total_elapsed_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::MessageData.add_field 18, 8, "total_timer_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::MessageData.add_field 18, 9, "total_distance", :type => 6, :scale => 100, :offset => 0, :units => "m"
Fit::MessageData.add_field 18, 10, "total_cycles", :type => 6, :scale => 1, :offset => 0, :units => "cycles"
Fit::MessageData.add_field 18, 10, "total_strides", :type => 6, :scale => 1, :offset => 0, :units => "strides"
Fit::MessageData.add_field 18, 11, "total_calories", :type => 4, :scale => 1, :offset => 0, :units => "kcal"
Fit::MessageData.add_field 18, 13, "total_fat_calories", :type => 4, :scale => 1, :offset => 0, :units => "kcal"
Fit::MessageData.add_field 18, 14, "avg_speed", :type => 4, :scale => 1000, :offset => 0, :units => "m/s"
Fit::MessageData.add_field 18, 15, "max_speed", :type => 4, :scale => 1000, :offset => 0, :units => "m/s"
Fit::MessageData.add_field 18, 16, "avg_heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::MessageData.add_field 18, 17, "max_heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::MessageData.add_field 18, 18, "avg_cadence", :type => 2, :scale => 1, :offset => 0, :units => "rpm"
Fit::MessageData.add_field 18, 18, "avg_running_cadence", :type => 2, :scale => 1, :offset => 0, :units => "strides/min"
Fit::MessageData.add_field 18, 19, "max_cadence", :type => 2, :scale => 1, :offset => 0, :units => "rpm"
Fit::MessageData.add_field 18, 19, "max_running_cadence", :type => 2, :scale => 1, :offset => 0, :units => "strides/min"
Fit::MessageData.add_field 18, 20, "avg_power", :type => 4, :scale => 1, :offset => 0, :units => "watts"
Fit::MessageData.add_field 18, 21, "max_power", :type => 4, :scale => 1, :offset => 0, :units => "watts"
Fit::MessageData.add_field 18, 22, "total_ascent", :type => 4, :scale => 1, :offset => 0, :units => "m"
Fit::MessageData.add_field 18, 23, "total_descent", :type => 4, :scale => 1, :offset => 0, :units => "m"
Fit::MessageData.add_field 18, 24, "total_training_effect", :type => 2, :scale => 10, :offset => 0
Fit::MessageData.add_field 18, 25, "first_lap_index", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 18, 26, "num_laps", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 18, 27, "event_group", :type => 2, :scale => 1, :offset => 0
Fit::MessageData.add_field 18, 28, "trigger", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 18, 29, "nec_lat", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::MessageData.add_field 18, 30, "nec_long", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::MessageData.add_field 18, 31, "swc_lat", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::MessageData.add_field 18, 32, "swc_long", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"

Fit::MessageData.add_name 19, "lap"
Fit::MessageData.add_field 19, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 19, 253, "timestamp", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::MessageData.add_field 19, 0, "event", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 19, 1, "event_type", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 19, 2, "start_time", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 19, 3, "start_position_lat", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::MessageData.add_field 19, 4, "start_position_long", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::MessageData.add_field 19, 5, "end_position_lat", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::MessageData.add_field 19, 6, "end_position_long", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::MessageData.add_field 19, 7, "total_elapsed_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::MessageData.add_field 19, 8, "total_timer_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::MessageData.add_field 19, 9, "total_distance", :type => 6, :scale => 100, :offset => 0, :units => "m"
Fit::MessageData.add_field 19, 10, "total_cycles", :type => 6, :scale => 1, :offset => 0, :units => "cycles"
Fit::MessageData.add_field 19, 10, "total_strides", :type => 6, :scale => 1, :offset => 0, :units => "strides"
Fit::MessageData.add_field 19, 11, "total_calories", :type => 4, :scale => 1, :offset => 0, :units => "kcal"
Fit::MessageData.add_field 19, 12, "total_fat_calories", :type => 4, :scale => 1, :offset => 0, :units => "kcal"
Fit::MessageData.add_field 19, 13, "avg_speed", :type => 4, :scale => 1000, :offset => 0, :units => "m/s"
Fit::MessageData.add_field 19, 14, "max_speed", :type => 4, :scale => 1000, :offset => 0, :units => "m/s"
Fit::MessageData.add_field 19, 15, "avg_heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::MessageData.add_field 19, 16, "max_heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::MessageData.add_field 19, 17, "avg_cadence", :type => 2, :scale => 1, :offset => 0, :units => "rpm"
Fit::MessageData.add_field 19, 17, "avg_running_cadence", :type => 2, :scale => 1, :offset => 0, :units => "strides/min"
Fit::MessageData.add_field 19, 18, "max_cadence", :type => 2, :scale => 1, :offset => 0, :units => "rpm"
Fit::MessageData.add_field 19, 18, "max_running_cadence", :type => 2, :scale => 1, :offset => 0, :units => "strides/min"
Fit::MessageData.add_field 19, 19, "avg_power", :type => 4, :scale => 1, :offset => 0, :units => "watts"
Fit::MessageData.add_field 19, 20, "max_power", :type => 4, :scale => 1, :offset => 0, :units => "watts"
Fit::MessageData.add_field 19, 21, "total_ascent", :type => 4, :scale => 1, :offset => 0, :units => "m"
Fit::MessageData.add_field 19, 22, "total_descent", :type => 4, :scale => 1, :offset => 0, :units => "m"
Fit::MessageData.add_field 19, 23, "intensity", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 19, 24, "lap_trigger", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 19, 25, "sport", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 19, 26, "event_group", :type => 2, :scale => 1, :offset => 0

Fit::MessageData.add_name 20, "record"
Fit::MessageData.add_field 20, 253, "timestamp", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::MessageData.add_field 20, 0, "position_lat", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::MessageData.add_field 20, 1, "position_long", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::MessageData.add_field 20, 2, "altitude", :type => 4, :scale => 5, :offset => 500, :units => "m"
Fit::MessageData.add_field 20, 3, "heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::MessageData.add_field 20, 4, "cadence", :type => 2, :scale => 1, :offset => 0, :units => "rpm"
Fit::MessageData.add_field 20, 5, "distance", :type => 6, :scale => 100, :offset => 0, :units => "m"
Fit::MessageData.add_field 20, 6, "speed", :type => 4, :scale => 1000, :offset => 0, :units => "m/s"
Fit::MessageData.add_field 20, 7, "power", :type => 4, :scale => 1, :offset => 0, :units => "watts"
Fit::MessageData.add_field 20, 8, "compressed_speed_distance", :type => 13, :scale => 1, :offset => 0
Fit::MessageData.add_field 20, 9, "grade", :type => 3, :scale => 100, :offset => 0, :units => "%"
Fit::MessageData.add_field 20, 10, "resistance", :type => 2, :scale => 1, :offset => 0
Fit::MessageData.add_field 20, 11, "time_from_course", :type => 5, :scale => 1000, :offset => 0, :units => "s"
Fit::MessageData.add_field 20, 12, "cycle_length", :type => 2, :scale => 100, :offset => 0, :units => "m"
Fit::MessageData.add_field 20, 13, "temperature", :type => 1, :scale => 1, :offset => 0, :units => "C"

Fit::MessageData.add_name 21, "event"
Fit::MessageData.add_field 21, 253, "timestamp", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::MessageData.add_field 21, 0, "event", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 21, 1, "event_type", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 21, 2, "data16", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 21, 3, "data", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 21, 3, "timer_trigger", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 21, 3, "course_point_index", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 21, 3, "battery_level", :type => 6, :scale => 1000, :offset => 0, :units => "V"
Fit::MessageData.add_field 21, 3, "virtual_partner_speed", :type => 6, :scale => 1000, :offset => 0, :units => "m/s"
Fit::MessageData.add_field 21, 3, "hr_high_alert", :type => 6, :scale => 1, :offset => 0, :units => "bpm"
Fit::MessageData.add_field 21, 3, "hr_low_alert", :type => 6, :scale => 1, :offset => 0, :units => "bpm"
Fit::MessageData.add_field 21, 3, "speed_high_alert", :type => 6, :scale => 1000, :offset => 0, :units => "m/s"
Fit::MessageData.add_field 21, 3, "speed_low_alert", :type => 6, :scale => 1000, :offset => 0, :units => "m/s"
Fit::MessageData.add_field 21, 3, "cad_high_alert", :type => 6, :scale => 1, :offset => 0, :units => "rpm"
Fit::MessageData.add_field 21, 3, "cad_low_alert", :type => 6, :scale => 1, :offset => 0, :units => "rpm"
Fit::MessageData.add_field 21, 3, "power_high_alert", :type => 6, :scale => 1, :offset => 0, :units => "watts"
Fit::MessageData.add_field 21, 3, "power_low_alert", :type => 6, :scale => 1, :offset => 0, :units => "watts"
Fit::MessageData.add_field 21, 3, "time_duration_alert", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::MessageData.add_field 21, 3, "distance_duration_alert", :type => 6, :scale => 100, :offset => 0, :units => "m"
Fit::MessageData.add_field 21, 3, "calorie_duration_alert", :type => 6, :scale => 1, :offset => 0, :units => "calories"
Fit::MessageData.add_field 21, 3, "fitness_equipment_state", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 21, 4, "event_group", :type => 2, :scale => 1, :offset => 0

Fit::MessageData.add_name 23, "device_info"
Fit::MessageData.add_field 23, 253, "timestamp", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::MessageData.add_field 23, 0, "device_index", :type => 2, :scale => 1, :offset => 0
Fit::MessageData.add_field 23, 1, "device_type", :type => 2, :scale => 1, :offset => 0
Fit::MessageData.add_field 23, 2, "manufacturer", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 23, 3, "serial_number", :type => 12, :scale => 1, :offset => 0
Fit::MessageData.add_field 23, 4, "product", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 23, 5, "software_version", :type => 4, :scale => 100, :offset => 0
Fit::MessageData.add_field 23, 6, "hardware_version", :type => 2, :scale => 1, :offset => 0
Fit::MessageData.add_field 23, 7, "cum_operating_time", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::MessageData.add_field 23, 10, "battery_voltage", :type => 4, :scale => 256, :offset => 0, :units => "V"
Fit::MessageData.add_field 23, 11, "battery_status", :type => 2, :scale => 1, :offset => 0

Fit::MessageData.add_name 31, "course"
Fit::MessageData.add_field 31, 4, "sport", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 31, 5, "name", :type => 7, :scale => 1, :offset => 0
Fit::MessageData.add_field 31, 6, "capabilities", :type => 12, :scale => 1, :offset => 0

Fit::MessageData.add_name 32, "course_point"
Fit::MessageData.add_field 32, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 32, 1, "timestamp", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 32, 2, "position_lat", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::MessageData.add_field 32, 3, "position_long", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::MessageData.add_field 32, 4, "distance", :type => 6, :scale => 100, :offset => 0, :units => "m"
Fit::MessageData.add_field 32, 5, "type", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 32, 6, "name", :type => 7, :scale => 1, :offset => 0

Fit::MessageData.add_name 26, "workout"
Fit::MessageData.add_field 26, 4, "sport", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 26, 5, "capabilities", :type => 12, :scale => 1, :offset => 0
Fit::MessageData.add_field 26, 6, "num_valid_steps", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 26, 8, "wkt_name", :type => 7, :scale => 1, :offset => 0

Fit::MessageData.add_name 27, "workout_step"
Fit::MessageData.add_field 27, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 27, 0, "wkt_step_name", :type => 7, :scale => 1, :offset => 0
Fit::MessageData.add_field 27, 1, "duration_type", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 27, 2, "duration_value", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 27, 2, "duration_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::MessageData.add_field 27, 2, "duration_distance", :type => 6, :scale => 100, :offset => 0, :units => "m"
Fit::MessageData.add_field 27, 2, "duration_hr", :type => 6, :scale => 1, :offset => 0, :units => "% or bpm"
Fit::MessageData.add_field 27, 2, "duration_calories", :type => 6, :scale => 1, :offset => 0, :units => "calories"
Fit::MessageData.add_field 27, 2, "duration_step", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 27, 2, "duration_power", :type => 6, :scale => 1, :offset => 0, :units => "% or watts"
Fit::MessageData.add_field 27, 3, "target_type", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 27, 4, "target_value", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 27, 4, "target_hr_zone", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 27, 4, "target_power_zone", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 27, 4, "repeat_steps", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 27, 4, "repeat_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::MessageData.add_field 27, 4, "repeat_distance", :type => 6, :scale => 100, :offset => 0, :units => "m"
Fit::MessageData.add_field 27, 4, "repeat_calories", :type => 6, :scale => 1, :offset => 0, :units => "calories"
Fit::MessageData.add_field 27, 4, "repeat_hr", :type => 6, :scale => 1, :offset => 0, :units => "% or bpm"
Fit::MessageData.add_field 27, 4, "repeat_power", :type => 6, :scale => 1, :offset => 0, :units => "% or watts"
Fit::MessageData.add_field 27, 5, "custom_target_value_low", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 27, 5, "custom_target_speed_low", :type => 6, :scale => 1000, :offset => 0, :units => "m/s"
Fit::MessageData.add_field 27, 5, "custom_target_heart_rate_low", :type => 6, :scale => 1, :offset => 0, :units => "% or bpm"
Fit::MessageData.add_field 27, 5, "custom_target_cadence_low", :type => 6, :scale => 1, :offset => 0, :units => "rpm"
Fit::MessageData.add_field 27, 5, "custom_target_power_low", :type => 6, :scale => 1, :offset => 0, :units => "% or watts"
Fit::MessageData.add_field 27, 6, "custom_target_value_high", :type => 6, :scale => 1, :offset => 0
Fit::MessageData.add_field 27, 6, "custom_target_speed_high", :type => 6, :scale => 1000, :offset => 0, :units => "m/s"
Fit::MessageData.add_field 27, 6, "custom_target_heart_rate_high", :type => 6, :scale => 1, :offset => 0, :units => "% or bpm"
Fit::MessageData.add_field 27, 6, "custom_target_cadence_high", :type => 6, :scale => 1, :offset => 0, :units => "rpm"
Fit::MessageData.add_field 27, 6, "custom_target_power_high", :type => 6, :scale => 1, :offset => 0, :units => "% or watts"
Fit::MessageData.add_field 27, 7, "intensity", :type => 0, :scale => 1, :offset => 0

Fit::MessageData.add_name 33, "totals"
Fit::MessageData.add_field 33, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::MessageData.add_field 33, 253, "timestamp", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::MessageData.add_field 33, 0, "timer_time", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::MessageData.add_field 33, 1, "distance", :type => 6, :scale => 1, :offset => 0, :units => "m"
Fit::MessageData.add_field 33, 2, "calories", :type => 6, :scale => 1, :offset => 0, :units => "kcal"
Fit::MessageData.add_field 33, 3, "sport", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 33, 4, "elapsed_time", :type => 6, :scale => 1, :offset => 0, :units => "s"

Fit::MessageData.add_name 30, "weight_scale"
Fit::MessageData.add_field 30, 253, "timestamp", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::MessageData.add_field 30, 0, "weight", :type => 4, :scale => 100, :offset => 0, :units => "kg"
Fit::MessageData.add_field 30, 1, "percent_fat", :type => 4, :scale => 100, :offset => 0, :units => "%"
Fit::MessageData.add_field 30, 2, "percent_hydration", :type => 4, :scale => 100, :offset => 0, :units => "%"
Fit::MessageData.add_field 30, 3, "visceral_fat_mass", :type => 4, :scale => 100, :offset => 0, :units => "kg"
Fit::MessageData.add_field 30, 4, "bone_mass", :type => 4, :scale => 100, :offset => 0, :units => "kg"
Fit::MessageData.add_field 30, 5, "muscle_mass", :type => 4, :scale => 100, :offset => 0, :units => "kg"
Fit::MessageData.add_field 30, 7, "basal_met", :type => 4, :scale => 4, :offset => 0, :units => "kcal/day"
Fit::MessageData.add_field 30, 8, "physique_rating", :type => 2, :scale => 1, :offset => 0
Fit::MessageData.add_field 30, 9, "active_met", :type => 4, :scale => 4, :offset => 0, :units => "kcal/day"
Fit::MessageData.add_field 30, 10, "metabolic_age", :type => 2, :scale => 1, :offset => 0, :units => "years"
Fit::MessageData.add_field 30, 11, "visceral_fat_rating", :type => 2, :scale => 1, :offset => 0
Fit::MessageData.add_field 30, 12, "user_profile_index", :type => 4, :scale => 1, :offset => 0

Fit::MessageData.add_name 51, "blood_pressure"
Fit::MessageData.add_field 51, 253, "timestamp", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::MessageData.add_field 51, 0, "systolic_pressure", :type => 4, :scale => 1, :offset => 0, :units => "mmHg"
Fit::MessageData.add_field 51, 1, "diastolic_pressure", :type => 4, :scale => 1, :offset => 0, :units => "mmHg"
Fit::MessageData.add_field 51, 2, "mean_arterial_pressure", :type => 4, :scale => 1, :offset => 0, :units => "mmHg"
Fit::MessageData.add_field 51, 3, "map_3_sample_mean", :type => 4, :scale => 1, :offset => 0, :units => "mmHg"
Fit::MessageData.add_field 51, 4, "map_morning_values", :type => 4, :scale => 1, :offset => 0, :units => "mmHg"
Fit::MessageData.add_field 51, 5, "map_evening_values", :type => 4, :scale => 1, :offset => 0, :units => "mmHg"
Fit::MessageData.add_field 51, 6, "heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::MessageData.add_field 51, 7, "heart_rate_type", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 51, 8, "status", :type => 0, :scale => 1, :offset => 0
Fit::MessageData.add_field 51, 9, "user_profile_index", :type => 4, :scale => 1, :offset => 0
