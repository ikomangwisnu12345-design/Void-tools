
---

## 📄 `install.sh` (Auto Install)

```bash
#!/bin/bash

echo "🔥 INSTALLING VOID TOOLS..."
pkg update && pkg upgrade -y
pkg install bash curl whois figlet -y

echo "📥 Cloning repository..."
git clone https://github.com/username/void-tools
cd void-tools

echo "🔧 Setting permission..."
chmod +x void-tools.sh

echo "✅ Instalasi selesai!"
echo "🚀 Jalankan dengan: ./void-tools.sh"