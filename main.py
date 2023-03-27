from flask import Flask, render_template, request, session, redirect, url_for, jsonify
from werkzeug.utils import secure_filename
import os
from collections import Counter

from DataBase import Database

app = Flask(__name__)
app.secret_key = b'_5#y2L"F4uisdbiunsdfjnfdsjnksfkjnfQ8z\n\xec]/'


def get_recipe(id_dish, admin=0):
    steps = []
    products = []
    try:
        dish = kavkaz_DB.execute_query(f"SELECT `name_dish`, `description`, `rating`, `history`, `image`, `kk`, `time`, `iddish` FROM `dish` WHERE `iddish` = {id_dish} AND `modern` = {admin}")
        if dish != ():
            steps_id_by_dish = kavkaz_DB.execute_query(f"SELECT `steps_idsteps` FROM `dish_has_steps` WHERE `dish_iddish` = {id_dish}")

            for i in steps_id_by_dish:
                steps.append(kavkaz_DB.execute_query(f"SELECT `step`, `picture` FROM `steps` WHERE `idsteps` = {i[0]}"))

            quantity = kavkaz_DB.execute_query(f"SELECT `product_idproduct`, `quantity` FROM `product_list` WHERE `dish_iddish` = {id_dish}")
            for i in quantity:
                products.append(kavkaz_DB.execute_query(f"SELECT `name_product` FROM `product` WHERE `idproduct` = {i[0]}"))
            return [steps, products, dish, quantity]
        return None
    except:
        return None

def save_image(file, filename):
    if file.filename == '':
        return redirect(request.url)

    file.save(os.path.join(app.config['UPLOAD_FOLDER'], f'{filename}.{file.filename.rsplit(".", 1)[1].lower()}'))

def upload_file(request, last_stepid, last_dishid):
    images = {}
    if request.method == 'POST':
        if 'file' not in request.files:
            return redirect(request.url)

        file = request.files['file']
        print(request.files.getlist('file1'))
        UPLOAD_FOLDER = 'static/img/dish'
        app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

        save_image(file, last_dishid[0][0]+1)
        images['dish'] = f'img/dish/{last_dishid[0][0]+1}.{file.filename.rsplit(".", 1)[1].lower()}'

        file = request.files.getlist('file1')

        UPLOAD_FOLDER = 'static/img/steps'
        app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

        count = 1
        names = []
        for i in file:
            save_image(i, last_stepid[0][0]+count)
            names.append(f'img/steps/{last_stepid[0][0]+count}.{i.filename.rsplit(".", 1)[1].lower()}')
            count += 1

        images['steps'] = names
        return images

@app.route('/update_recipe', methods=('POST', 'GET'))
def update_recipe():
    filters = []
    for i in range(2):
        filters.append(kavkaz_DB.execute_query(f"SELECT `filtrer`, `idfilters` FROM `filters` WHERE `filter_type_idfilter_type` = {i+1};"))

    cuisines_values = request.form.getlist('cuisines[]')
    type1_values = request.form.getlist('type1[]')

    dish = []
    print(request.form)
    if len(cuisines_values) != 0 and len(type1_values) != 0:
        print('here')
        id_dish = []
        for i in range(len(cuisines_values)):
            if cuisines_values[i] == 'true':
                id_dish.append(kavkaz_DB.execute_query(f"SELECT `dish_iddish` FROM `dish_has_filters` WHERE `filters_idfilters` = {filters[1][i][1]}"))

        for i in range(len(type1_values)):
            if type1_values[i] == 'true':
                id_dish.append(kavkaz_DB.execute_query(f"SELECT `dish_iddish` FROM `dish_has_filters` WHERE `filters_idfilters` = {filters[0][i][1]}"))

        counts = Counter(id_dish)
        b = [i for i in id_dish if counts[i] > 1]
        b = list(set(b))

        try:
            for i in b:
                dish.append(kavkaz_DB.execute_query(f"SELECT `name_dish`, `description`, `rating`, `iddish`, `image` FROM `dish` WHERE `iddish` = {i[0][0]}"))
            dish = dish[0]
        except:
            pass
    print(dish)
    return jsonify({'a': dish})

@app.route('/', methods=('POST', 'GET'))
def index_page():
    """ Рендер index.html с данными из БД """

    """ TODO: Сделать регистрацию и вход """

    filters = []
    for i in range(2):
        filters.append(kavkaz_DB.execute_query(f"SELECT `filtrer`, `idfilters` FROM `filters` WHERE `filter_type_idfilter_type` = {i+1};"))

    # cuisines_values = request.form.getlist('cuisines[]')
    # type1_values = request.form.getlist('type1[]')

    # if len(cuisines_values) != 0 and len(type1_values) != 0:
    #     print('here')
    #     dish = []
    #     id_dish = []
    #     for i in range(len(cuisines_values)):
    #         if cuisines_values[i] == 'true':
    #             id_dish.append(kavkaz_DB.execute_query(f"SELECT `dish_iddish` FROM `dish_has_filters` WHERE `filters_idfilters` = {filters[1][i][1]}"))

    #     for i in range(len(type1_values)):
    #         if type1_values[i] == 'true':
    #             id_dish.append(kavkaz_DB.execute_query(f"SELECT `dish_iddish` FROM `dish_has_filters` WHERE `filters_idfilters` = {filters[0][i][1]}"))

    #     counts = Counter(id_dish)
    #     b = [i for i in id_dish if counts[i] > 1]
    #     b = list(set(b))

    #     try:
    #         for i in b:
    #             dish.append(kavkaz_DB.execute_query(f"SELECT `name_dish`, `description`, `rating`, `iddish`, `image` FROM `dish` WHERE `iddish` = {i[0][0]}"))
    #         dish = dish[0]
    #     except:
    #         pass   
    # else:
    #     print('there')
    dish = kavkaz_DB.execute_query(f"SELECT `name_dish`, `description`, `rating`, `iddish`, `image` FROM `dish` WHERE `modern` = {1}")

    return render_template(
        "index.html", 
        len_of_cuisines = len(filters[1]),
        len_of_type = len(filters[0]),
        len_of_dish = len(dish),
        Cuisines = filters[1],
        Type_of_dish = filters[0],
        Dish = dish,
        session = session,
    )

@app.route('/recipe/<int:id_dish>', methods=('POST', 'GET'))
def recipe_page(id_dish):
    """ TODO: сделать оптимальные sql запросы, 
        чтобы полностью заполнить страницу, сделать отзывы """

    recipe = get_recipe(id_dish, admin=1)
    print(recipe)
    if recipe == None:
        return redirect(url_for('index_page', session = session,))
    return render_template(
        "recipe.html",
        len_of_steps = len(recipe[0][0]),
        len_of_quantity = len(recipe[1][0]),
        Dish = recipe[2][0],
        Steps = recipe[0][0],
        Quantity = recipe[3],
        Products = recipe[1],
        session = session,
    )

@app.route('/admin', methods=('POST', 'GET'))
def admin_page():
    """ TODO: связать это с бд, доделать input, 
        потому что в них не учитывается порядок с БД, 
        поэтому не являются уникальными """

    recipes = []
    id_dish_max = kavkaz_DB.execute_query("SELECT MAX(`iddish`) FROM `dish`")[0][0]

    for i in range(1, id_dish_max+1):
        recipe = get_recipe(i)
        if recipe == None:
            continue
        recipes.append(recipe)

    if request.method == 'POST':
        id_dish = list(request.form.keys())[0]
        res = request.form[f'{id_dish}']
        if res == 'Отклонить':
            kavkaz_DB.execute_query(f"DELETE FROM `dish` WHERE `iddish` = {id_dish}")
        else:
            kavkaz_DB.execute_query(f"UPDATE `dish` SET `modern` = 1 WHERE `iddish` = {id_dish}")

    return render_template(
        "admin.html",
        len_of_recipes = len(recipes),
        len_of_steps = [len(i[0]) for i in recipes],
        len_of_quantity = [len(i[3]) for i in recipes],
        Dish = [i[2][0] for i in recipes],
        Steps = [i[0] for i in recipes],
        Quantity = [i[3] for i in recipes],
        Products = [i[1] for i in recipes],
        session = session,
    )

@app.route('/profile/<string:name>', methods=('POST', 'GET'))
def profile_page(name):
    """ TODO: сделать, чтобы другой пользователь не имел доступа к аккаунту другого """
    return render_template(
        "account.html",
        session = session,
    )

@app.route('/profile/<string:name>/myrecipe', methods=('POST', 'GET'))
def add_recipe_page(name):
    return render_template(
        "myrecipe.html",
        session = session,
    )

@app.route('/add_recipe', methods=('POST', 'GET'))
def add_recipe():
    data = request.form
    last_stepid = kavkaz_DB.execute_query("SELECT MAX(`idsteps`) FROM `steps`")
    last_dishid = kavkaz_DB.execute_query("SELECT MAX(`iddish`) FROM `dish`")
    if last_dishid[0][0] is None:
        last_dishid = [[0]]
    images = upload_file(request, last_stepid, last_dishid)
    kavkaz_DB.execute_query(f"INSERT INTO `dish` (`name_dish`, `history`, `description`, `rating`, `image`, `kk`, `time`, `modern`) VALUES ('{data['title']}', '{data['history']}', '{data['desc']}', 0, '{images['dish']}', '{data['kk']}', '{data['time']}', 0)")
    counts = data.getlist('count')
    products = data.getlist('product')
    print(data)
    for i in range(len(products)):
        product_id = kavkaz_DB.execute_query(f"SELECT idproduct FROM product WHERE name_product='{products[i]}'")
        kavkaz_DB.execute_query(f"INSERT INTO `product_list` (`priority`, `quantity`, `dish_iddish`, `product_idproduct`) VALUES (2, '{counts[i]}', {int(last_dishid[0][0]+1)}, {int(product_id[0][0])});")

    desc = data.getlist('desc')[1:]
    for i in range(len(desc)):
        print(images['steps'][i], len(desc))
        kavkaz_DB.execute_query(f"INSERT INTO `steps` (`step`, `picture`) VALUES ('{desc[i]}', '{images['steps'][i]}')")
        kavkaz_DB.execute_query(f"INSERT INTO `dish_has_steps` (`dish_iddish`, `steps_idsteps`) VALUES ({int(last_dishid[0][0]+1)}, {int(last_stepid[0][0] + 1 + i)})")

    return render_template(
        "myrecipe.html",
        session = session,
    )

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        print(request.form, request.form['email'])
        session['username'] = request.form['email']
        print(session)
        return redirect(url_for('index_page', session = session,))
    return redirect(url_for('index_page', session = session,)) #TODO: сделать окно с ошибкой, если вручную вводить login

@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect(url_for('index_page', session = session,))

if __name__ == '__main__':
    kavkaz_DB = Database('localhost', 'root', '', 'kavkaz')
    kavkaz_DB.connect()
    app.run(host='192.168.0.17', port=5000)