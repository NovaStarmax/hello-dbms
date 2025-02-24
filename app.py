from flask import Flask, render_template, request
import mysql.connector
import pandas as pd

app = Flask(__name__)

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'carbonfootprint'
}

median_emissions = {
    'coal': 820,
    'gas': 490,
    'oil': 740,
    'hydro': 24,
    'renewable': 41,
    'nuclear': 12
}

def get_db_connection():
    return mysql.connector.connect(**db_config)

@app.route('/', methods=['GET','POST'])
def home():
    conn = get_db_connection()
    
    df_regions = pd.read_sql("SELECT id, region, coal, gas, oil, hydro, renewable, nuclear FROM World", conn)
    regions_list = df_regions.to_dict(orient='records')
    
    df_world_all = pd.read_sql("SELECT * FROM World", conn)

    df_country_all = pd.read_sql("SELECT * FROM Country", conn)

    selected_region_id = None
    selected_country_id = None
    consumption_kW = 1
    
    region_data = None
    country_data = None
    countries_list = []
    
    if request.method == 'POST':
        selected_region_id = request.form.get("region_id")
        selected_country_id = request.form.get("country_id")
        consumption_kW = float(request.form.get("consumption_kW", 1))
        
        if selected_region_id:
            query_r = "SELECT * FROM World WHERE id = %s"
            df_r = pd.read_sql(query_r, conn, params=(selected_region_id,))
            if not df_r.empty:
                df_r['coal_contrib'] = (df_r['coal']/100)*median_emissions['coal']
                df_r['gas_contrib']  = (df_r['gas']/100)*median_emissions['gas']
                df_r['oil_contrib']  = (df_r['oil']/100)*median_emissions['oil']
                df_r['hydro_contrib'] = (df_r['hydro']/100)*median_emissions['hydro']
                df_r['renewable_contrib'] = (df_r['renewable']/100)*median_emissions['renewable']
                df_r['nuclear_contrib'] = (df_r['nuclear']/100)*median_emissions['nuclear']

                df_r['emission_total'] = (
                    df_r['coal_contrib'] + df_r['gas_contrib'] + df_r['oil_contrib'] +
                    df_r['hydro_contrib'] + df_r['renewable_contrib'] + df_r['nuclear_contrib']
                )
                df_r['annual_kg'] = (df_r['emission_total']/1000)*(24*365)*consumption_kW
                df_r['trees_needed'] = df_r['annual_kg']/25

                region_data = df_r.to_dict(orient='records')[0]

            query_c = "SELECT id, country FROM Country WHERE region_id = %s"
            df_c = pd.read_sql(query_c, conn, params=(selected_region_id,))
            countries_list = df_c.to_dict(orient='records')
        
        if selected_country_id:
            query_p = "SELECT * FROM Country WHERE id = %s"
            df_p = pd.read_sql(query_p, conn, params=(selected_country_id,))
            if not df_p.empty:
                df_p['coal_contrib'] = (df_p['coal']/100)*median_emissions['coal']
                df_p['gas_contrib']  = (df_p['gas']/100)*median_emissions['gas']
                df_p['oil_contrib']  = (df_p['oil']/100)*median_emissions['oil']
                df_p['hydro_contrib'] = (df_p['hydro']/100)*median_emissions['hydro']
                df_p['renewable_contrib'] = (df_p['renewable']/100)*median_emissions['renewable']
                df_p['nuclear_contrib'] = (df_p['nuclear']/100)*median_emissions['nuclear']

                df_p['emission_total'] = (
                    df_p['coal_contrib'] + df_p['gas_contrib'] + df_p['oil_contrib'] +
                    df_p['hydro_contrib'] + df_p['renewable_contrib'] + df_p['nuclear_contrib']
                )
                df_p['annual_kg'] = (df_p['emission_total']/1000)*(24*365)*consumption_kW
                df_p['trees_needed'] = df_p['annual_kg']/25

                country_data = df_p.to_dict(orient='records')[0]

    conn.close()
    
    return render_template('index.html',
                           regions_list=regions_list,
                           selected_region_id=selected_region_id,
                           selected_country_id=selected_country_id,
                           consumption_kW=consumption_kW,
                           countries_list=countries_list,
                           region_data=region_data,
                           country_data=country_data,
                           df_world_all=df_world_all.to_dict(orient='records'),
                           df_country_all=df_country_all.to_dict(orient='records')
                           )

if __name__=='__main__':
    app.run(debug=True)