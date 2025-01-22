from flask import Flask, render_template, request
from db_profils import profils
import mysql.connector
import pandas as pd

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
        # Connexion MySQL
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)
        
        # Récupérer les données des tables
        cursor.execute("SELECT * FROM World")
        world_data = cursor.fetchall()

        cursor.execute("SELECT * FROM Country")
        country_data = cursor.fetchall()

        cursor.close()
        conn.close()
        
        return render_template('data.html', world_data=world_data, country_data=country_data)
    except Exception as e:
        return f"Erreur lors de la récupération des données : {e}"

@app.route('/filter', methods=['GET', 'POST'])
def filter_data():
    try:
        # Connexion MySQL
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)
        
        # Récupérer les régions pour le menu déroulant
        cursor.execute("SELECT id, region FROM World")
        regions = cursor.fetchall()

        countries = []
        selected_region = None

        if request.method == 'POST':
            selected_region = request.form.get('region')
            cursor.execute("SELECT * FROM Country WHERE region_id = %s", (selected_region,))
            countries = cursor.fetchall()

        cursor.close()
        conn.close()
        
        return render_template('filter.html', regions=regions, countries=countries, selected_region=selected_region)
    except Exception as e:
        return f"Erreur lors du filtrage des données : {e}"

@app.route('/calculations', methods=['GET', 'POST'])
def calculations():
    try:
        # Exemple pour calculer les émissions totales
        total_emissions = None
        if request.method == 'POST':
            country_id = request.form.get('country_id')
            conn = mysql.connector.connect(**db_config)
            cursor = conn.cursor(dictionary=True)

            # Récupération des pourcentages et calcul des émissions
            cursor.execute("SELECT * FROM Country WHERE id = %s", (country_id,))
            country_data = cursor.fetchone()
            
            if country_data:
                total_emissions = (
                    country_data['coal'] * 820 +
                    country_data['gas'] * 490 +
                    country_data['oil'] * 740 +
                    country_data['hydro'] * 24 +
                    country_data['renewable'] * 41 +
                    country_data['nuclear'] * 12
                )

            cursor.close()
            conn.close()
        
        return render_template('calculations.html', total_emissions=total_emissions)
    except Exception as e:
        return f"Erreur lors du calcul des émissions : {e}"

if __name__ == '__main__':
    select_profile()
    app.run(debug=True)
