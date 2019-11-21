
%% SECRET SANTA %%
% Define variables
filename    = 'contacts.csv';              % .CSV file avec gmail list (You can easyly get that by doing a "group" in your gmail account and 
% click on [More][Export ...][Google CSV format (for importing into a Google account)
% if you want to do it manually you should call the first column "Name" and the second one "E-mail 1 - Value"
mail        = 'yourGmailadress@gmail.com';    % Your Gmail address
password    = 'yourPassword';      % Your GMail password %whatchout when you share this obviously!!%%
%you might have to allow "less secure apps on your gmail account momentarly"

% Read .CSV file
list        = gmailcsv(filename);
% randomize contacts and send e-mails
giftexchange(list, mail, password);
