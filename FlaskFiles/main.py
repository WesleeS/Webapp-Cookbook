from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

@app.route('/')
@app.route('/input/')
def tableInputPage():
    return render_template('tableInput.html')

@app.route('/submit', methods=['GET'])
def submit():
    recipeID = request.args.get('recipeID')
    recipeName = request.args.get('recipeName')
    recipePage = request.args.get('recipePage')
    recipeBook = request.args.get('recipeBook')

    return redirect(url_for('tableViewPage', recipeID=recipeID, recipeName=recipeName, recipePage=recipePage, recipeBook=recipeBook))

@app.route('/view/')
def tableViewPage():
    recipeID = request.args.get('recipeID')
    recipeName = request.args.get('recipeName')
    recipePage = request.args.get('recipePage')
    recipeBook = request.args.get('recipeBook')
    
    return render_template('tableView.html', recipeID=recipeID, recipeName=recipeName, recipePage=recipePage, recipeBook=recipeBook)