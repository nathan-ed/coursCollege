% author : sylcha
% licence : Creative Commons Attribution-NonCommercial-ShareAlike 4.0
%           https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode
% purpose : une classe pour des tests de calcul mental
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{calculmental}[2023/10/05 v0.1]%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax%
\LoadClass[svgnames,slidetop,12pt]{beamer}%
\RequirePackage{xkeyval}%
\def\theme{Mon thème}%
\def\niveau{6}%
\define@key{calculmental.cls}{theme}[Mon thème]{%
  \def\theme{#1}%
}
\define@key{calculmental.cls}{niveau}[6]{%
  \def\niveau{#1}%
}
\ExecuteOptionsX{theme}
\ProcessOptionsX%
\RequirePackage{couleurs}
\usetheme[sectionpage=none,numbering=none,progressbar=head,block=fill]{metropolis}
\setbeamercolor{block title alerted}{fg=white, bg=colorSec}
\setbeamercolor{block body alerted}{bg=colorSec!20}
\setbeamercolor{alerted text}{fg=colorSec,bg=colorSec!20}
\setbeamercolor{block title example}{fg=white, bg=colorTer}
\setbeamercolor{block body example}{bg=colorTer!20}
\setbeamercolor{example text}{fg=colorTer,bg=colorTer!20}
\setbeamercolor{frametitle}{bg=colorPrim}
\RequirePackage[french]{babel}%
\RequirePackage{fontawesome5}
% node[cross] draw a cross
\usetikzlibrary{shapes.misc}
\tikzset{cross/.style={cross out, draw=black, minimum size=2*(#1-\pgflinewidth), inner sep=0pt, outer sep=0pt},
  %default radius will be 1pt.
  cross/.default={1pt}} %[cross=2pt] for size, [cross, rotate=50] to rotate...
%
% contenu de la page de titre
\title{\niveau\ieme{} - Calcul mental}
%\subtitle{Session 7}
\author{\theme}
\date{}
% ================================================================================
%
%                                  COMMANDES
% 
% ================================================================================
\newcounter{cm}
\newcommand{\calcm}[3]{%
  \addtocounter{cm}{1}%
  \begin{frame}
    \transduration<1->{#1}
    \frametitle{Calcul \thecm}
    Dans la case \no\thecm, écrire le résultat de\dots
    \begin{columns}[t]
      \begin{column}{6cm}
        \begin{alertblock}{Gauche}
          {#2}
        \end{alertblock}
      \end{column}
      \begin{column}{6cm}
        \begin{exampleblock}{Droite}
          {#3}
        \end{exampleblock}
      \end{column}
    \end{columns}
    \vspace{3cm}
  \end{frame}
}

\newcommand{\question}[4]{%
  \addtocounter{cm}{1}%
  \begin{frame}[c]
    \transduration<1->{#1}
    \frametitle{Calcul \thecm}
    Dans la case \no\thecm, #2\dots{}
    \begin{columns}[t]
      \begin{column}{5.5cm}
        \begin{alertblock}{Gauche}
          \begin{center}
            {#3}
          \end{center}
        \end{alertblock}
      \end{column}
      \begin{column}{5.5cm}
        \begin{exampleblock}{Droite}
          \begin{center}
            {#4}
          \end{center}
        \end{exampleblock}
      \end{column}
    \end{columns}
  \end{frame}
}

\AtBeginDocument{
  \maketitle
  \section*{Instructions}

  \begin{frame}
    \frametitle{Avant de commencer...}
    \begin{enumerate}
      \item<1-> Écrire son nom et son prénom.
      \item<2-> Cocher la case correspondant à votre place sur la table.\\
        \begin{center}
          \textbf{\alert{gauche}} ou \textbf{\textcolor{colorTer}{droite}}.
        \end{center}
      \item<3-> Faire les calculs\dots\bigskip

        \begin{columns}[t]
          \begin{column}{6cm}
            Case \textbf{\textcolor{colorSec}{rouge}} si on est à \textcolor{colorSec}{gauche}.
            \begin{alertblock}{Gauche}
              {\huge $4\times23,9$}
            \end{alertblock}
          \end{column}
          \begin{column}{6cm}
            Case \textbf{\textcolor{colorTer}{verte}} si on est à \textcolor{colorTer}{droite}.
            \begin{exampleblock}{Droite}
              {\huge $7\times12,58$}
            \end{exampleblock}
          \end{column}
        \end{columns}
    \end{enumerate}
  \end{frame}

  \begin{frame}
    \frametitle{}
    {\Huge\textbf{Attention au départ...}}
  \end{frame}
}

\AtEndDocument{
  \begin{frame}
    \frametitle{}
    \begin{center}
      {\Huge\textbf{FIN !}}
    \end{center}
  \end{frame}
}
