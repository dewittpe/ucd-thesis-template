%%
%% The `ucdenver-dissertation.cls' is used for formatting a PhD thesis 
%% for the Department of Biostatistics & Informatics,
%% University of Colorado Denver.
%% It may be applicable to other students in the Graduate School
%% on Anschutz Medical Campus, but please check the
%% Graduate School rules prior to using.
%%
%% Author: Sarah Kreidler
%%         Peter DeWitt
%%
%%
%% Package 'ucdenver-dissertation' to use with LaTeX2e 
%% License: GPL-2
%% Copyright: (C) University of Colorado Denver
%% Author: Sarah Kreidler
%% Please report errors to sarah.kreidler@ucdenver.edu, and/or
%% peter.dewitt@ucdenver.edu
%%
%% Change log
%% 13 Apr 2014 - added vspace*{\fill} to the listofigures to center vertically
%% 26 Jan 2016 - commented out the vspace*{\fill} from listtofigures
\def\fileversion{1.0}
\def\filename{ucdenver-dissertation}
\def\filedate{2012/09/24}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ucdenver-dissertation}[\filedate\space\fileversion\space UCD Dissertation dissertation Class by Sarah Kreidler]
\ProcessOptions

%% load report defaults
\LoadClass[10pt]{report}

%% required packages
\RequirePackage[left=1in,top=1in,right=1in,bottom=1in,bindingoffset=0.25in]{geometry}
\RequirePackage[font=singlespacing]{caption}
\RequirePackage[raggedright]{titlesec}

\RequirePackage{setspace,savesym,amsmath,amsthm,amsfonts,graphicx,color,hyperref,extramarks,lastpage,chngpage}

\RequirePackage[T1]{fontenc}
\RequirePackage{fancyhdr}
\RequirePackage{framed}
\RequirePackage{appendix}
 

%%
%% The following preamble elements are required to properly create
%% the title page
%%
%% definitions from calling document
\newcommand{\authorLast}[1]{\def\@authorLast{#1}}
\newcommand{\authorFirst}[1]{\def\@authorFirst{#1}}
\newcommand{\authorMiddle}[1]{\def\@authorMiddle{#1}}
\newcommand{\education}[1]{\def\@education{#1}}
\newcommand{\school}[1]{\def\@school{#1}}
\newcommand{\program}[1]{\def\@program{#1}}
\newcommand{\advisor}[1]{\def\@advisor{#1}}
\newcommand{\advisorTitle}[1]{\def\@advisorTitle{#1}}
\newcommand{\coadvisor}[1]{\def\@coadvisor{#1}}
\newcommand{\coadvisorTitle}[1]{\def\@coadvisorTitle{#1}}
\newcommand{\committeeChair}[1]{\def\@committeeChair{#1}}
\newcommand{\committeeMembers}[1]{\def\@committeeMembers{#1}}
\newcommand{\submitDate}[1]{\def\@submitDate{#1}}
\newcommand{\acknowledgements}[1]{\def\@acknowledgements{#1}}
\newcommand{\dedication}[1]{\def\@dedication{#1}}
\newcommand{\preface}[1]{\def\@preface{#1}}


%% numbering for theorems
\newcounter{theorem}
\newcounter{lemma}

%% set margins
\geometry{verbose,tmargin=1in,bmargin=1in,lmargin=1in,rmargin=1in}

\pagestyle{fancy} %
\fancyhf{} %
\cfoot{\thepage}                  %
\renewcommand{\headrulewidth}{0pt} %

%% setup the document
\AtBeginDocument{
\pagenumbering{roman}
  \begin{titlepage}
  \maketitle
  \end{titlepage}
  \addtocounter{page}{1}
  \makecommitteepage
  \makeprefacepage
  \makededicationpage
  \makeacknowledgementspage
  \newpage
  \tableofcontents
  \newpage
  \listoftables
  \newpage
  \listoffigures
  \newpage
  \pagenumbering{arabic}
  \setcounter{page}{1}

}


%% Format the title page
\renewcommand{\maketitle}{
\vspace{1in}
\doublespacing
\begin{center}
  {\MakeUppercase{\@title}} \\
  by \\
  \MakeUppercase{\@authorFirst{}\ \@authorMiddle{}\ \@authorLast{}} \\
  \@education \\[3in] 
  A thesis submitted to the \\
  Faculty of the Graduate School of the \\
  University of Colorado in partial fulfillment \\
  of the requirements for the degree of \\
  Doctor of Philosophy \\
  \@program\ Program \\
  \@date \\
\end{center} 
\vspace*{\fill}
  
}

%% formatting committee page
\newcommand{\makecommitteepage}{
  \newpage
  \vspace*{\fill}
  \begin{center}
    \doublespacing
    This thesis for the Doctor of Philosophy degree by \\
    \@authorFirst\ \@authorMiddle\ \@authorLast \\
    has been approved for the \\
    \@program\ Program \\
    by \\[3in]
    \@committeeChair, Chair \\
    \@advisor, Co-Advisor \\
    \@coadvisor, Co-Advisor \\
    \@committeeMembers \\[1in]
  \end{center}
  \begin{flushright}
    Date \underline{\@submitDate}
  \end{flushright}
  \vspace*{\fill}
}

%% formatting committee page
\newcommand{\makeprefacepage}{
  \newpage
  \begin{flushleft} 
  \@authorLast{}, \@authorFirst{} \@authorMiddle{} (Ph.D., \@program) \\
  { \doublespacing \@title \par Thesis directed by \@advisorTitle{} \@advisor\ and \@coadvisorTitle \@coadvisor \par }
  \end{flushleft}
  \medskip
  \begin{center}
  {\bf ABSTRACT}\\
  \end{center} 
  \hskip \parindent
  {\doublespacing \@preface \par }
  \vfill
  \begin{flushright}
  The form and content of this abstract are approved. We recommend its publication.
  \end{flushright}
  \begin{flushright}
  \hfill Approved: \@advisor\ and \@coadvisor
  \end{flushright}
}

%% formatting committee page
\newcommand{\makeacknowledgementspage}{
\ifdefined\@acknowledgements
  \newpage
  \begin{center}
  {\bf ACKNOWLEDGEMENTS} \\
  \end{center}
  \hskip \parindent { \doublespacing \@acknowledgements }
\fi
}

%% formatting dedication page
\newcommand{\makededicationpage}{
\ifdefined\@dedication
  \newpage
  \vspace*{\fill}
  %\hskip \parindent \@dedication \\  % For a dedication of one or more sentences
  \begin{center} \@dedication \end{center}          % for a dedication less than one sentence
  \vspace*{\fill}
\fi
}


%% Theorems, lemmas, and proofs

%% theorems
%\newenvironment{theorem}{%
%    \setcounter{lemma}{1}%
%    \refstepcounter{theorem}
%    \medskip
%    \noindent{\emph{Theorem \thetheorem}.}%
%}{}
%\renewcommand*\thetheorem{\thesection.\arabic{theorem}}

%\newenvironment{problem}{\begin{framed}\begin{bfseries}}{\end{bfseries}\end{framed}\vspace{11pt}}

%% Proofs
%\newenvironment{proof}{%
%    \medskip
%    \noindent\emph{Proof}\vspace{\z@}
%}

%% colors
%\definecolor{Red}{rgb}{0.5,0,0}
%\definecolor{Blue}{rgb}{0,0,0.5}

%% hyperlink formatting
\hypersetup{%
    hyperindex = {true},
    colorlinks = {true},
    linktocpage = {true},
    plainpages = {false},
    linkcolor = {blue},
    citecolor = {blue},
    urlcolor = {blue},
    pdfstartview = {Fit},
    pdfpagemode = {UseOutlines},
    pdfview = {XYZ null null null}
}
\urlstyle{same}

%% table of contents 
\renewcommand{\@tocrmarg}{2.55em plus1fil}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@tocrmarg
      \parfillskip -\rightskip
      \leavevmode 
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak
      \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill%
      \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}


\renewcommand*\l@section{\vspace{12pt}\@dottedtocline{1}{1.5em}{2.3em}}
\renewcommand*\l@subsection{\vspace{12pt}\@dottedtocline{2}{3.0em}{3.2em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}



\newcommand{\ucdtocchapterlabel}{CHAPTER}
\newcommand{\ucdtocheader}[1]{\newpage%
  \pdfbookmark[0]{\contentsname}{Table of Contents}
  {\begin{center}#1\end{center}
  \ucdtocchapterlabel
  }%

}
\renewcommand\contentsname{TABLE OF CONTENTS}
\renewcommand\tableofcontents{%
    %%\setcounter{page}{\value{fmpage}}%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \singlespacing
    \ucdtocheader{\textbf{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \doublespacing
    \if@restonecol\twocolumn\fi
}

%% custom list of tables
\newcommand{\ucdlisttableheader}[1]{\newpage%
  \pdfbookmark[0]{\listtablename}{LIST OF TABLES}
  {\begin{center}#1\end{center}
  TABLE
  }%
}
\renewcommand\listtablename{LIST OF TABLES}
\renewcommand*\l@table{\vspace{12pt}\@dottedtocline{1}{0em}{2.3em}}
\renewcommand\listoftables{%
    \singlespacing
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \ucdlisttableheader{\textbf{\MakeUppercase\listtablename}}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    \doublespacing
    }
    
%% custom list of figures
\renewcommand\listfigurename{LIST OF FIGURES}
\newcommand{\ucdlistfigureheader}[1]{\newpage%
  \pdfbookmark[0]{\listfigurename}{LIST OF FIGURES}
%\vspace*{\fill}
  {\begin{center}#1\end{center}
  FIGURE
  }%
}
\renewcommand*\l@figure{\vspace{12pt}\@dottedtocline{1}{0em}{2.3em}}
\renewcommand\listoffigures{%
    \singlespacing
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \ucdlistfigureheader{\textbf{\MakeUppercase\listfigurename}}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
%\vspace*{\fill}
    \doublespacing
    }
    
%% we override the abstract command to avoid a new page
\renewenvironment{abstract}{%
    \small
    \begin{center}%
      {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
    \end{center}%
    \quotation
}

%% appendix
\newcommand\ucdappendix{%
    \appendix
    \addtocontents{toc}{\vspace{12pt}\noindent APPENDIX \par}
}

%% footnote size
\let\footnotesize\normalsize
\renewcommand\footnoterule{%
  \vspace{12pt}
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
  
\usepackage{chngcntr}
\counterwithout{footnote}{chapter}

  
%% sections, subsections, and subsubsections
\newlength{\preXLskip}
\newlength{\preLskip}
\newlength{\preMskip}
\newlength{\preSskip}
\newlength{\postMskip}
\newlength{\postSskip}
\setlength{\preXLskip}{1.8\baselineskip plus 0.5ex minus 0ex}
\setlength{\preLskip}{1.5\baselineskip plus 0.3ex minus 0ex}
\setlength{\preMskip}{1\baselineskip plus 0.2ex minus 0ex}
\setlength{\preSskip}{.8\baselineskip plus 0.2ex minus 0ex}
\setlength{\postMskip}{.5\baselineskip plus 0ex minus 0.1ex}
\setlength{\postSskip}{.3\baselineskip plus 0ex minus 0.1ex}

\newcounter {chapternn}
\renewcommand \thechapternn {\@arabic\c@chapternn}
% chapter
\renewcommand \thechapter {\@Roman\c@chapter}
\newcommand{\ucdchapter}[2][default]{
  \newpage%
  \refstepcounter{chapter}%
  \addcontentsline{toc}{chapter}{\hspace{2em} \thechapter.\space #1}
  {\begin{center}\textbf{\MakeUppercase\@chapapp\ \thechapter \\ #2}\end{center}} \nopagebreak
  \vskip \postSskip \nopagebreak
  }
\newcommand{\ucdchapternn}[1]{\newpage%
  \refstepcounter{chapternn}% -- required to make pdf bookmarks work
  \addcontentsline{toc}{chapter}{#1}
  {\begin{center}\textbf{#1}\end{center}} \nopagebreak
  \vskip \postSskip \nopagebreak
}


% part
\newcommand{\ucdpart}[2][default]{
  \newpage%
  \refstepcounter{part}%
  \addcontentsline{toc}{part}{Part \thepart\space #1}
  {\@afterindentfalse\@afterheading\singlespacing\textbf{\Huge Part \thepart\space #2}} \nopagebreak
  \vskip \postMskip \nopagebreak
  }
\newcommand{\ucdpartnn}[1]{\newpage%
  \addcontentsline{toc}{part}{#1}
  {\@afterindentfalse\@afterheading\singlespacing\textbf{\Huge #1}} \nopagebreak
  \vskip \postMskip \nopagebreak}

% section
\newcommand{\ucdsec}[2][default]{%
  \refstepcounter{section}%
  \addcontentsline{toc}{section}{\hspace{3em}\thesection\space #1}
  {\@afterindentfalse\@afterheading\singlespacing\centerline{\textbf{\thesection\space #2}}} \nopagebreak
  \vskip \postSskip \nopagebreak
  }
\newcommand{\ucdsecnn}[1]{%
  {\@afterindentfalse\@afterheading\singlespacing\textbf{#1}} \nopagebreak
  \vskip \postSskip \nopagebreak}

% subsection
\newcommand{\ucdsubsec}[2][default]{%
  \refstepcounter{subsection}%
  \addcontentsline{toc}{subsection}{\hspace{5em}\thesubsection\space #1}
  {\@afterindentfalse\@afterheading\singlespacing\textbf{\thesubsection\space #2}} \nopagebreak
  \vskip \postSskip \nopagebreak}
\newcommand{\ucdsubsecnn}[1]{%
  {\@afterindentfalse\@afterheading\singlespacing\textbf{#1}} \nopagebreak
  \vskip \postSskip \nopagebreak}

% subsubsection
\newcommand{\ucdsubsubsec}[2][default]{%
  \refstepcounter{subsubsection}%
  \addcontentsline{toc}{subsubsection}{\thesubsubsection\space #1}
  {\@afterindentfalse\@afterheading\singlespacing\normalsize\textbf{\thesubsubsection\space #2}} \nopagebreak
  \vskip \postSskip \nopagebreak}
\newcommand{\ucdsubsubsecnn}[1]{%
  {\@afterindentfalse\@afterheading\singlespacing{\normalsize\textbf #1}} \nopagebreak
  \vskip \postSskip \nopagebreak}
  
\renewcommand{\chapter}{\secdef \ucdchapter \ucdchapternn}
\renewcommand{\part}{\secdef \ucdpart \ucdpartnn}
\renewcommand{\section}{\secdef \ucdsec \ucdsecnn}
\renewcommand{\subsection}{\secdef \ucdsubsec \ucdsubsecnn}
\renewcommand{\subsubsection}{\secdef \ucdsubsubsec \ucdsubsubsecnn}


%%
%% End of file `ucdenver-dissertation.cls'.
