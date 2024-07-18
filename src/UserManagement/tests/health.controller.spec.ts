import { Test, TestingModule } from '@nestjs/testing';
import HealthController from '../Controllers/health.contoller';


describe('Health Test ', () => {
    let healthController: HealthController;

    beforeEach(() => {
        healthController = new HealthController();
    });

    describe('findAll', () => {
        it('should return an array of cats', async () => {
            const result = 'healthy endpoint';

            expect(await healthController.health()).toBe(result);
        });
    });

});