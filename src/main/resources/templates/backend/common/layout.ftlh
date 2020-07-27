<#include "header.ftlh">
<#macro body breadcrumb>
    <body>
        <section id="app" class="section" v-cloak>
            <#if breadcrumb>
                <#include "breadcrumb.ftlh">
            </#if>
            <#nested>
        </section>
        </#macro>
        <#macro footer>
        <script src="/js/vue.min.js"></script>
        <script src="/js/axios.min.js"></script>
        <#nested>
    </body>
</html>
</#macro>