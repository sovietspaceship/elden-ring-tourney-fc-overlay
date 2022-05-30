
const fs = require('fs')
const path = require('path')
const { promisify } = require('util')

const Hapi = require('@hapi/hapi');

const readFileAsync = promisify(fs.readFile);

require('dotenv').config();

const { OVERLAY_DATA_PATH } = process.env;

main().catch(error => {
    console.error(error)
    process.exit(1);
})

async function main() {
    const server = Hapi.server({
        port: 4567,
        host: 'localhost',
        routes: {
            files: {
                relativeTo: path.join(__dirname, './public')
            }
        }
    });

    await server.register(require('@hapi/inert'));

    server.route({
        method: 'GET',
        path: '/data',
        async handler(request, h) {
            const data = await readOverlayData();

            return data;
        }
    });

    server.route({
        method: 'GET',
        path: '/{param*}',
        handler: {
            directory: {
                path: '.',
                index: ['index.html']
            }
        }
    });

    await server.start();

    console.log('Server running on', server.info.uri);
}

async function readOverlayData() {
    const rawData = await readFileAsync(OVERLAY_DATA_PATH)
    const [player1CurrentHP, player1MaxHP] = rawData.toString().split(',')
    return {
        Players: [{
            CurrentHP: +player1CurrentHP,
            MaxHP: +player1MaxHP,
            Name: 'Emilia'
        }, {
            CurrentHP: +420,
            MaxHP: 666,
            Name: 'Hakresht'
        }],
    }
}
