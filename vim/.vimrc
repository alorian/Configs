" ------------------------------------------------------------------- "
" Конфигурационный файл Vim
" Автор Alorian
" Дата последнего изменения 20.01.2011 
" Версия Vim 7.3
" ------------------------------------------------------------------- "

" ------------------------ Настройки русского языка ----------------- "
set fileencodings=utf-8,cp1251
set termencoding=utf-8
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
" ------------------------------------------------------------------- "

" ------------------------ Общие настройки -------------------------- "
set mouse=a " Загадочный режим мыши
set autowrite " Автосохранение при :make
set history=50 " Хранить 50 команд из командной строки
" set undolevels=1000 " Хранить 1000 последних изменений
set showcmd " Показывать незаконченные команды
set updatetime=0 " Частота обновления экрана
set novisualbell " Выключить звуковой сигнал
set nocompatible " Отключает совместимость с Vi
" set pastetoggle=<F4> " Переключение в режим вклейки
set sessionoptions=curdir,buffers,tabpages " Опции сесссий
set autochdir "Автоматическое переключение рабочей папки
set noswapfile

" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden 
" Перечитываем .vimrc после записи. Работает только под *nix
autocmd! bufwritepost ~/.vimrc execute "normal! :source ~/.vimrc"
" ------------------------------------------------------------------- "

" ----------------------- Резервное копирование --------------------- "
" set backup " Резервное копирование файла при запуске
" set backupdir=d:\my\backup
" ------------------------------------------------------------------- "


" ------------------------ Настройки отображения -------------------- "

" ---- Общие настройки ---- "
set nu " Нумерация строк
set wrap " Перенос строк
set linebreak " Перонос строки без разбивки слова
" set wrapmargin=5 " Отступ строки от правого края при переносе
set showbreak=_ " Отображение переноса строк
set showmatch " Показывать первую парную скобку после ввода второй
set scrolloff=9 " Сколько строк вверху и внизу экрана показывать при скроллинге
set sidescrolloff=3 " То же самое только вбок
set laststatus=2 " always show the status line
set statusline=%t\ %y%m%r[%{&fileencoding}]%<[%{strftime(\"%d.%m.%y\",getftime(expand(\"%:p\")))}]%k%=%-14.(%l,%c%V%)\[]\ %P
set cursorline " Подсветка строки с курсором
au GUIEnter * :set lines=99999 columns=99999 " Разворачивание на весь экран
" set showtabline=2 " Включаем строку с табами по умолчанию
" ------------------------- "

" ---- Табуляция ---- "
set ts=4 " Размер табуляции
set shiftwidth=4
set autoindent " Авто отступ
" set pastetoggle= " при вставке фрагмента сохраняет отступы
" ------------------- "

" ---- Убираем Интерфейс ---- "
set guioptions-=T " Тулбар
set guioptions-=m " Меню
" set guioptions-=r " правый скролбар
" --------------------------- "

" ---- Цветовая схема ---- "
colorscheme alorian
" ------------------------ "
"
" ---- Шрифт ---- "
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Courier\ New\ 11
  elseif has("gui_photon")
    set guifont=Courier\ New:s11
  elseif has("gui_kde")
    set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
	set guifont=Lucida_Console:h10:cRUSSIAN
  endif
endif
" --------------- "
"
" ---- Настройки сворачивания ---- "
" set foldenable
" set foldmethod=syntax " Сворачивание кода между скобок
" set foldcolumn=3 " Ширина колонки для отображения свернутых кусков кода
" -------------------------------- "

" ------------------------------------------------------------------- "


" --------------------------- Настройки поиска ---------------------- "
set hlsearch " Подсветка найденного
" Сброс поиска
nmap <S-h> :nohls<CR>
set incsearch " Инкрементальный поиск
set ignorecase " Игнорировать регистр
set smartcase " Игнорирует регистр если нет больших букв

" Поиск и замена слова под курсором в текущей строке
nmap \ :.,+0s/\<<c-r>=expand("<cword>")<cr>\>//gc<LEFT><LEFT><LEFT>
" Поиск и замена слова под курсором во всем файле
nmap - :%s/\<<c-r>=expand("<cword>")<cr>\>//g<LEFT><LEFT>
" ------------------------------------------------------------------- "

" -------------------------- Настройки синтаксиса ------------------- "
syntax on " Включение подсветки синтаксиса
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php,module,install set omnifunc=phpcomplete#CompletePHP

" ---- Типы файлов ---- "
" Включаем filetype плугин. Настройки, специфичные для определынных файлов мы разнесём по разным местам
filetype plugin on
au BufRead,BufNewFile *.phps,*.module,*.install set filetype=php
" --------------------- "

" ------------------------------------------------------------------- "


" -------------------------- Управление ----------------------------- "

" ---- Мышь ---- "
set mouse=a
set mousemodel=popup
set mousehide " Скрывать мышь во время печатания
" -------------- "

" ---- Автозавершение скобок ---- "
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
" ------------------------------- "

" Макросы
nmap B /<p align<CR>^fahxdt>k$F>i<Space><Esc>p

" Четыре строки ниже для удобного ред. строк с переносом
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Переключаюсь по табам Alt+номер
map <M-1> 1gt
map <M-2> 2gt
map <M-3> 3gt


" Быстрый переход в нормальный режим
imap qq <ESC>
vmap qq <ESC>

" Создание новой вкладки
nmap <C-Tab> :tabn<CR>
nmap <C-S-Tab> :tabp<CR>
nmap <C-t> :tabnew<CR>

" Просмотр списка буферов
nmap b <ESC>:b 

" Восстанавливаем выделение после сдвига через > или <
vmap > >gv
vmap < <gv

" Вставка пустой строки в нормальном режиме
nmap oo o<ESC>
nmap OO O<ESC>

" <br /> по ctrl+enter
nmap <C-CR> i<br /><ESC>
imap <C-CR> <br />

inoremap <C-Space> <C-x><C-o>
set backspace=indent,eol,start " Разрешает backspace удалять все
set fo+=cr " Исправляем <Enter> для комментирования

" Открыть VIMRC
map ,v :vsp $MYVIMRC<CR>

" Перечитать VIMRC
map ,V :source $MYVIMRC<CR>

" Подсветка линии с курсором по \l
:nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
" Подсветка столбца с курсором по \c
:nnoremap <silent> <Leader>c :execute 'match Search /\%'.virtcol('.').'v/'<CR>
nmap <leader>w :hi clear guibg=#<c-r>=expand("<cword>")<cr><cr>

" Включение автоотступов
nmap <F4> :set ai<CR>

" В начало строки + последний макрос
nmap -- ^@@

" Перелистывание по пробелу
nmap <Space> <PageDown>
nmap <S-Space> <PageUp>

" Копировать все
nmap <C-A> mrgg"+yG`r
imap <C-A> <esc>mrgg"+yG`ri

" Копирование по Ctrl+C
vmap <C-C> "+ygv

" Вставка по Ctrl+V
nmap <C-V> "+gP
imap <C-V> <esc>"+gPi<RIGHT>

" F2 - быстрое сохранение
nmap <F2> :w<cr>
nmap <C-s> :w<CR>
vmap <F2> <esc>:w<cr>i
vmap <C-s> <esc>:w<cr>gv
imap <F2> <esc>:w<cr>i
imap <C-s> <esc>:w<cr>i


" F6 - предыдущий буфер
map <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i

" F7 - следующий буфер
map <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>i
imap <F7> <esc>:bn<cr>i

" F9 - make команда
map <F9> :make<cr>
vmap <F9> <esc>:make<cr>i
imap <F9> <esc>:make<cr>i

" F10 - закрыть вкладку/буфер
map <F10> :bd<cr>
vmap <F10> <esc>:bd<cr>
imap <F10> <esc>:bd<cr>

	" Закрыть вкладку/буфер по CTRL+w
	map <F10> :bd<cr>
	vmap <F10> <esc>:bd<cr>
	imap <F10> <esc>:bd<cr>

" F11 - показать окно Taglist
map <F11> :TlistToggle<cr>
vmap <F11> <esc>:TlistToggle<cr>
imap <F11> <esc>:TlistToggle<cr>

" F12 - обозреватель файлов
nmap <F12> :Ex<cr>


" Переключение языка внутри вима по CTRL+F
cmap <silent> <C-F> <C-^>
imap <silent> <C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
nmap <silent> <C-F> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
vmap <silent> <C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv

" Переход в нормальный режим
imap <F12> <ESC>
vmap <F12> <ESC>
imap <M> <ESC>
vmap <M> <ESC>

" Saving File to FTP server
nmap <C-S> :w<CR>:FTPUpload<CR>
vmap <C-S> <esc>:w<CR>:FTPUpload<CR>gv
imap <C-S> <esc>:w<CR>:FTPUpload<CR>i
" ------------------------------------------------------------------- "


" -------------------------- Функции -------------------------------- "

" ---- Переключение раскладок и индикация выбранной ---- "
" в данный момент раскладки.
" -->
" Переключение раскладок будет производиться по <C-F>
" При английской раскладке статусная строка текущего окна будет синего
" цвета, а при русской - зеленого.

function! MyKeyMapHighlight()
	if &iminsert == 0
		hi StatusLine ctermfg=White guifg=White
	else
		hi StatusLine ctermfg=Red guifg=Red
	endif
endfunction

" Вызываем функцию, чтобы она установила цвета при запуске Vim'a
call MyKeyMapHighlight()

" При изменении активного окна будет выполняться обновление
" индикации текущей раскладки
au WinEnter * :call MyKeyMapHighlight()
" ------------------------------------------------------ "

" ---- Авто смена текущей директории при смене буфера ---- "
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
" -------------------------------------------------------- "
"
" ------------------------------------------------------------------- "



" ------------------------------- Настройки плагинов ---------------- "

" ---- Matchit ---- "
" ----------------- "

" ---- Netrw ---- "
" let g:netrw_silent = 1
" ----------------- "

" ---- FTPSave ---- "
let g:ftpsave = {}

let g:ftpsave.1 = {}
	let g:ftpsave.1.rootFolder = 'd:\asd\'
	let g:ftpsave.1.ftpHost = 'ftp://asd.asd.ru/asd'
	let g:ftpsave.1.ftpLogin = "asd"
	let g:ftpsave.1.ftpPass = "asd"
" ----------------- "

" ---- Session Manager ---- "
let g:SessionMgr_AutoManage = 0
let g:SessionMgr_DefaultName = "mysession"
" ------------------------- "

" ---- Tlist ---- "
" Настройки для Tlist (показвать только текущий файл в окне навигации по коду)
let g:Tlist_Show_One_File = 1
" --------------- "

" ---- Zen Coding ---- "
let g:user_zen_expandabbr_key = '<c-e>'
let g:user_zen_settings = {
\	'css' : {
\		'snippets' : {
\			'css' : "@media all{\n"
\				."\n"
\				."/* ====================================\n"
\				."============ RESET ================= */\n"
\				."html, body, div, span, object, iframe, img, strong, b, u, i, form, label, legend{margin:0; padding:0; border:0; outline:0; vertical-align:baseline; background:transparent;}\n"
\				."body{color:#000; font:1em/1 Arial, Geneva, sans-serif; background:#FFF;}\n"
\				."a{color:#06C; text-decoration:underline; outline:0;}\n"
\				."a:hover{text-decoration:none;}\n"
\				."a:visited{color:#93C;}\n"
\				."a:active{color:#F00;}\n"
\				."\n"
\				."/* ====================================\n"
\				."============ STRUCTURE ============= */\n"
\				."#wrapper{}\n"
\				."\n"
\				."#header{}\n"
\				."\n"
\				."#middle{}\n"
\				."    #content{}\n"
\				."\n"
\				."#footer{}\n"
\				."\n"
\				."/* ====================================\n"
\				."============ BLOCKS ================ */\n"
\				."\n"
\				."/* ====================================\n"
\				."============ CONTENT STYLES ======== */\n"
\				."\n"
\				."}\n"
\				."\n"
\				."@media print{\n"
\				."	/* style for printers */\n"
\				."}\n",
\		}
\	},
\	'html' : {
\		'snippets' : {
\			'a:void': "<a href=\"javascript:void(0)\">${child}|</a>",
\			'html:xs': "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n"
\                    ."<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"${lang}\">\n"
\                    ."<head>\n"
\                    ."    <meta http-equiv=\"Content-Type\" content=\"text/html;charset=UTF-8\" />\n"
\                    ."    <title></title>\n"
\                    ."    <meta name=\"robots\" content=\"index,follow\" />\n"
\                    ."    <meta name=\"description\" content=\"\" />\n"
\                    ."    <meta name=\"keywords\" content=\"\" />\n"
\                    ."    <link href=\"/favicon.ico\" rel=\"shortcut icon\" />\n"
\					 ."    <link media=\"all\" rel=\"stylesheet\" href=\"style.css\" type=\"text/css\" />\n"
\                    ."</head>\n"
\                    ."<body>\n"
\                    ."<div id=\"wrapper\">\n"
\                    ."\n"
\                    ."    <div id=\"header\">\n"
\                    ."    </div>\n"
\                    ."\n"
\                    ."    <div id=\"middle\">\n"
\                    ."        <div id=\"content\">\n"
\                    ."              ${child}|\n"
\                    ."        </div>\n"
\                    ."    </div>\n"
\                    ."\n"
\                    ."    <div id=\"footer\">\n"
\                    ."    </div>\n"
\                    ."\n"
\                    ."</div>\n"
\                    ."</body>\n"
\                    ."</html>",
\		}
\	},
\	'php' : {
\		'snippets' : {
\			'pre:ar': "echo '<pre>'; print_r($${child}|arResult); echo '</pre>';\n",
\			'print': "<pre>\n"
\					."	<?print_r(${child}|);?>\n"
\					."</pre>\n",
\			'print:ar': "<pre>\n"
\					."	<?print_r($arResult);?>\n"
\					."</pre>\n",
\		}
\	}
\}

" -------------------- "


" ------------------------------------------------------------------- "



" ------------------------------------------------------------------- "

