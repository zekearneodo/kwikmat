function time_stamps = get_rec_timestamps(file_info, rec_id_list)
    %in: file_info as read by h5read
    % rec_id_list (n_rec *1 array) all the rec_ids to get the times from
    % time_stamps: (n_rec * 6) array with one row of [yy mm dd hh mm ss]
    % per rec_id in rec_id_list
    
    time_stamps_cell = read_rec_attrib(file_info, 'start_time', rec_id_list);
    time_stamps = datevec(time_stamps_cell);
end

