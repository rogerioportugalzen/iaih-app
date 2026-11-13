#!/bin/bash
# Pedido 23: vídeos da conversa da missão 1 (8 primeiros)
set -e
d=midia/videos/m1; mkdir -p $d
b(){ curl -sSfL -o $d/$1.mp4 "$2"; }
b v2a 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/sRN0rdjnzNc8LgynlDyv/B8oMyrvaIj5UYtBUiIkL/content.mp4?Expires=1794618000&KeyName=assets-cdn-key-1&Signature=H9-oAmyqwCnAJcrmA3SoSKzCngk='
b v2b 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/AUKfvKBudPY8e1RpJ7dg/wKMBXg1T9bXuie8wIAoy/content.mp4?Expires=1794618000&KeyName=assets-cdn-key-1&Signature=z5wkZo54U5uSzJcY3Rpioovr7AA='
b v4 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/x0bMnHLpsaW3z8YpOsQN/07KTF6RWNOs5JIEmRQbY/content.mp4?Expires=1794618000&KeyName=assets-cdn-key-1&Signature=PjRmche7hGtbvO4mxT-0PUa1WYI='
b v6 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/AUKgTtqJvDw3PSoMq7ox/EBTgB6jCjJLtHNBII17K/content.mp4?Expires=1794618000&KeyName=assets-cdn-key-1&Signature=elqCfP-AReX92bM9tIz33Z-icTU='
b v7 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/XuOl9cdTNeKUY7cRPkGt/NMNT8Bvck80QJWHb6QEV/content.mp4?Expires=1794618000&KeyName=assets-cdn-key-1&Signature=QY8a4EDZib6Xvf_A_-skLmeaO_M='
b v8 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/84p6y0ITc2S20QFzACru/ZpnbF9i8Hkgy9ywAS3eQ/content.mp4?Expires=1794618000&KeyName=assets-cdn-key-1&Signature=tz90NMtpMF3eqKQ7i8_uF0eYTt0='
b v9 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/S5217I5RDwngHTxWrDui/w1MKbqk2vIEoyFSqPuqC/content.mp4?Expires=1794618000&KeyName=assets-cdn-key-1&Signature=uyPZi8DWhlqlv8fOuQVvH48Erdg='
b v12 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/fMCBhQzkP8QZbZQkXXE4/KDne1fyGb09bSZNRI5aY/content.mp4?Expires=1794618000&KeyName=assets-cdn-key-1&Signature=e-grXBNdwVQjHxNz7H3Wqsqv_xU='
ls -la $d
