#!/bin/bash

# Function to install dependencies and setup environment
setup_environment() {
    echo "Updating package list and installing dependencies..."
    sudo apt-get update
    sudo apt-get install -y curl gnupg build-essential zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libffi-dev

    # Install rbenv and ruby-build
    if ! command -v rbenv &> /dev/null; then
        echo "Installing rbenv and ruby-build..."
        curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-installer | bash
        echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
        echo 'eval "$(rbenv init -)"' >> ~/.bashrc
        source ~/.bashrc
    fi
}

# Function to install the latest stable Ruby using rbenv
install_ruby() {
    local ruby_version=$(rbenv install -l | grep -v - | tail -1 | tr -d '[:space:]')

    if ! rbenv versions | grep -q "$ruby_version"; then
        echo "Installing Ruby $ruby_version..."
        rbenv install $ruby_version
    fi
    rbenv global $ruby_version
    echo "Ruby version set to $(ruby -v)"
}

# Function to update Bundler and Jekyll
update_bundler_and_jekyll() {
    echo "Updating Bundler..."
    gem install bundler

    echo "Updating Jekyll..."
    gem install jekyll
}

# Function to update Jekyll project dependencies
update_jekyll_project() {
    local project_dir="$1"

    if [ -d "$project_dir" ]; then
        cd "$project_dir"
        echo "Updating Jekyll project dependencies in $project_dir..."
        bundle update
    else
        echo "Directory $project_dir does not exist."
        exit 1
    fi
}

# Function to serve the Jekyll site with verbose logging
serve_jekyll_site() {
    echo "Serving the Jekyll site with verbose logging..."
    bundle exec jekyll serve --verbose
}

# Main script execution
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <jekyll_project_directory>"
    exit 1
fi

jekyll_project_dir="$1"

setup_environment
install_ruby
update_bundler_and_jekyll
update_jekyll_project "$jekyll_project_dir"
serve_jekyll_site

echo "Update complete. Your Jekyll site should be running at http://localhost:4000"
