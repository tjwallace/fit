module Fit
  class File
    module Definitions

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
end

# DATA
Fit::File::Definitions.add_name 0, "file_id"
Fit::File::Definitions.add_field 0, 0, "type", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 0, 1, "manufacturer", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 0, 2, "product", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 0, 2, "garmin_product", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 0, 3, "serial_number", :type => 12, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 0, 4, "time_created", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 0, 5, "number", :type => 4, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 49, "file_creator"
Fit::File::Definitions.add_field 49, 0, "software_version", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 49, 1, "hardware_version", :type => 2, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 35, "software"
Fit::File::Definitions.add_field 35, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 35, 3, "version", :type => 4, :scale => 100, :offset => 0
Fit::File::Definitions.add_field 35, 5, "part_number", :type => 7, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 1, "capabilities"
Fit::File::Definitions.add_field 1, 0, "languages", :type => 10, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 1, 1, "sports", :type => 10, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 1, 21, "workouts_supported", :type => 12, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 1, 23, "connectivity_supported", :type => 12, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 37, "file_capabilities"
Fit::File::Definitions.add_field 37, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 37, 0, "type", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 37, 1, "flags", :type => 10, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 37, 2, "directory", :type => 7, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 37, 3, "max_count", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 37, 4, "max_size", :type => 6, :scale => 1, :offset => 0, :units => "bytes"

Fit::File::Definitions.add_name 38, "mesg_capabilities"
Fit::File::Definitions.add_field 38, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 38, 0, "file", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 38, 1, "mesg_num", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 38, 2, "count_type", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 38, 3, "count", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 38, 3, "num_per_file", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 38, 3, "max_per_file", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 38, 3, "max_per_file_type", :type => 4, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 39, "field_capabilities"
Fit::File::Definitions.add_field 39, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 39, 0, "file", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 39, 1, "mesg_num", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 39, 2, "field_num", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 39, 3, "count", :type => 4, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 2, "device_settings"
Fit::File::Definitions.add_field 2, 0, "active_time_zone", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 2, 1, "utc_offset", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 2, 5, "time_zone_offset", :type => 1, :scale => 4, :offset => 0, :units => "hr"

Fit::File::Definitions.add_name 3, "user_profile"
Fit::File::Definitions.add_field 3, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 3, 0, "friendly_name", :type => 7, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 3, 1, "gender", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 3, 2, "age", :type => 2, :scale => 1, :offset => 0, :units => "years"
Fit::File::Definitions.add_field 3, 3, "height", :type => 2, :scale => 100, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 3, 4, "weight", :type => 4, :scale => 10, :offset => 0, :units => "kg"
Fit::File::Definitions.add_field 3, 5, "language", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 3, 6, "elev_setting", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 3, 7, "weight_setting", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 3, 8, "resting_heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::File::Definitions.add_field 3, 9, "default_max_running_heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::File::Definitions.add_field 3, 10, "default_max_biking_heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::File::Definitions.add_field 3, 11, "default_max_heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::File::Definitions.add_field 3, 12, "hr_setting", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 3, 13, "speed_setting", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 3, 14, "dist_setting", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 3, 16, "power_setting", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 3, 17, "activity_class", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 3, 18, "position_setting", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 3, 21, "temperature_setting", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 3, 22, "local_id", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 3, 23, "global_id", :type => 13, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 3, 30, "height_setting", :type => 0, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 4, "hrm_profile"
Fit::File::Definitions.add_field 4, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 4, 0, "enabled", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 4, 1, "hrm_ant_id", :type => 11, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 5, "sdm_profile"
Fit::File::Definitions.add_field 5, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 5, 0, "enabled", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 5, 1, "sdm_ant_id", :type => 11, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 5, 2, "sdm_cal_factor", :type => 4, :scale => 10, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 5, 3, "odometer", :type => 6, :scale => 100, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 5, 4, "speed_source", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 5, 5, "sdm_ant_id_trans_type", :type => 10, :scale => 1, :offset => 1
Fit::File::Definitions.add_field 5, 7, "odometer_rollover", :type => 2, :scale => 1, :offset => 1

Fit::File::Definitions.add_name 6, "bike_profile"
Fit::File::Definitions.add_field 6, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 6, 0, "name", :type => 7, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 6, 1, "sport", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 6, 2, "sub_sport", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 6, 3, "odometer", :type => 6, :scale => 100, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 6, 4, "bike_spd_ant_id", :type => 11, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 6, 5, "bike_cad_ant_id", :type => 11, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 6, 6, "bike_spdcad_ant_id", :type => 11, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 6, 7, "bike_power_ant_id", :type => 11, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 6, 8, "custom_wheelsize", :type => 4, :scale => 1000, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 6, 9, "auto_wheelsize", :type => 4, :scale => 1000, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 6, 10, "bike_weight", :type => 4, :scale => 10, :offset => 0, :units => "kg"
Fit::File::Definitions.add_field 6, 11, "power_cal_factor", :type => 4, :scale => 10, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 6, 12, "auto_wheel_cal", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 6, 13, "auto_power_zero", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 6, 14, "id", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 6, 15, "spd_enabled", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 6, 16, "cad_enabled", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 6, 17, "spdcad_enabled", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 6, 18, "power_enabled", :type => 0, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 7, "zones_target"
Fit::File::Definitions.add_field 7, 1, "max_heart_rate", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 7, 2, "threshold_heart_rate", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 7, 3, "functional_threshold_power", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 7, 5, "hr_calc_type", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 7, 7, "pwr_calc_type", :type => 0, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 12, "sport"
Fit::File::Definitions.add_field 12, 0, "sport", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 12, 1, "sub_sport", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 12, 3, "name", :type => 7, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 8, "hr_zone"
Fit::File::Definitions.add_field 8, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 8, 1, "high_bpm", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::File::Definitions.add_field 8, 2, "name", :type => 7, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 9, "power_zone"
Fit::File::Definitions.add_field 9, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 9, 1, "high_value", :type => 4, :scale => 1, :offset => 0, :units => "watts"
Fit::File::Definitions.add_field 9, 2, "name", :type => 7, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 10, "met_zone"
Fit::File::Definitions.add_field 10, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 10, 1, "high_bpm", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 10, 2, "calories", :type => 4, :scale => 10, :offset => 0, :units => "kcal / min"
Fit::File::Definitions.add_field 10, 3, "fat_calories", :type => 2, :scale => 10, :offset => 0, :units => "kcal / min"

Fit::File::Definitions.add_name 15, "goal"
Fit::File::Definitions.add_field 15, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 15, 0, "sport", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 15, 1, "sub_sport", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 15, 2, "start_date", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 15, 3, "end_date", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 15, 4, "type", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 15, 5, "value", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 15, 6, "repeat", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 15, 7, "target_value", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 15, 8, "recurrence", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 15, 9, "recurrence_value", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 15, 10, "enabled", :type => 0, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 34, "activity"
Fit::File::Definitions.add_field 34, 253, "timestamp", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 34, 0, "total_timer_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 34, 1, "num_sessions", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 34, 2, "type", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 34, 3, "event", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 34, 4, "event_type", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 34, 5, "local_timestamp", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 34, 6, "event_group", :type => 2, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 18, "session"
Fit::File::Definitions.add_field 18, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 18, 253, "timestamp", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 18, 0, "event", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 18, 1, "event_type", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 18, 2, "start_time", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 18, 3, "start_position_lat", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::File::Definitions.add_field 18, 4, "start_position_long", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::File::Definitions.add_field 18, 5, "sport", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 18, 6, "sub_sport", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 18, 7, "total_elapsed_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 18, 8, "total_timer_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 18, 9, "total_distance", :type => 6, :scale => 100, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 18, 10, "total_cycles", :type => 6, :scale => 1, :offset => 0, :units => "cycles"
Fit::File::Definitions.add_field 18, 10, "total_strides", :type => 6, :scale => 1, :offset => 0, :units => "strides"
Fit::File::Definitions.add_field 18, 11, "total_calories", :type => 4, :scale => 1, :offset => 0, :units => "kcal"
Fit::File::Definitions.add_field 18, 13, "total_fat_calories", :type => 4, :scale => 1, :offset => 0, :units => "kcal"
Fit::File::Definitions.add_field 18, 14, "avg_speed", :type => 4, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 18, 15, "max_speed", :type => 4, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 18, 16, "avg_heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::File::Definitions.add_field 18, 17, "max_heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::File::Definitions.add_field 18, 18, "avg_cadence", :type => 2, :scale => 1, :offset => 0, :units => "rpm"
Fit::File::Definitions.add_field 18, 18, "avg_running_cadence", :type => 2, :scale => 1, :offset => 0, :units => "strides/min"
Fit::File::Definitions.add_field 18, 19, "max_cadence", :type => 2, :scale => 1, :offset => 0, :units => "rpm"
Fit::File::Definitions.add_field 18, 19, "max_running_cadence", :type => 2, :scale => 1, :offset => 0, :units => "strides/min"
Fit::File::Definitions.add_field 18, 20, "avg_power", :type => 4, :scale => 1, :offset => 0, :units => "watts"
Fit::File::Definitions.add_field 18, 21, "max_power", :type => 4, :scale => 1, :offset => 0, :units => "watts"
Fit::File::Definitions.add_field 18, 22, "total_ascent", :type => 4, :scale => 1, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 18, 23, "total_descent", :type => 4, :scale => 1, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 18, 24, "total_training_effect", :type => 2, :scale => 10, :offset => 0
Fit::File::Definitions.add_field 18, 25, "first_lap_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 18, 26, "num_laps", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 18, 27, "event_group", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 18, 28, "trigger", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 18, 29, "nec_lat", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::File::Definitions.add_field 18, 30, "nec_long", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::File::Definitions.add_field 18, 31, "swc_lat", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::File::Definitions.add_field 18, 32, "swc_long", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::File::Definitions.add_field 18, 34, "normalized_power", :type => 4, :scale => 1, :offset => 0, :units => "watts"
Fit::File::Definitions.add_field 18, 35, "training_stress_score", :type => 4, :scale => 10, :offset => 0, :units => "tss"
Fit::File::Definitions.add_field 18, 36, "intensity_factor", :type => 4, :scale => 1000, :offset => 0, :units => "if"
Fit::File::Definitions.add_field 18, 37, "left_right_balance", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 18, 41, "avg_stroke_count", :type => 6, :scale => 10, :offset => 0, :units => "strokes/lap"
Fit::File::Definitions.add_field 18, 42, "avg_stroke_distance", :type => 4, :scale => 100, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 18, 43, "swim_stroke", :type => 0, :scale => 1, :offset => 0, :units => "swim_stroke"
Fit::File::Definitions.add_field 18, 44, "pool_length", :type => 4, :scale => 100, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 18, 46, "pool_length_unit", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 18, 47, "num_active_lengths", :type => 4, :scale => 1, :offset => 0, :units => "lengths"
Fit::File::Definitions.add_field 18, 48, "total_work", :type => 6, :scale => 1, :offset => 0, :units => "J"
Fit::File::Definitions.add_field 18, 49, "avg_altitude", :type => 4, :scale => 5, :offset => 500, :units => "m"
Fit::File::Definitions.add_field 18, 50, "max_altitude", :type => 4, :scale => 5, :offset => 500, :units => "m"
Fit::File::Definitions.add_field 18, 51, "gps_accuracy", :type => 2, :scale => 1, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 18, 52, "avg_grade", :type => 3, :scale => 100, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 18, 53, "avg_pos_grade", :type => 3, :scale => 100, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 18, 54, "avg_neg_grade", :type => 3, :scale => 100, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 18, 55, "max_pos_grade", :type => 3, :scale => 100, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 18, 56, "max_neg_grade", :type => 3, :scale => 100, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 18, 57, "avg_temperature", :type => 1, :scale => 1, :offset => 0, :units => "C"
Fit::File::Definitions.add_field 18, 58, "max_temperature", :type => 1, :scale => 1, :offset => 0, :units => "C"
Fit::File::Definitions.add_field 18, 59, "total_moving_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 18, 60, "avg_pos_vertical_speed", :type => 3, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 18, 61, "avg_neg_vertical_speed", :type => 3, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 18, 62, "max_pos_vertical_speed", :type => 3, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 18, 63, "max_neg_vertical_speed", :type => 3, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 18, 64, "min_heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::File::Definitions.add_field 18, 65, "time_in_hr_zone", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 18, 66, "time_in_speed_zone", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 18, 67, "time_in_cadence_zone", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 18, 68, "time_in_power_zone", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 18, 69, "avg_lap_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 18, 70, "best_lap_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 18, 71, "min_altitude", :type => 4, :scale => 5, :offset => 500, :units => "m"
Fit::File::Definitions.add_field 18, 82, "player_score", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 18, 83, "opponent_score", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 18, 84, "opponent_name", :type => 7, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 18, 85, "stroke_count", :type => 4, :scale => 1, :offset => 0, :units => "counts"
Fit::File::Definitions.add_field 18, 86, "zone_count", :type => 4, :scale => 1, :offset => 0, :units => "counts"
Fit::File::Definitions.add_field 18, 87, "max_ball_speed", :type => 4, :scale => 100, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 18, 88, "avg_ball_speed", :type => 4, :scale => 100, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 18, 89, "avg_vertical_oscillation", :type => 4, :scale => 10, :offset => 0, :units => "mm"
Fit::File::Definitions.add_field 18, 90, "avg_stance_time_percent", :type => 4, :scale => 100, :offset => 0, :units => "percent"
Fit::File::Definitions.add_field 18, 91, "avg_stance_time", :type => 4, :scale => 10, :offset => 0, :units => "ms"
Fit::File::Definitions.add_field 18, 92, "avg_fractional_cadence", :type => 2, :scale => 128, :offset => 0, :units => "rpm"
Fit::File::Definitions.add_field 18, 93, "max_fractional_cadence", :type => 2, :scale => 128, :offset => 0, :units => "rpm"
Fit::File::Definitions.add_field 18, 94, "total_fractional_cycles", :type => 2, :scale => 128, :offset => 0, :units => "cycles"
Fit::File::Definitions.add_field 18, 95, "avg_total_hemoglobin_conc", :type => 4, :scale => 100, :offset => 0, :units => "g/dL"
Fit::File::Definitions.add_field 18, 96, "min_total_hemoglobin_conc", :type => 4, :scale => 100, :offset => 0, :units => "g/dL"
Fit::File::Definitions.add_field 18, 97, "max_total_hemoglobin_conc", :type => 4, :scale => 100, :offset => 0, :units => "g/dL"
Fit::File::Definitions.add_field 18, 98, "avg_saturated_hemoglobin_percent", :type => 4, :scale => 10, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 18, 99, "min_saturated_hemoglobin_percent", :type => 4, :scale => 10, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 18, 100, "max_saturated_hemoglobin_percent", :type => 4, :scale => 10, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 18, 101, "avg_left_torque_effectiveness", :type => 2, :scale => 2, :offset => 0, :units => "percent"
Fit::File::Definitions.add_field 18, 102, "avg_right_torque_effectiveness", :type => 2, :scale => 2, :offset => 0, :units => "percent"
Fit::File::Definitions.add_field 18, 103, "avg_left_pedal_smoothness", :type => 2, :scale => 2, :offset => 0, :units => "percent"
Fit::File::Definitions.add_field 18, 104, "avg_right_pedal_smoothness", :type => 2, :scale => 2, :offset => 0, :units => "percent"
Fit::File::Definitions.add_field 18, 105, "avg_combined_pedal_smoothness", :type => 2, :scale => 2, :offset => 0, :units => "percent"

Fit::File::Definitions.add_name 19, "lap"
Fit::File::Definitions.add_field 19, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 19, 253, "timestamp", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 19, 0, "event", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 19, 1, "event_type", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 19, 2, "start_time", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 19, 3, "start_position_lat", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::File::Definitions.add_field 19, 4, "start_position_long", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::File::Definitions.add_field 19, 5, "end_position_lat", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::File::Definitions.add_field 19, 6, "end_position_long", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::File::Definitions.add_field 19, 7, "total_elapsed_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 19, 8, "total_timer_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 19, 9, "total_distance", :type => 6, :scale => 100, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 19, 10, "total_cycles", :type => 6, :scale => 1, :offset => 0, :units => "cycles"
Fit::File::Definitions.add_field 19, 10, "total_strides", :type => 6, :scale => 1, :offset => 0, :units => "strides"
Fit::File::Definitions.add_field 19, 11, "total_calories", :type => 4, :scale => 1, :offset => 0, :units => "kcal"
Fit::File::Definitions.add_field 19, 12, "total_fat_calories", :type => 4, :scale => 1, :offset => 0, :units => "kcal"
Fit::File::Definitions.add_field 19, 13, "avg_speed", :type => 4, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 19, 14, "max_speed", :type => 4, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 19, 15, "avg_heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::File::Definitions.add_field 19, 16, "max_heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::File::Definitions.add_field 19, 17, "avg_cadence", :type => 2, :scale => 1, :offset => 0, :units => "rpm"
Fit::File::Definitions.add_field 19, 17, "avg_running_cadence", :type => 2, :scale => 1, :offset => 0, :units => "strides/min"
Fit::File::Definitions.add_field 19, 18, "max_cadence", :type => 2, :scale => 1, :offset => 0, :units => "rpm"
Fit::File::Definitions.add_field 19, 18, "max_running_cadence", :type => 2, :scale => 1, :offset => 0, :units => "strides/min"
Fit::File::Definitions.add_field 19, 19, "avg_power", :type => 4, :scale => 1, :offset => 0, :units => "watts"
Fit::File::Definitions.add_field 19, 20, "max_power", :type => 4, :scale => 1, :offset => 0, :units => "watts"
Fit::File::Definitions.add_field 19, 21, "total_ascent", :type => 4, :scale => 1, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 19, 22, "total_descent", :type => 4, :scale => 1, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 19, 23, "intensity", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 19, 24, "lap_trigger", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 19, 25, "sport", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 19, 26, "event_group", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 19, 32, "num_lengths", :type => 4, :scale => 1, :offset => 0, :units => "lengths"
Fit::File::Definitions.add_field 19, 33, "normalized_power", :type => 4, :scale => 1, :offset => 0, :units => "watts"
Fit::File::Definitions.add_field 19, 34, "left_right_balance", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 19, 35, "first_length_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 19, 37, "avg_stroke_distance", :type => 4, :scale => 100, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 19, 38, "swim_stroke", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 19, 39, "sub_sport", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 19, 40, "num_active_lengths", :type => 4, :scale => 1, :offset => 0, :units => "lengths"
Fit::File::Definitions.add_field 19, 41, "total_work", :type => 6, :scale => 1, :offset => 0, :units => "J"
Fit::File::Definitions.add_field 19, 42, "avg_altitude", :type => 4, :scale => 5, :offset => 500, :units => "m"
Fit::File::Definitions.add_field 19, 43, "max_altitude", :type => 4, :scale => 5, :offset => 500, :units => "m"
Fit::File::Definitions.add_field 19, 44, "gps_accuracy", :type => 2, :scale => 1, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 19, 45, "avg_grade", :type => 3, :scale => 100, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 19, 46, "avg_pos_grade", :type => 3, :scale => 100, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 19, 47, "avg_neg_grade", :type => 3, :scale => 100, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 19, 48, "max_pos_grade", :type => 3, :scale => 100, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 19, 49, "max_neg_grade", :type => 3, :scale => 100, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 19, 50, "avg_temperature", :type => 1, :scale => 1, :offset => 0, :units => "C"
Fit::File::Definitions.add_field 19, 51, "max_temperature", :type => 1, :scale => 1, :offset => 0, :units => "C"
Fit::File::Definitions.add_field 19, 52, "total_moving_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 19, 53, "avg_pos_vertical_speed", :type => 3, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 19, 54, "avg_neg_vertical_speed", :type => 3, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 19, 55, "max_pos_vertical_speed", :type => 3, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 19, 56, "max_neg_vertical_speed", :type => 3, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 19, 57, "time_in_hr_zone", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 19, 58, "time_in_speed_zone", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 19, 59, "time_in_cadence_zone", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 19, 60, "time_in_power_zone", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 19, 61, "repetition_num", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 19, 62, "min_altitude", :type => 4, :scale => 5, :offset => 500, :units => "m"
Fit::File::Definitions.add_field 19, 63, "min_heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::File::Definitions.add_field 19, 71, "wkt_step_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 19, 74, "opponent_score", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 19, 75, "stroke_count", :type => 4, :scale => 1, :offset => 0, :units => "counts"
Fit::File::Definitions.add_field 19, 76, "zone_count", :type => 4, :scale => 1, :offset => 0, :units => "counts"
Fit::File::Definitions.add_field 19, 77, "avg_vertical_oscillation", :type => 4, :scale => 10, :offset => 0, :units => "mm"
Fit::File::Definitions.add_field 19, 78, "avg_stance_time_percent", :type => 4, :scale => 100, :offset => 0, :units => "percent"
Fit::File::Definitions.add_field 19, 79, "avg_stance_time", :type => 4, :scale => 10, :offset => 0, :units => "ms"
Fit::File::Definitions.add_field 19, 80, "avg_fractional_cadence", :type => 2, :scale => 128, :offset => 0, :units => "rpm"
Fit::File::Definitions.add_field 19, 81, "max_fractional_cadence", :type => 2, :scale => 128, :offset => 0, :units => "rpm"
Fit::File::Definitions.add_field 19, 82, "total_fractional_cycles", :type => 2, :scale => 128, :offset => 0, :units => "cycles"
Fit::File::Definitions.add_field 19, 83, "player_score", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 19, 84, "avg_total_hemoglobin_conc", :type => 4, :scale => 100, :offset => 0, :units => "g/dL"
Fit::File::Definitions.add_field 19, 85, "min_total_hemoglobin_conc", :type => 4, :scale => 100, :offset => 0, :units => "g/dL"
Fit::File::Definitions.add_field 19, 86, "max_total_hemoglobin_conc", :type => 4, :scale => 100, :offset => 0, :units => "g/dL"
Fit::File::Definitions.add_field 19, 87, "avg_saturated_hemoglobin_percent", :type => 4, :scale => 10, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 19, 88, "min_saturated_hemoglobin_percent", :type => 4, :scale => 10, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 19, 89, "max_saturated_hemoglobin_percent", :type => 4, :scale => 10, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 19, 91, "avg_left_torque_effectiveness", :type => 2, :scale => 2, :offset => 0, :units => "percent"
Fit::File::Definitions.add_field 19, 92, "avg_right_torque_effectiveness", :type => 2, :scale => 2, :offset => 0, :units => "percent"
Fit::File::Definitions.add_field 19, 93, "avg_left_pedal_smoothness", :type => 2, :scale => 2, :offset => 0, :units => "percent"
Fit::File::Definitions.add_field 19, 94, "avg_right_pedal_smoothness", :type => 2, :scale => 2, :offset => 0, :units => "percent"
Fit::File::Definitions.add_field 19, 95, "avg_combined_pedal_smoothness", :type => 2, :scale => 2, :offset => 0, :units => "percent"

Fit::File::Definitions.add_name 101, "length"
Fit::File::Definitions.add_field 101, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 101, 253, "timestamp", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 101, 0, "event", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 101, 1, "event_type", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 101, 2, "start_time", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 101, 3, "total_elapsed_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 101, 4, "total_timer_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 101, 5, "total_strokes", :type => 4, :scale => 1, :offset => 0, :units => "strokes"
Fit::File::Definitions.add_field 101, 6, "avg_speed", :type => 4, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 101, 7, "swim_stroke", :type => 0, :scale => 1, :offset => 0, :units => "swim_stroke"
Fit::File::Definitions.add_field 101, 9, "avg_swimming_cadence", :type => 2, :scale => 1, :offset => 0, :units => "strokes/min"
Fit::File::Definitions.add_field 101, 10, "event_group", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 101, 11, "total_calories", :type => 4, :scale => 1, :offset => 0, :units => "kcal"
Fit::File::Definitions.add_field 101, 12, "length_type", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 101, 18, "player_score", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 101, 19, "opponent_score", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 101, 20, "stroke_count", :type => 4, :scale => 1, :offset => 0, :units => "counts"
Fit::File::Definitions.add_field 101, 21, "zone_count", :type => 4, :scale => 1, :offset => 0, :units => "counts"

Fit::File::Definitions.add_name 20, "record"
Fit::File::Definitions.add_field 20, 253, "timestamp", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 20, 0, "position_lat", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::File::Definitions.add_field 20, 1, "position_long", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::File::Definitions.add_field 20, 2, "altitude", :type => 4, :scale => 5, :offset => 500, :units => "m"
Fit::File::Definitions.add_field 20, 3, "heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::File::Definitions.add_field 20, 4, "cadence", :type => 2, :scale => 1, :offset => 0, :units => "rpm"
Fit::File::Definitions.add_field 20, 5, "distance", :type => 6, :scale => 100, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 20, 6, "speed", :type => 4, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 20, 7, "power", :type => 4, :scale => 1, :offset => 0, :units => "watts"
Fit::File::Definitions.add_field 20, 8, "compressed_speed_distance", :type => 13, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 20, 9, "grade", :type => 3, :scale => 100, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 20, 10, "resistance", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 20, 11, "time_from_course", :type => 5, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 20, 12, "cycle_length", :type => 2, :scale => 100, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 20, 13, "temperature", :type => 1, :scale => 1, :offset => 0, :units => "C"
Fit::File::Definitions.add_field 20, 17, "speed_1s", :type => 2, :scale => 16, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 20, 18, "cycles", :type => 2, :scale => 1, :offset => 0, :units => "cycles"
Fit::File::Definitions.add_field 20, 19, "total_cycles", :type => 6, :scale => 1, :offset => 0, :units => "cycles"
Fit::File::Definitions.add_field 20, 28, "compressed_accumulated_power", :type => 4, :scale => 1, :offset => 0, :units => "watts"
Fit::File::Definitions.add_field 20, 29, "accumulated_power", :type => 6, :scale => 1, :offset => 0, :units => "watts"
Fit::File::Definitions.add_field 20, 30, "left_right_balance", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 20, 31, "gps_accuracy", :type => 2, :scale => 1, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 20, 32, "vertical_speed", :type => 3, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 20, 33, "calories", :type => 4, :scale => 1, :offset => 0, :units => "kcal"
Fit::File::Definitions.add_field 20, 39, "vertical_oscillation", :type => 4, :scale => 10, :offset => 0, :units => "mm"
Fit::File::Definitions.add_field 20, 40, "stance_time_percent", :type => 4, :scale => 100, :offset => 0, :units => "percent"
Fit::File::Definitions.add_field 20, 41, "stance_time", :type => 4, :scale => 10, :offset => 0, :units => "ms"
Fit::File::Definitions.add_field 20, 42, "activity_type", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 20, 43, "left_torque_effectiveness", :type => 2, :scale => 2, :offset => 0, :units => "percent"
Fit::File::Definitions.add_field 20, 44, "right_torque_effectiveness", :type => 2, :scale => 2, :offset => 0, :units => "percent"
Fit::File::Definitions.add_field 20, 45, "left_pedal_smoothness", :type => 2, :scale => 2, :offset => 0, :units => "percent"
Fit::File::Definitions.add_field 20, 46, "right_pedal_smoothness", :type => 2, :scale => 2, :offset => 0, :units => "percent"
Fit::File::Definitions.add_field 20, 47, "combined_pedal_smoothness", :type => 2, :scale => 2, :offset => 0, :units => "percent"
Fit::File::Definitions.add_field 20, 48, "time128", :type => 2, :scale => 128, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 20, 49, "stroke_type", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 20, 50, "zone", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 20, 51, "ball_speed", :type => 4, :scale => 100, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 20, 52, "cadence256", :type => 4, :scale => 256, :offset => 0, :units => "rpm"
Fit::File::Definitions.add_field 20, 53, "fractional_cadence", :type => 2, :scale => 128, :offset => 0, :units => "rpm"
Fit::File::Definitions.add_field 20, 54, "total_hemoglobin_conc", :type => 4, :scale => 100, :offset => 0, :units => "g/dL"
Fit::File::Definitions.add_field 20, 55, "total_hemoglobin_conc_min", :type => 4, :scale => 100, :offset => 0, :units => "g/dL"
Fit::File::Definitions.add_field 20, 56, "total_hemoglobin_conc_max", :type => 4, :scale => 100, :offset => 0, :units => "g/dL"
Fit::File::Definitions.add_field 20, 57, "saturated_hemoglobin_percent", :type => 4, :scale => 10, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 20, 58, "saturated_hemoglobin_percent_min", :type => 4, :scale => 10, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 20, 59, "saturated_hemoglobin_percent_max", :type => 4, :scale => 10, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 20, 62, "device_index", :type => 2, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 21, "event"
Fit::File::Definitions.add_field 21, 253, "timestamp", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 21, 0, "event", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 21, 1, "event_type", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 21, 2, "data16", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 21, 3, "data", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 21, 3, "timer_trigger", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 21, 3, "course_point_index", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 21, 3, "battery_level", :type => 6, :scale => 1000, :offset => 0, :units => "V"
Fit::File::Definitions.add_field 21, 3, "virtual_partner_speed", :type => 6, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 21, 3, "hr_high_alert", :type => 6, :scale => 1, :offset => 0, :units => "bpm"
Fit::File::Definitions.add_field 21, 3, "hr_low_alert", :type => 6, :scale => 1, :offset => 0, :units => "bpm"
Fit::File::Definitions.add_field 21, 3, "speed_high_alert", :type => 6, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 21, 3, "speed_low_alert", :type => 6, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 21, 3, "cad_high_alert", :type => 6, :scale => 1, :offset => 0, :units => "rpm"
Fit::File::Definitions.add_field 21, 3, "cad_low_alert", :type => 6, :scale => 1, :offset => 0, :units => "rpm"
Fit::File::Definitions.add_field 21, 3, "power_high_alert", :type => 6, :scale => 1, :offset => 0, :units => "watts"
Fit::File::Definitions.add_field 21, 3, "power_low_alert", :type => 6, :scale => 1, :offset => 0, :units => "watts"
Fit::File::Definitions.add_field 21, 3, "time_duration_alert", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 21, 3, "distance_duration_alert", :type => 6, :scale => 100, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 21, 3, "calorie_duration_alert", :type => 6, :scale => 1, :offset => 0, :units => "calories"
Fit::File::Definitions.add_field 21, 3, "fitness_equipment_state", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 21, 4, "event_group", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 21, 7, "score", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 21, 8, "opponent_score", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 21, 9, "front_gear_num", :type => 10, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 21, 10, "front_gear", :type => 10, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 21, 11, "rear_gear_num", :type => 10, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 21, 12, "rear_gear", :type => 10, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 23, "device_info"
Fit::File::Definitions.add_field 23, 253, "timestamp", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 23, 0, "device_index", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 23, 1, "device_type", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 23, 2, "manufacturer", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 23, 3, "serial_number", :type => 12, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 23, 4, "product", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 23, 5, "software_version", :type => 4, :scale => 100, :offset => 0
Fit::File::Definitions.add_field 23, 6, "hardware_version", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 23, 7, "cum_operating_time", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 23, 10, "battery_voltage", :type => 4, :scale => 256, :offset => 0, :units => "V"
Fit::File::Definitions.add_field 23, 11, "battery_status", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 23, 18, "sensor_position", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 23, 19, "descriptor", :type => 7, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 23, 20, "ant_transmission_type", :type => 10, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 23, 21, "ant_device_number", :type => 11, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 23, 22, "ant_network", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 23, 25, "source_type", :type => 0, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 31, "course"
Fit::File::Definitions.add_field 31, 4, "sport", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 31, 5, "name", :type => 7, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 31, 6, "capabilities", :type => 12, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 32, "course_point"
Fit::File::Definitions.add_field 32, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 32, 1, "timestamp", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 32, 2, "position_lat", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::File::Definitions.add_field 32, 3, "position_long", :type => 5, :scale => 1, :offset => 0, :units => "semicircles"
Fit::File::Definitions.add_field 32, 4, "distance", :type => 6, :scale => 100, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 32, 5, "type", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 32, 6, "name", :type => 7, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 26, "workout"
Fit::File::Definitions.add_field 26, 4, "sport", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 26, 5, "capabilities", :type => 12, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 26, 6, "num_valid_steps", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 26, 8, "wkt_name", :type => 7, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 27, "workout_step"
Fit::File::Definitions.add_field 27, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 27, 0, "wkt_step_name", :type => 7, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 27, 1, "duration_type", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 27, 2, "duration_value", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 27, 2, "duration_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 27, 2, "duration_distance", :type => 6, :scale => 100, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 27, 2, "duration_hr", :type => 6, :scale => 1, :offset => 0, :units => "% or bpm"
Fit::File::Definitions.add_field 27, 2, "duration_calories", :type => 6, :scale => 1, :offset => 0, :units => "calories"
Fit::File::Definitions.add_field 27, 2, "duration_step", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 27, 2, "duration_power", :type => 6, :scale => 1, :offset => 0, :units => "% or watts"
Fit::File::Definitions.add_field 27, 3, "target_type", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 27, 4, "target_value", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 27, 4, "target_hr_zone", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 27, 4, "target_power_zone", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 27, 4, "repeat_steps", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 27, 4, "repeat_time", :type => 6, :scale => 1000, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 27, 4, "repeat_distance", :type => 6, :scale => 100, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 27, 4, "repeat_calories", :type => 6, :scale => 1, :offset => 0, :units => "calories"
Fit::File::Definitions.add_field 27, 4, "repeat_hr", :type => 6, :scale => 1, :offset => 0, :units => "% or bpm"
Fit::File::Definitions.add_field 27, 4, "repeat_power", :type => 6, :scale => 1, :offset => 0, :units => "% or watts"
Fit::File::Definitions.add_field 27, 5, "custom_target_value_low", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 27, 5, "custom_target_speed_low", :type => 6, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 27, 5, "custom_target_heart_rate_low", :type => 6, :scale => 1, :offset => 0, :units => "% or bpm"
Fit::File::Definitions.add_field 27, 5, "custom_target_cadence_low", :type => 6, :scale => 1, :offset => 0, :units => "rpm"
Fit::File::Definitions.add_field 27, 5, "custom_target_power_low", :type => 6, :scale => 1, :offset => 0, :units => "% or watts"
Fit::File::Definitions.add_field 27, 6, "custom_target_value_high", :type => 6, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 27, 6, "custom_target_speed_high", :type => 6, :scale => 1000, :offset => 0, :units => "m/s"
Fit::File::Definitions.add_field 27, 6, "custom_target_heart_rate_high", :type => 6, :scale => 1, :offset => 0, :units => "% or bpm"
Fit::File::Definitions.add_field 27, 6, "custom_target_cadence_high", :type => 6, :scale => 1, :offset => 0, :units => "rpm"
Fit::File::Definitions.add_field 27, 6, "custom_target_power_high", :type => 6, :scale => 1, :offset => 0, :units => "% or watts"
Fit::File::Definitions.add_field 27, 7, "intensity", :type => 0, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 33, "totals"
Fit::File::Definitions.add_field 33, 254, "message_index", :type => 4, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 33, 253, "timestamp", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 33, 0, "timer_time", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 33, 1, "distance", :type => 6, :scale => 1, :offset => 0, :units => "m"
Fit::File::Definitions.add_field 33, 2, "calories", :type => 6, :scale => 1, :offset => 0, :units => "kcal"
Fit::File::Definitions.add_field 33, 3, "sport", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 33, 4, "elapsed_time", :type => 6, :scale => 1, :offset => 0, :units => "s"

Fit::File::Definitions.add_name 30, "weight_scale"
Fit::File::Definitions.add_field 30, 253, "timestamp", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 30, 0, "weight", :type => 4, :scale => 100, :offset => 0, :units => "kg"
Fit::File::Definitions.add_field 30, 1, "percent_fat", :type => 4, :scale => 100, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 30, 2, "percent_hydration", :type => 4, :scale => 100, :offset => 0, :units => "%"
Fit::File::Definitions.add_field 30, 3, "visceral_fat_mass", :type => 4, :scale => 100, :offset => 0, :units => "kg"
Fit::File::Definitions.add_field 30, 4, "bone_mass", :type => 4, :scale => 100, :offset => 0, :units => "kg"
Fit::File::Definitions.add_field 30, 5, "muscle_mass", :type => 4, :scale => 100, :offset => 0, :units => "kg"
Fit::File::Definitions.add_field 30, 7, "basal_met", :type => 4, :scale => 4, :offset => 0, :units => "kcal/day"
Fit::File::Definitions.add_field 30, 8, "physique_rating", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 30, 9, "active_met", :type => 4, :scale => 4, :offset => 0, :units => "kcal/day"
Fit::File::Definitions.add_field 30, 10, "metabolic_age", :type => 2, :scale => 1, :offset => 0, :units => "years"
Fit::File::Definitions.add_field 30, 11, "visceral_fat_rating", :type => 2, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 30, 12, "user_profile_index", :type => 4, :scale => 1, :offset => 0

Fit::File::Definitions.add_name 51, "blood_pressure"
Fit::File::Definitions.add_field 51, 253, "timestamp", :type => 6, :scale => 1, :offset => 0, :units => "s"
Fit::File::Definitions.add_field 51, 0, "systolic_pressure", :type => 4, :scale => 1, :offset => 0, :units => "mmHg"
Fit::File::Definitions.add_field 51, 1, "diastolic_pressure", :type => 4, :scale => 1, :offset => 0, :units => "mmHg"
Fit::File::Definitions.add_field 51, 2, "mean_arterial_pressure", :type => 4, :scale => 1, :offset => 0, :units => "mmHg"
Fit::File::Definitions.add_field 51, 3, "map_3_sample_mean", :type => 4, :scale => 1, :offset => 0, :units => "mmHg"
Fit::File::Definitions.add_field 51, 4, "map_morning_values", :type => 4, :scale => 1, :offset => 0, :units => "mmHg"
Fit::File::Definitions.add_field 51, 5, "map_evening_values", :type => 4, :scale => 1, :offset => 0, :units => "mmHg"
Fit::File::Definitions.add_field 51, 6, "heart_rate", :type => 2, :scale => 1, :offset => 0, :units => "bpm"
Fit::File::Definitions.add_field 51, 7, "heart_rate_type", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 51, 8, "status", :type => 0, :scale => 1, :offset => 0
Fit::File::Definitions.add_field 51, 9, "user_profile_index", :type => 4, :scale => 1, :offset => 0
