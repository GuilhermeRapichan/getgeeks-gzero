from faker import Faker
fake=Faker()

import bcrypt 



def get_hashed_pass(password): 
    return bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))


def factory_user(target):

    data = {
        'faker':{
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': fake.free_email(),
            'password': 'pwd123',
            'hashpass': '$2b$08$nS8kvrMc6hmtjcpfeVOj.eP0.jK4rCBMqwl5z9LJOxkGiAGHsGpxa'
        },
        'wrong_email':{
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': 'sdask&skdjs.bsk',
            'password': 'pwd123'
        },
        'login':{
            'name' : 'Guilherme',
            'lastname': 'Rapichan',
            'email': 'guirapichan@gmail.com',
            'password': 'pwd123',
            'hashpass': '$2b$08$nS8kvrMc6hmtjcpfeVOj.eP0.jK4rCBMqwl5z9LJOxkGiAGHsGpxa'
        },
        'begeek':{
            'name':'Kim',
            'lastname':'Dotcom',
            'email': 'kim@dot.com',
            'password': 'pwd123',
            'hashpass': '$2b$08$nS8kvrMc6hmtjcpfeVOj.eP0.jK4rCBMqwl5z9LJOxkGiAGHsGpxa',
            'geek_profile': {
                'whats':'43999264449',
                'desc':'Lorem ipsum dolor sit amet. Id tempore voluptatem aut recusandae omnis qui animi incidunt est alias temporibus. Ut veritatis voluptatem est voluptates quia et accusantium facilis est eaque neque.Corrupti quod et',
                'printer_repair': 'Sim',
                'work':'Remoto',
                'cost':'100'
            }
        },
        'attempt_be_geek':{
            'name':'Kim',
            'lastname':'Dotcom',
            'email': 'kim@dot.com',
            'password': 'pwd123',
            'hashpass': '$2b$08$nS8kvrMc6hmtjcpfeVOj.eP0.jK4rCBMqwl5z9LJOxkGiAGHsGpxa',
            'geek_profile': {
                'whats':'43999264449',
                'desc':'Lorem ipsum dolor sit amet. Id tempore voluptatem aut recusandae omnis qui animi incidunt est alias temporibus. Ut veritatis voluptatem est voluptates quia et accusantium facilis est eaque neque.Corrupti quod ',
                'printer_repair': 'Sim',
                'work':'Remoto',
                'cost':'100'
            }
        }    
    }   
    return data[target]