import type { HttpContext } from '@adonisjs/core/http'
import axios from 'axios'

export default class VehiclesController {
  async fromPlate({ request, response }: HttpContext) {
    const plate = request.input('plate')

    if (!plate) {
      return response.badRequest({ message: 'La plaque est requise' })
    }

    try {
      // Appel à l’API externe
      const apiResponse = await axios.get(
        `https://api-siv-systeme-d-immatriculation-des-vehicules.p.rapidapi.com/${plate}`,
        {
          headers: {
            'x-rapidapi-key': '2aec947722msh95ee19098817585p1083fdjsn909d1a41751e',
            'x-rapidapi-host': 'api-siv-systeme-d-immatriculation-des-vehicules.p.rapidapi.com',
          },
        }
      )

      const data = apiResponse.data?.data

      if (!data) {
        return response.notFound({ message: 'Aucune donnée trouvée pour cette plaque.' })
      }

      // ✅ On retourne les données trouvées
      return response.ok({
        plate,
        brand: data.AWN_marque,
        model: data.AWN_modele,
        modelName: data.AWN_label,
        year: Number(data.AWN_annee_de_debut_modele),
        imageUrl: data.AWN_model_image,
        brandImageUrl: data.AWN_url_image
      })
    } catch (error) {
      console.error(error)
      return response.status(500).send({ message: 'Erreur serveur', error: error.message })
    }
  }

  async store({ auth, request }: HttpContext) {
    const user = await auth.getUserOrFail()

    const data = request.only([
      'plate',
      'model',
      'year',
      'mileage',
      'technicalControlDate',
      'image',
      'brand',
    ])

    const vehicle = await user.related('vehicles').create(data)

    return vehicle
  }
}
