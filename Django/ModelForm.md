[TOC]



# ModelForm

> If you’re building a database-driven app, chances are you’ll have forms that map closely to Django models. Django provides a helper class that lets you create a `Form` class from a Django model.

```python
from django import forms
from .models import Article

# Create the form class.
class ArticleForm(forms.ModelForm):
	class Meta:
	model = Article
	fields = ['pub_date', 'headline', 'content', 'reporter']

# Creating a form to add an article.
>>> form = ArticleForm()

# Creating a form to change an existing article.
>>> article = Article.objects.get(pk=1)
>>> form = ArticleForm(instance=article)
```

