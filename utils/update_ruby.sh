#!/bin/bash

# Function to install dependencies and setup environment
setup_environment() {
    sudo apt-get update
    sudo apt-get install -y curl gnupg build-essential zlib1g-dev

    # Install rbenv and ruby-build
    if ! command -v rbenv &> /dev/null; then
        echo "Installing rbenv and ruby-build..."
        curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-installer | bash
        echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
        echo 'eval "$(rbenv init -)"' >> ~/.bashrc
        source ~/.bashrc
    fi
}

# Function to install Ruby using rbenv
install_ruby() {
    local ruby_version="3.1.0"

    if ! rbenv versions | grep -q "$ruby_version"; then
        echo "Installing Ruby $ruby_version..."
        rbenv install $ruby_version
    fi
    rbenv global $ruby_version
    echo "Ruby version set to $(ruby -v)"
}

# Function to install Bundler and Jekyll
install_jekyll() {
    local bundler_version="2.4.22"

    echo "Installing Bundler $bundler_version..."
    gem install bundler -v $bundler_version

    echo "Installing Jekyll..."
    gem install jekyll

    echo "Installing Jekyll dependencies..."
    bundle install
}

# Function to clone the repository and serve the site
setup_jekyll_site() {
    local repo_url="https://github.com/yourusername/pleasant-painting.git"
    local repo_dir="pleasant-painting"

    echo "Cloning repository..."
    git clone $repo_url
    cd $repo_dir

    echo "Serving the Jekyll site..."
    bundle exec jekyll serve
}

# Main script execution
setup_environment
install_ruby
install_jekyll
setup_jekyll_site

echo "Setup complete. Your Jekyll site should be running at http://localhost:4000"

