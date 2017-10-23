---
layout: post
title: How to add vertical ruler in Visual Code?
date: 2017-10-16 08:27:01 +0700
excerpt: I wanted to pass id of failed job to php artisan queue:retry [id], but the document of Laravel does not show me how, it only tells how to pass arguments, but how to pass values without arguments?
category: editor
tags: 
  - Visual Code
---

<div class="page-header">
  <h1>{{page.title}}</h1>
</div>

<div class="date"><span class="label label-danger" id="date"></span></div>

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

<script>
var day = moment("{{page.date}}");
</script>