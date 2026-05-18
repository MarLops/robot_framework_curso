import requests
from robot.api.deco import keyword,library

@library
class PokeClient:

    BASE_URL = "https://pokeapi.co/api/v2/pokemon/"

    def __init__(self, pokemon_id=1):
        self.session = requests.Session()
        self._my_pokemon = pokemon_id
        

    @keyword("Get Pokemon")
    def get_pokemon(self, name_or_id):
        url = f"{self.BASE_URL}{name_or_id}/"
        try:
            resp = self.session.get(url, timeout=10)
            resp.raise_for_status()
            return resp.json()
        except requests.RequestException:
            return None

    @keyword("Get My Pokemon")
    def get_my_pokemon(self):
        return self.get_pokemon(self._my_pokemon)