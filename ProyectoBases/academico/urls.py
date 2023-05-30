from django.urls import path
from django.conf.urls.static import static
from django.conf import settings
from .views import *
urlpatterns = [
    path('',registro,name='inicio'),
    path('Main/',main , name='main'),
    path ('logout/', salir , name='salir'),
]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
