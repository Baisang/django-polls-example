from __future__ import unicode_literals
from mongoengine import *
connect('django-example')


from django.utils import timezone
# Create your models here.

class Question(Document):
    question_text = StringField(max_length=200)
    pub_date = DateTimeField(db_field='date published')

    def was_published_recently(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)

class Choice(Document):
    question = ReferenceField(Question)
    choice_text = StringField(max_length=200)
    votes = IntField()
