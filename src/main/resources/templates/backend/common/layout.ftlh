<#include "header.ftlh">
<#macro body>
    <body>
        <section id="app" class="section">
            <#include "breadcrumb.ftlh">
            <#nested>
        </section>
        </#macro>
        <#macro footer>
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <#nested>
    </body>
</html>
</#macro>