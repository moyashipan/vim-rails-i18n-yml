vim-rails-i18n-yml
==================

i18n用yamlが長くなりすぎていませんか？ 今いる行のpathを調べたり、pathを指定して該当行に移動できます。

### CONFIG EXAMPLE 

```
command! -nargs=0 YamlPwd call yml#search('.')
command! -nargs=1 YamlJump call yml#jump(<f-args>)
```

### HOW TO USE

```
:YamlPwd
```

```
:YamlJump ja.errors.messages
```
