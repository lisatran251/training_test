# Base image with Debian  
FROM debian:bullseye-slim  

# Metadata  
LABEL maintainer="Your Name <your.email@example.com>"  
LABEL description="Docker image for bioinformatics tools including FastQC and BWA"  

# Update and install dependencies  
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3 \
    python3-pip \
    wget \
    curl \
    git \
    unzip \
    zlib1g-dev \
    bwa \
    fastqc \
    && apt-get clean && rm -rf /var/lib/apt/lists/*  

# Upgrade pip and install Python packages commonly used in bioinformatics  
RUN python3 -m pip install --no-cache-dir \
    numpy \
    pandas \
    matplotlib \
    biopython \
    pysam  

# Set environment variables  
ENV PATH="/usr/local/bin:$PATH"  

# Create a working directory  
WORKDIR /workspace  

# Default command (can be overridden)  
CMD ["/bin/bash"]

