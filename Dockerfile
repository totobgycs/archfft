FROM totobgycs/archdev
MAINTAINER totobgycs

USER build
WORKDIR /home/build

RUN yaourt -Syy ; \
  yaourt -S --noconfirm --aur python cython python-pip python-setuptools \
    python-scipy python-numpy python-virtualenv \
    fftw clfft

#RUN yaourt -S --noconfirm --aur amdapp-sdk fftw clfft clinfo

#RUN yaourt -Syy ; \
#  yaourt -S --noconfirm --aur clang hwloc llvm \
#    python cython python-pip python-setuptools \
#    python-scipy python-numpy python-virtualenv \
#    fftw clfft 

#RUN yaourt -S --noconfirm --aur libopencl

RUN git clone https://github.com/geggo/gpyfft.git

WORKDIR /home/build/gpyfft

RUN sudo python setup.py install

RUN yaourt -S --noconfirm --aur clinfo
RUN yaourt -S --noconfirm --aur amdapp-sdk

VOLUME /home/build/program

WORKDIR /home/build/program

#ENTRYPOINT python
ENTRYPOINT clinfo
