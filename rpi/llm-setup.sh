#!/bin/bash

# Update the system
echo "Updating system..."
sudo apt-get update -y && sudo apt-get upgrade -y

# Install Ollama (assuming it's available for ARM64, adjust as needed)
echo "Installing Ollama..."
curl -fsSL https://ollama.com/install.sh | sh

# Install Miniconda for ARM64
echo "Installing Miniconda..."
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh -O miniconda.sh
bash miniconda.sh -b -p $HOME/miniconda
rm miniconda.sh
export PATH="$HOME/miniconda/bin:$PATH"

# Create a new conda environment for the LLM
echo "Creating conda environment..."
conda create -n llm -c conda-forge python=3.11 -y
conda activate llm

# Install required Python libraries
echo "Installing Python libraries..."
pip install --q chromadb
pip install --q unstructured langchain langchain-text-splitters

conda install -c conda-forge protobuf=3.20 opentelemetry-proto -y

pip install --q "unstructured[all-docs]"
pip install --q flask

echo "Setup completed successfully!"