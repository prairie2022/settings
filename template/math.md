---
title: "title"
author: "卓育安"
date: "date"
lang: "en"
encoding: "utf-8"
---

<style>
    :root {
        --thm-name: "";
        --thm-head-end: ".";
    }
    :is(.proof, .thm, .rem) {
        position: relative;
        margin-top: 12px;
        margin-bottom: 12px;
        padding: 12px;
    }
    :is(.proof, details.proof summary, .thm, details.thm summary, .rem, details.rem summary)[data-name]{
        --thm-name: attr(data-name);
    }
    .proof {
        --thm-name: "Proof";
        outline: 3px dotted;
    }
    .thm {
        --thm-name: "Theorem";
        outline: 3px solid;
    }
    .rem {
        --thm-name: "Remark";
        outline: 1px solid;
    }
    .proof::after {
        content: "\25A1"; /* QED */
        position: absolute;
        bottom: 12px;
        right: 12px;
    }
    :is(div.proof, details.proof summary)::before {
        content: var(--thm-name) var(--thm-head-end);
        display: inline-block;
        font-style: italic;
        padding-right: 8px;
    }
    :is(div.thm, details.thm summary)::before {
        content: var(--thm-name) var(--thm-head-end);
        display: inline-block;
        font-weight: bold;
        padding-right: 8px;
    }
    :is(div.rem, details.rem summary)::before {
        content: var(--thm-name) var(--thm-head-end);
        display: inline-block;
        text-decoration: underline;
        padding-right: 8px;
    }
</style>

<span hidden> 
$$
\global\def\OP#1{\operatorname{#1}}
\global\def\N{\mathbb N}
\global\def\Z{\mathbb Z}
\global\def\Q{\mathbb Q}
\global\def\R{\mathbb R}
\global\def\C{\mathbb C}
\global\def\eps{\varepsilon}
\global\newcommand{\maps}[4]{\begin{aligned}
    #1 &\xrightarrow{\quad} #2\\
    #3 &\xmapsto{\quad} #4
\end{aligned}\;}
\global\def\abs#1{\lvert #1 \rvert}
\global\def\ags#1{\langle #1 \rangle}
\global\def\norm#1{\lVert #1 \rVert}
\global\def\set#1{\left\lbrace #1 \right\rbrace}
\global\def\d{\mathop{}\!\mathrm d}
$$</span>

