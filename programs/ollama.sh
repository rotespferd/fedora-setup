echo "Install ollama..."

curl -fsSL https://ollama.com/install.sh | sh

ollama pull llama3.1
ollama pull codellama