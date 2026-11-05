# =====================================================================
# Projeto Integrador I - Simulador de Alarme Industrial em Assembly MIPS
# Autores: Grupo de Douglas, Luiz Otavio, e Gustavo
# Descrição: Lê os estados de C, A e B, processa a lógica S = C AND (A OR B)
#            e exibe o resultado do alarme.
# =====================================================================

.data
    str_intro:   .asciiz "=== Simulador de Alarme Industrial ===\n"
    str_promptC: .asciiz "Digite o estado do Sistema C (0=Desligado, 1=Ligado): "
    str_promptA: .asciiz "Digite o estado da Porta A (0=Fechada, 1=Aberta): "
    str_promptB: .asciiz "Digite o estado do Movimento B (0=Sem movimento, 1=Movimento): "
    str_res:     .asciiz "Estado do Alarme (S): "
    str_quebra:  .asciiz "\n"

.text
.globl main

main:
    # Exibir mensagem de boas-vindas
    li $v0, 4
    la $a0, str_intro
    syscall

    # 1. Ler entrada C (Sistema)
    li $v0, 4
    la $a0, str_promptC
    syscall
    li $v0, 5
    syscall
    move $t0, $v0        # $t0 = C

    # 2. Ler entrada A (Porta)
    li $v0, 4
    la $a0, str_promptA
    syscall
    li $v0, 5
    syscall
    move $t1, $v0        # $t1 = A

    # 3. Ler entrada B (Movimento)
    li $v0, 4
    la $a0, str_promptB
    syscall
    li $v0, 5
    syscall
    move $t2, $v0        # $t2 = B

    # =====================================================================
    # Lógica Booleana: S = C AND (A OR B)
    # =====================================================================
    
    or  $t3, $t1, $t2    # $t3 = A OR B
    and $t4, $t0, $t3    # $t4 = C AND (A OR B) [Resultado S]

    # =====================================================================
    # Exibir o Resultado
    # =====================================================================
    li $v0, 4
    la $a0, str_res
    syscall

    li $v0, 1
    move $a0, $t4        # Imprime o valor de S (0 ou 1)
    syscall

    li $v0, 4
    la $a0, str_quebra
    syscall

    # Encerrar programa
    li $v0, 10
    syscall