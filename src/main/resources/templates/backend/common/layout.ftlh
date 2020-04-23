<#include "header.ftlh">

<#macro app>
    <body>
        <div id="app">
            <#include "left-sider.ftlh">
            <#nested>
        </div>
        </#macro>

        <#macro footer>
        <script src="https://cdn.jsdelivr.net/gh/vuejs/vue@2.6.11/dist/vue.min.js"></script>
        <script src="https://cdn.jsdelivr.net/gh/axios/axios@0.19.2/dist/axios.min.js"></script>
        <#nested>
    </body>
</html>
</#macro>
