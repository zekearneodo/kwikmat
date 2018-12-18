% get the indices of a channel name (or wildcard for multiple channels)
% within a chan_list
function idx_vec = get_chan_index(chan_list, chan_name)
    % chan_name is either a channel name or a part.
    % useful when you want to get a whole segment, i.e A- for port A
    % ADC- for all the adc channels.
    idx_vec = cellfun(@(x) any(x), (strfind(chan_list, chan_name)));
end