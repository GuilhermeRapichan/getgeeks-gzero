from faker import Faker
fake=Faker()

import bcrypt 



def get_hashed_pass(password): 
    return bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))

def factory_user():
    return {
        'name': fake.first_name(),
        'lastname': fake.last_name(),
        'email': fake.free_email(),
        'password': 'pwd123'
    }
    

def factory_wrong_email():
    return {
        'name': fake.first_name(),
        'lastname': fake.last_name(),
        'email': 'sdask&skdjs.bsk',
        'password': 'pwd123'
    }
    
def factory_user_login():
    return {
        'name' : 'Guilherme',
        'lastname': 'Rapichan',
        'email': 'guirapichan@gmail.com',
        'password': 'rapichan13',
        'hashpass': '$2b$08$b.yQtsOfX9h5pnrWK6oaAu2NnAng3cp1e98pS3k4imki7lx5G5wum'
    }    