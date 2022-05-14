*Settings*
Documentation       Be Geek Test Suite

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Start Session For Attempt Be Geek
Test Template   Attempt Be a Geek

*Variables*

${long+desc}        Lorem ipsum dolor sit amet. Id tempore voluptatem aut recusandae omnis qui animi incidunt est alias temporibus. Ut veritatis voluptatem est voluptates quia et accusantium facilis est eaque neque.Corrupti quod Lorem ipsum dolor sit amet. Id tempore voluptatem aut recusandae omnis qui animi incidunt est alias temporibus. Ut veritatis voluptatem est voluptates quia et accusantium facilis est eaque neque.Corrupti quod

*Test Cases*
#Nome dos casos           Campo a validar          Massa de teste para os campos                 Mensagem esperada
Long Desc                   desc                    ${long+desc}                                 A descrição deve ter no máximo 255 caracteres
Short Desc                  desc                    Formato o seu PC                             A descrição deve ter no minimo 80 caracteres
Empty Desc                  desc                    ${Empty}                                     Informe a descrição do seu trabalho
Whats Only DDD              whats                   11                                           O WhatsApp deve ter 11 digitos contando com o DDD
Whats Only Numbers          whats                   999999999                                    O WhatsApp deve ter 11 digitos contando com o DDD
Empty Whats                 whats                   ${Empty}                                     O WhatsApp deve ter 11 digitos contando com o DDD
Cost Letters                cost                    aaaa                                         Valor hora deve ser numérico
Cost Alpha                  cost                    aa12                                         Valor hora deve ser numérico
Cost Special Chars          cost                    $%#$                                         Valor hora deve ser numérico
Empty Cost                  cost                    ${Empty}                                     Valor hora deve ser numérico
No Printer Repair           printer_repair          ${Empty}                                     Por favor, informe se você é um Geek Supremo
No work                     work                    ${Empty}                                     Por favor, selecione o modelo de trabalho

*Keywords*
Attempt Be a Geek
    [Arguments]     ${key}      ${input_field}      ${output_message}

    ${user}     Factory user    attempt_be_geek


    Set to Dictionary   ${user}[geek_profile]       ${key}      ${input_field}

    Fill Geek Form  ${user}
    Submit Geek Form
    Alert Span Should Be  ${output_message}
    After Session


Start Session For Attempt Be Geek

    ${user}     Factory User        attempt_be_geek

    Start Session
    Do Login  ${user}
    Go To Geek Form