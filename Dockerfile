# ─── Stage: Serve com Nginx ───────────────────────────────────────────────────
# Usa a imagem Alpine para manter o container leve (~25MB)
FROM nginx:1.27-alpine

# Remove a configuração padrão do Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Copia a configuração customizada
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copia todos os arquivos do portfólio para o diretório raiz do Nginx
COPY . /usr/share/nginx/html

# Expõe a porta 80
EXPOSE 80

# Comando padrão do Nginx (inicia em foreground)
CMD ["nginx", "-g", "daemon off;"]
