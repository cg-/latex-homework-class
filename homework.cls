\NeedsTeXFormat{LaTeX2e}
\LoadClassWithOptions{article}
\ProvidesClass{homework}[2014/12/16 Class file for homework assignments]

% ----- Packages --------------------------------------------------------------

% Better fonts with accents
\RequirePackage[T1]{fontenc}

% Required for starred commands
\RequirePackage{suffix}

% Math symbols
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{centernot}

% Nice lists
\RequirePackage{enumerate}
\RequirePackage{enumitem}

% Nice images, figures, and listings
\RequirePackage{graphicx}
\RequirePackage[all]{xy}
\RequirePackage{wrapfig}
\RequirePackage{fancyvrb}
\RequirePackage{listings}

% Header & Page Setup
\RequirePackage{fancyhdr}
\RequirePackage{fullpage}

% Links
\RequirePackage{hyperref}

% ----- Questions -------------------------------------------------------------
\newcounter{questionCounter}
\newcounter{partCounter}[questionCounter]

% Prefix for questions
\newcommand{\questiontype}[0]{Question}

% Use this if your "written" questions are all under one section
% For example, if the homework handout has Section 5: Written Questions
% and all questions are 5.1, 5.2, 5.3, etc. set this to 5
% Use for 0 no prefix. Redefine as needed per-question.
\newcommand{\writtensection}[0]{0}

% Numbered question
\providecommand{\question}{}
\renewcommand{\question}[0]{%
  % Wrap in minipage so that we don't get a line break enywhere in between
  \begin{minipage}{\linewidth}%
    \stepcounter{questionCounter}%
      \vspace{.2in}%
      \ifx\writtensection\undefined{}
        \noindent{\bf \questiontype\ \arabic{questionCounter}.}%
        \else
          \if\writtensection0
          \noindent{\bf \questiontype\ \arabic{questionCounter}.}%
          \else
          \noindent{\bf \questiontype\ \writtensection.\arabic{questionCounter}}%
        \fi
      \vspace{0.3em} \hrule \vspace{.1in}%
  \end{minipage}
}

% Named question, takes one argument
\WithSuffix\providecommand\question*{}
\WithSuffix\renewcommand\question*[1]{%
  % Wrap in minipage so that we don't get a line break enywhere in between
  \begin{minipage}{\linewidth}%
    \addtocounter{questionCounter}{1}%
    \setcounter{partCounter}{0}%
    \vspace{.2in}%
      \noindent{\bf #1}%
    \vspace{0.3em} \hrule \vspace{.1in}%
  \end{minipage}
}

% Override normal section defintions
\renewcommand{\section}[0]{\question}
\WithSuffix\newcommand\section*[1]{\question*{#1}}

% ----- Question Parts --------------------------------------------------------

\newenvironment{alphaparts}[0]{%
  \begin{enumerate}[label=\textbf{(\alph*)}]%
}{\end{enumerate}}

\newenvironment{arabicparts}[0]{%
  \begin{enumerate}[label=\textbf{\arabic{questionCounter}.\arabic*})]%
}{\end{enumerate}}

\newcommand{\questionpart}[0]{\item}

% ----- Induction Environment -------------------------------------------------

\newenvironment{induction}[0]{%
  \begin{description}
}{\end{description}}

\newcommand{\basecase}{\item[Base Case]\mbox{}\\}
\newcommand{\indhyp}{\item[Induction Hypothesis]\mbox{}\\}
\newcommand{\indstep}{\item[Induction Step]\mbox{}\\}

% ----- Answer Box ------------------------------------------------------------

\newcommand{\answerbox}[1]{%
\begin{framed}
\vspace{#1}
\end{framed}}

% ----- Page Setup ------------------------------------------------------------

% Use block style paragraphs
\setlength{\parindent}{0pt}
\setlength{\parskip}{5pt plus 1pt}

\def\indented#1{\list{}{}\item[]}
\let\indented=\endlist

% ----- Title & Header --------------------------------------------------------
\pagestyle{empty}
\pagestyle{fancy}

\newcommand{\makeheader}[0]{%
}
\renewcommand{\maketitle}[0]{%
  % Setup header
  \setlength{\headheight}{15.2pt}
  \lhead{\hwclass{} \hwlecture\hwsection}%
  \chead{\hwname{} (\hwemail)}%
  \rhead{\hwtype{} \hwnum}%

  % Setup hrule in header
  \renewcommand{\headrulewidth}{0pt}
  \headrule{}

  % Don't put header on first page
  \thispagestyle{plain}

  \begin{center}
    {\Large \hwclass{} \hwtype{} \hwnum}

    \hwname{} (\hwemail)

    \today
  \end{center}
  \renewcommand{\headrulewidth}{0.4pt}
}

% -----------------------------------------------------------------------------