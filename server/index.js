
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
        async handler(_request, _h) {
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
    const [
        player1CurrentHP,
        player1MaxHP,
        player1Name,
        player2CurrentHP,
        player2MaxHP,
        player2Name,
        player3CurrentHP,
        player3MaxHP,
        player3Name,
        player4CurrentHP,
        player4MaxHP,
        player4Name,
    ] = rawData.toString().split(',')
    return {
        Players: [{
            CurrentHP: +player1CurrentHP,
            MaxHP: +player1MaxHP,
            Name: player1Name,
        }, {
            CurrentHP: +player2CurrentHP,
            MaxHP: +player2MaxHP,
            Name: player2Name
        }, {
            CurrentHP: +player3CurrentHP,
            MaxHP: +player3MaxHP,
            Name: player3Name
        }, {
            CurrentHP: +player4CurrentHP,
            MaxHP: +player4MaxHP,
            Name: player4Name
        }],
    }
}
