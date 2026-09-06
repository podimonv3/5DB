FROM python:3.13-slim-bookworm

# സിസ്റ്റം പാക്കേജുകളും ബിൽഡ് ടൂളുകളും ഇൻസ്റ്റാൾ ചെയ്യുന്നു
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends git gcc g++ python3-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# ആദ്യം requirements മാത്രം കോപ്പി ചെയ്ത് ഇൻസ്റ്റാൾ ചെയ്യുന്നു (ബിൽഡ് വേഗത്തിലാക്കാൻ)
COPY requirements.txt .
RUN pip3 install -U pip && pip3 install -U -r requirements.txt

# ബാക്കി എല്ലാ ഫയലുകളും കോപ്പി ചെയ്യുന്നു
COPY . .

CMD ["python3", "bot.py"]
