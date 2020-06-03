% eegplugin_bidsvalidator() - EEGLAB plugin for validating BIDS dataset
%
% Usage:
%   >> eegplugin_bidsvalidator(fig, trystrs, catchstrs);
%
% Inputs:
%   fig        - [integer]  EEGLAB figure
%   trystrs    - [struct] "try" strings for menu callbacks.
%   catchstrs  - [struct] "catch" strings for menu callbacks.

function vers = eegplugin_bidsvalidator(fig, trystrs, catchstrs)

    vers = '1.0';
    if nargin < 3
        error('eegplugin_bidsvalidator requires 3 arguments');
    end
    
%     % add folder to path
%     % ------------------
%     p = which('pop_importbids.m');
%     p = p(1:findstr(p,'pop_importbids.m')-1);
%     if ~exist('pop_importbids')
%         addpath( p );
%     end
    
    % find data menu
    % ---------------------
    menui = findobj(fig, 'label', 'File');
    
    % create BIDS menus
    % -----------------
    comvalidatebids = [ trystrs.no_check 'pop_validatebids();' catchstrs.add_to_hist ];
    uimenu( menui, 'label', 'Validate BIDS dataset', 'separator', 'on','callback', comvalidatebids, 'position', 6, 'userdata', 'startup:on;study:on');
