<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.2/css/bulma.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.8.2/css/all.min.css">
    <title>Log in to ${blogTitle}</title>
    <style>
        [v-cloak] {
            display: none;
        }
    </style>
</head>
<body>
<section id="app" class="hero is-light is-fullheight">
    <div class="hero-body">
        <div class="container" style="max-width: 350px;">
            <article class="message is-danger" :class="{ 'is-hidden': isHidden }" v-cloak>
                <div class="message-body">
                    {{ message }}
                </div>
            </article>
            <div class="card">
                <header class="card-header">
                    <p class="card-header-title">
                        Log in to Henry's Blog
                    </p>
                </header>
                <div class="card-content">
                    <form @submit.prevent="handleSubmit">
                        <div class="field">
                            <p class="control has-icons-left">
                                <input class="input" type="text" placeholder="Username" autofocus
                                       v-model.trim="username" @input="handleCheckInput">
                                <span class="icon is-small is-left">
                                        <i class="fas fa-user"></i>
                                    </span>
                            </p>
                        </div>
                        <div class="field">
                            <p class="control has-icons-left">
                                <input class="input" type="password" placeholder="Password"
                                       v-model="password" @input="handleCheckInput">
                                <span class="icon is-small is-left">
                                        <i class="fas fa-lock"></i>
                                    </span>
                            </p>
                        </div>
                        <div class="field">
                            <p class="control">
                                <button id="submitButton" class="button is-info is-fullwidth" disabled>
                                    Log in
                                </button>
                            </p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.11/dist/vue.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios@0.19.2/dist/axios.min.js"></script>
<script>
    new Vue({
        el: '#app',
        data: {
            isHidden: true,
            message: '',
            username: '',
            password: ''
        },
        methods: {
            handleCheckInput: function () {
                if(this.username !== '' && this.password !== '') {
                    document.getElementById('submitButton').disabled = false;
                    return true;
                } else {
                    document.getElementById('submitButton').disabled = true;
                    return false;
                }
            },
            handleSubmit: function () {
                this.isHidden = true;
                let check = this.handleCheckInput();
                if(check) {
                    let _this = this;
                    axios.post('/admin/login', {
                        username: _this.username,
                        password: _this.password
                    }).then(function (response) {
                        if(response.status === 200 && response.data.code === 0) {
                            window.location.href = '/admin/article/list';
                        } else {
                            _this.message = response.data.msg;
                            _this.isHidden = false;
                        }
                    }).catch(function (error) {
                        _this.message = error;
                        _this.isHidden = false;
                    });
                }
            }
        }
    });
</script>
</body>
</html>
