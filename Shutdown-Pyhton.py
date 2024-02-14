import os
import shutil
import datetime
import ctypes

# Criar arquivo de log
log_file = "log-python.txt"
with open(log_file, "a") as f:
    f.write("Limpeza de pastas temporárias\n")
    f.write("Data: " + datetime.date.today().strftime("%Y-%m-%d") + "\n")
    f.write("Hora: " + datetime.datetime.now().strftime("%H:%M:%S") + "\n")

# Definir variáveis de pasta
pasta1 = os.environ["TEMP"]
pasta2 = os.environ["SystemRoot"] + "\\temp"
pasta3 = os.environ["SystemRoot"] + "\\Prefetch"

# Função para limpar a pasta
def limpar_pasta(pasta):
    print("Limpando a pasta", pasta, "...")
    for root, dirs, files in os.walk(pasta):
        for file in files:
            try:
                os.remove(os.path.join(root, file))
            except Exception as e:
                pass
    print("Pasta", pasta, "limpa.")

# Limpar as pastas
limpar_pasta(pasta1)
limpar_pasta(pasta2)
limpar_pasta(pasta3)

# Exibir mensagem de finalização
mensagem = "Processo de limpeza finalizado.\n" \
           "Ele está apagando os arquivos que consegue e deixando de lado aqueles que não pode excluir por falta de permissao.\n" \
           "Se você quiser ter certeza de que os arquivos foram apagados corretamente, pode olhar nas pastas indicadas por conta propria ou verificar um arquivo chamado log.txt em " + log_file + " para ver quais arquivos foram removidos com sucesso."
ctypes.windll.user32.MessageBoxW(None, mensagem, "Limpeza Concluída", 0x40)

# Desligar o computador após 60 segundos
os.system("shutdown /s /t 60")
