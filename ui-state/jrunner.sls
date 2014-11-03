jrunner:
  user.present:
  - shell: /bin/bash
  - home: /home/jrunner
  - uid: 7777
  - gid: 7777
  - groups:
    - wheel
  - require:
    - group: jrunner
  group.present:
    - gid: 7777

jrunner_ssh:
  ssh_auth:
   - present
   - source: salt://ssh/jrunner.id_rsa.pub
   - user: jrunner
   - require:
     - user: jrunner

/home/jrunner/.bashrc:
  file.managed:
    - require:
      - user: jrunner
    - user: jrunner
    - group: jrunner
    - mode: 644
    - source: salt://files/bashrc

/home/jrunner/.vimrc:
  file.managed:
    - require:
      - user: jrunner
    - user: jrunner
    - group: jrunner
    - mode: 644
    - source: salt://files/vimrc

/home/jrunner/.vim:
  file.recurse:
    - source: salt://files/vim
    - include_empty: True
    - user: jrunner
    - group: jrunner


