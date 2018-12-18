function attr = read_rec_attrib(file_info, attrib_name, rec_id_list)
    all_rec_list = list_recordings(file_info);
    ri = file_info.Groups(1); % short variable name for recordings info
    
    rec_idx_list = find(ismember(all_rec_list, rec_id_list));
    
    attr = arrayfun(@(x) ri.Groups(x).Attributes(contains({ri.Groups(x).Attributes.Name},...
        attrib_name)).Value, rec_idx_list, 'UniformOutput', false);
end