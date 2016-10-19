FROM totobgycs/archdev
MAINTAINER totobgycs

USER build
WORKDIR /home/build

RUN yaourt -Syy ; \
  yaourt -S --noconfirm --aur python cython python-pip python-setuptools \
    python-scipy python-numpy python-virtualenv \
    fftw clfft clinfo

RUN git clone https://github.com/geggo/gpyfft.git

WORKDIR /home/build/gpyfft

RUN sudo python setup.py install

RUN yaourt -S --noconfirm --aur amdapp-sdk

VOLUME /home/build/program

WORKDIR /home/build/program

ENV PYOPENCL_CTX='0'

#ENTRYPOINT python
#ENTRYPOINT clinfo
CMD /bin/bash
