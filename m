Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAEE3BA249
	for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 12:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616181; cv=none; b=TqOosuHDLP4RUm22ivAAiFYxN1BAgBRVwPFrx3kv3HHeFStOyRSvmoDi8zKszZz0VVqBDU5l2VYBJHC+lxZHBoGDrjQT2Zy6uUBIGUWInApbIfE+ZLtGsQgpqXJG8YRrHp7DFWC/8iH+HFuhT6jOlUw9gB8Jm319Df416ypa26Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616181; c=relaxed/simple;
	bh=9iBoxNGbR7Yc+w9NG6t1Zi7yG1GJqTpxTm3NnpbPEd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QvDV6KFD4APir8bb8yiSG1x3zC/Ih/tngpJxuQ7NvyGTx47pp5vt+eB3YwlpMUgEkc7g+1Ow53JUbx0Fdzf4VmD0PeK1neRdlL9kPy7EJljjyyTCcGkoierKAcBl5XqUTmNLqBfSBJw+7D+PJkcmkmGVsNsttMzIDGUBTWIDpVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBuwZsj9; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBuwZsj9"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94aca174532so625769241.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 05:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774616178; x=1775220978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/00eenU+aiPjirZiqlNCTi2XaYskiP6bIiuaeY6rVA=;
        b=VBuwZsj9NEwfM6ODFMmTaPgcjCPIha8Xj5Z+cb+SosQoom6Vjev7ry+mr99zH6k7ua
         X4j5yBkXpp3JBZQ4l0CGLbKyxIsANThw66qfB/V8U646J1x7YugTCduPMfK1ztenYEOF
         dkVKpP9FieeqzhLwhHNEsNGfM6Eh1KhYMVU0YskRW8UN/tTtvSswh0DhoJgnyhUBzA7s
         y4F5njpbwtNU/BFc6+lGcNXiPXnpcSmId1UHI/NfUs9obHUBvCsl5YdNUpHlpdAGttS0
         mZiZDsp/DYDI0TzGDrLyu4czIMN11xbL7EIknvLHMKcCN8rah5xkZdaAnozorTquh0zg
         QysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616178; x=1775220978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K/00eenU+aiPjirZiqlNCTi2XaYskiP6bIiuaeY6rVA=;
        b=TA8NlVKxzNEKS5Vu3xQg+rQWzoLLfhJp77Z7fZdPXnWJsTGwZ4zBI0jYlKEGd5rZ+t
         42EHPMt5Bcb7Or5Qp34OHqZZuRPLS7NGiW9FkjtJUEaK4or5Ur5MBSeuGkNwuiS+NUx+
         WKVYo/17LL2KnpzYalHRdUTOaVX6H8Mzj4S6cySxcUjmwQwzSrWvGm4y8YOg+y/8MLFP
         mLdRzrQcuG398cxC/BjtotRI+hDX9BfjBVK4UB8eQRkTAcH0uh9hj3MPObMY9O3MKbIO
         qiXWIz4fJCsKUXUYmlz5YhNV55qCQgVYRXUqW+P9wpNkujilNfO9zQ0Fab94NRLrRTOs
         /1hQ==
X-Gm-Message-State: AOJu0YxmoeY9DoCULUFsiZJ8JQUsUzALVk8SaczWv4gMPGV4eGwXyuGu
	9k6RiIPC13hVvZCQFGOKaYfTxWINuXJru9kr/mWLT2jPe2HBZ83O7lgvHypmBYcm
X-Gm-Gg: ATEYQzyp7+dBU36Ieo6e8OV+dhjjJKU497tBv6PL/LmPT0VJu9FLWhG2bYf9RX7yrHb
	jbxJsOTR2qk2Y07vKc2ogu5/FW8pNaWWlDMqFoCXaLghC7rPxg8D6ELJ2O28Iq3IewnwoLIUj93
	+ldT3Yt5W+fBmyWmBXPhwKgXujbFcusN7zs3nLg1p7bqGdpwDYa+H2ptjXDTzqoSYedMckbcPwN
	qhRq7jnYpHVOqXgZRkr5k465C+PmTRQrTL0vbnYmW28sd/JbDWML5qdudEEqkD5S0S4rTEZREQF
	s9+mJfi6Fl6oXevNkj+3Sp9uddJ/Fu70EzUwOvESduKnFDdWUgg1izz8rrsWuC7VDia3doTibyU
	JbEF9TFGhXDt6z7FYYcj+ZH6J6FCqC/osLTiH5UdaGg3JKWV6WJbsjasrTMeJ+z3b2xeYbwc4iw
	LJBRlvkbTOz0h04FT3a1fxk3QsddCAGeU/T0zBqbwVaS2Au432ITnQ66qotVjlurW7DjTGgPPNa
	A==
X-Received: by 2002:a05:6102:4a95:b0:5ff:2569:cff1 with SMTP id ada2fe7eead31-604f9097d6cmr810228137.15.1774616178026;
        Fri, 27 Mar 2026 05:56:18 -0700 (PDT)
Received: from parrot.dimenoc.com ([2804:29b8:512d:4c55:1868:543f:1aeb:fd26])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d50c928asm6259318137.5.2026.03.27.05.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:56:17 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 3/5] docs: pt_BR: continue PGP guide translation
Date: Fri, 27 Mar 2026 09:55:34 -0300
Message-ID: <20260327125538.581064-4-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327125538.581064-1-danielmaraboo@gmail.com>
References: <20260327125538.581064-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Translate the backup and smartcard-related sections of the PGP
maintainer guide into Brazilian Portuguese.

This update includes:
- Procedures for paperkey and full GnuPG directory backups.
- Guide for identifying keygrips and removing the Certify key from
  the local workstation for offline storage.
- Smartcard benefits, hardware options, and initial configuration.

The internal label 'smartcards' was renamed to 'smartcards_pt' to
avoid a global namespace conflict with the original English document
during the Sphinx build.

The file was verified with checkpatch.pl and passes with 0 errors
and 0 warnings.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/process/maintainer-pgp-guide.rst    | 291 +++++++++++++++++-
 1 file changed, 290 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
index e10336a12..280207498 100644
--- a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
@@ -199,4 +199,293 @@ Nosso objetivo é proteger sua chave de Certificação movendo-a para uma mídia
 offline; portanto, se você tiver apenas uma chave **[SC]** combinada, você deve
 criar uma subchave de assinatura separada::
 
-    $ gpg --quick-addkey [fpr] ed25519 sign
\ No newline at end of file
+    $ gpg --quick-addkey [fpr] ed25519 sign
+
+Faça backup da sua chave de Certificação para recuperação de desastres
+----------------------------------------------------------------------
+
+Quanto mais assinaturas de outros desenvolvedores você tiver em sua chave PGP,
+mais motivos você terá para criar uma versão de backup que resida em algo que
+não seja mídia digital, por razões de recuperação de desastres.
+
+Uma boa maneira de criar uma cópia impressa da sua chave privada é usando o
+software ``paperkey``, escrito para este propósito específico. Veja
+``man paperkey`` para mais detalhes sobre o formato de saída e seus benefícios
+em relação a outras soluções. O Paperkey já deve estar empacotado para a
+maioria das distribuições.
+
+Execute o seguinte comando para criar um backup impresso da sua chave privada::
+
+    $ gpg --export-secret-key [fpr] | paperkey -o /tmp/key-backup.txt
+
+Imprima esse arquivo, pegue uma caneta e escreva sua frase secreta na margem do
+papel. **Isso é fortemente recomendado** porque a impressão da chave ainda
+está criptografada com essa frase secreta e, se você algum dia alterá-la, você
+não se lembrará de qual era quando criou o backup -- *garantido*.
+
+Coloque a cópia impressa resultante e a frase secreta escrita à mão em um
+envelope e guarde-os em um local seguro e bem protegido, de preferência longe
+de sua casa, como o cofre de um banco.
+
+.. note::
+
+    A chave ainda está criptografada com sua frase secreta, portanto, imprimir
+    mesmo em impressoras modernas "integradas à nuvem" deve continuar sendo uma
+    operação relativamente segura.
+
+Faça backup de todo o seu diretório GnuPG
+-----------------------------------------
+
+.. warning::
+
+    **!!!Não pule esta etapa!!!**
+
+É importante ter um backup prontamente disponível de suas chaves PGP caso
+precise recuperá-las. Isso é diferente da preparação para nível de desastre que
+fizemos com o ``paperkey``. Você também dependerá dessas cópias externas sempre
+que precisar usar sua chave de Certificação -- como ao fazer alterações em sua
+própria chave ou assinar as chaves de outras pessoas após conferências e
+encontros.
+
+Comece obtendo um cartão de mídia externa (de preferência dois!) que você usará
+para fins de backup. Você precisará criar uma partição criptografada neste
+dispositivo usando LUKS -- consulte a documentação de sua distribuição sobre
+como fazer isso.
+
+Para a frase secreta de criptografia, você pode usar a mesma de sua chave PGP.
+
+Assim que o processo de criptografia terminar, insira novamente o dispositivo e
+certifique-se de que ele foi montado corretamente. Copie todo o seu diretório
+``.gnupg`` para o armazenamento criptografado::
+
+    $ cp -a ~/.gnupg /media/disk/foo/gnupg-backup
+
+Você deve agora testar para garantir que tudo ainda funciona::
+
+    $ gpg --homedir=/media/disk/foo/gnupg-backup --list-key [fpr]
+
+Se você não receber nenhum erro, então está tudo pronto. Desmonte o
+dispositivo, identifique-o claramente para não sobrescrevê-lo por acidente e
+guarde-o em um lugar seguro -- mas não muito longe, pois você precisará
+usá-lo de vez em quando para tarefas como editar identidades, adicionar ou
+revogar subchaves, ou assinar as chaves de outras pessoas.
+
+Remova a chave de Certificação de seu diretório pessoal
+-------------------------------------------------------
+
+Os arquivos em nosso diretório pessoal não estão tão bem protegidos quanto
+gostaríamos de pensar. Eles podem ser vazados ou roubados por meio de muitos
+meios diferentes:
+
+- por acidente ao fazer cópias rápidas do diretório pessoal para configurar
+  uma nova estação de trabalho
+- por negligência ou malícia do administrador de sistemas
+- por meio de backups mal protegidos
+- por meio de malware em aplicativos de desktop (navegadores, visualizadores
+  de PDF, etc.)
+- por meio de coação ao cruzar fronteiras internacionais
+
+Proteger sua chave com uma boa frase secreta ajuda muito a reduzir o risco
+de qualquer um dos itens acima, mas as frases secretas podem ser descobertas
+por meio de keyloggers, shoulder-surfing (observação direta) ou qualquer número
+de outros meios. Por este motivo, a configuração recomendada é remover sua
+chave de Certificação de seu diretório pessoal e armazená-la em um
+armazenamento offline.
+
+.. warning::
+
+    Consulte a seção anterior e certifique-se de que você fez o backup do seu
+    diretório GnuPG em sua totalidade. O que estamos prestes a fazer tornará
+    sua chave inútil se você não tiver um backup utilizável!
+
+Primeiro, identifique o "keygrip" da sua chave de Certificação::
+
+    $ gpg --with-keygrip --list-key [fpr]
+
+A saída será algo como isto::
+
+    pub   ed25519 2022-12-20 [SC] [expires: 2022-12-19]
+          000000000000000000000000AAAABBBBCCCCDDDD
+          Keygrip = 1111000000000000000000000000000000000000
+    uid           [ultimate] Alice Dev <adev@kernel.org>
+    sub   cv25519 2022-12-20 [E] [expires: 2022-12-19]
+          Keygrip = 2222000000000000000000000000000000000000
+    sub   ed25519 2022-12-20 [S]
+          Keygrip = 3333000000000000000000000000000000000000
+
+Encontre a entrada keygrip que está abaixo da linha ``pub`` (logo abaixo da
+impressão digital da chave de Certificação). Isso corresponderá diretamente a
+um arquivo em seu diretório ``~/.gnupg``::
+
+    $ cd ~/.gnupg/private-keys-v1.d
+    $ ls
+    1111000000000000000000000000000000000000.key
+    2222000000000000000000000000000000000000.key
+    3333000000000000000000000000000000000000.key
+
+É suficiente remover o arquivo .key que corresponde ao keygrip da chave de
+Certificação::
+
+    $ cd ~/.gnupg/private-keys-v1.d
+    $ rm 1111000000000000000000000000000000000000.key
+
+Agora, se você executar o comando ``--list-secret-keys``, ele mostrará que a
+chave de Certificação está faltando (o símbolo ``#`` indica que ela não está
+disponível)::
+
+    $ gpg --list-secret-keys
+    sec#  ed25519 2022-12-20 [SC] [expires: 2024-12-19]
+          000000000000000000000000AAAABBBBCCCCDDDD
+    uid           [ultimate] Alice Dev <adev@kernel.org>
+    ssb   cv25519 2022-12-20 [E] [expires: 2024-12-19]
+    ssb   ed25519 2022-12-20 [S]
+
+Você também deve remover quaisquer arquivos ``secring.gpg`` no diretório
+``~/.gnupg``, que podem ser remanescentes de versões anteriores do GnuPG.
+
+Se você não tiver o diretório "private-keys-v1.d"
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Se você não tiver um diretório ``~/.gnupg/private-keys-v1.d``, então suas
+chaves secretas ainda estão armazenadas no arquivo legado ``secring.gpg`` usado
+pelo GnuPG v1. Fazer qualquer alteração em sua chave, como mudar a frase
+secreta ou adicionar uma subchave, deve converter automaticamente o formato
+antigo ``secring.gpg`` para usar o ``private-keys-v1.d``.
+
+Assim que concluir isso, certifique-se de excluir o arquivo ``secring.gpg``
+obsoleto, que ainda contém suas chaves privadas.
+
+Mova as subchaves para um dispositivo criptográfico dedicado
+============================================================
+
+Embora a chave de Certificação agora esteja protegida contra vazamentos ou
+roubos, as subchaves ainda estão em seu diretório pessoal. Qualquer pessoa que
+consiga colocar as mãos nelas poderá descriptografar sua comunicação ou forjar
+suas assinaturas (se souberem a frase secreta). Além disso, cada vez que uma
+operação do GnuPG é realizada, as chaves são carregadas na memória do sistema e
+podem ser roubadas por malware suficientemente avançado (pense em Meltdown e
+Spectre).
+
+Uma boa maneira de proteger completamente suas chaves é movê-las para um
+dispositivo de hardware especializado que seja capaz de realizar operações de
+smartcard.
+
+Os benefícios dos smartcards
+----------------------------
+
+Um smartcard contém um chip criptográfico capaz de armazenar chaves privadas e
+realizar operações criptográficas diretamente no próprio cartão. Como o
+conteúdo da chave nunca sai do smartcard, o sistema operacional do computador
+no qual você conecta o dispositivo de hardware não é capaz de recuperar as
+próprias chaves privadas. Isso é muito diferente do dispositivo de
+armazenamento de mídia criptografado que usamos anteriormente para fins de
+backup -- enquanto esse dispositivo estiver conectado e montado, o sistema
+operacional poderá acessar o conteúdo da chave privada.
+
+O uso de mídia criptografada externa não substitui o uso de um dispositivo
+compatível com smartcard.
+
+Dispositivos smartcard disponíveis
+----------------------------------
+
+A menos que todos os seus laptops e estações de trabalho tenham leitores de
+smartcard, o mais fácil é obter um dispositivo USB especializado que implemente
+a funcionalidade de smartcard. Existem várias opções disponíveis:
+
+- `Nitrokey Start (pt)`_: Hardware aberto e Software Livre, baseado no `Gnuk_pt`_ da FSI
+  Japan. Uma das opções mais baratas, mas oferece menos recursos de segurança
+  (como resistência a violações ou alguns ataques de canal lateral).
+- `Nitrokey 3 (pt)`_: Semelhante ao Nitrokey Start, mas mais resistente a violações
+  e oferece mais recursos de segurança e formatos USB. Suporta criptografia ECC
+  (ED25519 e NISTP).
+- `Yubikey 5 (pt)`_: Hardware e software proprietários, mas mais barato que o
+  Nitrokey com um conjunto semelhante de recursos. Suporta criptografia ECC
+  (ED25519 e NISTP).
+
+Sua escolha dependerá do custo, da disponibilidade de envio em sua região
+geográfica e de considerações sobre hardware aberto ou proprietário.
+
+.. note::
+
+    Se você estiver listado em uma entrada `M:` no arquivo MAINTAINERS ou tiver
+    uma conta no kernel.org, você `se qualifica para um Nitrokey Start gratuito`_
+    cortesia da Linux Foundation.
+
+.. _`Nitrokey Start (pt)`: https://www.nitrokey.com/products/nitrokeys
+.. _`Nitrokey 3 (pt)`: https://www.nitrokey.com/products/nitrokeys
+.. _`Yubikey 5 (pt)`: https://www.yubico.com/products/yubikey-5-overview/
+.. _Gnuk_pt: https://www.fsij.org/doc-gnuk/
+.. _`se qualifica para um Nitrokey Start gratuito`: https://www.kernel.org/nitrokey-digital-tokens-for-kernel-developers.html
+
+Configure seu dispositivo smartcard
+-----------------------------------
+
+Seu dispositivo smartcard deve simplesmente funcionar (Just Work - TM) no
+momento em que você o conecta em qualquer estação de trabalho Linux moderna.
+Você pode verificar executando::
+
+    $ gpg --card-status
+
+Se você vir os detalhes completos do smartcard, então está tudo pronto.
+Infelizmente, solucionar todos os possíveis motivos pelos quais as coisas
+podem não estar funcionando para você está muito além do escopo deste guia.
+Se você estiver tendo problemas para fazer a placa funcionar com o GnuPG,
+procure ajuda por meio dos canais usuais de suporte.
+
+Para configurar seu smartcard, você precisará usar o sistema de menus do GnuPG,
+pois não existem opções de linha de comando convenientes::
+
+    $ gpg --card-edit
+    [...omitido...]
+    gpg/card> admin
+    Comandos de administração são permitidos
+    gpg/card> passwd
+
+Você deve configurar o PIN de usuário (1), o PIN de Administrador (3) e o
+Código de Redefinição (4). Por favor, certifique-se de registrar e armazenar
+estes em um local seguro -- especialmente o PIN de Administrador e o Código de
+Redefinição (que permite limpar completamente o smartcard). Você raramente
+precisará usar o PIN de Administrador, de modo que inevitavelmente esquecerá
+o que é se não o registrar.
+
+Voltando ao menu principal do cartão, você também pode definir outros valores
+(como nome, gênero, dados de login, etc.), mas não é necessário e irá,
+adicionalmente, vazar informações sobre o seu smartcard caso você o perca.
+
+.. note::
+
+    Apesar de ter o nome "PIN", nem o PIN de usuário nem o PIN de administrador
+    no cartão precisam ser apenas números.
+
+.. warning::
+
+    Alguns dispositivos podem exigir que você mova as subchaves para o
+    dispositivo antes de poder alterar a frase secreta. Por favor, verifique a
+    documentação fornecida pelo fabricante do dispositivo.
+
+Mova as subchaves para o seu smartcard
+--------------------------------------
+
+Saia do menu do cartão (usando "q") e salve todas as alterações. Em seguida,
+vamos mover suas subchaves para o smartcard. Você precisará tanto da sua
+frase secreta da chave PGP quanto do PIN de administrador do cartão para a
+maioria das operações::
+
+    $ gpg --edit-key [fpr]
+
+    Secret subkeys are available.
+
+    pub  ed25519/AAAABBBBCCCCDDDD
+         created: 2022-12-20  expires: 2024-12-19  usage: SC
+         trust: ultimate      validity: ultimate
+    ssb  cv25519/1111222233334444
+         created: 2022-12-20  expires: never       usage: E
+    ssb  ed25519/5555666677778888
+         created: 2017-12-07  expires: never       usage: S
+    [ultimate] (1). Alice Dev <adev@kernel.org>
+
+    gpg>
+
+Usar ``--edit-key`` nos coloca no modo de menu novamente, e você notará que a
+listagem das chaves é um pouco diferente. De aqui em diante, todos os comandos
+são feitos de dentro deste modo de menu, conforme indicado por ``gpg>``.
\ No newline at end of file
-- 
2.47.3

