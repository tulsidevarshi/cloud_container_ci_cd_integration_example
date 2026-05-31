import azure.functions as func
from fastapi import FastAPI

# Your standard FastAPI app setup
app = FastAPI()


@app.get("/")
def root():
    return {"message": "Hello from FastAPI on Azure Functions!"}


# This connects your FastAPI instance directly to the Azure Functions runtime handler
def main(req: func.HttpRequest, context: func.Context) -> func.HttpResponse:
    return func.AsgiMiddleware(app).handle(req, context)

