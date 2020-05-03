<#include "header.ftlh">
<#macro body>
    <body>
        <section id="app" class="section" v-cloak>
            <#include "breadcrumb.ftlh">
            <#nested>
        </section>
        </#macro>
        <#macro footer>
        <script src="https://cdn.jsdelivr.net/npm/vue@2.6.11/dist/vue.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios@0.19.2/dist/axios.min.js"></script>
        <#nested>
    </body>
</html>
</#macro>