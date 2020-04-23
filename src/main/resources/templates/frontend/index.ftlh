<#include "common/layout.ftlh">

<#--header-->
<@header title="${blogTitle}">
    <link rel="preconnect" href="//cdn.jsdelivr.net">
    <link href="//cdn.jsdelivr.net/npm/@primer/css@13.2.0/dist/primer.css" rel="stylesheet" />
    <link href="/css/hryen.css" rel="stylesheet" />
</@header>

<#--body-->
<@body>
    <main class="index">
        <h1 class="title">Articles</h1>
        <#if articleList?size gt 0>
            <ul class="article-list">
                <#list articleList as article>
                    <li class="article">
                        <span class="date">${article.published?string("yyyy-MM-dd")}</span>
                        <a target="_blank" href="/article/${article.permalink}">${article.title}</a>
                    </li>
                </#list>
            </ul>
        <#else>
            <p>No articles have been published yet.</p>
        </#if>

        <#include "common/pagination.ftlh">
    </main>
</@body>

<#--script-->
<@script>
</@script>
