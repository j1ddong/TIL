from django.urls import path
from . import views


app_name = 'articles'
urlpatterns = [
    path('', views.index, name='index'),
    path('create/', views.create, name='create'),
    path('made/', views.made, name='made'),
    path('detail/<int:pk>', views.detail, name='detail'),
    path('update/<int:pk>', views.update, name='update'),
    path('edit/<int:pk>', views.edit, name='edit'),
    path('delete/<int:pk>', views.delete, name='delete'),
]
