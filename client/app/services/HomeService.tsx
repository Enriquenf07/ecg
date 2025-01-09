import axios from "axios";

export const AulasService = (token: string) => {
    
    const pesquisar = async () => {
        const response = await axios.get('http://localhost:5000/api/aula/', {
            headers: {
                'Authorization': `Bearer ${token}`,
            },
        });
        return response
    }

    const pesquisarModulos = async (id: number) => {
        const response = await axios.get(`http://localhost:5000/api/aula/${id}`, {
            headers: {
                'Authorization': `Bearer ${token}`,
            },
        });
        return response
    }

    const carregar = async (id: number) => {
        const response = await axios.get(`http://localhost:5000/api/aula/${id}/info`, {
            headers: {
                'Authorization': `Bearer ${token}`,
            },
        });
        return response
    }

    return {
        pesquisar,
        pesquisarModulos,
        carregar
    }
};