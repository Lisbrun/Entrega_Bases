# Generated by Django 4.1.5 on 2023-05-27 19:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('academico', '0008_alter_cupo_creditos_creditos_adicionales_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cupo_creditos',
            name='Creditos_Disponibles',
            field=models.IntegerField(),
        ),
    ]
