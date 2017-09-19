# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2017-09-18 16:04
from __future__ import unicode_literals

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('consumers', '0002_remove_consumer_date_of_birth'),
    ]

    operations = [
        migrations.AddField(
            model_name='consumer',
            name='date_joined',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name='Date Joined'),
        ),
        migrations.AddField(
            model_name='consumer',
            name='email',
            field=models.EmailField(default='', error_messages={'unique': 'Customer Email'}, max_length=255, unique=True, verbose_name='Email'),
        ),
        migrations.AddField(
            model_name='consumer',
            name='is_active',
            field=models.BooleanField(default=True, verbose_name='Active'),
        ),
        migrations.AddField(
            model_name='consumer',
            name='is_admin',
            field=models.BooleanField(default=False, verbose_name='Admin'),
        ),
        migrations.AddField(
            model_name='consumer',
            name='is_staff',
            field=models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status'),
        ),
        migrations.AddField(
            model_name='consumer',
            name='last_login',
            field=models.DateTimeField(default=django.utils.timezone.now),
        ),
        migrations.AddField(
            model_name='consumer',
            name='name',
            field=models.CharField(blank=True, max_length=255, verbose_name='Customer Name'),
        ),
        migrations.AddField(
            model_name='consumer',
            name='password',
            field=models.CharField(default='', error_messages={'required': 'This field is required'}, max_length=128, verbose_name='Password'),
        ),
        migrations.AlterField(
            model_name='consumer',
            name='healthier_ID',
            field=models.CharField(default='consumer_xa7sx0srnf7daaw5i19k', max_length=30),
        ),
    ]
