% get the list of channel names that are in the \data dataset within a
% recording group
function chan_list = get_channel_list(kwd_file_path, rec_name)
    rec_location = sprintf('/recordings/%d/application_data', rec_name);
    chan_list = h5readatt(kwd_file_path, rec_location, 'channel_names');
end