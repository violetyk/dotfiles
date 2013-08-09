# -*- coding: utf-8 -*-
# vim: set et fenc=utf-8 ff=unix ft=python sts=2 sw=2 ts=2 :

from powerline.bindings.vim import vim_get_func

def unite_status_string(pl):
  '''Return status string from unite.vim'''
  return vim_get_func('unite#get_status_string')()
