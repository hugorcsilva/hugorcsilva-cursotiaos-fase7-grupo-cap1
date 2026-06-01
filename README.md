# 🌱 FarmTech Solutions - Hub Central (Fase 7)

**Instituição:** FIAP - Pós-Graduação / Inteligência Artificial  
**Projeto:** Ecossistema Integrado de Gestão Agrícola, Saúde Animal e Segurança Patrimonial (Consolidação Fases 1 a 7)  

---

## 📖 Sobre o Projeto
O **FarmTech Solutions** evoluiu de um sistema de monitoramento de culturas agrícolas para um ecossistema digital inteligente de alto valor agregado. O objetivo da **Fase 7** foi consolidar todos os serviços desenvolvidos ao longo do curso em uma plataforma centralizada, construída com uma arquitetura monolítica modular focada no usuário final.

Através de um painel interativo orquestrador em **Python (Streamlit)**, o sistema integra:
1. **Modelagem e Estatística (R):** Cálculos de manejo de insumos e consumo de APIs meteorológicas.
2. **IoT e Banco de Dados (Oracle):** Leitura de logs físicos (ESP32) e gestão automatizada de tabelas relacionais (`DADO_AGRICOLA`).
3. **Machine Learning (Scikit-Learn):** Análise exploratória (Clusterização/PCA) e regressão preditiva para rendimento de safras, gerando recomendações automáticas de irrigação e fertilização.
4. **Visão Computacional Avançada (YOLOv5):** Prova de Conceito (PoC) expandida para duas novas verticais estratégicas:
   * 🐶 **Saúde Animal:** Diagnóstico e monitoramento clínico veterinário (Alvo: *Shih Tzu* - Stress test de texturas/pelagem).
   * 🚙 **Segurança Patrimonial:** Controle de acesso restrito (Alvo: *Nissan Kicks* - Validação de design automotivo).
5. **Cloud Computing (AWS SNS):** Disparo de alertas em tempo real (E-mail/SMS) integrados aos gatilhos de Machine Learning e Visão Computacional.

---

## 🔗 Histórico de Fases (Repositórios Anteriores)
A evolução iterativa deste ecossistema pode ser rastreada através das entregas prévias da equipe:
* **Fase 01 (Base de Dados e R):** [farmtech-fiap-cap01](https://github.com/hugorcsilva/farmtech-fiap-cap01)
* **Fase 02 (IoT ESP32 e Python):** [fase2-grupo9-esp32](https://github.com/agentesiafiap/cursotiaos-fase2-grupo9-esp32) | [fase2-grupo6-python](https://github.com/agentesiafiap/cursotiaos-fase2-grupo6-python)
* **Fase 03 (Oracle Database):** [fase3-grupo16-oracle](https://github.com/agentesiafiap/cursotiaos-fase3-grupo16-oracle)
* **Fase 04 (Machine Learning e EDA):** [fase4-grupo43-previsao](https://github.com/agentesiafiap/cursotiaos-fase4-grupo43-previsao)
* **Fase 05 (Cloud AWS & Mensageria):** [fase5-grupo19-ml-aws](https://github.com/agentesiafiap/cursotiaos-fase5-grupo19-ml-aws)
* **Fase 06 (Visão Computacional YOLO):** [fase6-grupo21-yolo-cnn](https://github.com/agentesiafiap/cursotiaos-fase6-grupo21-yolo-cnn)

---

## 🏗️ Estrutura do Repositório (Fase 7)
A arquitetura do projeto foi refatorada para garantir organização e escalabilidade:

```text
/
├── app.py                      # Dashboard Principal (Hub Streamlit)
├── requirements.txt            # Dependências do projeto Python
├── .env.example                # Template de variáveis de ambiente
├── yolov5_farmtech.pt          # Pesos treinados do YOLOv5 (Fase 6)
├── regression_model.joblib     # Modelo de Machine Learning treinado (Fase 4)
│
├── data/                       # Diretório de Armazenamento
│   ├── crop_yield.csv          # Base histórica para análise de clusters
│   ├── dados_farmtech.csv      # Armazenamento de áreas de plantio
│   ├── dados_historicos_2024.csv # Logs físicos do IoT para importação Oracle
│   ├── confusion_matrix.png    # Métricas do modelo YOLO
│   └── F1_curve.png            # Métricas do modelo YOLO
│
└── scripts/                    # Scripts de Lógica de Negócio e R
    ├── analise_estatistica.R   # Motor estatístico (Fase 1)
    ├── analise_openmeteo.R     # Meteorologia via R (Fase 1)
    └── recommend.py            # Regras de negócio para irrigação e fertilização (Fase 4)
```

##🚀Como Executar o Projeto Localmente

- **Pré-requisitos:** Certifique-se de ter o Python 3.9+ e a linguagem R instalados no seu ambiente.
- Clone este repositório.
- Instale as dependências executando no terminal:

```Bash
pip install -r requirements.txt
```

- **Configuração de Variáveis de Ambiente:** Crie um arquivo `.env` na raiz do projeto contendo suas credenciais do Oracle e da AWS:

```Snippet de código
DB_USER=seu_usuario
DB_PASS=sua_senha
DB_HOST=seu_host_oracle
DB_PORT=1521
DB_SERVICE=seu_service_name

AWS_ACCESS_KEY_ID=sua_chave_aws
AWS_SECRET_ACCESS_KEY=seu_secret_aws
AWS_DEFAULT_REGION=us-east-1
SNS_TOPIC_ARN=arn:aws:sns:us-east-1:1234567890:SeuTopico
```
- Inicie o painel orquestrador:

```Bash
streamlit run app.py
```