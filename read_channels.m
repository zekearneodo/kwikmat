function chan_data = read_channels(kwd_path, rec_id, chan_idx_vec)
    % chan_idx_vec is a one-hot encoding of chosen channels [0 0 1 0 1..]
    chan_indices = find(chan_idx_vec);
    chan_block = [min(chan_indices), max(chan_indices)];
    
    dset_name = sprintf('/recordings/%d/data', rec_id);
    dset_info = h5info(kwd_path, dset_name);
    dset_len = dset_info.Dataspace.Size(2);
    
    data_block = h5read(kwd_path, dset_name, [chan_block(1), 1], [diff(chan_block)+1, dset_len]);
    
    block_chan_idx_vec = chan_idx_vec(chan_block(1): chan_block(2));
    chan_data = data_block(block_chan_idx_vec, :);
end