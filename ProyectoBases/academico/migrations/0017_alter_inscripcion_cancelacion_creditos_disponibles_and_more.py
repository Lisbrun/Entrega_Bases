# Generated by Django 4.1.5 on 2023-06-04 15:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('academico', '0016_alter_inscripcion_cancelacion_creditos_disponibles_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='inscripcion_cancelacion',
            name='Creditos_Disponibles',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='inscripcion_cancelacion',
            name='Semestre',
            field=models.IntegerField(blank=True, null=True),
        ),
    ]
