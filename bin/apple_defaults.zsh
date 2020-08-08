#!/bin/zsh

#-------------------------------------------------------------------------------
# Terminal
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable auto-correct
#defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Avoid creating .DS_Store files on network
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#-------------------------------------------------------------------------------
# Finder
#-------------------------------------------------------------------------------
# Finder: show all filename extensions	
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
 
# Keep folders on top when sorting by name	
defaults write com.apple.finder _FXSortFoldersFirst -bool true
 
# When performing a search, search the current folder by default	
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network or USB volumes	
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
 
# Use list view in all Finder windows by default	
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
  
#-------------------------------------------------------------------------------
# Browser
#-------------------------------------------------------------------------------
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Prevent Safari from opening ‘safe’ files automatically after downloading	
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
 
# Enable Safari’s debug menu	
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
  
# Enable continuous spellchecking
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true

# Disable auto-correct
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# Enable the Develop menu and the Web Inspector in Safari	
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

#-------------------------------------------------------------------------------
# Screenshots
#-------------------------------------------------------------------------------

# create screenshots dir
function screenshots_mk {

    # change to dir 
    cd ~/Pictures
    
    # exists or create
    [[ -d dir ]] || mkdir Screenshots

}

screenshots_mk

# Save screenshots to the desktop	
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"
	
# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

#-------------------------------------------------------------------------------
# Misc
#-------------------------------------------------------------------------------
# Disable automatic capitalization as it’s annoying when typing code	
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code	
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
 
 
