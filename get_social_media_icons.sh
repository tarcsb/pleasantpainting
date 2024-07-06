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
    ["linkedin"]="https://cdn3.iconfinder.com/data/icons/social-media-circle/512/circle-linkedin-512.png"
    ["youtube"]="https://cdn3.iconfinder.com/data/icons/social-media-circle/512/circle-youtube-512.png"
    ["pinterest"]="https://cdn3.iconfinder.com/data/icons/social-media-circle/512/circle-pinterest-512.png"
    ["snapchat"]="https://cdn3.iconfinder.com/data/icons/social-media-circle/512/circle-snapchat-512.png"
    ["reddit"]="https://cdn3.iconfinder.com/data/icons/social-media-circle/512/circle-reddit-512.png"
    ["tumblr"]="https://cdn3.iconfinder.com/data/icons/social-media-circle/512/circle-tumblr-512.png"
    ["whatsapp"]="https://cdn3.iconfinder.com/data/icons/social-media-circle/512/circle-whatsapp-512.png"
)

# Download each icon
for icon in "${!icons[@]}"; do
    wget -O "$TARGET_DIR/$icon.png" "${icons[$icon]}"
done

echo "All icons have been downloaded to $TARGET_DIR"

