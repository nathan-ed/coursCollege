% author : sylcha
% licence : Creative Commons Attribution-NonCommercial-ShareAlike 4.0
%           https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode
% purpose : une classe pour fabriquer des cartes mentales de cours
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{cartementale}[2023/08/01 v0.1]%
\DeclareOption{onecolumn}{\OptionNotUsed}%
\newcommand{\InnerMarginWidth}{15mm}%
\DeclareOption{large}{\renewcommand{\InnerMarginWidth}{30mm}}%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}%
\ProcessOptions\relax%
\LoadClass[a4paper,10pt,svgnames,twoside]{article}%
\RequirePackage{boites}%
% gestion des marges dans la page
\RequirePackage[a4paper,nohead,vmargin=1cm,inner=\InnerMarginWidth,outer=15mm]{geometry}%
% tableaux
\RequirePackage{tabularray}%
\UseTblrLibrary{varwidth}%
% listes
\RequirePackage{enumitem}%
\setlist[1]{labelindent=\parindent}%
\setlist[enumerate,1]{%
    label   = {\textcolor{colorPrim}{\textbf{\arabic*.}}},%
    ref     = \arabic*}%
% \setlist[enumerate,2]{label={\textcolor{colorPrim}{\textbf{\alpha*.}}}}
\setlist[enumerate,2]{%
    label       = \textcolor{colorPrim}{\textbf{\alph*}.},%
    ref         = \theenumi.\emph{\alph*},%
    leftmargin  = 1.5em}%
\setlist[itemize]{%
    label   = \raisebox{0.2ex}{\textcolor{colorPrim}{\tiny \faCircle}}%
}%
% pas d'indentation
\setlength{\parindent}{0pt}%
% icones
\RequirePackage{fontawesome5}%
% highlight text
\RequirePackage{soul}%
% touches du clavier
\RequirePackage[os=win]{menukeys}
%%
%% Links
%%
\RequirePackage{hyperref}
\hypersetup{
    bookmarks=true,         % show bookmarks bar?
    unicode=false,          % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitH},    % fits the width of the page to the window
    pdftitle={Cours de math\'{e}matiques -- 3e},    % title
    pdfauthor={Sylcha},     % author
    pdfsubject={Cours de maths},   % subject of the document
    pdfcreator={},   % creator of the document
    pdfproducer={}, % producer of the document
    pdfkeywords={keyword1, key2, key3}, % list of keywords
    pdfnewwindow=true,      % links in new PDF window
    colorlinks=true,       % false: boxed links; true: colored links
    linkcolor=gray25,          % color of internal links (change box color with linkbordercolor)
    citecolor=green,        % color of links to bibliography
    filecolor=magenta,      % color of file links
    urlcolor=colorTextLight           % color of external links
}
% style tikz
\RequirePackage{calc}
\newlength{\thirdofpageheight}
\setlength{\thirdofpageheight}{(0.28\paperheight)}
\usetikzlibrary {shapes.symbols}
\usetikzlibrary {matrix,fit,calc}
\tikzset{%
  theme/.style={%
    rectangle, rounded corners, inner sep=20pt,fill=#1!10,%
    font=\huge\bfseries%
  },%
  theme/.default=colorPrim,%
  question/.style n args={3}{%
    rectangle, rounded corners, fill=#1!10,%
    draw=#1, thick,%
    inner sep=8pt, text width=\linewidth,%
    append after command={\pgfextra{\let\mainnode=\tikzlastnode}%
        node[anchor=south west, font=\Large\bfseries, text=#1!50] at (\mainnode.north west) {\tikz[baseline]{\node[font=\Large, text=#1, anchor=base] {#3};}#2}%
        %
    }%
  },%
  question/.default={colorPrim}{Où ?}{\faHeart},%
  fleche/.style={%
    draw, thick, -latex',shorten >=5pt
  }
}

% node[cross] draw a cross
\usetikzlibrary{shapes.misc}
\tikzset{cross/.style={cross out, draw=black, minimum size=2*(#1-\pgflinewidth), inner sep=0pt, outer sep=0pt},
%default radius will be 1pt.
cross/.default={1pt}} %[cross=2pt] for size, [cross, rotate=50] to rotate...
% contenu des cases
\NewDocumentCommand{\Quoi}{}{Texte du quoi}
\NewDocumentCommand{\Pourquoi}{}{Texte du pourquoi}
\NewDocumentCommand{\Quand}{}{Texte du quand}
\NewDocumentCommand{\Comment}{}{Texte du comment}
\NewDocumentCommand{\Vocabulaire}{}{Texte vocabulaire}
% commande pour afficher les cases sur une matrice 3x3
% (voir modèle `modele_carte` pour un autre affichage plus flexible)
% \NewDocumentCommand{\CarteMentale}{ m }{%
%   \begin{tikzpicture}[remember picture, overlay,%
%     % column 1/.style={anchor=base west},%
%     % column 2/.style={anchor=base east},%
%     % column 3/.style={anchor=base}%
%   ]%
%   % CASES
%   \matrix[column sep=10mm,row sep=10mm,ampersand replacement=\&]  at (current page.center) {%
%     \node[question={colorTer}{Comment ?}{\faCogs}] (comment) {\Comment};%
%     \&
%     \node[question={colorTer}{Vocabulaire}{\faHeart}] (vocabulaire) {\Vocabulaire};%%
%     \& 
%     \node[question={colorTer}{Quoi ?}{\faQuestionCircle}] (quoi) {\Quoi};
%     \\%
%     \& 
%     \node[theme] (theme) {#1};%
%     \& 
%     \node[question={colorTer}{Quand ?}{\faHourglassHalf}] (quand) {\Quand};
%     \\%
%     \&%
%     \& 
%     \node[question={colorTer}{Pourquoi ?}{\faBook}] (pourquoi) {\Pourquoi};
%     \\%
%   };%
%   % FLÈCHES
%   \begin{scope}[every path/.style=fleche]%
%     \path (theme) to[out=90,in=-90] (vocabulaire);%
%     \path ([xshift=-6mm]theme.north east) to[out=90,in=225] (quoi.south west);%
%     \path (theme) to[out=0,in=180] (quand);%
%     \path (theme) to[out=-90,in=180] (pourquoi);%
%     \path ([xshift=6mm]theme.north west) to[out=90,in=-45] (comment.south east);%
%   \end{scope}%
%   \end{tikzpicture}%
% }
\NewDocumentCommand{\CarteMentale}{ o }{%
  \begin{tikzpicture}[every outer matrix/.style={minimum width=\linewidth}]
    \matrix[row sep=5mm] {
      \IfNoValueTF{#1}{\node[question={Crimson}{Vocabulaire}{\faHeart}] (vocabulaire) {\Vocabulaire};\\}{}%
      \node[question={LimeGreen}{Quoi ?}{\faQuestionCircle}] (quoi) {\Quoi};\\%
      \node[question={MediumSlateBlue}{Comment ?}{\faCogs}] (comment) {\Comment};\\%
      \node[question={Orange}{Quand ?}{\faHourglassHalf}] (quand) {\Quand};\\%
      \node[question={Fuchsia}{Pourquoi ?}{\faBook}] (pourquoi) {\Pourquoi};\\%
    };
  \end{tikzpicture}
}