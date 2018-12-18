% example
function data = read_chan_list(kwd_file_path, rec_id, chan_names_cell)
    % kwd_file_path: (str) path to kwd file
    % rec_id: (int) rec identifier
    % chan_names_cell: (cell array) names of channels to extract (e.g
    % {'ADC-00', 'B-', 'A-016'}
    % data: array (n_chan, n_samples). The data
    
    chan_list = get_channel_list(kwd_file_path, rec_id);
    idx_cell_arr = cellfun(@(x) get_chan_index(chan_list, x), chan_names_cell, 'UniformOutput', false);
    chan_idx_vec = sum(cell2mat(idx_cell_arr), 2);
    
    data = read_channels(kwd_file_path, rec_id, chan_idx_vec);
    
end