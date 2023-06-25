BITS 64

SYS_READ  equ 0
SYS_WRITE equ 1
STDIN     equ 0
STDOUT    equ 1

section .bss
    ; variable

    money resb 3
    conf resq 1

section .data
    ; constante

    yes: dq 'yes'   
    yesLen: equ $-yes

    start: db "Welcome to the ♠♥blackjack♦♣ table!"
    startLen: equ $-start
    
    wannaplay: db "Do you want to play? :"
    wannaplayLen: equ $-wannaplay

    denied: db "Well it was fun while it lasted, good night!"
    deniedLen: equ $-denied  

    showMoney: db "You have this much money : "
    showMoneyLen: equ $-showMoney

    bettingMoney: db "How much money do you want to bet? : "
    bettingMoneyLen: equ $-bettingMoney

    cardGivenToDealer: db "The dealer draws a card : "
    cardGivenToDealerLen: equ $-cardGivenToDealer
    
    cardGivenToPlayer: db "The player draws a card : "
    cardGivenToPlayerLen: equ $-cardGivenToPlayer

    hitOrStand: db "Do you want to hit or stand : "
    hitOrStandLen: equ $-hitOrStand

    hit: db "You hit !"
    hitLen: equ $-hit

    stand: db "You stand !"
    standLen: equ $-stand

    endGame: db "I counted the card and... "
    endGameLen: equ $-endGame

    youLost: db "You lost :( unlucky !"
    youLostLen: equ $-youLost

    youWon: db "You won :), it was luck of the draw !"
    youWonLen: equ $-youWon

    replay: db "Do you want to keep playing ? : "
    replayLen: equ $-replay

    replayYes: db "Great! Lets continue then !"
    replayYesLen: equ $-replayYes

    playerBusted: db "You went over 21! Busted!"
    playerBustedLen: equ $-playerBusted

    dealerBusted: db "The dealer went over 21! Busted!"
    dealerBustedLen: equ $-dealerBusted 

    blackjack: db "21 ! Its a ♠♥blackjack♦♣ !"
    blackjackLen: equ $-blackjack

    newline: db 0x0a
    newlineLen: equ $-newline


section .text
    global _start

    _start: 

        MOV rax,SYS_WRITE
        MOV rdi,STDOUT
        MOV rsi,newline
        MOV rdx,newlineLen
        syscall

        ; starting string
        MOV rax,SYS_WRITE
        MOV rdi,STDOUT
        MOV rsi,start
        MOV rdx,startLen
        syscall

        ; NEWLINE PRINT
        MOV rax,SYS_WRITE
        MOV rdi,STDOUT
        MOV rsi,newline
        MOV rdx,newlineLen
        syscall

        ; ask the player if he wants to play 
        MOV rax,SYS_WRITE
        MOV rdi,STDOUT
        MOV rsi,wannaplay
        MOV rdx,wannaplayLen
        syscall

        ; user input if he wants to play or not
        MOV rax,SYS_READ
        MOV rdi,STDIN
        MOV rsi,conf
        MOV rdx,3
        syscall

        MOV rax,[conf]
        CMP rax,[yes]

        JE loopGame 

        ; NEWLINE PRINT
        MOV rax,SYS_WRITE
        MOV rdi,STDOUT
        MOV rsi,newline
        MOV rdx,newlineLen
        syscall

        ; user refuses to play
        MOV rax,SYS_WRITE
        MOV rdi,STDOUT
        MOV rsi,denied
        MOV rdx,deniedLen
        syscall

        ; NEWLINE PRINT
        MOV rax,SYS_WRITE
        MOV rdi,STDOUT
        MOV rsi,newline
        MOV rdx,newlineLen
        syscall

        ;exiting
        mov rax,60 
        mov rdi,0
        syscall


    loopGame:

        ; ask the player if he wants to play 
        MOV rax,SYS_WRITE
        MOV rdi,STDOUT
        MOV rsi,start
        MOV rdx,startLen
        syscall

        ;exiting
        mov rax,60 
        mov rdi,0
        syscall
