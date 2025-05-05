import User from '#models/user'
import type { HttpContext } from '@adonisjs/core/http'
import hash from '@adonisjs/core/services/hash'

export default class UsersController {
    async register ({ request, response }: HttpContext) {
        const data = request.only(['email', 'password'])

        try{
            const user = await User.create(data)
            return response.created({
                message:"Utilisateur Crée avec succès",
                user,
            })
        }catch (error ){
            return response.badRequest({
                message:"Erreur lors de la création de l'utilisateur",
                error,
            })
        }
    }

    public async login({ request, response }: HttpContext) {
        const { email, password } = request.only(['email', 'password'])
    

        const user = await User.findBy('email', email)
        if (!user) {
          return response.unauthorized({ message: 'Email ou mot de passe incorrect' })
        }

        const isPasswordValid = await hash.verify(user.password, password)
        if (!isPasswordValid) {
          return response.unauthorized({ message: 'Email ou mot de passe incorrect' })
        }

        const token = await User.accessTokens.create(user)
    
        return {
          user: {
            id: user.id,
            email: user.email,
          },
          token: token.value,
        }
      }
}