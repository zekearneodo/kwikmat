% Set of functions to read .kwd files tha follow the format specified in
% https://github.com/klusta-team/kwiklib/wiki/Kwik-format
% Example usage:
% list the recordings of a .kwd file
kwd_file_path = '/Users/zeke/experiment/raw_data/o3g3/ss_data/awake_mix_test/experiment2.kwd';
% get the info structure of the file
kwd_file_info = h5info(kwd_file_path);

% get the list of recordings
rec_list = list_recordings(file_info);

% get the timestamps of all of the recordings
all_time_stamps = get_rec_timestamps(file_info, rec_list);

% get the timestamps in a cell array of strings, using the read attributes
% function
all_time_stamps_cell = read_rec_attrib(file_info, 'start_time', rec_list);
% for one particular recording, get the list of channel names
% for multiple recordings, chan_list should be the same if nothing was
% changed within the session. 
% But if it was, still the channels can be read consistendly across the
% session, if they were present, addressing them by name.

this_rec_id = rec_list(1);
chan_list = get_channel_list(kwd_file_path, this_rec_id);

% read the data of the channel named 'ADC-00' (usually the microphone)
mic_data = read_chan_list(kwd_file_path, this_rec_id, {'ADC-00'});
size(mic_data)
plot(mic_data)

% read the data of the first port in the intan board ('A-???')
neural_data = read_chan_list(kwd_file_path, this_rec_id, {'A-'});
size(neural_data)

% read the data of all ports in the intan board ('A-???')
all_neural_data = read_chan_list(kwd_file_path, this_rec_id, {'A-', 'B-', 'C-', 'D-'});
size(all_neural_data)

% Todo:
% - read a .json file where the names of the channels to extract are (e.g:
% microphone: 'ADC-00'
% electrode: 'A-'
% - read digital channels (that we' rather do from the events table
% recorded in the .kwe file).