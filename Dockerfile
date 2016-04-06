FROM ubuntu:14.04.4
MAINTAINER jim_lin <jim_lin@quantatw.com>

ADD apt.conf /etc/apt/
ADD requirement.txt /tmp/ 
ADD vim-deb/ /tmp/vim-deb 

RUN apt-get update && apt-get install -y python3-pip git ctags 
RUN apt-get install -y libbonoboui2-0 libgdk-pixbuf2.0-0 libglib2.0-0 libgnome2-0 libgnomeui-0 libgtk2.0-0 libice6 liblua5.2-0 libpango-1.0-0 libperl5.18
RUN apt-get install -y libgpm2 libruby1.9.1 libtcl8.6
RUN pip3 install --proxy=http://10.242.104.204:5678/ -r /tmp/requirement.txt
RUN export uid=1000 gid=1000 && \
mkdir -p /home/admin && \
echo "admin:x:${uid}:${gid}:admin,,,:/home/admin:/bin/bash" >> /etc/passwd && \
echo "admin:x:${uid}:" >> /etc/group && \
echo "admin ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/admin && \
chmod 0440 /etc/sudoers.d/admin && \
chown ${uid}:${gid} -R /home/admin
RUN  cd /tmp/vim-deb && \
dpkg -i vim-gnome_7.4.052-1ubuntu3_amd64.deb vim-common_7.4.052-1ubuntu3_amd64.deb vim-gui-common_7.4.052-1ubuntu3_all.deb vim-runtime_7.4.052-1ubuntu3_all.deb

ADD gitconfig /home/admin/.gitconfig
ADD vim/ /home/admin/.vim
ADD .vimrc /home/admin/

RUN chown admin:admin -R /home/admin
USER admin
ENV HOME /home/admin
CMD /bin/bash 
