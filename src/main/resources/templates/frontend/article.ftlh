<#include "common/layout.ftlh">

<#--header-->
<@header title="${article.title} - ${blogTitle}">
</@header>

<#--body-->
<@body>
    <section class="hero">
        <div class="hero-body">
            <div id="article" class="container">
                <div class="content">
                    <h1>${article.title}</h1>
                    <p>${article.published?string("MMMM dd, yyyy")}</p>
                    ${article.htmlContent?no_esc}
                </div>
            </div>
        </div>
    </section>
</@body>

<#--script-->
<@script>
    <script src="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.18.1/build/highlight.min.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>
</@script>