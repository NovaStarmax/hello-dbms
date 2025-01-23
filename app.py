from flask import Flask, render_template
import mysql.connector
import pandas as pd
from db_profils import profils

app = Flask(__name__)
db_config = {}

def select_profile():
    global db_config
    print("==== Sélectionnez un profil de base de données ====")
    print("1. Antoine")
    print("2. Sulili")
    print("3. Ines")

    choice = input("Entrez le numéro du profil (1/2/3, par défaut 1) : ").strip()
    
    # Par défaut, choisir le profil 1
    if choice == "" or choice not in profils:
        choice = "1"
    
    db_config = profils[choice]
    print(f"\nProfil {choice} sélectionné avec succès !\n")

# Route pour la page principale
@app.route('/')
def home():
    context = {
        'title': "Calculateur d'Empreinte Carbone",
        'description': (
            "Ce projet vise à analyser l'empreinte carbone liée à la production d'énergie électrique "
            "et à fournir des outils pour mieux comprendre les contributions des différentes sources d'énergie."
        )
    }
    return render_template('index.html', context=context)

# Route pour afficher les observations et les jeux de données
@app.route('/data')
def data():
    # Connexion MySQL
    conn = mysql.connector.connect(**db_config)

    # Récupérer les données des tables
    world_query = "SELECT * FROM World;"
    country_query = "SELECT * FROM Country;"
    world_data = pd.read_sql(world_query, conn)
    country_data = pd.read_sql(country_query, conn)

    # Fermer la connexion
    conn.close()

    # Convertir en dictionnaires pour affichage
    world_records = world_data.to_dict(orient='records')
    country_records = country_data.to_dict(orient='records')

    # Observations
    observations = [
        "Les régions les plus dépendantes des énergies fossiles sont l'Asie de l'Est et le Pacifique.",
        "L'Europe et l'Amérique du Nord sont plus engagées dans les énergies propres.",
        "Les énergies fossiles contribuent de manière significative aux émissions de CO2, avec le charbon en tête."
    ]

    return render_template('data.html', 
                           world_records=world_records, 
                           country_records=country_records, 
                           observations=observations)

if __name__ == '__main__':
    select_profile()
    app.run(debug=True)
