import { defineStore } from 'pinia'

import { default as axios } from 'axios';

export type PlayerData = {
  CurrentHP: number,
  MaxHP: number,
  Name: string,
}

export type OverlayData = {
  Players: PlayerData[]
}

const REFRESH_INTERVAL = 1000;
const TEST_MODE = false;

export const useOverlayData = defineStore({
  id: 'overlay-data',
  state: () => ({
    data: {} as OverlayData,
    interval: 0 as number,
  }),
  getters: {
  },
  actions: {
    async refresh() {
      if (TEST_MODE) {
        this.data = {
          Players: [{
            CurrentHP: (600 + Math.random() * 100 | 0),
            MaxHP: 1000,
            Name: 'Emilia',
          }]
        }
      } else {
        const response = await axios.get<OverlayData>('/data', {});
        this.data = response.data;
      }
    },
    start() {
      this.interval = setInterval(() => {
        this.refresh()
      }, REFRESH_INTERVAL)
    },
    stop() {
      clearInterval(this.interval);
      this.interval = 0;
    }
  }
})
