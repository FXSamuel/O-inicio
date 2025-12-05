programa
{
    funcao inicio()
    {
        inteiro opcao, continuar
        inteiro i, indice, qtdUsuarios = 0, usuarioLogado = -1
        inteiro qtdPedidos = 0, qtdVagas = 0, qtdCurriculos = 0
        inteiro tentativas[20]

        cadeia nomesUsuarios[20], emailsUsuarios[20], senhasUsuarios[20], tiposUsuarios[20]
        cadeia nomesMateriais[50], statusMateriais[50]
        inteiro quantidadesMateriais[50], idSolicitante[50]

        cadeia tituloVagas[20], descricaoVagas[20], empresaVagas[20]
        cadeia nomeCandidato[50], emailCandidato[50], vagaCandidato[50], statusCandidato[50]

        cadeia nome, email, senha, tipo, material, titulo, descricao, empresa
        cadeia tituloBusca, statusBusca, novoStatus, novaSenha
        inteiro quantidade, escolhaStatus, resp

        inteiro qtdNotificacoes = 0
        cadeia notificacoes[100]
        inteiro donoNotificacao[100], notifPedido[100]

        logico logado = falso

        para (i = 0; i < 20; i++)
        {
            tentativas[i] = 0
        }

        faca
        {
            limpa()
            escreva("╔══════════════════════════════════════════════╗\n")
            escreva("║              A.L.V.A - SISTEMA               ║\n")
            escreva("║     Analise, Lideranca, Visao e Acao         ║\n")
            escreva("╠══════════════════════════════════════════════╣\n")

            se (logado == verdadeiro)
            {
                escreva("║Usuario logado: ", nomesUsuarios[usuarioLogado], " (", tiposUsuarios[usuarioLogado], ")             ║\n")
                escreva("╠══════════════════════════════════════════════╣\n")
            }

            escreva("║ USUARIOS                                     ║\n")
            escreva("║ 1 - Cadastrar usuario                        ║\n")
            escreva("║ 2 - Login                                    ║\n")

            se (logado == verdadeiro)
            {
                escreva("╠══════════════════════════════════════════════╣\n")
                escreva("║ CONTA                                        ║\n")
                escreva("║ 11 - Meu perfil                              ║\n")
                escreva("║ 12 - Sair do usuario                         ║\n")
                escreva("║ 14 - Ver notificacoes                        ║\n")
            }

            escreva("╠══════════════════════════════════════════════╣\n")
            escreva("║ GESTAO DE MATERIAIS                          ║\n")
            escreva("║ 3 - Solicitar material                       ║\n")
            escreva("║ 4 - Listar pedidos do usuario logado         ║\n")
            escreva("║ 5 - Atualizar status de pedidos (gestor)     ║\n")
            escreva("╠══════════════════════════════════════════════╣\n")
            escreva("║ GESTAO DE VAGAS E CURRICULOS                 ║\n")
            escreva("║ 6 - Cadastrar vaga de emprego                ║\n")
            escreva("║ 7 - Enviar curriculo para vaga               ║\n")
            escreva("║ 8 - Listar curriculos por vaga               ║\n")
            escreva("║ 9 - Listar vagas disponiveis                 ║\n")

            se (logado == verdadeiro e tiposUsuarios[usuarioLogado] == "GESTOR")
            {
                escreva("╠══════════════════════════════════════════════╣\n")
                escreva("║ AREA DO GESTOR                               ║\n")
                escreva("║ 10 - Painel do gestor                        ║\n")
                escreva("║ 13 - Listar pedidos por status               ║\n")
                escreva("║ 15 - Desbloquear usuario                     ║\n")
            }

            escreva("╠══════════════════════════════════════════════╣\n")
            escreva("║ 0 - Sair                                     ║\n")
            escreva("╚══════════════════════════════════════════════╝\n")
            escreva("Escolha uma opcao: ")
            leia(opcao)

            escolha(opcao)
            {
                caso 1:
                    limpa()
                    escreva("=== CADASTRO DE USUARIO ===\n\n")

                    se (qtdUsuarios >= 20)
                    {
                        escreva("Limite de usuarios atingido.\n")
                    }
                    senao
                    {
                        escreva("Nome: ")
                        leia(nome)
                        escreva("Email: ")
                        leia(email)
                        escreva("Senha: ")
                        leia(senha)
                        escreva("Tipo de usuario:\n")
                        escreva("1 - Funcionario\n")
                        escreva("2 - Gestor\n")
                        escreva("3 - Empresa\n")
                        escreva("Digite a opcao: ")
                        leia(indice)

                        se (indice == 1)
                        {
                            tipo = "FUNCIONARIO"
                        }
                        senao se (indice == 2)
                        {
                            tipo = "GESTOR"
                        }
                        senao se (indice == 3)
                        {
                            tipo = "EMPRESA"
                        }
                        senao
                        {
                            tipo = "DESCONHECIDO"
                        }

                        nomesUsuarios[qtdUsuarios] = nome
                        emailsUsuarios[qtdUsuarios] = email
                        senhasUsuarios[qtdUsuarios] = senha
                        tiposUsuarios[qtdUsuarios] = tipo
                        tentativas[qtdUsuarios] = 0
                        qtdUsuarios++

                        escreva("\nUsuario cadastrado com sucesso!\n")
                    }

                    escreva("\nDigite qualquer numero para voltar: ")
                    leia(continuar)
                    pare

                caso 2:
                    limpa()
                    escreva("=== LOGIN ===\n\n")
                    escreva("Email: ")
                    leia(email)
                    escreva("Senha: ")
                    leia(senha)

                    logado = falso
                    usuarioLogado = -1

                    logico encontrouEmail
                    encontrouEmail = falso

                    para (i = 0; i < qtdUsuarios; i++)
                    {
                        se (email == emailsUsuarios[i])
                        {
                            encontrouEmail = verdadeiro

                            se (tentativas[i] >= 3)
                            {
                                escreva("\nUsuario bloqueado por tentativas excessivas.\n")
                                escreva("Procure um gestor para desbloqueio.\n")
                            }
                            senao se (senha == senhasUsuarios[i])
                            {
                                logado = verdadeiro
                                usuarioLogado = i
                                tentativas[i] = 0
                            }
                            senao
                            {
                                tentativas[i] = tentativas[i] + 1
                                escreva("\nSenha incorreta. Tentativas: ", tentativas[i], " de 3.\n")
                            }
                        }
                    }

                    se (logado == verdadeiro)
                    {
                        escreva("\nLogin realizado com sucesso!\n")
                        escreva("Bem-vindo, ", nomesUsuarios[usuarioLogado], " (", tiposUsuarios[usuarioLogado], ")\n")
                    }
                    senao se (encontrouEmail == falso)
                    {
                        escreva("\nUsuario nao encontrado.\n")
                    }
                    senao
                    {
                        escreva("\nNao foi possivel fazer login.\n")
                    }

                    escreva("\nDigite qualquer numero para voltar: ")
                    leia(continuar)
                    pare

                caso 3:
                    limpa()
                    escreva("=== SOLICITAR MATERIAL ===\n\n")

                    se (logado == falso)
                    {
                        escreva("Voce precisa estar logado para solicitar material.\n")
                    }
                    senao se (qtdPedidos >= 50)
                    {
                        escreva("Limite de pedidos atingido.\n")
                    }
                    senao
                    {
                        escreva("Nome do material: ")
                        leia(material)
                        escreva("Quantidade: ")
                        leia(quantidade)

                        nomesMateriais[qtdPedidos] = material
                        quantidadesMateriais[qtdPedidos] = quantidade
                        statusMateriais[qtdPedidos] = "PENDENTE"
                        idSolicitante[qtdPedidos] = usuarioLogado
                        qtdPedidos++

                        escreva("\nPedido registrado com sucesso! Status: PENDENTE\n")
                    }

                    escreva("\nDigite qualquer numero para voltar: ")
                    leia(continuar)
                    pare

                caso 4:
                    limpa()
                    escreva("=== PEDIDOS DO USUARIO LOGADO ===\n\n")

                    se (logado == falso)
                    {
                        escreva("Voce precisa estar logado para visualizar.\n")
                    }
                    senao
                    {
                        inteiro achouPedidos
                        achouPedidos = 0

                        para (i = 0; i < qtdPedidos; i++)
                        {
                            se (idSolicitante[i] == usuarioLogado)
                            {
                                achouPedidos = 1
                                escreva("Pedido ", i, "\n")
                                escreva("Material: ", nomesMateriais[i], "\n")
                                escreva("Quantidade: ", quantidadesMateriais[i], "\n")
                                escreva("Status: ", statusMateriais[i], "\n\n")
                            }
                        }

                        se (achouPedidos == 0)
                        {
                            escreva("Voce nao possui pedidos registrados.\n")
                        }
                    }

                    escreva("Digite qualquer numero para voltar: ")
                    leia(continuar)
                    pare

                caso 5:
                    limpa()
                    escreva("=== ATUALIZAR STATUS DE PEDIDOS ===\n\n")

                    se (logado == falso)
                    {
                        escreva("Voce precisa estar logado.\n")
                    }
                    senao se (tiposUsuarios[usuarioLogado] != "GESTOR")
                    {
                        escreva("Apenas usuarios do tipo GESTOR podem atualizar pedidos.\n")
                    }
                    senao
                    {
                        se (qtdPedidos == 0)
                        {
                            escreva("Nenhum pedido registrado.\n")
                        }
                        senao
                        {
                            para (i = 0; i < qtdPedidos; i++)
                            {
                                escreva("Pedido ", i, "\n")
                                escreva("Solicitante: ", nomesUsuarios[idSolicitante[i]], "\n")
                                escreva("Material: ", nomesMateriais[i], "\n")
                                escreva("Quantidade: ", quantidadesMateriais[i], "\n")
                                escreva("Status atual: ", statusMateriais[i], "\n\n")
                            }

                            escreva("Digite o numero do pedido para atualizar: ")
                            leia(indice)

                            se (indice < 0 ou indice >= qtdPedidos)
                            {
                                escreva("Indice invalido.\n")
                            }
                            senao
                            {
                                escreva("\n1 - APROVADO\n")
                                escreva("2 - NEGADO\n")
                                escreva("3 - ENTREGUE\n")
                                escreva("Escolha o novo status: ")
                                leia(escolhaStatus)

                                se (escolhaStatus == 1)
                                {
                                    novoStatus = "APROVADO"
                                }
                                senao se (escolhaStatus == 2)
                                {
                                    novoStatus = "NEGADO"
                                }
                                senao se (escolhaStatus == 3)
                                {
                                    novoStatus = "ENTREGUE"
                                }
                                senao
                                {
                                    novoStatus = statusMateriais[indice]
                                }

                                statusMateriais[indice] = novoStatus
                                escreva("\nStatus atualizado para ", novoStatus, ".\n")

                                se (qtdNotificacoes < 100)
                                {
                                    notificacoes[qtdNotificacoes] = novoStatus
                                    donoNotificacao[qtdNotificacoes] = idSolicitante[indice]
                                    notifPedido[qtdNotificacoes] = indice
                                    qtdNotificacoes = qtdNotificacoes + 1
                                }
                            }
                        }
                    }

                    escreva("\nDigite qualquer numero para voltar: ")
                    leia(continuar)
                    pare

                caso 6:
                    limpa()
                    escreva("=== CADASTRAR VAGA DE EMPREGO ===\n\n")

                    se (logado == falso)
                    {
                        escreva("Voce precisa estar logado.\n")
                    }
                    senao se (tiposUsuarios[usuarioLogado] != "EMPRESA" e tiposUsuarios[usuarioLogado] != "GESTOR")
                    {
                        escreva("Apenas EMPRESA ou GESTOR podem cadastrar vagas.\n")
                    }
                    senao se (qtdVagas >= 20)
                    {
                        escreva("Limite de vagas atingido.\n")
                    }
                    senao
                    {
                        escreva("Titulo da vaga: ")
                        leia(titulo)
                        escreva("Descricao resumida: ")
                        leia(descricao)
                        escreva("Nome da empresa: ")
                        leia(empresa)

                        tituloVagas[qtdVagas] = titulo
                        descricaoVagas[qtdVagas] = descricao
                        empresaVagas[qtdVagas] = empresa
                        qtdVagas++

                        escreva("\nVaga cadastrada com sucesso!\n")
                    }

                    escreva("\nDigite qualquer numero para voltar: ")
                    leia(continuar)
                    pare

                caso 7:
                    limpa()
                    escreva("=== ENVIAR CURRICULO ===\n\n")

                    se (logado == falso)
                    {
                        escreva("Voce precisa estar logado.\n")
                    }
                    senao se (qtdVagas == 0)
                    {
                        escreva("Nao existem vagas cadastradas.\n")
                    }
                    senao se (qtdCurriculos >= 50)
                    {
                        escreva("Limite de curriculos atingido.\n")
                    }
                    senao
                    {
                        escreva("Vagas disponiveis:\n\n")
                        para (i = 0; i < qtdVagas; i++)
                        {
                            escreva(i, " - ", tituloVagas[i], " (", empresaVagas[i], ")\n")
                        }

                        escreva("\nDigite o indice da vaga desejada: ")
                        leia(indice)

                        se (indice < 0 ou indice >= qtdVagas)
                        {
                            escreva("Indice invalido.\n")
                        }
                        senao
                        {
                            escreva("Nome completo do candidato: ")
                            leia(nome)
                            escreva("Email do candidato: ")
                            leia(email)

                            nomeCandidato[qtdCurriculos] = nome
                            emailCandidato[qtdCurriculos] = email
                            vagaCandidato[qtdCurriculos] = tituloVagas[indice]
                            statusCandidato[qtdCurriculos] = "ENVIADO"
                            qtdCurriculos++

                            escreva("\nCurriculo enviado para a vaga ")
                            escreva(tituloVagas[indice])
                            escreva(". Status: ENVIADO\n")
                        }
                    }

                    escreva("\nDigite qualquer numero para voltar: ")
                    leia(continuar)
                    pare

                caso 8:
                    limpa()
                    escreva("=== LISTAR CURRICULOS POR VAGA ===\n\n")

                    se (qtdCurriculos == 0)
                    {
                        escreva("Nenhum curriculo cadastrado.\n")
                    }
                    senao
                    {
                        escreva("Digite o titulo da vaga para consulta: ")
                        leia(tituloBusca)

                        inteiro achou
                        achou = 0

                        para (i = 0; i < qtdCurriculos; i++)
                        {
                            se (vagaCandidato[i] == tituloBusca)
                            {
                                achou = 1
                                escreva("\nCandidato ", i, "\n")
                                escreva("Nome: ", nomeCandidato[i], "\n")
                                escreva("Email: ", emailCandidato[i], "\n")
                                escreva("Vaga: ", vagaCandidato[i], "\n")
                                escreva("Status: ", statusCandidato[i], "\n")
                            }
                        }

                        se (achou == 0)
                        {
                            escreva("\nNenhum curriculo para essa vaga.\n")
                        }
                    }

                    escreva("\nDigite qualquer numero para voltar: ")
                    leia(continuar)
                    pare

                caso 9:
                    limpa()
                    escreva("=== LISTAR VAGAS DISPONIVEIS ===\n\n")

                    se (qtdVagas == 0)
                    {
                        escreva("Nenhuma vaga cadastrada.\n")
                    }
                    senao
                    {
                        para (i = 0; i < qtdVagas; i++)
                        {
                            escreva("Vaga ", i, "\n")
                            escreva("Titulo: ", tituloVagas[i], "\n")
                            escreva("Descricao: ", descricaoVagas[i], "\n")
                            escreva("Empresa: ", empresaVagas[i], "\n\n")
                        }
                    }

                    escreva("Digite qualquer numero para voltar: ")
                    leia(continuar)
                    pare

                caso 10:
                    limpa()
                    escreva("=== PAINEL DO GESTOR ===\n\n")

                    se (logado == falso ou tiposUsuarios[usuarioLogado] != "GESTOR")
                    {
                        escreva("Apenas usuarios do tipo GESTOR podem acessar este painel.\n")
                    }
                    senao
                    {
                        inteiro totalPendentes
                        inteiro totalFunc, totalGest, totalEmp
                        inteiro bloqueados
                        totalPendentes = 0
                        totalFunc = 0
                        totalGest = 0
                        totalEmp = 0
                        bloqueados = 0

                        para (i = 0; i < qtdUsuarios; i++)
                        {
                            se (tiposUsuarios[i] == "FUNCIONARIO")
                            {
                                totalFunc = totalFunc + 1
                            }
                            senao se (tiposUsuarios[i] == "GESTOR")
                            {
                                totalGest = totalGest + 1
                            }
                            senao se (tiposUsuarios[i] == "EMPRESA")
                            {
                                totalEmp = totalEmp + 1
                            }

                            se (tentativas[i] >= 3)
                            {
                                bloqueados = bloqueados + 1
                            }
                        }

                        escreva("Resumo geral do sistema:\n\n")
                        escreva("Total de usuarios cadastrados: ", qtdUsuarios, "\n")
                        escreva("Funcionarios: ", totalFunc, "\n")
                        escreva("Gestores: ", totalGest, "\n")
                        escreva("Empresas: ", totalEmp, "\n")
                        escreva("Usuarios bloqueados: ", bloqueados, "\n\n")
                        escreva("Total de pedidos de material: ", qtdPedidos, "\n")
                        escreva("Total de vagas cadastradas: ", qtdVagas, "\n")
                        escreva("Total de curriculos enviados: ", qtdCurriculos, "\n\n")

                        escreva("Pedidos pendentes:\n\n")
                        se (qtdPedidos == 0)
                        {
                            escreva("Nenhum pedido registrado.\n")
                        }
                        senao
                        {
                            para (i = 0; i < qtdPedidos; i++)
                            {
                                se (statusMateriais[i] == "PENDENTE")
                                {
                                    totalPendentes = totalPendentes + 1
                                    escreva("Pedido ", i, "\n")
                                    escreva("Solicitante: ", nomesUsuarios[idSolicitante[i]], "\n")
                                    escreva("Material: ", nomesMateriais[i], "\n")
                                    escreva("Quantidade: ", quantidadesMateriais[i], "\n")
                                    escreva("Status: ", statusMateriais[i], "\n\n")
                                }
                            }

                            se (totalPendentes == 0)
                            {
                                escreva("Nenhum pedido pendente.\n")
                            }
                            senao
                            {
                                escreva("Total de pedidos pendentes: ", totalPendentes, "\n")
                            }
                        }
                    }

                    escreva("\nDigite qualquer numero para voltar: ")
                    leia(continuar)
                    pare

                caso 11:
                    limpa()
                    escreva("=== MEU PERFIL ===\n\n")

                    se (logado == falso)
                    {
                        escreva("Voce precisa estar logado para acessar o perfil.\n")
                    }
                    senao
                    {
                        escreva("Nome: ", nomesUsuarios[usuarioLogado], "\n")
                        escreva("Email: ", emailsUsuarios[usuarioLogado], "\n")
                        escreva("Tipo: ", tiposUsuarios[usuarioLogado], "\n\n")

                        escreva("Deseja alterar a senha?\n")
                        escreva("1 - Sim\n")
                        escreva("2 - Nao\n")
                        escreva("Opcao: ")
                        leia(resp)

                        se (resp == 1)
                        {
                            escreva("\nDigite a nova senha: ")
                            leia(novaSenha)
                            senhasUsuarios[usuarioLogado] = novaSenha
                            tentativas[usuarioLogado] = 0
                            escreva("\nSenha atualizada com sucesso!\n")
                        }
                        senao
                        {
                            escreva("\nNenhuma alteracao realizada.\n")
                        }
                    }

                    escreva("\nDigite qualquer numero para voltar: ")
                    leia(continuar)
                    pare

                caso 12:
                    limpa()
                    se (logado == falso)
                    {
                        escreva("Nenhum usuario esta logado no momento.\n")
                    }
                    senao
                    {
                        logado = falso
                        usuarioLogado = -1
                        escreva("Voce saiu da sua conta com sucesso.\n")
                    }

                    escreva("\nDigite qualquer numero para voltar: ")
                    leia(continuar)
                    pare

                caso 13:
                    limpa()
                    escreva("=== LISTAR PEDIDOS POR STATUS ===\n\n")

                    se (logado == falso ou tiposUsuarios[usuarioLogado] != "GESTOR")
                    {
                        escreva("Apenas usuarios do tipo GESTOR podem acessar esta funcao.\n")
                    }
                    senao se (qtdPedidos == 0)
                    {
                        escreva("Nenhum pedido registrado.\n")
                    }
                    senao
                    {
                        escreva("Status disponiveis: PENDENTE, APROVADO, NEGADO, ENTREGUE\n")
                        escreva("Digite o status que deseja filtrar: ")
                        leia(statusBusca)

                        inteiro achouStatus
                        achouStatus = 0

                        para (i = 0; i < qtdPedidos; i++)
                        {
                            se (statusMateriais[i] == statusBusca)
                            {
                                achouStatus = 1
                                escreva("\nPedido ", i, "\n")
                                escreva("Solicitante: ", nomesUsuarios[idSolicitante[i]], "\n")
                                escreva("Material: ", nomesMateriais[i], "\n")
                                escreva("Quantidade: ", quantidadesMateriais[i], "\n")
                                escreva("Status: ", statusMateriais[i], "\n")
                            }
                        }

                        se (achouStatus == 0)
                        {
                            escreva("\nNenhum pedido com esse status.\n")
                        }
                    }

                    escreva("\nDigite qualquer numero para voltar: ")
                    leia(continuar)
                    pare

                caso 14:
                    limpa()
                    escreva("=== NOTIFICACOES ===\n\n")

                    se (logado == falso)
                    {
                        escreva("Voce precisa estar logado para ver notificacoes.\n")
                    }
                    senao
                    {
                        inteiro achouNotif
                        achouNotif = 0

                        para (i = 0; i < qtdNotificacoes; i++)
                        {
                            se (donoNotificacao[i] == usuarioLogado)
                            {
                                achouNotif = 1
                                escreva("Notificacao ", i, ":\n")
                                escreva("Pedido ", notifPedido[i], "\n")
                                escreva("Material: ", nomesMateriais[notifPedido[i]], "\n")
                                escreva("Novo status: ", notificacoes[i], "\n\n")
                            }
                        }

                        se (achouNotif == 0)
                        {
                            escreva("Voce nao possui notificacoes.\n")
                        }
                    }

                    escreva("\nDigite qualquer numero para voltar: ")
                    leia(continuar)
                    pare

                caso 15:
                    limpa()
                    escreva("=== DESBLOQUEAR USUARIO ===\n\n")

                    se (logado == falso ou tiposUsuarios[usuarioLogado] != "GESTOR")
                    {
                        escreva("Apenas usuarios do tipo GESTOR podem acessar esta funcao.\n")
                    }
                    senao
                    {
                        inteiro achouBloq, idx
                        achouBloq = 0

                        para (i = 0; i < qtdUsuarios; i++)
                        {
                            se (tentativas[i] >= 3)
                            {
                                achouBloq = 1
                                escreva("Usuario ", i, "\n")
                                escreva("Nome: ", nomesUsuarios[i], "\n")
                                escreva("Email: ", emailsUsuarios[i], "\n")
                                escreva("Tentativas de login: ", tentativas[i], "\n\n")
                            }
                        }

                        se (achouBloq == 0)
                        {
                            escreva("Nao ha usuarios bloqueados.\n")
                        }
                        senao
                        {
                            escreva("Digite o indice do usuario para desbloquear: ")
                            leia(idx)

                            se (idx < 0 ou idx >= qtdUsuarios)
                            {
                                escreva("Indice invalido.\n")
                            }
                            senao se (tentativas[idx] < 3)
                            {
                                escreva("Este usuario nao esta bloqueado.\n")
                            }
                            senao
                            {
                                tentativas[idx] = 0
                                escreva("Usuario desbloqueado com sucesso.\n")
                            }
                        }
                    }

                    escreva("\nDigite qualquer numero para voltar: ")
                    leia(continuar)
                    pare

                caso 0:
                    limpa()
                    escreva("Encerrando sistema A.L.V.A...\n")
                    escreva("Ate mais!\n")
                    pare

                caso contrario:
                    limpa()
                    escreva("Opcao invalida.\n")
                    escreva("Digite qualquer numero para voltar: ")
                    leia(continuar)
                    pare
            }
        }
        enquanto (opcao != 0)
    }
}
1