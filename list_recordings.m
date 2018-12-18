% List the recordings within a kwd/kwik file
function rec_list = list_recordings(file_info)
    % file_info: info of the file (output of h5info(kwd_file_path)
    % rec_list: list of the present recordings
    
    rec_list = cellfun(@(x) str2double(strtok(x, '/recordings/')), {file_info.Groups.Groups.Name});
end
