module Fit
  class File
    module Types

      @@types = {}

      class << self
        def add_type(name, type, option = {})
          @@types[name] = option.merge({basic_type: type})
        end

        def get_type_definition(name)
          return @@types[name] if @@types.has_key? name
          nil
        end

        def date_time_value(time, values, parameters)
          val = values.invert
          if time < val['min']
            time.to_s
          else
            res= parameters[:utc] ? Time.utc(1989,12,31) + time : Time.local(1989,12,31) + time
            res.to_s
          end
        end

        def message_index_value(msg_index, values, parameters = nil)
          val = values.invert
          msg_index & val['mask']
        end

        def bitfield_value(bitfield, values, parameters = nil)
          res = ''
          values.each do |key, val|
            if key & bitfield != 0
              res << '/' unless res.empty?
              res << val
            end
          end
          res
        end
      end

    end
  end
end

# basic types
Fit::File::Types.add_type :enum, nil, invalid: 0xFF
Fit::File::Types.add_type :sint8, nil, invalid: 0x7F
Fit::File::Types.add_type :uint8, nil, invalid: 0xFF
Fit::File::Types.add_type :sint16, nil, invalid: 0x7FFF
Fit::File::Types.add_type :uint16, nil, invalid: 0xFFFF
Fit::File::Types.add_type :sint32, nil, invalid: 0x7FFFFFFF
Fit::File::Types.add_type :uint32, nil, invalid: 0xFFFFFFFF
Fit::File::Types.add_type :string, nil, invalid: 0x00
Fit::File::Types.add_type :float32, nil, invalid: 0xFFFFFFFF
Fit::File::Types.add_type :float64, nil, invalid: 0xFFFFFFFFFFFFFFFF
Fit::File::Types.add_type :uint8z, nil, invalid: 0x00
Fit::File::Types.add_type :uint16z, nil, invalid: 0x0000
Fit::File::Types.add_type :uint32z, nil, invalid: 0x00000000
Fit::File::Types.add_type :byte, nil, invalid: 0xFF

# derived types
Fit::File::Types.add_type :file, :enum, values: {
    1 => 'device',
    2 => 'settings',
    3 => 'sport',
    4 => 'activity',
    5 => 'workout',
    6 => 'course',
    7 => 'schedules',
    9 => 'weight',
    10 => 'totals',
    11 => 'goals',
    14 => 'blood_pressure',
    15 => 'monitoring_a',
    20 => 'activity_summary',
    28 => 'monitoring_daily',
    32 => 'monitoring_b' }
Fit::File::Types.add_type :mesg_num, :uint16, values: {
    0 => 'file_id',
    1 => 'capabilities',
    2 => 'device_settings',
    3 => 'user_profile',
    4 => 'hrm_profile',
    5 => 'sdm_profile',
    6 => 'bike_profile',
    7 => 'zones_target',
    8 => 'hr_zone',
    9 => 'power_zone',
    10 => 'met_zone',
    12 => 'sport',
    15 => 'goal',
    18 => 'session',
    19 => 'lap',
    20 => 'record',
    21 => 'event',
    23 => 'device_info',
    26 => 'workout',
    27 => 'workout_step',
    28 => 'schedule',
    30 => 'weight_scale',
    31 => 'course',
    32 => 'course_point',
    33 => 'totals',
    34 => 'activity',
    35 => 'software',
    37 => 'file_capabilities',
    38 => 'mesg_capabilities',
    39 => 'field_capabilities',
    49 => 'file_creator',
    51 => 'blood_pressure',
    53 => 'speed_zone',
    55 => 'monitoring',
    72 => 'training_file',
    78 => 'hrv',
    101 => 'length',
    103 => 'monitoring_info',
    105 => 'pad',
    106 => 'slave_device',
    131 => 'cadence_zone',
    145 => 'memo_glob',
    65280 => 'mfg_range_min',
    65534 => 'mfg_range_max' }
Fit::File::Types.add_type :checksum, :uint8, values: {
    0 => 'clear',
    1 => 'ok' }
Fit::File::Types.add_type :file_flags, :uint8z, values: {
    0x02 => 'read',
    0x04 => 'write',
    0x08 => 'erase' }, method: :bitfield_value
Fit::File::Types.add_type :mesg_count, :enum, values: {
    0 => 'num_per_file',
    1 => 'max_per_file',
    2 => 'max_per_file_type' }
Fit::File::Types.add_type :date_time, :uint32, values: {
    268435456 => 'min' }, method: :date_time_value, parameters: {utc: true}
Fit::File::Types.add_type :local_date_time, :uint32, values: {
    268435456 => 'min' }, method: :date_time_value, parameters: {utc: false}
Fit::File::Types.add_type :message_index, :uint16, values: {
    32768 => 'selected',
    26872 => 'reserved',
    4095 => 'mask' }, method: :message_index_value
Fit::File::Types.add_type :device_index, :uint8, values: {
    0 => 'creator' }
Fit::File::Types.add_type :gender, :enum, values: {
    0 => 'female',
    1 => 'male' }
Fit::File::Types.add_type :language, :enum, values: {
    0 => 'english',
    1 => 'french',
    2 => 'italian',
    3 => 'german',
    4 => 'spanish',
    5 => 'croatian',
    6 => 'czech',
    7 => 'danish',
    8 => 'dutch',
    9 => 'finnish',
    10 => 'greek',
    11 => 'hungarian',
    12 => 'norwegian',
    13 => 'polish',
    14 => 'portuguese',
    15 => 'slovakian',
    16 => 'slovenian',
    17 => 'swedish',
    18 => 'russian',
    19 => 'turkish',
    20 => 'latvian',
    21 => 'ukrainian',
    22 => 'arabic',
    23 => 'farsi',
    24 => 'bulgarian',
    25 => 'romanian',
    254 => 'custom' }
Fit::File::Types.add_type :time_zone, :enum, values: {
    0 => 'almaty',
    1 => 'bangkok',
    2 => 'bombay',
    3 => 'brasilia',
    4 => 'cairo',
    5 => 'cape_verde_is',
    6 => 'darwin',
    7 => 'eniwetok',
    8 => 'fiji',
    9 => 'hong_kong',
    10 => 'islamabad',
    11 => 'kabul',
    12 => 'magadan',
    13 => 'mid_atlantic',
    14 => 'moscow',
    15 => 'muscat',
    16 => 'newfoundland',
    17 => 'samoa',
    18 => 'sydney',
    19 => 'tehran',
    20 => 'tokyo',
    21 => 'us_alaska',
    22 => 'us_atlantic',
    23 => 'us_central',
    24 => 'us_eastern',
    25 => 'us_hawaii',
    26 => 'us_mountain',
    27 => 'us_pacific',
    28 => 'other',
    29 => 'auckland',
    30 => 'kathmandu',
    31 => 'europe_western_wet',
    32 => 'europe_central_cet',
    33 => 'europe_eastern_eet',
    34 => 'jakarta',
    35 => 'perth',
    36 => 'adelaide',
    37 => 'brisbane',
    38 => 'tasmania',
    39 => 'iceland',
    40 => 'amsterdam',
    41 => 'athens',
    42 => 'barcelona',
    43 => 'berlin',
    44 => 'brussels',
    45 => 'budapest',
    46 => 'copenhagen',
    47 => 'dublin',
    48 => 'helsinki',
    49 => 'lisbon',
    50 => 'london',
    51 => 'madrid',
    52 => 'munich',
    53 => 'oslo',
    54 => 'paris',
    55 => 'prague',
    56 => 'reykjavik',
    57 => 'rome',
    58 => 'stockholm',
    59 => 'vienna',
    60 => 'warsaw',
    61 => 'zurich',
    62 => 'quebec',
    63 => 'ontario',
    64 => 'manitoba',
    65 => 'saskatchewan',
    66 => 'alberta',
    67 => 'british_columbia',
    68 => 'boise',
    69 => 'boston',
    70 => 'chicago',
    71 => 'dallas',
    72 => 'denver',
    73 => 'kansas_city',
    74 => 'las_vegas',
    75 => 'los_angeles',
    76 => 'miami',
    77 => 'minneapolis',
    78 => 'new_york',
    79 => 'new_orleans',
    80 => 'phoenix',
    81 => 'santa_fe',
    82 => 'seattle',
    83 => 'washington_dc',
    84 => 'us_arizona',
    85 => 'chita',
    86 => 'ekaterinburg',
    87 => 'irkutsk',
    88 => 'kaliningrad',
    89 => 'krasnoyarsk',
    90 => 'novosibirsk',
    91 => 'petropavlovsk_kamchatskiy',
    92 => 'samara',
    93 => 'vladivostok',
    94 => 'mexico_central',
    95 => 'mexico_mountain',
    96 => 'mexico_pacific',
    97 => 'cape_town',
    98 => 'winkhoek',
    99 => 'lagos',
    100 => 'riyahd',
    101 => 'venezuela',
    102 => 'australia_lh',
    103 => 'santiago',
    253 => 'manual',
    254 => 'automatic' }
Fit::File::Types.add_type :display_measure, :enum, values: {
    0 => 'metric',
    1 => 'statute' }
Fit::File::Types.add_type :display_heart, :enum, values: {
    0 => 'bpm',
    1 => 'max',
    2 => 'reserve' }
Fit::File::Types.add_type :display_power, :enum, values: {
    0 => 'watts',
    1 => 'percent_ftp' }
Fit::File::Types.add_type :display_position, :enum, values: {
    0 => 'degree',
    1 => 'degree_minute',
    2 => 'degree_minute_second',
    3 => 'austrian_grid',
    4 => 'british_grid',
    5 => 'dutch_grid',
    6 => 'hungarian_grid',
    7 => 'finnish_grid',
    8 => 'german_grid',
    9 => 'icelandic_grid',
    10 => 'indonesian_equatorial',
    11 => 'indonesian_irian',
    12 => 'indonesian_southern',
    13 => 'india_zone_0',
    14 => 'india_zone_IA',
    15 => 'india_zone_IB',
    16 => 'india_zone_IIA',
    17 => 'india_zone_IIB',
    18 => 'india_zone_IIIA',
    19 => 'india_zone_IIIB',
    20 => 'india_zone_IVA',
    21 => 'india_zone_IVB',
    22 => 'irish_transverse',
    23 => 'irish_grid',
    24 => 'loran',
    25 => 'maidenhead_grid',
    26 => 'mgrs_grid',
    27 => 'new_zealand_grid',
    28 => 'new_zealand_transverse',
    29 => 'qatar_grid',
    30 => 'modified_swedish_grid',
    31 => 'swedish_grid',
    32 => 'south_african_grid',
    33 => 'swiss_grid',
    34 => 'taiwan_grid',
    35 => 'united_states_grid',
    36 => 'utm_ups_grid',
    37 => 'west_malayan',
    38 => 'borneo_rso',
    39 => 'estonian_grid',
    40 => 'latvian_grid',
    41 => 'swedish_ref_99_grid' }
Fit::File::Types.add_type :sport, :enum, values: {
    0 => 'generic',
    1 => 'running',
    2 => 'cycling',
    3 => 'transition',
    4 => 'fitness_equipment',
    5 => 'swimming',
    6 => 'basketball',
    7 => 'soccer',
    8 => 'tennis',
    9 => 'american_football',
    10 => 'training',
    11 => 'walking',
    12 => 'cross_country_skiing',
    13 => 'alpine_skiing',
    14 => 'snowboarding',
    15 => 'rowing',
    16 => 'mountaineering',
    17 => 'hiking',
    18 => 'multisport',
    19 => 'paddling',
    254 => 'all' }
Fit::File::Types.add_type :sport_bits_0, :uint8z, values: {
    1 => 'generic',
    2 => 'running',
    4 => 'cycling',
    8 => 'transition',
    16 => 'fitness_equipment',
    32 => 'swimming',
    64 => 'basketball',
    128 => 'soccer' }
Fit::File::Types.add_type :sport_bits_1, :uint8z, values: {
    1 => 'tennis',
    2 => 'american_football',
    4 => 'training',
    8 => 'walking',
    16 => 'cross_country_skiing',
    32 => 'alpine_skiing',
    64 => 'snowboarding',
    128 => 'rowing' }
Fit::File::Types.add_type :sport_bits_2, :uint8z, values: {
    1 => 'mountaineering',
    2 => 'hiking',
    4 => 'multisport',
    8 => 'paddling' }
Fit::File::Types.add_type :sub_sport, :enum, values: {
    0 => 'generic',
    1 => 'treadmill',
    2 => 'street',
    3 => 'trail',
    4 => 'track',
    5 => 'spin',
    6 => 'indoor_cycling',
    7 => 'road',
    8 => 'mountain',
    9 => 'downhill',
    10 => 'recumbent',
    11 => 'cyclocross',
    12 => 'hand_cycling',
    13 => 'track_cycling',
    14 => 'indoor_rowing',
    15 => 'elliptical',
    16 => 'stair_climbing',
    17 => 'lap_swimming',
    18 => 'open_water',
    19 => 'flexibility_training',
    20 => 'strength_training',
    21 => 'warm_up',
    22 => 'match',
    23 => 'exercise',
    24 => 'challenge',
    25 => 'indoor_skiing',
    26 => 'cardio_training',
    254 => 'all' }
Fit::File::Types.add_type :activity, :enum, values: {
    0 => 'manual',
    1 => 'auto_multi_sport' }
Fit::File::Types.add_type :intensity, :enum, values: {
    0 => 'active',
    1 => 'rest',
    2 => 'warmup',
    3 => 'cooldown' }
Fit::File::Types.add_type :session_trigger, :enum, values: {
    0 => 'activity_end',
    1 => 'manual',
    2 => 'auto_multi_sport',
    3 => 'fitness_equipment' }
Fit::File::Types.add_type :autolap_trigger, :enum, values: {
    0 => 'time',
    1 => 'distance',
    2 => 'position_start',
    3 => 'position_lap',
    4 => 'position_waypoint',
    5 => 'position_marked',
    6 => 'off' }
Fit::File::Types.add_type :lap_trigger, :enum, values: {
    0 => 'manual',
    1 => 'time',
    2 => 'distance',
    3 => 'position_start',
    4 => 'position_lap',
    5 => 'position_waypoint',
    6 => 'position_marked',
    7 => 'session_end',
    8 => 'fitness_equipment' }
Fit::File::Types.add_type :event, :enum, values: {
    0 => 'timer',
    3 => 'workout',
    4 => 'workout_step',
    5 => 'power_down',
    6 => 'power_up',
    7 => 'off_course',
    8 => 'session',
    9 => 'lap',
    10 => 'course_point',
    11 => 'battery',
    12 => 'virtual_partner_pace',
    13 => 'hr_high_alert',
    14 => 'hr_low_alert',
    15 => 'speed_high_alert',
    16 => 'speed_low_alert',
    17 => 'cad_high_alert',
    18 => 'cad_low_alert',
    19 => 'power_high_alert',
    20 => 'power_low_alert',
    21 => 'recovery_hr',
    22 => 'battery_low',
    23 => 'time_duration_alert',
    24 => 'distance_duration_alert',
    25 => 'calorie_duration_alert',
    26 => 'activity',
    27 => 'fitness_equipment',
    28 => 'length',
    32 => 'user_marker',
    33 => 'sport_point',
    36 => 'calibration',
    42 => 'front_gear_change',
    43 => 'rear_gear_change',
    45 => 'elev_high_alert',
    46 => 'elev_low_alert' }
Fit::File::Types.add_type :event_type, :enum, values: {
    0 => 'start',
    1 => 'stop',
    2 => 'consecutive_depreciated',
    3 => 'marker',
    4 => 'stop_all',
    5 => 'begin_depreciated',
    6 => 'end_depreciated',
    7 => 'end_all_depreciated',
    8 => 'stop_disable',
    9 => 'stop_disable_all' }
Fit::File::Types.add_type :timer_trigger, :enum, values: {
    0 => 'manual',
    1 => 'auto',
    2 => 'fitness_equipment' }
Fit::File::Types.add_type :fitness_equipment_state, :enum, values: {
    0 => 'ready',
    1 => 'in_use',
    2 => 'paused',
    3 => 'unknown' }
Fit::File::Types.add_type :activity_class, :enum, values: {
    127 => 'level',
    100 => 'level_max',
    128 => 'athlete' }
Fit::File::Types.add_type :hr_zone_calc, :enum, values: {
    0 => 'custom',
    1 => 'percent_max_hr',
    2 => 'percent_hrr' }
Fit::File::Types.add_type :pwr_zone_calc, :enum, values: {
    0 => 'custom',
    1 => 'percent_ftp' }
Fit::File::Types.add_type :wkt_step_duration, :enum, values: {
    0 => 'time',
    1 => 'distance',
    2 => 'hr_less_than',
    3 => 'hr_greater_than',
    4 => 'calories',
    5 => 'open',
    6 => 'repeat_until_steps_cmplt',
    7 => 'repeat_until_time',
    8 => 'repeat_until_distance',
    9 => 'repeat_until_calories',
    10 => 'repeat_until_hr_less_than',
    11 => 'repeat_until_hr_greater_than',
    12 => 'repeat_until_power_less_than',
    13 => 'repeat_until_power_greater_than',
    14 => 'power_less_than',
    15 => 'power_greater_than',
    28 => 'repetition_time' }
Fit::File::Types.add_type :wkt_step_target, :enum, values: {
    0 => 'speed',
    1 => 'heart_rate',
    2 => 'open',
    3 => 'cadence',
    4 => 'power',
    5 => 'grade',
    6 => 'resistance' }
Fit::File::Types.add_type :goal, :enum, values: {
    0 => 'time',
    1 => 'distance',
    2 => 'calories',
    3 => 'frequency',
    4 => 'steps' }
Fit::File::Types.add_type :goal_recurrence, :enum, values: {
    0 => 'off',
    1 => 'daily',
    2 => 'weekly',
    3 => 'monthly',
    4 => 'yearly',
    5 => 'custom' }
Fit::File::Types.add_type :schedule, :enum, values: {
    0 => 'workout',
    1 => 'course' }
Fit::File::Types.add_type :course_point, :enum, values: {
    0 => 'generic',
    1 => 'summit',
    2 => 'valley',
    3 => 'water',
    4 => 'food',
    5 => 'danger',
    6 => 'left',
    7 => 'right',
    8 => 'straight',
    9 => 'first_aid',
    10 => 'fourth_category',
    11 => 'third_category',
    12 => 'second_category',
    13 => 'first_category',
    14 => 'hors_category',
    15 => 'sprint',
    16 => 'left_fork',
    17 => 'right_fork',
    18 => 'middle_fork',
    19 => 'slight_left',
    20 => 'sharp_left',
    21 => 'slight_right',
    22 => 'sharp_right',
    23 => 'u_turn' }
Fit::File::Types.add_type :manufacturer, :uint16, values: {
    1 => 'garmin',
    2 => 'garmin_fr405_antfs',
    3 => 'zephyr',
    4 => 'dayton',
    5 => 'idt',
    6 => 'srm',
    7 => 'quarq',
    8 => 'ibike',
    9 => 'saris',
    10 => 'spark_hk',
    11 => 'tanita',
    12 => 'echowell',
    13 => 'dynastream_oem',
    14 => 'nautilus',
    15 => 'dynastream',
    16 => 'timex',
    17 => 'metrigear',
    18 => 'xelic',
    19 => 'beurer',
    20 => 'cardiosport',
    21 => 'a_and_d',
    22 => 'hmm',
    23 => 'suunto',
    24 => 'thita_elektronik',
    25 => 'gpulse',
    26 => 'clean_mobile',
    27 => 'pedal_brain',
    28 => 'peaksware',
    29 => 'saxonar',
    30 => 'lemond_fitness',
    31 => 'dexcom',
    32 => 'wahoo_fitness',
    33 => 'octane_fitness',
    34 => 'archinoetics',
    35 => 'the_hurt_box',
    36 => 'citizen_systems',
    37 => 'magellan',
    38 => 'osynce',
    39 => 'holux',
    40 => 'concept2',
    42 => 'one_giant_leap',
    43 => 'ace_sensor',
    44 => 'brim_brothers',
    45 => 'xplova',
    46 => 'perception_digital',
    47 => 'bf1systems',
    48 => 'pioneer',
    49 => 'spantec',
    50 => 'metalogics',
    51 => '4iiiis',
    52 => 'seiko_epson',
    53 => 'seiko_epson_oem',
    54 => 'ifor_powell',
    55 => 'maxwell_guider',
    56 => 'star_trac',
    57 => 'breakaway',
    58 => 'alatech_technology_ltd',
    59 => 'mio_technology_europe',
    60 => 'rotor',
    61 => 'geonaute',
    62 => 'id_bike',
    63 => 'specialized',
    64 => 'wtek',
    65 => 'physical_enterprises',
    66 => 'north_pole_engineering',
    67 => 'bkool',
    68 => 'cateye',
    69 => 'stages_cycling',
    70 => 'sigmasport',
    71 => 'tomtom',
    72 => 'peripedal',
    73 => 'wattbike',
    76 => 'moxy',
    77 => 'ciclosport',
    78 => 'powerbahn',
    79 => 'acorn_projects_aps',
    80 => 'lifebeam',
    81 => 'bontrager',
    82 => 'wellgo',
    83 => 'scosche',
    84 => 'magura',
    85 => 'woodway',
    86 => 'elite',
    87 => 'nielsen_kellerman',
    88 => 'dk_city',
    89 => 'tacx',
    90 => 'direction_technology',
    91 => 'magtonic',
    92 => '1partcarbon',
    93 => 'inside_ride_technologies',
    255 => 'development',
    257 => 'healthandlife',
    258 => 'lezyne',
    259 => 'scribe_labs',
    5759 => 'actigraphcorp' }
Fit::File::Types.add_type :garmin_product, :uint16, values: {
    1 => 'hrm1',
    2 => 'axh01',
    3 => 'axb01',
    4 => 'axb02',
    5 => 'hrm2ss',
    6 => 'dsi_alf02',
    7 => 'hrm3ss',
    8 => 'hrm_run_single_byte_product_id',
    9 => 'bsm',
    10 => 'bcm',
    473 => 'fr301_china',
    474 => 'fr301_japan',
    475 => 'fr301_korea',
    494 => 'fr301_taiwan',
    717 => 'fr405',
    782 => 'fr50',
    987 => 'fr405_japan',
    988 => 'fr60',
    1011 => 'dsi_alf01',
    1018 => 'fr310xt',
    1036 => 'edge500',
    1124 => 'fr110',
    1169 => 'edge800',
    1199 => 'edge500_taiwan',
    1213 => 'edge500_japan',
    1253 => 'chirp',
    1274 => 'fr110_japan',
    1325 => 'edge200',
    1328 => 'fr910xt',
    1333 => 'edge800_taiwan',
    1334 => 'edge800_japan',
    1341 => 'alf04',
    1345 => 'fr610',
    1360 => 'fr210_japan',
    1380 => 'vector_ss',
    1381 => 'vector_cp',
    1386 => 'edge800_china',
    1387 => 'edge500_china',
    1410 => 'fr610_japan',
    1422 => 'edge500_korea',
    1436 => 'fr70',
    1446 => 'fr310xt_4t',
    1461 => 'amx',
    1482 => 'fr10',
    1497 => 'edge800_korea',
    1499 => 'swim',
    1537 => 'fr910xt_china',
    1551 => 'fenix',
    1555 => 'edge200_taiwan',
    1561 => 'edge510',
    1567 => 'edge810',
    1570 => 'tempe',
    1600 => 'fr910xt_japan',
    1623 => 'fr620',
    1632 => 'fr220',
    1664 => 'fr910xt_korea',
    1688 => 'fr10_japan',
    1721 => 'edge810_japan',
    1735 => 'virb_elite',
    1736 => 'edge_touring',
    1742 => 'edge510_japan',
    1752 => 'hrm_run',
    1821 => 'edge510_asia',
    1822 => 'edge810_china',
    1823 => 'edge810_taiwan',
    1836 => 'edge1000',
    1837 => 'vivo_fit',
    1853 => 'virb_remote',
    1885 => 'vivo_ki',
    1903 => 'fr15',
    1918 => 'edge510_korea',
    1928 => 'fr620_japan',
    1929 => 'fr620_china',
    1930 => 'fr220_japan',
    1931 => 'fr220_china',
    1967 => 'fenix2',
    10007 => 'sdm4',
    10014 => 'edge_remote',
    20119 => 'training_center',
    65532 => 'android_antplus_plugin',
    65534 => 'connect' }
Fit::File::Types.add_type :antplus_device_type, :uint8, values: {
    1 => 'antfs',
    11 => 'bike_power',
    12 => 'environment_sensor_legacy',
    15 => 'multi_sport_speed_distance',
    16 => 'control',
    17 => 'fitness_equipment',
    18 => 'blood_pressure',
    19 => 'geocache_node',
    20 => 'light_electric_vehicle',
    25 => 'env_sensor',
    26 => 'racquet',
    119 => 'weight_scale',
    120 => 'heart_rate',
    121 => 'bike_speed_cadence',
    122 => 'bike_cadence',
    123 => 'bike_speed',
    124 => 'stride_speed_distance' }
Fit::File::Types.add_type :ant_network, :enum, values: {
    0 => 'public',
    1 => 'antplus',
    2 => 'antfs',
    3 => 'private' }
Fit::File::Types.add_type :workout_capabilities, :uint32z, values: {
    0x00000001 => 'interval',
    0x00000002 => 'custom',
    0x00000004 => 'fitness_equipment',
    0x00000008 => 'firstbeat',
    0x00000010 => 'new_leaf',
    0x00000020 => 'tcx',
    0x00000080 => 'speed',
    0x00000100 => 'heart_rate',
    0x00000200 => 'distance',
    0x00000400 => 'cadence',
    0x00000800 => 'power',
    0x00001000 => 'grade',
    0x00002000 => 'resistance',
    0x00004000 => 'protected' }, method: :bitfield_value
Fit::File::Types.add_type :battery_status, :uint8, values: {
    1 => 'new',
    2 => 'good',
    3 => 'ok',
    4 => 'low',
    5 => 'critical' }
Fit::File::Types.add_type :hr_type, :enum, values: {
    0 => 'normal',
    1 => 'irregular' }
Fit::File::Types.add_type :course_capabilities, :uint32z, values: {
    0x00000001 => 'processed',
    0x00000002 => 'valid',
    0x00000004 => 'time',
    0x00000008 => 'distance',
    0x00000010 => 'position',
    0x00000020 => 'heart_rate',
    0x00000040 => 'power',
    0x00000080 => 'cadence',
    0x00000100 => 'training',
    0x00000200 => 'navigation' }, method: :bitfield_value
Fit::File::Types.add_type :weight, :uint16, values: {
    65534 => 'calculating' }
Fit::File::Types.add_type :workout_hr, :uint32, values: {
    100 => 'bpm_offset' }
Fit::File::Types.add_type :workout_power, :uint32, values: {
    1000 => 'watts_offset' }
Fit::File::Types.add_type :bp_status, :enum, values: {
    0 => 'no_error',
    1 => 'error_incomplete_data',
    2 => 'error_no_measurement',
    3 => 'error_data_out_of_range',
    4 => 'error_irregular_heart_rate' }
Fit::File::Types.add_type :user_local_id, :uint16, values: {
    0 => 'local_min',
    15 => 'local_max',
    16 => 'stationary_min',
    255 => 'stationary_max',
    256 => 'portable_min',
    65534 => 'portable_max' }
Fit::File::Types.add_type :swim_stroke, :enum, values: {
    0 => 'freestyle',
    1 => 'backstroke',
    2 => 'breaststroke',
    3 => 'butterfly',
    4 => 'drill',
    5 => 'mixed',
    6 => 'im' }
Fit::File::Types.add_type :activity_type, :enum, values: {
    0 => 'generic',
    1 => 'running',
    2 => 'cycling',
    3 => 'transition',
    4 => 'fitness_equipment',
    5 => 'swimming',
    6 => 'walking',
    254 => 'all' }
Fit::File::Types.add_type :activity_subtype, :enum, values: {
    0 => 'generic',
    1 => 'treadmill',
    2 => 'street',
    3 => 'trail',
    4 => 'track',
    5 => 'spin',
    6 => 'indoor_cycling',
    7 => 'road',
    8 => 'mountain',
    9 => 'downhill',
    10 => 'recumbent',
    11 => 'cyclocross',
    12 => 'hand_cycling',
    13 => 'track_cycling',
    14 => 'indoor_rowing',
    15 => 'elliptical',
    16 => 'stair_climbing',
    17 => 'lap_swimming',
    18 => 'open_water',
    254 => 'all' }
Fit::File::Types.add_type :activity_level, :enum, values: {
    0 => 'low',
    1 => 'medium',
    2 => 'high' }
Fit::File::Types.add_type :left_right_balance, :uint8, values: {
    127 => 'mask',
    128 => 'right' }
Fit::File::Types.add_type :left_right_balance_100, :uint16, values: {
    16383 => 'mask',
    32768 => 'right' }
Fit::File::Types.add_type :length_type, :enum, values: {
    0 => 'idle',
    1 => 'active' }
Fit::File::Types.add_type :connectivity_capabilities, :uint32z, values: {
    1 => 'bluetooth',
    2 => 'bluetooth_le',
    4 => 'ant',
    8 => 'activity_upload',
    16 => 'course_download',
    32 => 'workout_download',
    64 => 'live_track',
    128 => 'weather_conditions',
    256 => 'weather_alerts',
    512 => 'gps_ephemeris_download',
    1024 => 'explicit_archive',
    2048 => 'setup_incomplete',
    4096 => 'continue_sync_after_software_update',
    8192 => 'connect_iq_app_download' }
Fit::File::Types.add_type :stroke_type, :enum, values: {
    0 => 'no_event',
    1 => 'other',
    2 => 'serve',
    3 => 'forehand',
    4 => 'backhand',
    5 => 'smash' }
Fit::File::Types.add_type :body_location, :enum, values: {
    0 => 'left_leg',
    1 => 'left_calf',
    2 => 'left_shin',
    3 => 'left_hamstring',
    4 => 'left_quad',
    5 => 'left_glute',
    6 => 'right_leg',
    7 => 'right_calf',
    8 => 'right_shin',
    9 => 'right_hamstring',
    10 => 'right_quad',
    11 => 'right_glute',
    12 => 'torso_back',
    13 => 'left_lower_back',
    14 => 'left_upper_back',
    15 => 'right_lower_back',
    16 => 'right_upper_back',
    17 => 'torso_front',
    18 => 'left_abdomen',
    19 => 'left_chest',
    20 => 'right_abdomen',
    21 => 'right_chest',
    22 => 'left_arm',
    23 => 'left_shoulder',
    24 => 'left_bicep',
    25 => 'left_tricep',
    26 => 'left_brachioradialis',
    27 => 'left_forearm_extensors',
    28 => 'right_arm',
    29 => 'right_shoulder',
    30 => 'right_bicep',
    31 => 'right_tricep',
    32 => 'right_brachioradialis',
    33 => 'right_forearm_extensors',
    34 => 'neck',
    35 => 'throat' }
Fit::File::Types.add_type :source_type, :enum, values: {
    0 => 'ant',
    1 => 'antplus',
    2 => 'bluetooth',
    3 => 'bluetooth_low_energy',
    4 => 'wifi',
    5 => 'local' }

# the type below is assigned to some fileds, but
# it is not defined in terms of values and basic type in FIT SDK as
# of 2015-01-29
Fit::File::Types.add_type :bool, :uint8, values: {
    0 => false,
    1 => true }
