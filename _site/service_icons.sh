#!/bin/bash

# Create the directory if it doesn't exist
mkdir -p assets/icons/services

# URLs of the icons
declare -A urls=(
    ["residential-painting"]="https://cdn-icons-png.flaticon.com/512/1829/1829233.png"
    ["commercial-painting"]="https://cdn-icons-png.flaticon.com/512/3135/3135712.png"
    ["custom-painting"]="https://cdn-icons-png.flaticon.com/512/2946/2946554.png"
    ["restoration"]="https://cdn-icons-png.flaticon.com/512/1044/1044457.png"
    ["driveway-painting"]="https://cdn-icons-png.flaticon.com/512/1497/1497854.png"
    ["pressure-cleaning"]="https://cdn-icons-png.flaticon.com/512/2834/2834601.png"
    ["color-matching"]="https://cdn-icons-png.flaticon.com/512/3291/3291575.png"
    ["free-estimates"]="https://cdn-icons-png.flaticon.com/512/1202/1202470.png"
    ["virtual-consults"]="https://cdn-icons-png.flaticon.com/512/1473/1473304.png"
    ["tech-tools"]="https://cdn-icons-png.flaticon.com/512/2946/2946552.png"
)

# Download the icons
for icon in "${!urls[@]}"; do
    wget -O "assets/icons/services/${icon}.png" "${urls[$icon]}"
done

echo "Icons downloaded successfully to assets/icons/services/"
