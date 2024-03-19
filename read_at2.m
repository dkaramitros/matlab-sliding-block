function [t,acc] = read_at2( file_name )
% Opens AT2 excitation record and returns acceleration time-history.

% Open file
myfile=fopen(file_name);

% Read first three lines
for i=1:3
    useless_line=fgetl(myfile);
end

% Read fourth line
useful_line=fgetl(myfile);
useful_numbers=textscan(useful_line,'%f %f');
npts=useful_numbers{1};
dt=useful_numbers{2};

% Create time array
t=linspace(0,npts*dt,npts);

% Read acceleration using fscanf
acc=fscanf(myfile,'%f');

% Close file
fclose(myfile);

end