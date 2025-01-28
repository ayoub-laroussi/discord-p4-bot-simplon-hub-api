import { Injectable } from '@nestjs/common';
import { Pool } from 'pg';

@Injectable()
export class AppService {
  private pool: Pool;

  constructor() {
    this.pool = new Pool({
      user: 'postgres',
      host: 'postgres',
      database: 'elden_ring',
      password: 'postgres',
      port: 5432,
    });
  }

  getHello(): string {
    return `
      <html>
        <head>
          <title>Elden Ring Database</title>
          <style>
            body { font-family: Arial, sans-serif; margin: 40px; }
            h1 { color: #2c3e50; }
            .section { margin: 20px 0; }
            table { border-collapse: collapse; width: 100%; }
            th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
            th { background-color: #f5f6fa; }
            tr:nth-child(even) { background-color: #f9f9f9; }
          </style>
        </head>
        <body>
          <h1>Elden Ring Database</h1>
          
          <div class="section" id="classes">
            <h2>Classes</h2>
            <div id="classesData">Loading...</div>
          </div>

          <div class="section" id="weapons">
            <h2>Weapons</h2>
            <div id="weaponsData">Loading...</div>
          </div>

          <div class="section" id="bosses">
            <h2>Bosses</h2>
            <div id="bossesData">Loading...</div>
          </div>

          <script>
            async function fetchData(endpoint, containerId) {
              try {
                const response = await fetch('/' + endpoint);
                const data = await response.json();
                
                let table = '<table><tr>';
                // Headers
                Object.keys(data[0]).forEach(key => {
                  table += '<th>' + key + '</th>';
                });
                table += '</tr>';
                
                // Data
                data.forEach(item => {
                  table += '<tr>';
                  Object.values(item).forEach(value => {
                    table += '<td>' + value + '</td>';
                  });
                  table += '</tr>';
                });
                
                table += '</table>';
                document.getElementById(containerId).innerHTML = table;
              } catch (error) {
                document.getElementById(containerId).innerHTML = 'Error loading data';
              }
            }

            // Load all data
            fetchData('classes', 'classesData');
            fetchData('weapons', 'weaponsData');
            fetchData('bosses', 'bossesData');
          </script>
        </body>
      </html>
    `;
  }

  async getClasses() {
    const { rows } = await this.pool.query('SELECT * FROM classes');
    return rows;
  }

  async getWeapons() {
    const { rows } = await this.pool.query('SELECT * FROM weapons');
    return rows;
  }

  async getBosses() {
    const { rows } = await this.pool.query('SELECT * FROM bosses');
    return rows;
  }
}
