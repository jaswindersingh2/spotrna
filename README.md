SPOT-RNA
===============

A docker image containing the fully configured SPOT-RNA predictor:

Installation
------------

First you need to install Docker on your computer. You can find all the installation steps [here](https://docs.docker.com/engine/installation/).

Once docker is installed properly, you are good to run SPOT-RNA. When running SPOT-RNA on your system for first time, it takes around 15-20 mins depending on internet speed to pull docker image (of size 700 MBs) from docker repository.


Usages
-------------------

To run SPOT-RNA, you need provide path to the input sequence file to the Docker container. Therefore, you have to mount the file system of your computer (the host) in the Docker container (the guest). Please replace 'path_to_directory_with_input_sequence_file' with absolute path to directory contains input fasta file and 'sequence.fasta' with file name:

```
docker run --rm -ti -v path_to_directory_with_input_sequence_file/:/mnt jaswindersingh2/spotrna SPOT-RNA mnt/sequences.fasta
```

Above command saves predicted secondary structure files (.ct, .bpseq, .prob etc) in the 'outputs' folder within the directory 'path_to_directory_with_input_sequence_file'.
