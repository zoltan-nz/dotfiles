## Install VS Code on CentOS

```bash
sudo yum -y install "Development tools"
sudo yum -y install glibc-devel.i686 glibc-i686
wget http://ftp.gnu.org/gnu/glibc/glibc-2.16.0.tar.gz
tar -xvzf glibc-2.16.0.tar.gz
cd glibc-2.16.0
mkdir glibc-build
cd glibc-build
../configure --prefix='/usr'
vim ../scripts/test-installation.pl
```

Line 171
replace `if (/$ld_so_name/) {` with `if (/\Q$ld_so_name\E/) {`

```
make
sudo make install
```
