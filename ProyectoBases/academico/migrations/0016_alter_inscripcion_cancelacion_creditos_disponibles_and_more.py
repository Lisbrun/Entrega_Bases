# Generated by Django 4.1.5 on 2023-06-04 15:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('academico', '0015_alter_historial_academico_programa'),
    ]

    operations = [
        migrations.AlterField(
            model_name='inscripcion_cancelacion',
            name='Creditos_Disponibles',
            field=models.IntegerField(null=True),
        ),
        migrations.AlterField(
            model_name='inscripcion_cancelacion',
            name='Semestre',
            field=models.IntegerField(null=True),
        ),
    ]