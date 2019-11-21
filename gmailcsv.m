function list = gmailcsv(filename)

% read and separates name and email value from list
fileText = textread(filename, '%s', 'delimiter', '\n', 'whitespace', '');
% read header
header = fileText{1};
[~, ~, ~, ~, ~, ~, splitStr] = regexp(header, ',');
% Find position of 'Name'
nameIdx = find(cellfun(@(x) strcmp('Name',x),splitStr));
% Find position of 'E-mail 1 - Value'
emailIdx = find(cellfun(@(x) strcmp('E-mail 1 - Value',x),splitStr));
% nCols = numel(splitStr);
nContacts = size(fileText,1)-1;
% preallocate list
list = cell([nContacts 2]);
for iContacts = 1:nContacts,
     [~, ~, ~, ~, ~, ~, currentRow] = regexp(fileText{iContacts+1}, ',');
    list{iContacts, 1} = currentRow{nameIdx};
    list{iContacts, 2} = currentRow{emailIdx};
end
end
            
