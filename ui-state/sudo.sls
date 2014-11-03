/etc/sudoers:
 file.managed:
  - user: root
  - group: root
  - mode: 0440
  - source: salt://files/sudoers
