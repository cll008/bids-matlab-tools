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
    
    if ~plugin_status('bids-matlab-tools')
        warning("This plugin requires the installation of bids-matlab-tools plugin which is currently not installed. Installing bids-matlab-tools...");
        % download plugin
        plugins = plugin_getweb('', []);
        indPlugin = strmatch(lower('bids-matlab-tools'), lower({ plugins.name }), 'exact');
        if isempty(indPlugin)
            error('Failed to install bids-matlab-tools. Please try to install it manually then run eeglab again');
        end
        % install
        plugin_install(plugins(indPlugin(1)).zip, plugins(indPlugin(1)).name, plugins(indPlugin(1)).version, true);
        eegplugin_bids(fig, trystrs, catchstrs);
    end