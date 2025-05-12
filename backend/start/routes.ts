/*
|--------------------------------------------------------------------------
| Routes file
|--------------------------------------------------------------------------
|
| The routes file is used for defining the HTTP routes.
|
*/

import UsersController from '#controllers/users_controller'
import router from '@adonisjs/core/services/router'
import { middleware } from './kernel.js'
import VehiclesController from '#controllers/vehicles_controller'
import AuthController from '#controllers/auth_controller'

router.post('/register', [UsersController, 'registerWithVehicle'])
router.post('/login', [UsersController, 'login'])
router.post('/vehicles/from-plate', [VehiclesController, 'fromPlate'])
router.post('/vehicles', [VehiclesController, 'store']).use(middleware.auth())
router.post('/register-with-vehicle', [AuthController, 'registerWithVehicle'])




