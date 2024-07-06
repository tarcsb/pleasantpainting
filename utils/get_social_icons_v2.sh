#!/bin/bash

# Directory to save the icons
TARGET_DIR="assets/images/social-media-icons"

# Create the directory if it does not exist
mkdir -p "$TARGET_DIR"

# List of social media icons and their URLs
declare -A icons
icons=(
    ["facebook"]="https://cdn3.iconfinder.com/data/icons/social-media-circle/512/circle-facebook-512.png"
    ["twitter"]="https://cdn3.iconfinder.com/data/icons/social-media-circle/512/circle-twitter-512.png"
    ["instagram"]="https://cdn3.iconfinder.com/data/icons/social-media-circle/512/circle-instagram-512.png"
    ["linkedin"]="https://cdn4.iconfinder.com/data/icons/social-media-logos-6/512/58-linkedin_logo-512.png"
    ["youtube"]="https://cdn3.iconfinder.com/data/icons/social-media-circle/512/circle-youtube-512.png"
    ["pinterest"]="https://cdn3.iconfinder.com/data/icons/social-media-2210/24/Pinterest-512.png"
    ["snapchat"]="https://cdn3.iconfinder.com/data/icons/social-media-circle/512/circle-snapchat-512.png"
    ["reddit"]="https://cdn3.iconfinder.com/data/icons/social-media-circle/512/circle-reddit-512.png"
    ["tumblr"]="https://cdn4.iconfinder.com/data/icons/social-media-2210/24/Tumblr-512.png"
    ["whatsapp"]="https://cdn4.iconfinder.com/data/icons/social-media-2210/24/Whatsapp-512.png"
)

# Download each icon
for icon in "${!icons[@]}"; do
    wget -O "$TARGET_DIR/$icon.png" "${icons[$icon]}"
done

echo "All icons have been downloaded to $TARGET_DIR"
