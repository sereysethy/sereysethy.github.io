---
title: How to add vertical ruler in Visual Code?
date: 2017-10-16 08:27:01 +0700
category: editor
tags: 
  - Visual Code
---

To add vertical line to Visual Code on Mac (it should work the same way on Linux/
Windows), go to Code > Preferences > Settings and find `editor.rulers` then
add `80` or any values that you want VS Code to display a vertical line. 

```javascript
// Place your settings in this file to overwrite the default settings
{
    "editor.tabSize": 2,
    "cSpell.language": "en,fr",
    "editor.rulers": [80]
}
```