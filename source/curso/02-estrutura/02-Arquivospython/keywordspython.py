
from typing import Any, Dict
import requests
from robot.api.deco import  keyword


@keyword("Pegar pokemon",types={"name_or_id":int})
def get_pokemon_data(name_or_id: str) -> Dict[str, Any]:
    url = f"https://pokeapi.co/api/v2/pokemon/{name_or_id}"
    try:
        resp = requests.get(url, timeout=10)
    except requests.RequestException as e:
        return {"error": str(e), "status_code": None}

    if resp.status_code == 200:
        try:
            return resp.json()
        except ValueError:
            return {"error": "Invalid JSON in response", "status_code": resp.status_code}

    return {"error": resp.text or resp.reason, "status_code": resp.status_code}



