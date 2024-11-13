section .data
;Clear Screen
    clearScreen db 27, '[2J', 0
    clearScreenLen equ $ - clearScreen

;Ascii Art
    aboutMe db 27, '[1;1H'
            db "#┏┓┓        ┳┳┓┏┓"
            db 27, '[2;1H'
            db "#┣┫┣┓┏┓┓┏╋  ┃┃┃┣ "
            db 27, '[3;1H' 
            db "#┛┗┗┛┗┛┗┻┗  ┛ ┗┗┛"
    aboutMeLen equ $ - aboutMe

    myFirst db 27, '[5;1H'
            db "#_  _ _ _  ____ _ ____ ____ ___"
            db 27, '[6;1H'
            db "#|\/|  Y   |--- | |--< ====  |"
    myFirstLen equ $ - myFirst

    myFaves db 27, '[9;1H'
            db "#╔╦╗┬ ┬  ╔═╗┌─┐┬  ┬┌─┐┌─┐"
            db 27, '[10;1H'
            db "#║║║└┬┘  ╠╣ ├─┤└┐┌┘├┤ └─┐"
            db 27, '[11;1H'
            db "#╩ ╩ ┴   ╚  ┴ ┴ └┘ └─┘└─┘"
    myFavesLen equ $ - myFaves

    hobbies db 27, '[18;1H'
            db "#|_| _ |_ |_  o  _  _"
            db 27, '[19;1H'
            db "#| |(_)|_)|_) | (/__>"
    hobbiesLen equ $ - hobbies

    amb db 27, '[24;1H'
            db "#  __    _      ___   _  _____  _   ___   _    "
            db 27, '[25;1H'
            db "# / /\  | |\/| | |_) | |  | |  | | / / \ | |\ |"
            db 27, '[26;1H'
            db "#/_/--\ |_|  | |_|_) |_|  |_|  |_| \_\_/ |_| \||: "
    ambLen equ $ - amb

    motto db 27, '[27;1H'
          db "#|V| _ _|__|_ _ "
          db 27, '[28;1H'
          db "#| |(_) |_ |_(_)|: ", 0xa
    mottoLen equ $ - motto    

;Prompts
    ;About Me
    prmtName db "Enter Name: "
    prmtNameLen equ $ - prmtName

    prmtEmail db "Enter Email: "
    prmtEmailLen equ $ - prmtEmail

    prmtWebsite db "Enter Website: "
    prmtWebsiteLen equ $ - prmtWebsite

    prmtAchieve db "Enter your first achievement: "
    prmtAchieveLen equ $ - prmtAchieve

    prmtRisk db "Enter the first risk you took: "
    prmtRiskLen equ $ - prmtRisk

    prmtHappy db "Enter the first time you felt completely happy: "
    prmtHappyLen equ $ - prmtHappy

    ;My Faves
    prmtColor db "Enter Favorite Color/s: "
    prmtColorLen equ $ - prmtColor

    prmtPerfume db "Enter Favorite Perfume: "
    prmtPerfumeLen equ $ - prmtPerfume

    prmtMusic db "Enter Favorite Music: "
    prmtMusicLen equ $ - prmtMusic

    prmtSinger db "Enter Favorite Singer/s: "
    prmtSingerLen equ $ - prmtSinger

    prmtSong db "Enter Favorite Song: "
    prmtSongLen equ $ - prmtSong

    prmtFood db "Enter Favorite Food: "
    prmtFoodLen equ $ - prmtFood

    prmtActivity db "Enter Favorite Weekend Activity: "
    prmtActivityLen equ $ - prmtActivity

    ;Hobbies
    prmtTV db "Enter TV Show: "
    prmtTVLen equ $ - prmtTV

    prmtFilm db "Enter Movie: "
    prmtFilmLen equ $ - prmtFilm

    prmtBook db "Enter Book: "
    prmtBookLen equ $ - prmtBook

    prmtCelebs db "Enter Celebs: "
    prmtCelebsLen equ $ - prmtCelebs

    prmtModel db "Enter Role Model: "
    prmtModelLen equ $ - prmtModel

    prmtAmbition db "What is your Ambition?: "
    prmtAmbitionLen equ $ - prmtAmbition

    prmtMotto db "What is your motto?: "
    prmtMottoLen equ $ - prmtMotto

;msg
    msgName db 27, '[3;17H'
            db "# |Name: "
    msgNameLen equ $ - msgName

    msgEmail db 27, '[4;1H'
            db "# |Email: "
    msgEmailLen equ $ - msgEmail

    msgWebsite db 27, '[4;33H'
            db "|Blog/Website: "
    msgWebsiteLen equ $ - msgWebsite

    msgAchieve db 27, '[6;32H'
            db " |First big achievment: "
    msgAchieveLen equ $ - msgAchieve

    msgRisk db 27, '[7;1H'
            db "# |First risk I ever took: "
    msgRiskLen equ $ - msgRisk

    msgHappy db 27, '[8;1H'
            db "# |First time I felt completely happy: "
    msgHappyLen equ $ - msgHappy

    msgColor db 27, '[11;26H'
            db " |Color/s: "
    msgColorLen equ $ - msgColor

    msgPerfume db 27, '[12;1H'
            db "# |Perfume: "
    msgPerfumeLen equ $ - msgPerfume

    msgMusic db 27, '[13;1H'
            db "# |Music: "
    msgMusicLen equ $ - msgMusic

    msgSinger db 27, '[14;1H'
            db "# |Singer/s: "
    msgSingerLen equ $ - msgSinger

    msgSong db 27, '[15;1H'
            db "# |Song: "
    msgSongLen equ $ - msgSong

    msgFood db 27, '[16;1H'
            db "# |Food: "
    msgFoodLen equ $ - msgFood

    msgActivity db 27, '[17;1H'
            db "# |Weekend activity: "
    msgActivityLen equ $ - msgActivity

    msgTV db 27, '[20;1H'
            db "# |TV Show: "
    msgTVLen equ $ - msgTV

    msgMovie db 27, '[21;1H'
            db "# |Movie: "
    msgMovieLen equ $ - msgMovie

    msgBook db 27, '[22;1H'
            db "# |Book: "
    msgBookLen equ $ - msgBook

    msgCelebs db 27, '[23;1H'
            db "# |Celebs: "
    msgCelebsLen equ $ - msgCelebs

    msgModel db 27, '[24;1H'
            db "# |Role model: "
    msgModelLen equ $ - msgModel

    msgAmb db 27, '[26;51H'
    msgAmbLen equ $ - msgAmb

    msgMotto db 27, '[28;20H'
    msgMottoLen equ $ - msgMotto

section .bss
    name resb 50
    nameLen equ $ - name

    email resb 50
    emailLen equ $ - email

    website resb 50
    websiteLen equ $ - website

    achieve resb 50
    achieveLen equ $ - achieve

    risk resb 50
    riskLen equ $ - risk

    happy resb 50
    happyLen equ $ - happy
    
    color resb 50
    colorLen equ $ - color

    perfume resb 50
    perfumeLen equ $ - perfume

    music resb 50
    musicLen equ $ - music

    singer resb 50
    singerLen equ $ - singer

    song resb 50
    songLen equ $ - song

    food resb 50
    foodLen equ $ - food

    activity resb 50
    activityLen equ $ - activity

    tv resb 50
    tvLen equ $ - tv

    film resb 50
    filmLen equ $ - film

    book resb 50
    bookLen equ $ - book

    celeb resb 50
    celebLen equ $ - celeb

    model resb 50
    modelLen equ $ - model

    ambitionInput resb 50
    ambitionInputLen equ $ - ambitionInput

    mottoInput resb 50
    mottoInputLen equ $ - mottoInput
section .text
    global _start
_start:
    call displayInputPrmts
    call theClearScreen
    call displayMsg
    call displayAscii
    
    ;exit code
    mov eax, 1
    int 0x80

    displayInputPrmts:
        ;Name
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtName
        mov edx, prmtNameLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, name
        mov edx, nameLen
        int 0x80
        ;Email
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtEmail
        mov edx, prmtEmailLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, email
        mov edx, emailLen
        int 0x80
        ;Website
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtWebsite
        mov edx, prmtWebsiteLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, website
        mov edx, websiteLen
        int 0x80
        ;Achievements
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtAchieve
        mov edx, prmtAchieveLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, achieve
        mov edx, achieveLen
        int 0x80
        ;Risk
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtRisk
        mov edx, prmtRiskLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, risk
        mov edx, riskLen
        int 0x80
        ;Happy
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtHappy
        mov edx, prmtHappyLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, happy
        mov edx, happyLen
        int 0x80

        ;Colors
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtColor
        mov edx, prmtColorLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, color
        mov edx, colorLen
        int 0x80
        ;Perfume
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtPerfume
        mov edx, prmtPerfumeLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, perfume
        mov edx, perfumeLen
        int 0x80
        ;Music
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtMusic
        mov edx, prmtMusicLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, music
        mov edx, musicLen
        int 0x80
        ;Singer
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtSinger
        mov edx, prmtSingerLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, singer
        mov edx, singerLen
        int 0x80
        ;Song
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtSong
        mov edx, prmtSongLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, song
        mov edx, songLen
        int 0x80
        ;Food
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtFood
        mov edx, prmtFoodLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, food
        mov edx, foodLen
        int 0x80
        ;Activity
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtActivity
        mov edx, prmtActivityLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, activity
        mov edx, activityLen
        int 0x80

        ;TV Show
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtTV
        mov edx, prmtTVLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, tv
        mov edx, tvLen
        int 0x80
        ;Film
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtFilm
        mov edx, prmtFilmLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, film
        mov edx, filmLen
        int 0x80
        ;Book
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtBook
        mov edx, prmtBookLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, book
        mov edx, bookLen
        int 0x80
        ;Celebs
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtCelebs
        mov edx, prmtCelebsLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, celeb
        mov edx, celebLen
        int 0x80
        ;Role Model
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtModel
        mov edx, prmtModelLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, model
        mov edx, modelLen
        int 0x80
        ;Ambition
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtAmbition
        mov edx, prmtAmbitionLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, ambitionInput
        mov edx, ambitionInputLen
        int 0x80
        ;motto
        mov eax, 4
        mov ebx, 1
        mov ecx, prmtMotto
        mov edx, prmtMottoLen
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, mottoInput
        mov edx, mottoInputLen
        int 0x80
        ret

    theClearScreen:
        mov eax, 4
	mov ebx, 1
	mov ecx, clearScreen
	mov edx, clearScreenLen
	int 0x80
	ret 

    displayAscii:
        mov eax, 4
        mov ebx, 1
        mov ecx, aboutMe
        mov edx, aboutMeLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, myFirst
        mov edx, myFirstLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, myFaves
        mov edx, myFavesLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, hobbies
        mov edx, hobbiesLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, amb
        mov edx, ambLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, motto
        mov edx, mottoLen
        int 0x80
        ret

    displayMsg:
        ;name
        mov eax, 4
        mov ebx, 1
        mov ecx, msgName
        mov edx, msgNameLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, name
        mov edx, nameLen
        int 0x80
        ;email
        mov eax, 4
        mov ebx, 1
        mov ecx, msgEmail
        mov edx, msgEmailLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, email
        mov edx, emailLen
        int 0x80
        ;website
        mov eax, 4
        mov ebx, 1
        mov ecx, msgWebsite
        mov edx, msgWebsiteLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, website
        mov edx, websiteLen
        int 0x80
        ;achieve
        mov eax, 4
        mov ebx, 1
        mov ecx, msgAchieve
        mov edx, msgAchieveLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, achieve
        mov edx, achieveLen
        int 0x80
        ;risk
        mov eax, 4
        mov ebx, 1
        mov ecx, msgRisk
        mov edx, msgRiskLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, risk
        mov edx, riskLen
        int 0x80
        ;happy
        mov eax, 4
        mov ebx, 1
        mov ecx, msgHappy
        mov edx, msgHappyLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, happy
        mov edx, happyLen
        int 0x80
        ;color
        mov eax, 4
        mov ebx, 1
        mov ecx, msgColor
        mov edx, msgColorLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, color
        mov edx, colorLen
        int 0x80
        ;perfume
        mov eax, 4
        mov ebx, 1
        mov ecx, msgPerfume
        mov edx, msgPerfumeLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, perfume
        mov edx, perfumeLen
        int 0x80
        ;music
        mov eax, 4
        mov ebx, 1
        mov ecx, msgMusic
        mov edx, msgMusicLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, music
        mov edx, musicLen
        int 0x80
        ;singer
        mov eax, 4
        mov ebx, 1
        mov ecx, msgSinger
        mov edx, msgSingerLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, singer
        mov edx, singerLen
        int 0x80
        ;song
        mov eax, 4
        mov ebx, 1
        mov ecx, msgSong
        mov edx, msgSongLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, song
        mov edx, songLen
        int 0x80
        ;food
        mov eax, 4
        mov ebx, 1
        mov ecx, msgFood
        mov edx, msgFoodLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, food
        mov edx, foodLen
        int 0x80
        ;activity
        mov eax, 4
        mov ebx, 1
        mov ecx, msgActivity
        mov edx, msgActivityLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, activity
        mov edx, activityLen
        int 0x80
        ;tv
        mov eax, 4
        mov ebx, 1
        mov ecx, msgTV
        mov edx, msgTVLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, tv
        mov edx, tvLen
        int 0x80
        ;movie
        mov eax, 4
        mov ebx, 1
        mov ecx, msgMovie
        mov edx, msgMovieLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, film
        mov edx, filmLen
        int 0x80
        ;book
        mov eax, 4
        mov ebx, 1
        mov ecx, msgBook
        mov edx, msgBookLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, book
        mov edx, bookLen
        int 0x80
        ;celebs
        mov eax, 4
        mov ebx, 1
        mov ecx, msgCelebs
        mov edx, msgCelebsLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, celeb
        mov edx, celebLen
        int 0x80
        ;model
        mov eax, 4
        mov ebx, 1
        mov ecx, msgModel
        mov edx, msgModelLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, model
        mov edx, modelLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, msgAmb
        mov edx, msgAmbLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, ambitionInput
        mov edx, ambitionInputLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, msgMotto
        mov edx, msgMottoLen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, mottoInput
        mov edx, mottoInputLen
        int 0x80
        ret
    
    mov eax, 1
    int 0x80
    
 
  
