import type { HttpContext } from '@adonisjs/core/http'
import User from '#models/user'

import hash from '@adonisjs/core/services/hash'

export default class AuthController {
  public async registerWithVehicle({ request, response }: HttpContext) {
    const {
      email,
      password,
      fullName,
      plate,
      model,
      brand,
      year,
      mileage,
      technicalControlDate,
      imageUrl,
    } = request.only([
      'email',
      'password',
      'fullName',
      'plate',
      'model',
      'brand',
      'year',
      'mileage',
      'technicalControlDate',
      'imageUrl',
    ])

    const data = request.only([
      'email',
      'password',
      'fullName',
      'plate',
      'model',
      'brand',
      'year',
      'mileage',
      'technicalControlDate',
      'imageUrl',
      'brand',
    ])
    
    
    console.log('Données reçues :', {
      email,
      fullName,
      plate,
      model,
      brand,
      year,
      mileage,
      technicalControlDate,
      imageUrl,
    })
    
    // Vérifie si l'email existe déjà
    const emailExists = await User.findBy('email', email)
    if (emailExists) {
      return response.conflict({ message: 'Un compte avec cet email existe déjà.' })
    }
    
    
    const user = await User.create({
      email: data.email,
      password: await hash.make(data.password),
      fullName: data.fullName || 'Utilisateur', // valeur par défaut si vide
    })

    // Création du véhicule lié à l'utilisateur
    const vehicle = await user.related('vehicles').create({
      plate,
      model,
      brand,
      year,
      mileage,
      technicalControlDate,
      imageUrl,
    })

    

    console.log('Véhicule créé :', vehicle)

    // Génère un token d'accès
    const token = await User.accessTokens.create(user)

    return response.created({
      message: 'Compte et véhicule créés avec succès',
      user: {
        id: user.id,
        email: user.email,
      },
      token,
    })
  }

  
}
