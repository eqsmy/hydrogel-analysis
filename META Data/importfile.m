function Physical2D = importfile(filename, dataLines)
%IMPORTFILE Import data from a text file
%  PHYSICAL2D = IMPORTFILE(FILENAME) reads data from text file FILENAME
%  for the default selection.  Returns the data as a table.
%
%  PHYSICAL2D = IMPORTFILE(FILE, DATALINES) reads data for the specified
%  row interval(s) of text file FILENAME. Specify DATALINES as a
%  positive scalar integer or a N-by-2 array of positive scalar integers
%  for dis-contiguous row intervals.
%
%  Example:
%  Physical2D = importfile("/Users/elysiasmyers/Documents/MATLAB/META Data/Physical 2D.csv", [2, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 24-Aug-2020 17:39:40

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 9);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Var1", "Var2", "Var3", "Var4", "YieldStressPa", "ExtensionalStraintoBreak", "Var7", "Var8", "Var9"];
opts.SelectedVariableNames = ["YieldStressPa", "ExtensionalStraintoBreak"];
opts.VariableTypes = ["string", "string", "string", "string", "double", "double", "string", "string", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Var1", "Var2", "Var3", "Var4", "Var7", "Var8", "Var9"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var2", "Var3", "Var4", "Var7", "Var8", "Var9"], "EmptyFieldRule", "auto");

% Import the data
Physical2D = readtable(filename, opts);

end