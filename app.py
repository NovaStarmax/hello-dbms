from flask import Flask, render_template, request
from db_profils import profils
import mysql.connector

app = Flask(__name__)
db_config = {}

def select_profile():
    global db_config
    print("==== Sélectionnez un profil de base de données ====")
    print("1. Antoine")
    print("2. Sulili")
    print("3. Profil utilisateur 3")

    choice = input("Entrez le numéro du profil (1/2/3, par défaut 1) : ").strip()
    if choice == "" or choice not in profils:
        choice = "1"
    
    db_config = profils[choice]
    print(f"\nProfil {choice} sélectionné avec succès !\n")

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/data')
def data():
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        # Récupérer les données des tables
        cursor.execute("SELECT * FROM World;")
        world_data = cursor.fetchall()

        cursor.execute("SELECT * FROM Country;")
        country_data = cursor.fetchall()

        conn.close()
    except Exception as e:
        return f"Erreur de connexion à la base de données : {e}"

    return render_template('data.html', world_data=world_data, country_data=country_data)

@app.route('/filter', methods=['GET', 'POST'])
def filter():
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        cursor.execute("SELECT id, region FROM World;")
        regions = cursor.fetchall()

        countries = []
        selected_region = None

        if request.method == 'POST':
            selected_region = request.form.get('region_id')
            cursor.execute("SELECT * FROM Country WHERE region_id = %s;", (selected_region,))
            countries = cursor.fetchall()

        conn.close()
    except Exception as e:
        return f"Erreur de connexion à la base de données : {e}"

    return render_template('filter.html', regions=regions, countries=countries, selected_region=selected_region)

@app.route('/calculations', methods=['GET', 'POST'])
def calculations():
    total_emissions = None
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        cursor.execute("SELECT id, country FROM Country;")
        countries = cursor.fetchall()

        if request.method == 'POST':
            country_id = request.form.get('country_id')
            cursor.execute("""
                SELECT coal, gas, oil, hydro, renewable, nuclear
                FROM Country WHERE id = %s;
            """, (country_id,))
            emissions = cursor.fetchone()

            # Calculer les émissions totales (en gCO2/kWh)
            factors = {'coal': 820, 'gas': 490, 'oil': 740, 'hydro': 24, 'renewable': 41, 'nuclear': 12}
            total_emissions = sum(emissions[source] * factors[source] for source in factors if emissions[source])

        conn.close()
    except Exception as e:
        return f"Erreur de connexion à la base de données : {e}"

    return render_template('calculations.html', countries=countries, total_emissions=total_emissions)

if __name__ == '__main__':
    select_profile()
    app.run(debug=True)
