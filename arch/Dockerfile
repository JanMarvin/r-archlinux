FROM ghcr.io/archlinux/archlinux:latest

# Install system dependencies
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    base-devel \
    bash blas bzip2 cairo curl gcc-libs glib2 glibc icu lapack \
    libdeflate libjpeg-turbo libpng libtiff libtirpc libx11 libxmu \
    libxt pango pcre2 readline tk unzip which xz zip zlib zstd \
    gcc-fortran git jdk-openjdk texlive-fontsrecommended \
    texlive-latexrecommended wget \
    blas-openblas texlive-latex \
    texlive-fontsextra texlive-plaingeneric

# Setup user
RUN useradd -m archie
USER archie
WORKDIR /home/archie/r-archlinux

# COPY the files from GitHub Action checkout
COPY --chown=archie:archie . .

ENV MAKEFLAGS="-j$(nproc)"

# Generate metadata and build
RUN makepkg --printsrcinfo > .SRCINFO
RUN makepkg --noconfirm

# Generate checksum for the specific file just built
RUN PKG_FILE=$(makepkg --packagelist | xargs basename) && \
    sha256sum "$PKG_FILE" > r-archlinux.sha256sum
