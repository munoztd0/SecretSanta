function send_mail_message(mail, password, id, subject, message)
%% SEND_MAIL_MESSAGE send email to gmail once lottery is done


% Send Mail ID
emailto = strcat(id); 
%% Set up Gmail SMTP service.  DO NOT MODIFY
% Then this code will set up the preferences properly:
setpref('Internet','E_mail',mail);
setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','SMTP_Username',mail);
setpref('Internet','SMTP_Password',password);

% Gmail server
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');


sendmail(emailto,subject,message)

end
