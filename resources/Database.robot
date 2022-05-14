*Settings*
Documentation       Database Helpers

Library     DatabaseLibrary
Library     factories/Users.py

*Keywords*
Connect To Postgres

    Connect To Database     psycopg2
    ...                     oyplfkit
    ...                     oyplfkit
    ...                     UmVABAd81FX6B5H0nXZKAugL-6DBErj8
    ...                     kashin.db.elephantsql.com
    ...                     5432

Reset Env

    Execute SQL String      DELETE FROM public.geeks
    Execute SQL String      DELETE FROM public.users

Insert User
    [Arguments]     ${u}


    ${q}    Set Variable        INSERT INTO public.users (name, email, password_hash, is_geek) values ('${u}[name] ${u}[lastname]', '${u}[email]', '${u}[hashpass]', false)   

    Execute SQL String      ${q}


Users Seed
        ${user}     Factory User    login
        Insert User  ${user}

        ${user2}    Factory User    begeek
        Insert User  ${user2}

        ${user3}    Factory User    attempt_be_geek
        Insert User  ${user3}    