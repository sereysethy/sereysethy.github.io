---
title: How to pass id of failed job to Laravel queue:retry programmatically?
date:   2017-03-15 18:49:01 +0700
category: programming
tags: 
  - PHP 
  - Laravel5.3 
  - Queue
---

<div class="page-header">
  <h1>{{page.title}}</h1>
</div>

<div class="date"><span class="label label-danger" id="date"></span></div>

I wanted to pass id of failed job to `php artisan queue:retry [id]`, but the document of Laravel does not show me how, it only tells how to pass arguments, but how to pass values without arguments?

In Laravel document it tells you this:

```php
<?php

Route::get('/foo', function () {
    $exitCode = Artisan::call('email:send', [
        'user' => 1, '--queue' => 'default'
    ]);

    //
});

?>
```

But what I want to achive is this

```
php artisan queue:retry 5
```

where `5` is the id of failed job.

Well after scraching my head and doing some searches on the internet, I gave up and I started looking at Laravel framework source code how this command accepts arguments in `Illuminate/Queue/Console/RetryCommand.php`, it takes an argument `id` and an array of `value` which corresponds to id of failed jobs.

{% highlight php %}
<?php

Route::get('/foo', function () {
    $exitCode = Artisan::call('queue:retry', [
        'id' => [5, 6]
    ]);

    //
});

?>
{% endhighlight %}

If we want to retry all failed jobs, we pass value `all` to argument `id`

{% highlight php %}
<?php

Route::get('/foo', function () {
    $exitCode = Artisan::call('queue:retry', [
        'id' => ['all']
    ]);

    //
});

?>
{% endhighlight %}

<script>
var day = moment("{{page.date}}");
</script>