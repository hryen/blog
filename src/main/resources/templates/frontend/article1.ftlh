<#include "common/layout.ftlh">

<#--header-->
<@header title="${article.title} - ${blogTitle}">
    <link rel="preconnect" href="https://cdn.jsdelivr.net">
    <link href="https://cdn.jsdelivr.net/npm/@primer/css@13.2.0/dist/primer.css" rel="stylesheet" />
    <link href="/css/hryen.css" rel="stylesheet" />
</@header>

<#--body-->
<@body>
    <article>
        <h1 class="title">${article.title}</h1>
        <span class="date">${article.published?string("MMMM dd, yyyy")}</span>
        <div class="content markdown-body">
            ${article.htmlContent?no_esc}
        </div>
    </article>
</@body>

<#--script-->
<@script>
    <script src="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.18.1/build/highlight.min.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>
</@script>
