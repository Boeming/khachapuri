let val = []
let x = 1
let y = 1
let inputs = document.querySelectorAll('.input__file');
let countFiles1 = 0;

document.addEventListener('click', e => {
    const element = document.getElementById('accChange')
    const elementE = e.composedPath().includes(element)

    const element1 = document.getElementById('accSave')
    const element1E = e.composedPath().includes(element1)

    const element2 = document.getElementById('accCancel')
    const element2E = e.composedPath().includes(element2)

    const element3 = document.getElementById('addRecipe')
    const element3E = e.composedPath().includes(element3)

    const ChangeInp = document.querySelectorAll('.wrapper .input-group input');

    if (element3E) {


        Array.prototype.forEach.call(inputs, function (input) {

            input.addEventListener('change', function (e) {

                if (this.files && this.files.length == 0) countFiles1 = 0

                if (this.files && this.files.length != 0) countFiles1 = 1


                if (countFiles1 == 0)
                    document.querySelector('.wrapper div[class="alerts"]').style.display = "block"

                if (countFiles1 != 0)
                    document.querySelector('.wrapper div[class="alerts"]').style.display = "none"
            });

            if (countFiles1 == 0)
                document.querySelector('.wrapper div[class="alerts"]').style.display = "block"
        });

    }

    for (let i = 0; i < ChangeInp.length; i++) { // выведет 0, затем 1, затем 2
        val.push(ChangeInp[i].value)
    }


    if (elementE) {
        for (let i = 0; i < ChangeInp.length; i++) { // выведет 0, затем 1, затем 2
            ChangeInp[i].removeAttribute("disabled");
            ChangeInp[i].style.backgroundColor = "rgb(252,231,140)"
        }

        document.getElementById('accChange').style.display = "none"
        document.getElementById('accSave').style.display = "block"
        document.getElementById('accCancel').style.display = "block"
    }

    else if (element1E) {
        for (let i = 0; i < ChangeInp.length; i++) { // выведет 0, затем 1, затем 2
            ChangeInp[i].setAttribute("disabled", "true");
            ChangeInp[i].style.backgroundColor = "black"
        }

        val = []

        for (let j = 0; j < ChangeInp.length; j++) { // выведет 0, затем 1, затем 2
            val.push(ChangeInp[j].value)
        }

        document.getElementById('accChange').style.display = "inline"
        document.getElementById('accSave').style.display = "none"
        document.getElementById('accCancel').style.display = "none"
    }

    else if (element2E) {


        for (let j = 0; j < ChangeInp.length; j++) { // выведет 0, затем 1, затем 2
            ChangeInp[j].value = val[j]
        }

        for (let i = 0; i < ChangeInp.length; i++) { // выведет 0, затем 1, затем 2
            ChangeInp[i].setAttribute("disabled", "true");
            ChangeInp[i].style.backgroundColor = "black"
        }

        document.getElementById('accChange').style.display = "inline"
        document.getElementById('accSave').style.display = "none"
        document.getElementById('accCancel').style.display = "none"
    }
})

let steps = []
let products = []

function addInput() {
    if (x < 10) {
        let str = '<div class="input-group" style="width: 100%;"><p style="width: 20%; padding-top: 5px;">Продукт:</p><input id ="product' + (x + 1) + '" name="product" style="width: 40%; border-radius: .375rem; height: 5vh;"  type="text" class="form-control"><p style="width: 20%; padding-top: 5px;">Количество:</p><input id ="product' + (x + 1) + 'quantity" name="count" style="width: 20%; border-radius: .375rem; height: 5vh;"  type="text" class="form-control"></div><div id="input' + (x + 1) + '"></div>'
        document.getElementById('input' + x).innerHTML = str;
        products.push(document.getElementById('input' + x))
        x++;
    }
    else {
        alert('Нельзя добавить больше ингридиентов!');
    }
}

function removeInput() {
    if (products.length > 0) {
        let poped = products.length
        products.pop()
        x = x - 1
        document.getElementById('input' + poped).innerHTML = "";
    }
}

function addInputSteps() {
    if (y < 15) {
        let str = '<div class="row" style="border: 2px solid rgb(252,231,140); border-radius: 50px; padding: 10px 0 30px 0; margin-bottom: 50px;">' +
            '<h3>Шаг ' + (y + 1) + '</h3>' +
            '<hr>' +
            '<div class="file2 col-5" style="padding: 5px 0 0 0;">' +
            '<p style="width: 20%; margin: 0 0 15px 70px;">Фото:</p>' +
            '<div class="input__wrapper" style="margin-left: 5%; margin-bottom: 0;">' +
            '<input name="file1" id="input__file' + (y + 1) + '" type="file" class="input input__file" multiple>' +
            '<label for="input__file0" class="input__file-button">' +
            '<p class="input__file-icon-wrapper"><i class="fa-solid fa-paperclip"></i></p>' +
            '<p class="input__file-button-text">Выберите файл</p>' +
            '</label>' +
            '</div>' +
            '</div>' +
            '<div class="col-7">' +
            '<p style="width: 20%; padding-top: 5px;">Описание:</p>' +
            '<div class="textarea">' +
            '<div class="scrolling">' +
            '<input type="text" name="desc" id="recipeDescription' + (y + 1) + '" required  style="width: 45%; height: 5vh; border-radius: .375rem;"' +
            '</div>' +
            '</div>' +
            '</div>' +
            '</div><div id="inputSteps' + (y + 1) + '" class="container"></div>'



        document.getElementById('inputSteps' + y).innerHTML = str;
        steps.push(document.getElementById('inputSteps' + y))
        y++;
    }
    else {
        alert('Нельзя добавить больше шагов!');
    }
}

function removeInputSteps() {
    if (steps.length > 0) {
        let poped = steps.length
        steps.pop()
        y = y - 1
        document.getElementById('inputSteps' + poped).innerHTML = "";
    }
}



Array.prototype.forEach.call(inputs, function (input) {
    let label = input.nextElementSibling,
        labelVal = label.querySelector('.input__file-button-text').innerText;

    input.addEventListener('change', function (e) {
        let countFiles = '';
        if (this.files && this.files.length >= 1)
            countFiles = this.files.length;

        if (countFiles)
            label.querySelector('.input__file-button-text').innerText = 'Выбрано файлов: ' + countFiles;
        else
            label.querySelector('.input__file-button-text').innerText = labelVal;
    });
});



function registration() {
    let title = document.getElementById('modal-content')
    title.innerHTML = '<div class="modal-header">\n' +
    '                                    <h3 class="modal-title" id="exampleModalLabel">Регистрация</h3>\n' +
    '                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>\n' +
    '                                </div>\n' +
    '                                <form>\n' +
    '                                   <div class="modal-body modal-inputs">\n' +
    '                                       <div class="mb-1">\n' +
    '                                           <label for="exampleFormControlInput1" class="form-label mb-0">Ваш Email*</label>\n' +
    '                                           <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com" required>\n' +
    '                                       </div>\n' +
    '                                       <div class="mb-1">\n' +
    '                                           <label for="exampleFormControlInput2" class="form-label mb-0">Ваше имя*</label>\n' +
    '                                           <input type="text" class="form-control" id="exampleFormControlInput2" required>\n' +
    '                                       </div>\n' +
    '                                       <div class="mb-1">\n' +
    '                                           <label for="exampleFormControlInput3" class="form-label mb-0">Ваш возраст</label>\n' +
    '                                           <input type="number" class="form-control" id="exampleFormControlInput3">\n' +
    '                                       </div>\n' +
    '                                       <div class="mb-1">\n' +
    '                                           <label for="exampleFormControlInput4" class="form-label mb-0">Ваш город</label>\n' +
    '                                           <input type="text" class="form-control" id="exampleFormControlInput4">\n' +
    '                                       </div>\n' +
    '                                       <div class="mb-1">\n' +
    '                                           <label>Ваш пол*</label>\n' +
    '                                           <div class="row">\n' +
    '                                               <div class="col form-check">\n' +
    '                                                   <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">\n' +
    '                                                   <label class="form-check-label" for="flexRadioDefault1">\n' +
    '                                                       Мужской\n' +
    '                                                   </label>\n' +
    '                                               </div>\n' +
    '                                               <div class="col form-check">\n' +
    '                                                   <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>\n' +
    '                                                   <label class="form-check-label" for="flexRadioDefault2">\n' +
    '                                                       Женский\n' +
    '                                                   </label>\n' +
    '                                               </div>\n' +
    '                                           </div>\n' +
    '                                       </div>\n' +
    '                                       <div class="mb-1">\n' +
    '                                           <label for="inputPassword1" class=" col-form-label mb-0">Пароль*</label>\n' +
    '                                           <div class="password">\n' +
    '                                               <input type="password" class="form-control" id="inputPassword1" required>\n' +
    '                                           </div>\n' +
    '                                       </div>\n' +
    '                                       <div class="mb-1">\n' +
    '                                           <label for="inputPassword2" class=" col-form-label mb-0">Повторите пароль*</label>\n' +
    '                                           <div class="password">\n' +
    '                                               <input type="password" class="form-control" id="inputPassword2" required>\n' +
    '                                           </div>\n' +
    '                                       </div>\n' +
    '                                   </div>\n' +
    '                                   <div class="modal-footer d-flex justify-content-between">\n' +
    '                                       <button type="button" onclick="login()" class="btn btn-primary btn-log-in btn-back">Назад</button>\n' +
    '                                       <button type="submit" class="btn btn-primary btn-log-in btn-sign-up">Зарегистрироваться</button>\n' +
    '                                   </div>' +
    '                                </form>'
};

function login() {
    let title = document.getElementById('modal-content')
    title.innerHTML = '<div class="modal-header">\n' +
        '                                    <h3 class="modal-title" id="exampleModalLabel">Вход</h3>\n' +
        '                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>\n' +
        '                                </div>\n' +
        '                                <form>\n' +
        '                                    <div class="modal-body modal-inputs">\n' +
        '                                        <div class="mb-2">\n' +
        '                                            <label for="exampleFormControlInput1" class="form-label mb-0">Ваш Email</label>\n' +
        '                                            <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com" required>\n' +
        '                                        </div>\n' +
        '                                        <div class="mb-2">\n' +
        '                                            <label for="inputPassword" class="col-sm-2 col-form-label mb-0">Пароль</label>\n' +
        '                                            <div class="password">\n' +
        '                                                <input type="password" class="form-control" id="inputPassword" required>\n' +
        '                                            </div>\n' +
        '                                        </div>\n' +
        '                                    </div>\n' +
        '                                    <div class="modal-footer d-flex justify-content-between">\n' +
        '                                        <a class="reg" onclick="registration()">Нет аккаунта?</a>\n' +
        '                                        <button type="submit" class="btn btn-primary btn-log-in btn-sign-in">Войти</button>\n' +
        '                                    </div>\n' +
        '                                </form>'
};

function scrolling(clicked) {
    window.scrollTo(0, 2000);
    document.querySelector('.active').classList.remove('active')
    clicked.classList.add('active')
}

function scrolling_fav(clicked) {
    window.scrollTo(0, 400);
    document.querySelector('.active').classList.remove('active')
    clicked.classList.add('active')
}
