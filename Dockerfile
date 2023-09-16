FROM pytorch/pytorch

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install vim git -y

RUN git clone https://github.com/nnzhan/Graph-WaveNet

WORKDIR Graph-WaveNet

COPY data data

RUN pip install -r requirements.txt
RUN pip install tables

RUN python generate_training_data.py --output_dir=data/METR-LA --traffic_df_filename=data/metr-la.h5
