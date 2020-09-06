<#include "common/layout.ftlh">

<#--header-->
<@header title="${article.title} - ${blogTitle}">
    <style>
        #article {
            max-width: 960px;
        }
    </style>
    <link rel="stylesheet" href="/css/tomorrow.min.css">
</@header>

<#--body-->
<@body>
    <section class="hero">
        <div class="hero-body">
            <div id="article" class="container">
                <div class="content">
                    <h1>${article.title}</h1>
                    <p><small>${article.published?string("MMMM dd, yyyy")}</small></p>
                    ${article.htmlContent?no_esc}
                </div>
            </div>
        </div>
    </section>
</@body>

<#--script-->
<@script>
    <script src="/js/highlight.min.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>
</@script>