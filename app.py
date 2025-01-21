from flask import Flask, render_template
import mysql.connector
import pandas as pd

app = Flask(__name__)

# Connexion à la base de données
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'root',
    'database': 'carbonfootprint'
}

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
    app.run(debug=True)
