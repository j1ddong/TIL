[TOC]

# Django Form

> Form은 Django 유효성 검사 도구 중 하나로 외부의 악의적 공격 및 데이터 손상에 대한 중요한 방어 수단

- Django's role in forms
  - preparing and restructuring data to make it ready for rendering
  - creating HTML forms for the data
  - receiving and processing submitted forms and data from the client



## Building a form in Django

### 1. Form class

```python
# app_name/forms.py

from django import forms

class NameForm(forms.Form):
    your_name = forms.CharField(max_length=100)
```

- The whole form will look like :

```html
<label for="your_name">Your name: </label>
<input id="your_name" type="text" name="your_name" maxlength="100" required>
```

- Note that it **does not** include the `<form>` tags, or a **submit button**.

1. `is_valid()`

- A `Form` instance has an `is_valid()`method, which runs validation routines for all its fields. When this method is called, if all fields contain valid data, it will:
  - return `True`
  - place the form’s data in its `cleaned_data`attribute.



### 2. form templates

```django
# template
<form action="/your-name/" method="post">
    {% csrf_token %}
    {{ form }}
    <input type="submit" value="Submit">
</form>
```

- `{{ form }}` will render its `<label>` and `<input>` elements appropriately.

#### 2-1. Form rendering options

There are other output options though for the `<label>`/`<input>` pairs:

- `{{ form.as_table }}` will render them as table cells wrapped in `<tr>` tags
- `{{ form.as_p }}` will render them wrapped in `<p>` tags
- `{{ form.as_ul }}` will render them wrapped in `<li>` tags

>  Note that you’ll have to provide the surrounding `<table>` or `<ul>` elements yourself.



#### 2-2 Django HTML input 요소 표현하는 2가지

##### 2-2-1 Form fields

- [Built-in Field classes](https://docs.djangoproject.com/en/4.0/ref/forms/fields/#built-in-field-classes)
- For each field, we describe the default widget used if you don’t specify `widget`. We also specify the value returned when you provide an empty value (see the section on `required` above to understand what that means).

##### 2-2-2 Widgets

> A widget is Django’s representation of an HTML input element. The widget handles the rendering of the HTML, and the extraction of data from a GET/POST dictionary that corresponds to the widget.

- 주의사항
  - Widgets should not be confused with the form fields. Form fields **deal with the logic of input validation** and are used directly in templates. Widgets deal with rendering of HTML form input elements on the web page and extraction of raw submitted data. However, **widgets do need to be assigned to form fields.**

-  [Built-in widgets](https://docs.djangoproject.com/en/4.0/ref/forms/widgets/#built-in-widgets-1)

