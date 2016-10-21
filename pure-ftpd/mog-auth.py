#!/usr/bin/python

import os

def auth(username, password):
  if username in ['mog', 'gom']:
    return 1
  else:
    return 0

def main():
  print 'auth_ok:', auth(os.environ['AUTHD_ACCOUNT'], os.environ['AUTHD_PASSWORD'])
  print 'dir:/home/', os.environ['AUTHD_ACCOUNT']
  print 'end'

if __name__ == '__main__':
    main()
