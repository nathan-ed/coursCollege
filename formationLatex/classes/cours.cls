% author : sylcha
% licence : Creative Commons Attribution-NonCommercial-ShareAlike 4.0
%           https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{cours}[2024/08/07 v0.1]%
\LoadClass[fontsize=10pt,svgnames,footinclude,headinclude]{book}%
% options
\RequirePackage{xkeyval}%
\def\niveau{Seconde}
\define@key{cours.cls}{niveau}[Seconde]{%
  \def\niveau{#1}%
}
\ExecuteOptionsX{niveau}%
\ProcessOptionsX%
\RequirePackage{ProfCollege}%
\RequirePackage{pgfplots}%
\pgfplotsset{compat=1.18}%
\RequirePackage[french]{babel}%
% mise en page
\RequirePackage{geometry}%
\geometry{nomarginpar,hmargin=2.5cm,vmargin=2.5cm}%
% \RequirePackage{silence} % :-\
% \WarningFilter{scrbook}{Usage of package `titlesec'}%
% \WarningFilter{titlesec}{Non standard sectioning command detected}%
% Pour le sous-titre de la page de garde
\RequirePackage{etoolbox}
\makeatletter
\providecommand{\subtitle}[1]{% add subtitle to \maketitle
  \apptocmd{\@title}{\par\vspace{1cm} {\Large #1 \par}}{}{}
}
\RequirePackage{imakeidx}
\makeatother
\RequirePackage{xcolor}%
\RequirePackage{packages/couleurs}%
% liens
\RequirePackage{hyperref}
\hypersetup{
unicode=false,          % non-Latin characters in Acrobat’s bookmarks
pdftoolbar=true,        % show Acrobat’s toolbar?
pdfmenubar=true,        % show Acrobat’s menu?
pdffitwindow=false,     % window fit to page when opened
pdfstartview={FitH},    % fits the width of the page to the window
pdftitle={Cours de math\'{e}matiques -- \niveau},    % title
pdfauthor={Sylcha},     % author
pdfsubject={Cours de maths},   % subject of the document
pdfcreator={},   % creator of the document
pdfproducer={}, % producer of the document
pdfkeywords={keyword1, key2, key3}, % list of keywords
pdfnewwindow=true,      % links in new PDF window
colorlinks=true,       % false: boxed links; true: colored links
linkcolor=CornflowerBlue,          % color of internal links (change box color with linkbordercolor)
citecolor=green,        % color of links to bibliography
filecolor=magenta,      % color of file links
urlcolor=colorTextLight           % color of external links
}
% tableaux
\RequirePackage{tabularray}%
\UseTblrLibrary{varwidth}%
% listes
\RequirePackage{enumitem}%
\setlist[1]{labelindent=\parindent}%
\setlist[enumerate,1]{%
  label   = {\textcolor{Grey}{\textbf{\arabic*. }}},%
  ref     = \arabic*%
  left    = 0pt .. \parindent,%
  labelindent = \parindent,%
  align   = left,%
  leftmargin = *}%
% \setlist[enumerate,2]{label={\textcolor{colorPrim}{\textbf{\alpha*.}}}}
\setlist[enumerate,2]{%
  label       = \textcolor{Grey}{\textbf{\alph*)} },%
  ref         = \theenumi.\emph{\alph*},%
  leftmargin  = 1em}%
\setlist[itemize]{%
  label   = \raisebox{0.2ex}{\textcolor{Grey}{\tiny \faCircle}},%
  leftmargin = 15pt%
}%
\setlist[itemize,2]{%
  label   = \raisebox{0.2ex}{\textcolor{Grey}{\tiny \faMinus}},%
  leftmargin = 15pt%
}%
% définitions, théorèmes, etc.
\RequirePackage{amsthm}%
\RequirePackage{thmtools}%
% \RequirePackage[unq]{unique}%
\RequirePackage[framemethod=TikZ]{mdframed}%
\mdfsetup{skipabove=2em,skipbelow=1em,innertopmargin=1ex,innerbottommargin=2ex}% 
\declaretheoremstyle[%
  spaceabove=\parsep,%
  spacebelow= \parsep,%
  headfont={\color{colorSec}\normalfont\scshape\bfseries},%
  headpunct={\vspace{\topsep}\newline},%
  postheadspace={0pt},%
  notebraces={\enspace  --\enspace}{},%
  notefont={\color{colorSec}\normalfont\itshape},%
  bodyfont=\normalfont,%
  mdframed={linewidth=4pt,rightline=false,topline=false,bottomline=false,linecolor=colorSec,backgroundcolor=colorSec!5}%
]{customtheostyle}% 
\declaretheoremstyle[%
  spaceabove=\parsep,%
  spacebelow= \parsep,%
  headfont={\color{colorPrim}\normalfont\scshape\bfseries},%
  headpunct={\vspace{\topsep}\newline},%
  postheadspace={0pt},%
  notebraces={\enspace  --\enspace}{},%
  notefont={\color{colorPrim}\normalfont\itshape},%
  bodyfont=\normalfont,%
  mdframed={linewidth=4pt,rightline=false,topline=false,bottomline=false,linecolor=colorPrim,backgroundcolor=colorPrim!5}
]{customdefstyle}% 
\declaretheoremstyle[%
  spaceabove=\parsep,%
  spacebelow= \parsep,%
  headfont={\color{colorTer}\normalfont\scshape\bfseries},%
  headpunct={\vspace{\topsep}\newline},%
  postheadspace={0pt},%
  notebraces={\enspace  --\enspace}{},%
  notefont={\color{colorTer}\normalfont\itshape},%
  bodyfont=\normalfont,%
  mdframed={linewidth=4pt,rightline=false,topline=false,bottomline=false,linecolor=colorTer,backgroundcolor=colorTer!5}
]{custommethstyle}%  
\declaretheoremstyle[%
  spaceabove=\parsep,%
  spacebelow= \parsep,%
  headfont={\color{colorTer}\normalfont\scshape\bfseries},%
  headpunct={\vspace{\topsep}\newline},%
  postheadspace={0pt},%
  notebraces={\enspace  --\enspace}{},%
  notefont={\color{colorTer}\normalfont\itshape},%
  bodyfont=\normalfont,%
  mdframed={linewidth=4pt,rightline=false,topline=false,bottomline=false,linecolor=colorTer,backgroundcolor=colorTer!5},%
  postheadhook=\begin{multicols}{2},%
  prefoothook=\end{multicols}%
]{custommethtwocolsstyle}%
\declaretheoremstyle[%
  spaceabove=\parsep,%
  spacebelow= 0.8\parsep,%
  headfont={\normalfont\bfseries},%
  headpunct={\vspace{\topsep}\newline},%
  postheadspace={0pt},%
  notebraces={\enspace  --\enspace}{},%
  notefont={\normalfont\itshape},%
  bodyfont=\normalfont\small,%
]{customexamplestyle}%
\declaretheorem[name=Théorème,style=customtheostyle,numberwithin=chapter]{theoreme}%
\declaretheorem[name=Théorème,style=customtheostyle,numbered=no]{theoreme*}%
\declaretheorem[name=Propriété,style=customtheostyle,numberwithin=chapter]{propriete}%
\declaretheorem[name=Propriété,style=customtheostyle,numbered=no]{propriete*}%
\declaretheorem[name=Définition,style=customdefstyle,numberwithin=chapter]{definition}% 
\declaretheorem[name=Définition,style=customdefstyle,numbered=no]{definition*}%
\declaretheorem[name=Méthode,style=custommethstyle,numberwithin=chapter]{methode}%
\declaretheorem[name=Méthode,style=custommethtwocolsstyle,numberwithin=chapter,sibling=methode]{methodetwocols}%
\declaretheorem[name=Méthode,style=custommethstyle,numbered=no]{methode*}%
\declaretheorem[name=Exemple,style=customexamplestyle,numberwithin=chapter]{exemple}% 
\declaretheorem[name=Exemple,style=customexamplestyle,numbered=no]{exemple*}%
% environnement pour les remarques
\newenvironment{remarque}{\par\vskip10pt\small % Vertical white space above the remark and smaller font size
  \begin{list}{}{
      \leftmargin=25pt % Indentation on the left
      \rightmargin=0pt}\item\ignorespaces % Indentation on the right
          \makebox[-2.5pt]{\begin{tikzpicture}[overlay]
              \node[draw=colorPrim!60,line width=1pt,circle,fill=colorPrim!25,font=\sffamily\bfseries,inner sep=2pt,outer sep=0pt] at (-15pt,0pt){\textcolor{colorPrim}{R}};\end{tikzpicture}} % Orange R in a circle
          \advance\baselineskip -1pt}{\end{list}\vskip5pt} % Tighter line spacing and white space after remark
% pas d'indentation
\setlength{\parindent}{0pt}%
% numerotaion des chapitres, sections, etc.
\RequirePackage{needspace}
\RequirePackage[explicit]{titlesec}
% \titleformat doit être appelé après la table des matière depuis le document maître
\newcommand{\FormatChaptersTitles}{\titleformat{\chapter}[block]{\fontsize{32pt}{28pt}\titlefont\color{colorPrim}}{}{0pt}{%
    \begin{tikzpicture}[remember picture,overlay,baseline]%
      \coordinate (A) at ([xshift=1in+\hoffset,yshift=-1in-\voffset]current page.north west);%
      \node[anchor=base west] at ([xshift=10pt]A) {##1};%
      \node[anchor=base east,text=colorPrim,fill=colorPrim,minimum width=1in+\hoffset+16pt,minimum height=2cm,align=right] (N) at (A) {1};%
      \node[anchor=base east,text=white,inner sep=5pt] at ([xshift=-16pt]N.base east) {\fontsize{32pt}{28pt}\titlefont \thechapter};%
    \end{tikzpicture}%
  }}
\titlespacing*{\chapter}{0pt}{*-4}{10ex}%
\newcommand{\marginsecnumber}[1]{%
  \makebox[0pt][r]{#1\hspace{16pt}}%
}%
\titleformat{\section}%
{\needspace{10\baselineskip}\normalfont\Large\bfseries}%
{\marginsecnumber\thesection}%
{0pt}%
{#1}%
\titleformat{\subsection}%
{\needspace{7\baselineskip}\normalfont\large\bfseries}%
{\marginsecnumber\thesubsection}%
{0pt}%
{#1}%
\titleformat{\subsubsection}%
{\needspace{4\baselineskip}\normalfont\normalsize\bfseries}%
{\marginsecnumber\thesubsubsection}%
{0pt}%
{#1}%
\titleformat{\paragraph}[runin]%
{\normalfont\normalsize\bfseries}%
{\marginsecnumber\theparagraph}%
{0pt}%
{#1}%
\titleformat{\subparagraph}[runin]%
{\normalfont\normalsize\bfseries}%
{\marginsecnumber\thesubparagraph}%
{0pt}%
{#1}%
\titlespacing*{\subsection}{0pt}{*3.25}{*1.5}%
% chapter number removed from numbering sections, subsection...
\renewcommand{\thesection}{\textcolor{colorPrim}{\arabic{section}}}%
\renewcommand*{\thesubsection}{\textcolor{colorPrim}{\arabic{section}.\arabic{subsection}}}%
% entêes et pieds de page
\newpagestyle{cours}[]{%
  \sethead[\footnotesize\textcolor{Silver}{\ttfamily\niveau}][][\footnotesize\textcolor{Silver}{\ttfamily\thechapter\enspace|\enspace\chaptertitle}]%
  {\footnotesize\textcolor{Silver}{\ttfamily\thechapter\enspace|\enspace\chaptertitle}}{}{\footnotesize\textcolor{Silver}{\ttfamily\niveau}}%
  \setfoot[][\small\textcolor{ Silver}{\thepage}][]%
  {}{\small\textcolor{Silver}{\thepage}}{}%
}%
\renewpagestyle{plain} {%
  \sethead*{}{}{}%
  \setfoot*{}{\small\textcolor{Silver}{\thepage}}{}%
}%
\pagestyle{cours}%
% TdM
\RequirePackage{titletoc}
\titlecontents{chapter}[0em]{\smallskip\bfseries}%\vspace{1cm}%
{}%
{\itshape\bfseries}%numberless%
{\hfill\contentspage}[\medskip]%
%
\titlecontents{section}[0em]{\smallskip}%
{\contentslabel[\thecontentslabel]{2em}}%numbered
{}%numberless
{\hfill\contentspage}[\smallskip]%
%
\titlecontents{subsection}[0.5em]{}%
{\contentslabel[\thecontentslabel]{2.5em}}%numbered
{}%numberless
{\hfill\contentspage}[\smallskip]
% icones
\RequirePackage{fontawesome5}%
% highlight text
\RequirePackage{soul}%
% touches du clavier
\RequirePackage[os=win]{menukeys}%
% fontes
% \RequirePackage{newpxtext} %
% \RequirePackage[euler-digits]{eulervm}%
% \RequirePackage{mathdesign}%
\RequirePackage[%
  % math={Noto Sans Math},%
  title={Source Sans Pro Black},%
  main={Source Sans Pro}%
]{packages/fontes}%
% % \RequirePackage{dsfont}%
% exercices
%\RequirePackage{packages/exos}%
% % pour imprimer les solutions à la fin
%\renewcommand\printsolutions{%
%  \def\currentchapter{}%
%  \def\lastchapter{}%
%  \ForEachUsedExerciseByType{%
%    \let\lastchapter\currentchapter
%    \edef\currentchapter{\ExercisePropertyGet{##1}{##2}{chapter-value}}%
%    \ifx\lastchapter\currentchapter\else%
%      \section*{Exercices du Chapitre \ExercisePropertyGet{##1}{##2}{chapter}}%
%    \fi%
%    \XSIMprint{solution}{##1}{##2}%
%  }%
%}%
%\xsimsetup{%
%  exo/within = chapter ,%
%  exo/the-counter = \thechapter.\arabic{exo}%
%}%
% pour les chemins
\newcommand{\ExoPath}{}%
% commandes utiles pour les maths
\RequirePackage[suite,nupletsep={pointvirgule}]{tdsfrmath}%
% node[cross] draw a cross
% [cross=2pt] for size, [cross, rotate=50] to rotate...
\usetikzlibrary{shapes.misc}%
\tikzset{cross/.style={%
      cross out,%
      draw=black,%
      minimum size=2*(#1-\pgflinewidth),%
      inner sep=0pt,%
      outer sep=0pt},%
  cross/.default={1pt}}%default radius will be 1pt.
% réduction des espaces entourant un environnement multicols
\setlength{\multicolsep}{6.0pt plus 2.0pt minus 2.0pt}
