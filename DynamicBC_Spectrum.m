function DynamicBC_Spectrum()
D.fig = figure('Name','Amplitude Spectrum',...       
    'units','normalized',...      
    'menubar','none',...       
    'numbertitle','off',...      
    'unit','normalized',...
    'color',[0.95 0.95 0.95],...
    'position',[0.25 0.2 0.4 0.4]);
movegui(D.fig,'center');           
            
%%=========================Mask_ROI=====================================
D_bg_mr_pos = [0.01 0.7 0.66 0.25];
D.D_bg_mr_pos = D_bg_mr_pos;

D.ed_files = uicontrol('style','text',...
                    'visible','off',...
                    'string',' ');
                
D.bg_mr(1) = uibuttongroup('units','norm',...
                     'pos',D_bg_mr_pos);   
                 
D.tx_mr(1) = uicontrol(D.bg_mr(1),...
                'style','text',...
                'units','norm',...
                'position',[0.2 0.92 0.6 0.26],...
                'string','Set ROI',...               
                'fontunits', 'normalized', 'fontsize',0.8,...
                'fontweight','bold',...
                'foregroundcolor',[.1 .1 .1]);     

D.rd_mr(1) = uicontrol('Parent',D.bg_mr(1),...
                    'style','rad',...
                    'units','norm',...
                    'position',[0.05 0.65 0.7 0.3],...
                    'string','Sphere ROI (MNI coordinate)',...                    
                    'backgroundc',get(D.bg_mr(1),'backgroundc'),...
                    'fontunits', 'normalized', 'fontsize',0.4,...
                    'fontweight','bold',...
                    'horizontalalign','center',...
                    'foregroundcolor',[0 0 .8],...
                    'value',1,...
                    'TooltipString','...');             
% mapping case.                 
D.rd_mr(2) = uicontrol('Parent',D.bg_mr(1),...
                    'style','rad',...
                    'units','norm',...
                    'position',[0.05 0.35 0.8 0.33],...
                    'string','ROI Mask',...                    
                    'backgroundc',get(D.bg_mr(1),'backgroundc'),...
                    'fontunits', 'normalized', 'fontsize',0.4,...
                    'fontweight','bold',...
                    'horizontalalign','center',...
                    'foregroundcolor',[0 0 0.8],...
                    'value',0,...
                    'TooltipString','...');    
D.ed_mask = uicontrol(D.bg_mr(1),...
                    'style','edit',...
                    'unit','norm',...
                    'position',[0.25 0.38 0.6 0.22],...
                    'fontunits', 'normalized', 'fontsize',0.5,...
                    'string','not selected');       
D.pb_mask = uicontrol(D.bg_mr(1),...
                  'style','pushbutton',...
                  'units','norm',...
                  'position',[0.88 0.37 0.09 0.25],...
                  'string','...',...
                  'TooltipString','Click me!',...
                  'fontunits', 'normalized', 'fontsize',0.8);     
              
              
% ROI wise case
D.rd_mr(3) = uicontrol('Parent',D.bg_mr(1),...
                    'style','rad',...
                    'units','norm',...
                    'position',[0.05 0.05 0.5 0.3],...
                    'string','Conn Index: [I, J]=',...                    
                    'backgroundc',get(D.bg_mr(1),'backgroundc'),...
                    'fontunits', 'normalized', 'fontsize',0.4,...
                    'fontweight','bold',...
                    'foregroundcolor',[0 0 .8],...
                    'value',0,...
                    'TooltipString','e.g. FC(I,J)');                 
D.ed_mat = uicontrol('Parent',D.bg_mr(1),...
                    'style','edit',...
                    'units','norm',...
                    'position',[0.3 0.08 0.15 0.25],...
                    'string','[1,2]',...                    
                    'backgroundc',get(D.bg_mr(1),'backgroundc'),...
                    'fontunits', 'normalized', 'fontsize',0.5,...
                    'fontweight','bold',...
                    'horizontalalign','center',...
                    'foregroundcolor',[0 0 .8],...                   
                    'visible','on',...
                    'TooltipString','...');  
                
D.tx_varname = uicontrol('Parent',D.bg_mr(1),...
                    'style','text',...
                    'units','norm',...
                    'position',[0.45 0.001 0.3 0.25],...
                    'string','Variable name:',...                    
                    'backgroundc',get(D.bg_mr(1),'backgroundc'),...
                    'fontunits', 'normalized', 'fontsize',0.45,...
                    'fontweight','bold',...
                    'foregroundcolor',[0 0 .8],...
                    'value',0,...
                    'visible','off',...
                    'TooltipString','e.g. FC(I,J)');                 
D.ed_varname = uicontrol('Parent',D.bg_mr(1),...
                    'style','edit',...
                    'units','norm',...
                    'position',[0.75 0.03 0.2 0.25],...
                    'string','FCM.Matrix',...                    
                    'backgroundc',get(D.bg_mr(1),'backgroundc'),...
                    'fontunits', 'normalized', 'fontsize',0.5,...
                    'fontweight','bold',...
                    'horizontalalign','center',...
                    'foregroundcolor',[0 0 .8],...                   
                    'visible','off',...
                    'TooltipString','...'); 

D.tx_fs = uicontrol('Parent',D.bg_mr(1),...
                    'style','text',...
                    'units','norm',...
                    'position',[0.58 0.68 0.3 0.2],...
                    'string','Sampling Rate:',...                    
                    'backgroundc',get(D.bg_mr(1),'backgroundc'),...
                    'fontunits', 'normalized', 'fontsize',0.6,...
                    'fontweight','bold',...
                    'horizontalalign','center',...
                    'foregroundcolor',[1 0 0],...
                    'value',1,...
                    'TooltipString','...');
D.ed_fs = uicontrol('Parent',D.bg_mr(1),...
                    'style','edit',...
                    'units','norm',...
                    'position',[0.85 0.7 0.13 0.2],...
                    'string','1/2',...                    
                    'backgroundc',get(D.bg_mr(1),'backgroundc'),...
                    'fontunits', 'normalized', 'fontsize',0.5,...
                    'fontweight','bold',...
                    'horizontalalign','center',...
                    'foregroundcolor',[1 0 0],...                   
                    'visible','on',...
                    'TooltipString','...');                   
%% seed MNI input
D.bg_seed_voxel = uibuttongroup('Parent',D.fig,...
                     'units','norm',...
                     'pos',[0.69 0.7 0.30 0.25]);   
D.tx_sphere(1) = uicontrol(D.bg_seed_voxel,...
                'style','text',...
                'units','norm',...
                'position',[0.2 0.99 0.6 0.2],...
                'string','Sphere MNI',...               
                'fontunits', 'normalized', 'fontsize',0.6,...
                'fontweight','bold',...
                'foregroundcolor',[.1 .1 .1]); 
xyz_height = [0.75 0.5 0.26 0.01];  
xyz_label = {'x','y','z','radius'};
xyz_val = {'0','-53','26','6'};
for xyz=1:4       
    D.ed_MNI(xyz) = uicontrol('Parent',D.bg_seed_voxel,...
                        'style','edit',...
                        'units','norm',...
                        'position',[0.4 xyz_height(xyz) 0.58 0.22],...
                        'string',[xyz_val{xyz}],...                    
                        'backgroundc',get(D.bg_seed_voxel,'backgroundc'),...
                        'fontunits', 'normalized', 'fontsize',0.6,...
                        'fontweight','bold',...
                        'horizontalalign','center',...
                        'foregroundcolor',[0 0 .8],...
                        'value',1,...
                        'TooltipString',[xyz_label{xyz},'-coordinate']); 
    
    D.tx_MNI(xyz) = uicontrol('Parent',D.bg_seed_voxel,...
                        'style','text',...
                        'units','norm',...
                        'position',[0.01 xyz_height(xyz) 0.38 0.22],...
                        'string',[xyz_label{xyz},': = '],...                    
                        'backgroundc',get(D.bg_seed_voxel,'backgroundc'),...
                        'fontunits', 'normalized', 'fontsize',0.6,...
                        'fontweight','bold',...
                        'horizontalalign','center',...
                        'foregroundcolor',[0 0 .8],...
                        'value',1);  
                    
    if xyz==4
        set(D.ed_MNI(4),'String','6','TooltipString','Sphere radius -mm','position',get(D.ed_MNI(4),'position')+[0.15 0 -0.15 -0.02]);
        set(D.tx_MNI(4),'position',get(D.tx_MNI(4),'position')+[0 -0.01 0.1 0]);
    end                    
end

%% data (mat, nifti)
D.bg_data = uibuttongroup('Parent',D.fig,...
                     'units','norm',...
                     'pos',[0.01 0.59 0.98 0.1]); 
D.data_tx = uicontrol('Parent',D.bg_data,...
                    'style','text',...
                    'units','norm',...
                    'position',[0.001 0.01 0.2 0.7],...
                    'string','Select Data:',...                    
                    'backgroundc',get(D.bg_mr(1),'backgroundc'),...
                    'fontunits', 'normalized', 'fontsize',0.5,...
                    'fontweight','bold',...
                    'horizontalalign','center',...
                    'foregroundcolor',[0 0 .8],...
                    'value',1,...
                    'TooltipString','...');    
D.ed_data = uicontrol(D.bg_data,...
                    'style','edit',...
                    'unit','norm',...
                    'position',[0.18 0.15 0.6 0.7],...
                    'fontunits', 'normalized', 'fontsize',0.5,...
                    'string','not selected');       
D.pb_data = uicontrol(D.bg_data,...
                  'style','pushbutton',...
                  'units','norm',...
                  'position',[0.78 0.15 0.05 0.7],...
                  'string','...',...
                  'TooltipString','Click me!',...
                  'fontunits', 'normalized', 'fontsize',0.8);     

D.pb_run = uicontrol(D.bg_data,...
                  'style','pushbutton',...
                  'units','norm',...
                  'position',[0.85 0.08 0.12 0.8],...
                  'string','Run',...
                  'TooltipString','Click me!',...
                  'fontunits', 'normalized', 'fontsize',0.6); 

set(D.pb_mask,'callback',{@wgr_select_dir,D,'mask',''});
set(D.pb_data,'callback',{@wgr_select_dir,D,'data',''});
set(D.rd_mr(1:3),'callback',{@wgr_sphere_ROI_call,D});
set(D.pb_run,'callback',{@wgr_run_call,D});



function []=wgr_run_call(varargin)
D = varargin{3};  % Get structure.
flag_seed_ROI = cell2mat(get(D.rd_mr,'val'));
nii_mat = get(D.ed_files,'string')
varname = get(D.ed_varname,'string');

Fs = str2num(get(D.ed_fs,'string'));

if flag_seed_ROI(1)
    vm = spm_vol(nii_mat(1,:));
    mni_radius = get(D.ed_MNI,'string') ;
    mni = [str2num(mni_radius{1}) str2num(mni_radius{2}) str2num(mni_radius{3})]; 
    radius = str2num(mni_radius{4});
    cor = [mni(:,1) mni(:,2) mni(:,3) ones(size(mni,1),1)]*(inv(vm.mat))' ;
    cor(:,4) = [];
    cor = round(cor);
    [seed_cor] = wgr_center2ball(vm.dim,abs(diag(vm.mat(1:3,1:3)))',cor, radius) ; %ball
    seed_ind = sub2ind(vm.dim, seed_cor(:,1), seed_cor(:,2), seed_cor(:,3)) ;
elseif flag_seed_ROI(2)
    ROI_mask = get(D.ed_mask,'String');
    ROI_data = spm_read_vols(spm_vol(ROI_mask));
    ROI_data(isnan(ROI_data))=0;
    seed_ind = find(ROI_data>0);
else
    id_str = get(D.ed_mat,'string'); 
    id = str2num(id_str);
end

if ~flag_seed_ROI(3)
    nobs = size(nii_mat,1);
    y = zeros(nobs,1);
    for j=1:nobs
        niifile = nii_mat(j,:);
        v = spm_vol(niifile);
        tmp_dat = spm_read_vols(v);
        y(j) = dynamicBC_nanmean(tmp_dat(seed_ind));
    end
else
    str = ['matrix = ',varname,';'];
    fprintf(str)
    load(nii_mat)
    eval(str)
    nobs = length(matrix);
    y = zeros(nobs,1);
    disp(nobs)
    for j=1:nobs
        tmp = matrix{j};
        y(j) = tmp(id(1),id(2));
    end
end
    

% t = 1:1000;
% y = 3*sin(2*pi*0.05*t) + 2*randn(size(t));
% TR = 1;
% Fs = 1/TR; %sampling frequency

L = length(y); %length of signal
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(y,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);

% Plot single-sided amplitude spectrum.
axes1 = axes('Parent',D.fig,...
    'Position',[0.1 0.1 0.85 0.4],'fontunits','norm','fontsize',0.07);
box(axes1,'on');
hold(axes1,'all');
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of y(t)','fontunits','norm','fontsize',0.07)
xlabel('Frequency (Hz)','fontunits','norm','fontsize',0.07)
ylabel('|Y(f)|','fontunits','norm','fontsize',0.07);



function [] = wgr_select_dir(varargin)
D = varargin{3};
str = varargin{4};
files = spm_select(inf,'any');
num = size(files,1);
    data1=[]; data2=[];
    for i=1:num
        fname = strcat(files(i,:));
        [pathstr, name, ext] = fileparts(fname);
        if i==1
            data1 = [data1,fname];
            data2 = [data2,name];
        else
            data1 = [data1,'; ',fname];
            data2 = [data2,'; ',name];
        end
    end

if strcmp(str ,'mask')
    set(D.ed_mask,'string',files);
elseif strcmp(str ,'data')
    set(D.ed_data,'string',data1);
    set(D.data_tx,'TooltipString',data2);
    set(D.ed_files,'string',files);
end


function []=wgr_sphere_ROI_call(varargin)
D = varargin{3};  % Get structure.
flag_seed_mask = cell2mat(get(D.rd_mr,'val'));
if flag_seed_mask(1)
    set([D.ed_MNI(:),D.tx_MNI(:)],'enable','on');   
    set([D.ed_varname,D.tx_varname],'vis','off');
elseif flag_seed_mask(2)
   set([D.ed_MNI(:),D.tx_MNI(:)],'enable','off');
   set([D.ed_varname,D.tx_varname],'vis','off');
else
    set([D.ed_MNI(:),D.tx_MNI(:)],'enable','off');
    set([D.ed_varname,D.tx_varname],'vis','on');
end

function [cor_s] = wgr_center2ball(ABrainSize, AVoxelSize, AROICenter, AROIRadius);
%ABrainSize, such as [61, 73, 61]
%AROICenter ,cor coordinate
radiusX =round(AROIRadius /AVoxelSize(1));
if (AROICenter(1)-radiusX)>=1 && (AROICenter(1)+radiusX)<=ABrainSize(1)
    rangeX	=(AROICenter(1)-radiusX):(AROICenter(1)+radiusX);
elseif (AROICenter(1)-radiusX)<1 && (AROICenter(1)+radiusX)<=ABrainSize(1)
    rangeX	=1:(AROICenter(1)+radiusX);
elseif (AROICenter(1)-radiusX)>=1 && (AROICenter(1)+radiusX)>ABrainSize(1)
    rangeX	=(AROICenter(1)-radiusX):ABrainSize(1);
else
    rangeX =1:ABrainSize(1);
end

radiusY =round(AROIRadius /AVoxelSize(2));
if (AROICenter(2)-radiusY)>=1 && (AROICenter(2)+radiusY)<=ABrainSize(2)
    rangeY	=(AROICenter(2)-radiusY):(AROICenter(2)+radiusY);
elseif (AROICenter(2)-radiusY)<1 && (AROICenter(2)+radiusY)<=ABrainSize(2)
    rangeY	=1:(AROICenter(2)+radiusY);
elseif (AROICenter(2)-radiusY)>=1 && (AROICenter(2)+radiusY)>ABrainSize(2)
    rangeY	=(AROICenter(2)-radiusY):ABrainSize(2);
else
    rangeY =1:ABrainSize(2);
end

radiusZ =round(AROIRadius /AVoxelSize(3));
if (AROICenter(3)-radiusZ)>=1 && (AROICenter(3)+radiusZ)<=ABrainSize(3)
    rangeZ	=(AROICenter(3)-radiusZ):(AROICenter(3)+radiusZ);
elseif (AROICenter(3)-radiusZ)<1 && (AROICenter(3)+radiusZ)<=ABrainSize(3)
    rangeZ	=1:(AROICenter(3)+radiusZ);
elseif (AROICenter(3)-radiusZ)>=1 && (AROICenter(3)+radiusZ)>ABrainSize(3)
    rangeZ	=(AROICenter(3)-radiusZ):ABrainSize(3);
else
    rangeZ =1:ABrainSize(3);
end
mni_s = []; cor_s = [];
for x=rangeX, for y=rangeY, for z=rangeZ,
    %Ball Definition, Computing within a cubic to minimize the time to be consumed
    if norm(([x, y, z] -AROICenter).*AVoxelSize)<=AROIRadius,
        cor_s = [cor_s; [x, y, z]];
    end
end; end; end;

function m = dynamicBC_nanmean(x,dim)
%NANMEAN Mean value, ignoring NaNs.
%   M = NANMEAN(X) returns the sample mean of X, treating NaNs as missing
%   values.  For vector input, M is the mean value of the non-NaN elements
%   in X.  For matrix input, M is a row vector containing the mean value of
%   non-NaN elements in each column.  For N-D arrays, NANMEAN operates
%   along the first non-singleton dimension.
%
%   NANMEAN(X,DIM) takes the mean along dimension DIM of X.
%
%   See also MEAN, NANMEDIAN, NANSTD, NANVAR, NANMIN, NANMAX, NANSUM.

%   Copyright 1993-2004 The MathWorks, Inc.


% Find NaNs and set them to zero
nans = isnan(x);
x(nans) = 0;

if nargin == 1 % let sum deal with figuring out which dimension to use
    % Count up non-NaNs.
    n = sum(~nans);
    n(n==0) = NaN; % prevent divideByZero warnings
    % Sum up non-NaNs, and divide by the number of non-NaNs.
    m = sum(x) ./ n;
else
    % Count up non-NaNs.
    n = sum(~nans,dim);
    n(n==0) = NaN; % prevent divideByZero warnings
    % Sum up non-NaNs, and divide by the number of non-NaNs.
    m = sum(x,dim) ./ n;
end