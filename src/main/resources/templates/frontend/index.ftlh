<#include "common/layout.ftlh">

<#--header-->
<@header title="${blogTitle}">
    <style>
        .container {
            max-width: 960px;
        }
        .date {
            margin-right: .5em;
        }
    </style>
</@header>

<#--body-->
<@body>
    <section class="section">
        <div class="container">
            <div class="content">
                <h1 class="title">Articles</h1>
                <#if articleList?size gt 0>
                    <#list articleList as article>
                        <p>
                            <small class="date">${article.published?string("yyyy-MM-dd")}</small>
                            <a href="/article/${article.permalink}">${article.title}</a>
                        </p>
                    </#list>
                <#else>
                    <p>No articles have been published yet.</p>
                </#if>
            </div>
        </div>
    </section>
</@body>

<#--script-->
<@script></@script>
