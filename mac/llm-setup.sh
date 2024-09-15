#!/bin/bash

# Update the system
echo "Updating system..."
brew update

# Install Ollama for Mac (Mac-specific command for GPU utilization)
echo "Installing Ollama..."
brew install ollama

# Install Miniconda for Mac
echo "Installing Miniconda..."
curl -fsSL https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o miniconda.sh
bash miniconda.sh -b -p $HOME/miniconda
rm miniconda.sh
export PATH="$HOME/miniconda/bin:$PATH"

# Create a new conda environment for the LLM
echo "Creating conda environment..."
conda create -n llm -c conda-forge python=3.11 -y
source activate llm

# Install required Python libraries
echo "Installing Python libraries..."
pip install --q chromadb
pip install --q unstructured langchain langchain-text-splitters

conda install -c conda-forge protobuf=3.20 opentelemetry-proto -y

pip install --q "unstructured[all-docs]"
pip install --q flask

echo "Setup completed successfully!"