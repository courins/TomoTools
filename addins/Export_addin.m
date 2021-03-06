function mod_hdl = Export_addin(handles)

% Panel addin for exporting data
% Robert S. Bradley (c) 2015

%% LOAD DEFAULTS FOR SIZING COMPONENTS =================================
margin = handles.defaults.margin_sz;
button_sz = handles.defaults.button_sz;
edit_sz = handles.defaults.edit_sz;
info_sz = handles.defaults.info_sz;
axes_sz = handles.defaults.axes_sz;
status_sz = handles.defaults.status_sz;
central_pos = handles.defaults.central_pos;
panel_pos =  handles.defaults.panel_pos;
subpanel_pos = handles.defaults.subpanel_pos;


%% PANEL NAME==========================================================
mod_hdl.name = 'Export';
mod_hdl.version = '1.0';
mod_hdl.target = 'PR'; %Suitable for projection images and reconstructed slices


%% EXPORT Panel==========================================================
%Create export panel
mod_hdl.panel = uipanel('Parent', handles.action_panel, 'Units', 'normalized', 'Position', subpanel_pos, 'Title', 'Export settings');
set(handle(mod_hdl.panel), 'BorderType', 'line',  'HighlightColor', handles.defaults.border_colour, 'BorderWidth', handles.defaults.border_width);  

set(mod_hdl.panel, 'Units', 'pixels');
subpanel_sz = get(mod_hdl.panel, 'Position');

%Add browse directory push button
mod_hdl.dir_label = uicontrol('Style', 'text', 'Parent', mod_hdl.panel, 'String', 'Select output directory:', 'units', 'pixels');
set(mod_hdl.dir_label, 'position', [margin subpanel_sz(4)-central_pos-button_sz(2)/2 3*button_sz(1) button_sz(2)], 'HorizontalAlignment', 'left'); 
%pos = get(handles.dir_label, 'position');

%Add browse directory push button
mod_hdl.dir_button = uicontrol('Style', 'pushbutton', 'Parent', mod_hdl.panel, 'String', 'Browse', 'units', 'pixels', 'Tag', 'Local');
set(mod_hdl.dir_button, 'position', [2*margin subpanel_sz(4)-margin-central_pos-2*button_sz(2)/2 1.25*button_sz(1) button_sz(2)]); 
pos = get(mod_hdl.dir_button, 'position');

%Add file edit box
mod_hdl.diropen_edit = uicontrol('Style', 'edit', 'Parent', mod_hdl.panel, 'BackgroundColor', [1 1 1], 'Tag', 'Local');
set(mod_hdl.diropen_edit, 'position', [pos(1)+pos(3)+margin subpanel_sz(4)-margin-central_pos-button_sz(2)/2-edit_sz(2)/2 edit_sz(1) edit_sz(2)], 'HorizontalAlignment', 'Left');

%Add output file type label
mod_hdl.filetype_label = uicontrol('Style', 'text', 'Parent', mod_hdl.panel, 'String', 'Select output file type and data type:', 'units', 'pixels');
set(mod_hdl.filetype_label, 'position', [margin pos(2)-2.5*margin-button_sz(2) 4*button_sz(1) button_sz(2)], 'HorizontalAlignment', 'left'); 
pos = get(mod_hdl.filetype_label, 'position');

%Add output file type menu
menu_sz_ratio = [2 1];
mod_hdl.filetype_menu = uicontrol('Style', 'popupmenu', 'Parent', mod_hdl.panel, 'String', 'Select file type:','BackgroundColor', [1 1 1],....
                  'Position', [pos(1) pos(2)-margin-button_sz(2)/2 menu_sz_ratio(1)*button_sz(1) menu_sz_ratio(2)*button_sz(2)],....
                  'String', {'tiff images';'avizo am format'; 'binary files'}, 'Tag', 'Local');

%Add output data type menu              
mod_hdl.datatype_menu = uicontrol('Style', 'popupmenu', 'Parent', mod_hdl.panel, 'String', 'Select data type:','BackgroundColor', [1 1 1],....
                  'Position', [pos(1)+margin+menu_sz_ratio(1)*button_sz(1) pos(2)-margin-button_sz(2)/2 menu_sz_ratio(1)*button_sz(1) menu_sz_ratio(2)*button_sz(2)],....
                  'String', {'uint8'; 'uint16'; 'float32'}, 'Tag', 'Local');              

pos = get(mod_hdl.datatype_menu, 'position');              
              
%Add apply flat field check box
mod_hdl.flatfield_cbox = uicontrol('Style', 'checkbox', 'Parent', mod_hdl.panel, 'String', 'Apply flat field','HorizontalAlignment', 'Left',...
                  'Position', [pos(1)+2*margin+menu_sz_ratio(1)*button_sz(1) pos(2)+margin menu_sz_ratio(1)*button_sz(1) menu_sz_ratio(2)*button_sz(2)], 'Value', 1, 'Tag', 'Local');  
              
%Add apply scale box
pos = get(mod_hdl.flatfield_cbox, 'position');  
mod_hdl.scale_cbox = uicontrol('Style', 'checkbox', 'Parent', mod_hdl.panel, 'String', 'Apply display scale','HorizontalAlignment', 'Left',...
                  'Position', [pos(1)+2*margin+menu_sz_ratio(1)*button_sz(1) pos(2) 1.25*menu_sz_ratio(1)*button_sz(1) menu_sz_ratio(2)*button_sz(2)], 'Value', 0, 'Tag', 'Local');    
              



%Pre-scaling options label
mod_hdl.prescaling_label = uicontrol('Style', 'text', 'Parent', mod_hdl.panel, 'String', 'Pre-scale data using equation:', 'units', 'pixels');
set(mod_hdl.prescaling_label, 'position', [margin pos(2)-2.5*margin-button_sz(2) 4*button_sz(1) button_sz(2)], 'HorizontalAlignment', 'left'); 
pos = get(mod_hdl.prescaling_label, 'position');  

%Pre-scaling options equation
mod_hdl.prescaling_edit = uicontrol('Style', 'edit', 'Parent', mod_hdl.panel, 'BackgroundColor', [1 1 1], 'Tag', 'Local');
set(mod_hdl.prescaling_edit, 'position', [pos(1) pos(2)+margin-button_sz(2)/2 1.5*menu_sz_ratio(1)*button_sz(1) edit_sz(2)], 'HorizontalAlignment', 'Left');

%Prescaling options checkbox
mod_hdl.prescaling_cbox = uicontrol('Style', 'checkbox', 'Parent', mod_hdl.panel, 'String', 'Apply pre-scaling','HorizontalAlignment', 'Left',...
                  'Position', [pos(1)+2*margin+1.5*menu_sz_ratio(1)*button_sz(1)+2*margin+button_sz(1) pos(2)+margin-edit_sz(2) menu_sz_ratio(1)*button_sz(1) menu_sz_ratio(2)*button_sz(2)], 'Value', 0, 'Tag', 'Local');  
              
%Prescaling options calc button
mod_hdl.prescaling_calcbtn = uicontrol('Style', 'pushbutton', 'Parent', mod_hdl.panel, 'String', 'Calculate','HorizontalAlignment', 'Left',...
                  'Position', [pos(1)+2*margin+1.5*menu_sz_ratio(1)*button_sz(1) pos(2)+margin-edit_sz(2) 1.25*button_sz(1) button_sz(2)], 'Value', 0, 'Tag', 'Local');                
              
 
%OPEN BUTTON CALL BACK TO SELECT DIRECTORY              
set(mod_hdl.dir_button, 'Callback', {@dir_select, mod_hdl});

%CALC BUTTON CALL BACK FOR PRESCALING              
set(mod_hdl.prescaling_calcbtn, 'Callback', {@calc_prescaling_eqn, mod_hdl});

              
%% FUNCTIONS ========================================================            
mod_hdl.run_function = @(h,q) file_export(h, mod_hdl, q);   %function to run when click go   
mod_hdl.load_function = @(h) file_load(h, mod_hdl);  % function to run on file load



end


%% INTERNAL FUNCTIONS==================================================
function dir_select(~,~,mod_hdl)
    
   %Select output directory and put name into edit field
   folder_name = uigetdir(get(mod_hdl.diropen_edit, 'String'));
   if isnumeric(folder_name)
      return; 
   end 
   set(mod_hdl.diropen_edit, 'String', folder_name);  

end

function file_load(handles,mod_hdl)
    %Update output directory
    dpath = fileparts(handles.DATA.file);
    set(mod_hdl.diropen_edit, 'String', dpath);
    if isempty(strfind(handles.DATA.data_type, 'int'))
        set(mod_hdl.scale_cbox, 'Value', 1, 'Enable', 'off');        
    else
        set(mod_hdl.scale_cbox, 'Value', 0, 'Enable', 'on');
    end
    switch handles.hdr_short.FileContents(1)
        case 'P'
           set(mod_hdl.flatfield_cbox, 'Value', 1, 'Enable', 'on');  
        otherwise
           set(mod_hdl.flatfield_cbox, 'Value', 0, 'Enable', 'off');    
    end
end


function calc_prescaling_eqn(~,~,mod_hdl)

    %Choose mode: fit full cdf or only peaks
    button = questdlg('Select fitting mode:','Prescaling','peaks','cdf', 'peaks');
    
    switch button
        case 'peaks'

    %Calculate using peak positions
    answers = inputdlg({'Enter peak positions for current data:','Enter peak positions for reference data:', 'Enter order of polynomial fit:'}, 'Calculate pre-scaling from peak positions', 1, {'','','1'}); 
    
    if isempty(answers)
        return;
    end
    if isempty(answers{1}) | isempty(answers{2})
        return;
    end
    
    
    p = polyfit(str2num(answers{1}),str2num(answers{2}),str2num(answers{3}));
    
        case 'cdf'
        [FileName,PathName,FilterIndex] = uigetfile('*.fig', 'Select reference histogram');
         openfig([PathName FileName]);  
         ch = get(gca, 'Children');
         xdata_ref = get(ch(1),'XData');   
         ydata_ref = get(ch(1),'YData');
         ydata_ref = cumsum(ydata_ref)/sum(ydata_ref(:));
         
         [FileName,PathName,FilterIndex] = uigetfile('*.fig', 'Select current histogram');
         openfig([PathName FileName]);    
         ch = get(gca, 'Children');
         xdata = get(ch(1),'XData');   
         ydata = get(ch(1),'YData');
         ydata = cumsum(ydata)/sum(ydata(:));
         [cdf_adj xparams] = fit_cdf([xdata(:) ydata(:)],[xdata_ref(:) ydata_ref(:)]);
         p = xparams;
    end
    pstr = [];
    for  pp = 1:numel(p)
       order = numel(p)-pp; 
       if order>1
           order_str = ['x^' num2str(order)];
       elseif order==1
           order_str = 'x';
       else
           order_str = '';
       end
       
       if p(pp)>=0
           pstr = [pstr ' +' num2str(p(pp)) order_str];
       else
           pstr = [pstr ' ' num2str(p(pp)) order_str];
       end
        
    end
    set(mod_hdl.prescaling_edit, 'String', pstr(3:end));
    
end


%NEED TO PUT ALL handles things in DATA properties
function queued = file_export(handles,mod_hdl,queue)
    %FUNCTION TO EXPORT DATA

    %Check if to rescale data between min and max
    apply_scale = get(mod_hdl.scale_cbox, 'Value');
    if apply_scale
        scale = [str2num(get(handles.displayscale_min, 'String')) str2num(get(handles.displayscale_max, 'String'))];
    else
        scale = [];
    end    
    
    %get output file type
    outputfile_type = get(mod_hdl.filetype_menu, 'Value');

    %Get data type
    data_typeval = get(mod_hdl.datatype_menu, 'Value');
    data_typestr = get(mod_hdl.datatype_menu, 'String');

    %Find output datatype
    try
        output_datatype = data_typestr{data_typeval};
    catch
        output_datatype = data_typestr(data_typeval);
    end    

    %Create file name
    switch handles.DATA.contents(1)
        case 'P'
            outputfn = [get(mod_hdl.diropen_edit, 'String') '\proj_']; %CHANGE
        case 'R'
            outputfn = [get(mod_hdl.diropen_edit, 'String') '\slice_']; %CHANGE
    end

    %remove \\ in dir if necessary
    outputfn = strrep(outputfn, '\\', '\');

    %Determine slice range
    Fcrop = round(str2num(get(handles.cropfirst_box, 'String')));
    LSTcrop = round(str2num(get(handles.croplast_box, 'String')));
    image_rng = [Fcrop 1 LSTcrop];

    %Determine crop range
    Tcrop = round(str2num(get(handles.croptop_box, 'String')));
    Bcrop = round(str2num(get(handles.cropbottom_box, 'String')));
    Lcrop = round(str2num(get(handles.cropleft_box, 'String')));
    Rcrop = round(str2num(get(handles.cropright_box, 'String')));

    crop_rng = [Tcrop Bcrop Lcrop Rcrop];    
    
    
     ROI = handles.DATA.ROI;
     handles.DATA.ROI = [1+Tcrop 1+Lcrop Fcrop; 1 1 1; handles.DATA.dimensions(1)-Bcrop handles.DATA.dimensions(2)-Rcrop LSTcrop];
        
     DR = handles.DATA.data_range;
     if ~isempty(scale)        
         handles.DATA.data_range = scale;
     end
    
    %Determine internal write function
    switch outputfile_type
        case 1
            %Tiff
            write_fn = 'tiff';
        case 2
            %AM encoding to single file
            write_fn = 'am';
            [~, f] = fileparts(handles.DATA.file);
            outputfn = [get(mod_hdl.diropen_edit, 'String') '\' f '.am'];
        case 3
            %Binary
            write_fn = 'binary';
            
    end        

    if queue
        %Add job to queue        
        queued.function = mod_hdl.name;
        queued.version = mod_hdl.version;
        queued.filename = handles.DATA.file;
        queued.filetype = handles.filetype;
        queued.mstring = ['DATA.ROI = ' mat2str(handles.DATA.ROI) sprintf(';\n')];        
        queued.mstring = [queued.mstring 'DATA.data_range = ' mat2str(handles.DATA.data_range) sprintf(';\n')];
        queued.mstring = [queued.mstring func2mstring('DATA3D_export', '#DATA', write_fn, outputfn, output_datatype)];
        
        handles.add2queue(queued);
                           
    else  
        %Run export       
        DATA3D_export(handles.DATA, write_fn, outputfn, output_datatype)
        
    end
    handles.DATA.ROI = ROI;
    handles.DATA.data_range = DR;

end