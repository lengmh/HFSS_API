% Description:
% ------------
clear all;
% add paths to the required m-files.
try
    addpath('..');
    %init_hfssapi;		
    runAndExit = true ; 
    runAndExit = false ; % debug
    iconized = true ;    
    nowait = false; 
    serial = 0;
    % Create a new temporary HFSS script file.	
    OD = 60:10:200;
    % M11_W = 5;  M11_S = 2;
    M9_W = 2:2:4; 
    M9_S = 2:2:4;
	iter = 1;
	total = length(OD)*length(M9_W)*length(M9_S);	
    for i=1:length(OD)
        for j=1:length(M9_W)
            for k=1:length(M9_S)
                % Read file as text
                x = fileread('ind_dualp.vbs');                
                % Remove commas from numbers
                fn = ['ind_dualp-D' num2str(OD(i)) 'W' num2str(M9_W(j))  'S' num2str(M9_S(k)) ];
                x = regexprep(x, 'HFSS_FILENAME', fn);
                x = regexprep(x, '<OD>', num2str(OD(i)));
                x = regexprep(x, '<W>', num2str(M9_W(j)));
                x = regexprep(x, '<S>', num2str(M9_S(k)));
                file_out = fopen(['.\DUALP\' fn '.vbs'],'w+') ;                                  
                fprintf(file_out,'%s',x);
                fclose all;
                iter = iter + 1;                   
            end
        end
    end 
catch exception
    disp('**** Error Caught **** Stack =');
    disp('Caller Stack =');
    err = struct2cell(exception.stack);
    % Show Caller Stack 
    disp(err(2:3,:));
    % Show the error thrown
    disp(exception.message);
end
% remove all the added paths.
%   deinit_hfssapi;