function giftexchange(list, mail, password) % randomize contacts and send e-mails

pos = (1:length(list))';
pos2 = (randperm(length(list)))';
while any(pos == pos2)
    disp('error')
    disp([pos pos2])
    pos2 = (randperm(length(list)))';
end
for iContacts=1:length(list),
    list2{iContacts,1} = list{pos2(iContacts),1};
    list2{iContacts,2} = list{pos2(iContacts),2};
    list3{iContacts+1,1} = list{iContacts,1};
    list3{iContacts+1,2} = list2{iContacts,1};
end
list3{1,1} = 'Giver';
list3{1,2} = 'Given';
%disp(list3); %uncomment this if you want to see which is which.. but that
%would ruin the surprise



fprintf('Sending e-mails...\n');

% Send the email   %change whatever mesage you want between the ' '
for iContacts = 1:size(list,1)
    send_mail_message(mail, password, list{iContacts,2},'Gift Exchange',...
        ['Hello ' list{iContacts,1} sprintf(',\n\n')...
        sprintf('This is an e-mail automatically generated using MATLAB\nYou will give a gift to: ')...
        list2{iContacts,1} sprintf('\nThe gift cost should be about $10')...  %%change price here
        sprintf('\n\n--\nWish you the best, Santa\n')]);
end
fprintf('e-mails sent!\n');

end