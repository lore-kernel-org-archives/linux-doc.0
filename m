Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313054;
	b=uzUFBEaK7asmH0J22ji35S7ajwO+WpMZHx7LtcMBMWy37gGGt/hRPnfK9z8hIwb+dF0T
	 fPB+/VfZjOAAI4tJOZQWMN8Xd5zbUzZYy9R4qejHS5QK0XLipsbSGUx/zWFFkivN7z+CF
	 ocAKuUYsFz01VaB0UVe17dpScuyquuB0duBHTj7HccxUuM65wl6aZDumsSoWM5g6TkXCv
	 lTuneiXKZBm/KY/NCVLnMRtuiozSJ0SsH2Zq98R1mlCk/uUQUr2TJIfidzYYp9+RuL2LS
	 WZojIO4zSbyIMrN6SuIgFTmG+afF6Wx5FLaqEv7Q7uvHtdCSfHKLfGuh8mDIdmPKWJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PlPLJM9OoYndjvn297QElKillLnuAQmLlG1wNYvPCDE=;
	b=43QixzbejTAHmQW4ZZH1c8+VEZFHgGqkycB2Ld0FC82X8lfghjCrO/eMH1DtyQv1CCwi
	 TSHkouHUqw92+9omPEwp8h3FS1rDNRHfNNKKinVJRALxzuP9zs3/7HgUA95OsdTlPCVmk
	 8mYZFPOjKOR7E8ID3926jebgUprGf2ZR49SjPF+bMazF5OFb4TaOHy+tuVnWvW2sNzArY
	 sUyNMV5Ry142MfFCn4I6NDit9Gx30BIElXJAi6tfBXt4gITzGkeyY4M9dRy8robg22G5u
	 ODdNIYX/hluZt7DWCTg16GtfgdA328Uo+PWogDHJ56aoDkSxZOILunPYYdihhZmaYnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QIYENdZu;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C5C606A323
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 22:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C5C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QIYENdZu
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9905d61449cso30088241.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 15:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793313052; x=1793917852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlPLJM9OoYndjvn297QElKillLnuAQmLlG1wNYvPCDE=;
        b=QIYENdZuNGR3+byxAFZH3qUPnGURoskM4tkRbJvTlXBCIDiX4IvFenjIggjIX5Rz/+
         kPTTbpdyvdN8yXQXED4ZGgdhk7paYlVo0lh5QD/JQ+/C9wtY7F9xEHsL80O+hFrI+mav
         LO85m162AiedoylgjdL71QPteCOE9bA8S3+sCPnCjYfqP2Q4W9HnZJpoD9ZU9vXiCNUg
         pbbgOSVXHxppck3yg388ozR4uQXmvX5blvgiU4pEyTZTfr0YGqm8F61OKU8Z2cF4pR+0
         kci1UKXO3PBOfw/qTJvghq0d47QBq64oDGFniCY/HzFUZXLuiO2CCZvQ/+J+3eM9hV6U
         0zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793313052; x=1793917852;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PlPLJM9OoYndjvn297QElKillLnuAQmLlG1wNYvPCDE=;
        b=F+EUVTitdP0M50293ivbBhbiknhkMik9BdHV9pBJ0T/73eZKGbRIh2xlCNK6cjzGap
         nwIRgqb4aC+TfMxkBsOycqw7urpRekVAdkV4PTAxnOmySsNVHF1qHjqgBcIbGy/sbfNm
         AgblNi7WDzC2jRW5USDXxIm1JrmnFEBAPQEajDT9NwgfnFZlzA0J++RrbmHc1h8qA9Nt
         IcUBiVgeo9XNsTiU7Lk84e3V++GrcmvbKWgW7VCkBeKh3eRXKZXn5vKbXTYcfASwGG5A
         t417ba+YXjEeCbEB3oO+7I1Mza8R2o6BvG9vZOxj5FFV1FNtfynDC+Lahy8PV7fNq8AA
         K9Hg==
X-Gm-Message-State: AFq9FYKmCzntV/52DemmmkXLKjlqRe10UL5v0dhLv2JAkQky+pLtYsvV
	AH6OsjD9Rz8nSt9ZRlFFd/haChupO4bb6vZzn4RoVRbwBsa/c6I86fsfSmOqQgeO
X-Gm-Gg: AYBFou3hq6PqB8hxBCMdoYZ58px9G8HyzXBhNJcKVZoeg9s6b1zzULqVSkIj+k6xfRp
	kA39jXWTETLvcm7vhLnaCIlD2xyP7/6qJRVp6uElTLS+wcpYG3xbABzgOZ7zlWsH/aIr4MtKQ1U
	DmoO1TX5KH0ETT0dBBId26+WWOn0tYkUNfC2oSiJUXFSej+vHK9ZH2g1BGgkCZDYMucp630Wa+K
	lOi1vnyRGUA+q+zY9xpAK9PBfhQYWq8RgsCbfOZ3oQjIkDIoLRUl0Vk73/DWw9n028UHMDE9mp/
	pHvULUTz39xq7mfMULU+YxuSBPZPoFqFcFCUQbwISlJDzw8iU+D6jNK8/NPqTUMq+0ufzq8Fgvw
	JbbJtNnZPjxrici5uXcw7tZUUUA58wxQHB2SBp6oCj6SXILcoC0IcURzSV8bGEeqAhLrra48eb7
	cylDdaJLF+vEsfVYfe9vSZchnoVqblTgpe0DWOpICbLKdciSEm32puL04d1VN4xSRR3Dc8YmopH
	gEb2dN1OXRgOsycWhsPNbTbkmUzJj7gDXyJWIRBjQeS+6pNLSN5OJs84pZt8ElAQj+zX6laakaE
	6fChn3ZtVHi+Nfnt8BWIlI0AZuRaXkShmKmoyXtl5HvDM/lt/MSBD0HBomrpWCAV4rLS6SKwtmU
	T5Q==
X-Received: by 2002:a05:6102:358f:b0:7cc:9d47:9c9 with SMTP id ada2fe7eead31-7d07269e791mr352159137.35.1793313051790;
        Thu, 29 Oct 2026 15:30:51 -0700 (PDT)
Received: from dell-pro-plus ([2804:29b8:5080:dd51:d55c:b555:e096:bdc4])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4c1603sm179946241.10.2026.10.29.15.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:30:51 -0700 (PDT)
From: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
To: linux-doc@vger.kernel.org
Cc: danielmaraboo@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	sashal@kernel.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] docs: translations: pt_BR: add maintainer PGP guide
Date: Thu, 29 Oct 2026 19:29:51 -0300
Message-ID: <20261029222951.19065-1-ic.gabrielribeiro@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate the maintainer PGP guide into Brazilian Portuguese and
add it to the pt_BR process index.

Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
---
Changes in v3:
- Preserve source certainty, tone, scope, and emphasis in reviewed passages.
- Restore the “all downloads” qualifier and remove the unsupported software detail.
- Clarify Nitrokey eligibility and Git tag-signature wording.

 .../translations/pt_BR/process/index.rst      |   1 +
 .../pt_BR/process/maintainer-pgp-guide.rst    | 898 ++++++++++++++++++
 2 files changed, 899 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index ccfe86de2..da92a7026 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -41,6 +41,7 @@ devem estar familiarizados.
    Requisitos mínimos <changes>
    Linguagem de programação <programming-language>
    Estilo de codificação do kernel Linux <coding-style>
+   Guia PGP para mantenedores do kernel <maintainer-pgp-guide>
    Informações sobre clientes de email para Linux <email-clients>
    Como aplicar patches <applying-patches>
    Backporting e resolução de conflitos <backporting>
diff --git a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
new file mode 100644
index 000000000..3b2666abc
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
@@ -0,0 +1,898 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _pt_BR_pgpguide:
+
+====================================
+Guia PGP para mantenedores do kernel
+====================================
+
+:Autor: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
+
+Este documento destina-se a desenvolvedores do kernel Linux, especialmente
+aos mantenedores de subsistemas. Ele contém uma parte das informações
+discutidas no guia mais abrangente
+`Proteção da integridade do código`_,
+publicado pela Linux Foundation. Leia esse documento para uma discussão
+mais aprofundada de alguns dos tópicos abordados aqui.
+
+.. _`Proteção da integridade do código`: https://github.com/lfit/itpol/blob/master/protecting-code-integrity.md
+
+O papel do PGP no desenvolvimento do kernel Linux
+=================================================
+
+O PGP ajuda a garantir a integridade do código produzido pela comunidade de
+desenvolvimento do kernel Linux e, em menor grau, a estabelecer canais de
+comunicação confiáveis entre desenvolvedores por meio de trocas de emails
+assinados com PGP.
+
+O código-fonte do kernel Linux está disponível em dois formatos principais:
+
+- Repositórios distribuídos de código-fonte (Git)
+- Snapshots periódicos de versões (tarballs)
+
+Tanto os repositórios Git quanto os tarballs incluem assinaturas PGP dos
+desenvolvedores que publicam versões oficiais do kernel. Essas assinaturas
+oferecem uma garantia criptográfica de que as versões disponíveis para
+download em kernel.org ou em outros espelhos são idênticas às que esses
+desenvolvedores têm em suas estações de trabalho. Para isso:
+
+- Os repositórios Git fornecem assinaturas PGP em todas as tags.
+- Os tarballs vêm acompanhados de assinaturas PGP separadas em todos os
+  downloads.
+
+Confiar nos desenvolvedores, não na infraestrutura
+--------------------------------------------------
+
+Desde o comprometimento de sistemas centrais do kernel.org em 2011, a
+principal diretriz operacional do projeto Kernel Archives é presumir que
+qualquer parte da infraestrutura pode ser comprometida a qualquer momento.
+Por isso, os administradores tomaram medidas deliberadas para enfatizar que
+a confiança deve ser depositada sempre nos desenvolvedores, nunca na
+infraestrutura que hospeda o código, por melhores que sejam as práticas de
+segurança desta última.
+
+Esse princípio orientador é o motivo da existência deste guia. Queremos
+garantir que, ao depositar confiança nos desenvolvedores, não estejamos
+apenas transferindo para outra pessoa a culpa por possíveis incidentes de
+segurança futuros. O objetivo é fornecer um conjunto de diretrizes que os
+desenvolvedores possam usar para criar um ambiente de trabalho seguro e
+proteger as chaves PGP usadas para estabelecer a integridade do próprio
+kernel Linux.
+
+Ferramentas PGP
+===============
+
+Use o GnuPG 2.4 ou posterior
+----------------------------
+
+Sua distribuição já deve ter o GnuPG instalado por padrão; basta verificar
+se você está usando uma versão recente o suficiente. Para conferir,
+execute::
+
+    $ gpg --version | head -n1
+
+Se você tiver a versão 2.4 ou posterior, está tudo certo. Se você tiver
+uma versão anterior, então estará usando uma versão do GnuPG que não é
+mais mantida e alguns comandos deste guia podem não funcionar.
+
+Configure as opções do gpg-agent
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+O agente do GnuPG é uma ferramenta auxiliar iniciada automaticamente sempre
+que você usa o comando ``gpg``. Ele é executado em segundo plano para
+armazenar em cache a frase secreta da chave privada. Há duas opções que
+permitem ajustar quando a frase secreta expira do cache:
+
+- ``default-cache-ttl`` (em segundos): se você usar a mesma chave novamente
+  antes de o tempo de vida expirar, a contagem será reiniciada por mais um
+  período. O padrão é 600 (10 minutos).
+- ``max-cache-ttl`` (em segundos): independentemente de quando a chave foi
+  usada pela última vez, ao expirar o tempo máximo contado desde a primeira
+  digitação da frase secreta, será necessário digitá-la novamente. O padrão
+  é 30 minutos.
+
+Se algum desses valores padrão for curto (ou longo) demais, edite o arquivo
+``~/.gnupg/gpg-agent.conf`` para definir seus próprios valores::
+
+    # ttl normal de 30 minutos e ttl máximo de 2 horas
+    default-cache-ttl 1800
+    max-cache-ttl 7200
+
+.. note::
+
+    Não é mais necessário iniciar o gpg-agent manualmente no início da
+    sessão do shell. Talvez seja bom conferir seus arquivos rc e remover
+    configurações que você tenha mantido para versões antigas do GnuPG, pois
+    elas podem não funcionar corretamente.
+
+Proteja sua chave PGP
+=====================
+
+Este guia pressupõe que você já tenha uma chave PGP para usar no
+desenvolvimento do kernel Linux. Se ainda não tiver uma, consulte o
+documento
+`Proteção da integridade do código`_,
+mencionado acima, para saber como criar uma.
+
+Você também deve criar uma nova chave se a atual for mais fraca que RSA de
+2048 bits.
+
+Entenda as subchaves PGP
+------------------------
+
+Uma chave PGP raramente consiste em um único par de chaves; normalmente, é
+um conjunto de subchaves independentes, que podem ser usadas para
+finalidades diferentes conforme as capacidades atribuídas na criação. O PGP
+define quatro capacidades que uma chave pode ter:
+
+- Chaves **[S]** podem ser usadas para assinar
+- Chaves **[E]** podem ser usadas para criptografar
+- Chaves **[A]** podem ser usadas para autenticação
+- Chaves **[C]** podem ser usadas para certificar outras chaves
+
+A chave com a capacidade **[C]** costuma ser chamada de chave “mestre”, mas
+essa terminologia é enganosa: sugere que a chave de certificação pode
+substituir qualquer outra subchave da mesma cadeia, como uma chave-mestra
+física que abre fechaduras feitas para outras chaves. Como não é esse o
+caso, este guia usará “chave de certificação” para evitar ambiguidades.
+
+É fundamental entender plenamente o seguinte:
+
+1. Todas as subchaves são totalmente independentes. Se você perder uma
+   subchave privada, não será possível restaurá-la nem recriá-la a partir
+   de outra chave privada da cadeia.
+2. Com exceção da chave de certificação, pode haver várias subchaves com
+   capacidades idênticas (por exemplo, duas subchaves de criptografia
+   válidas e três de assinatura, mas apenas uma subchave de certificação
+   válida). Todas são independentes: uma mensagem criptografada para uma
+   subchave **[E]** não pode ser descriptografada com nenhuma outra
+   subchave **[E]** que você tenha.
+3. Uma única subchave pode ter várias capacidades (por exemplo, a chave
+   **[C]** também pode ser a chave **[S]**).
+
+A chave com a capacidade **[C]** (certificação) é a única que pode
+estabelecer relações com outras chaves. Somente ela pode:
+
+- Adicionar ou revogar outras chaves (subchaves) com capacidades S/E/A.
+- Adicionar, alterar ou revogar identidades (UIDs) associadas à chave.
+- Adicionar ou alterar a data de expiração da própria chave ou de qualquer
+  subchave.
+- Assinar as chaves de outras pessoas para fins de rede de confiança.
+
+Por padrão, ao gerar novas chaves, o GnuPG cria:
+
+- Uma subchave com as capacidades de certificação e assinatura (**[SC]**).
+- Uma subchave separada com a capacidade de criptografia (**[E]**).
+
+Se você usou os parâmetros padrão ao gerar a chave, ela terá essa
+estrutura. Confira executando ``gpg --list-secret-keys``, por exemplo::
+
+    sec   ed25519 2022-12-20 [SC] [expires: 2024-12-19]
+          000000000000000000000000AAAABBBBCCCCDDDD
+    uid           [ultimate] Alice Dev <adev@kernel.org>
+    ssb   cv25519 2022-12-20 [E] [expires: 2024-12-19]
+
+A linha longa sob a entrada ``sec`` é a impressão digital da chave. Nos
+exemplos abaixo, ``[fpr]`` representa essa cadeia de 40 caracteres.
+
+Use uma frase secreta forte
+---------------------------
+
+O GnuPG usa frases secretas para criptografar suas chaves privadas antes de
+armazená-las no disco. Assim, mesmo que todo o diretório ``.gnupg`` seja
+exposto ou roubado, os invasores não poderão usar as chaves privadas sem
+obter primeiro a frase secreta para descriptografá-las.
+
+É absolutamente essencial proteger suas chaves privadas com uma frase
+secreta forte. Para defini-la ou alterá-la, use::
+
+    $ gpg --change-passphrase [fpr]
+
+Crie uma subchave de assinatura separada
+----------------------------------------
+
+Nosso objetivo é proteger a chave de certificação transferindo-a para uma
+mídia offline. Portanto, se você tiver apenas uma chave combinada **[SC]**,
+crie uma subchave de assinatura separada::
+
+    $ gpg --quick-addkey [fpr] ed25519 sign
+
+Faça backup da chave de certificação para recuperação de desastres
+------------------------------------------------------------------
+
+Quanto mais assinaturas de outros desenvolvedores sua chave PGP tiver, mais
+motivos você terá para criar uma cópia de backup em algo que não seja uma
+mídia digital, para recuperação de desastres.
+
+Uma boa maneira de criar uma cópia impressa da chave privada é usar o
+software ``paperkey``, desenvolvido para essa finalidade. Consulte
+``man paperkey`` para obter detalhes sobre o formato da saída e suas
+vantagens em relação a outras soluções. O Paperkey já deve estar disponível
+nos pacotes da maioria das distribuições.
+
+Execute o comando a seguir para criar um backup impresso da chave privada::
+
+    $ gpg --export-secret-key [fpr] | paperkey -o /tmp/key-backup.txt
+
+Imprima esse arquivo e escreva à mão sua frase secreta na margem. **Isso é
+altamente recomendado**, pois a impressão da chave continua criptografada
+por essa frase secreta. Se você a alterar, não se lembrará da frase usada
+quando criou o backup — *garantidamente*.
+
+Coloque a impressão e a frase secreta escrita à mão em um envelope e
+guarde-o em um local seguro e bem protegido, de preferência fora de casa,
+como um cofre bancário.
+
+.. note::
+
+    A chave continua criptografada pela sua frase secreta; por isso,
+    imprimi-la — mesmo em impressoras modernas integradas à nuvem — deve
+    ser uma operação relativamente segura.
+
+Faça backup de todo o diretório do GnuPG
+----------------------------------------
+
+.. warning::
+
+    **!!!Não pule esta etapa!!!**
+
+É importante ter um backup das chaves PGP facilmente disponível para
+recuperação. Isso é diferente da preparação para desastres que fizemos com
+o ``paperkey``. Você também precisará dessas cópias externas sempre que for
+usar a chave de certificação, por exemplo, para alterar sua própria chave
+ou assinar chaves de outras pessoas após conferências e encontros.
+
+Comece obtendo uma mídia de armazenamento externa (de preferência, duas!)
+para usar no backup. Será necessário criar nela uma partição criptografada
+com LUKS; consulte a documentação da sua distribuição para saber como fazer
+isso.
+
+Você pode usar para criptografar a mídia a mesma frase secreta da chave
+PGP.
+
+Depois de concluir a criptografia, reinsira o dispositivo e confira se ele
+foi montado corretamente. Copie todo o diretório ``.gnupg`` para o
+armazenamento criptografado::
+
+    $ cp -a ~/.gnupg /media/disk/foo/gnupg-backup
+
+Agora teste se tudo continua funcionando::
+
+    $ gpg --homedir=/media/disk/foo/gnupg-backup --list-key [fpr]
+
+Se não houver erros, está tudo certo. Desmonte o dispositivo, identifique-o
+claramente para não sobrescrevê-lo por acidente e guarde-o em um local
+seguro — mas não tão distante, pois você precisará dele de tempos em tempos
+para editar identidades, adicionar ou revogar subchaves ou assinar chaves
+de outras pessoas.
+
+Remova a chave de certificação do seu diretório pessoal
+-------------------------------------------------------
+
+Os arquivos do diretório pessoal não estão tão protegidos quanto gostamos
+de imaginar. Eles podem ser expostos ou roubados de várias maneiras:
+
+- Por acidente, ao fazer cópias rápidas do diretório pessoal para
+  configurar uma nova estação de trabalho.
+- Por negligência ou má-fé de um administrador de sistemas.
+- Por meio de backups mal protegidos.
+- Por malware em aplicativos de desktop (navegadores, leitores de PDF
+  etc.).
+- Por coerção ao cruzar fronteiras internacionais.
+
+Proteger sua chave com uma boa frase secreta reduz bastante esses riscos,
+mas frases secretas podem ser descobertas por keyloggers, observação por
+cima do ombro ou vários outros meios. Por isso, recomenda-se remover a
+chave de certificação do diretório pessoal e guardá-la em uma mídia
+offline.
+
+.. warning::
+
+    Consulte a seção anterior e confirme que fez backup de todo o diretório
+    do GnuPG. O procedimento a seguir inutilizará sua chave se você não
+    tiver um backup utilizável!
+
+Primeiro, identifique o ``keygrip`` da chave de certificação::
+
+    $ gpg --with-keygrip --list-key [fpr]
+
+A saída será semelhante a esta::
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
+Localize a entrada ``keygrip`` logo abaixo da linha ``pub`` (imediatamente
+abaixo da impressão digital da chave de certificação). Ela corresponde
+diretamente a um arquivo no diretório ``~/.gnupg``::
+
+    $ cd ~/.gnupg/private-keys-v1.d
+    $ ls
+    1111000000000000000000000000000000000000.key
+    2222000000000000000000000000000000000000.key
+    3333000000000000000000000000000000000000.key
+
+Basta remover o arquivo ``.key`` correspondente ao ``keygrip`` da chave de
+certificação::
+
+    $ cd ~/.gnupg/private-keys-v1.d
+    $ rm 1111000000000000000000000000000000000000.key
+
+Agora, ao executar ``--list-secret-keys``, você verá que a chave de
+certificação está ausente (o caractere ``#`` indica que ela não está
+disponível)::
+
+    $ gpg --list-secret-keys
+    sec#  ed25519 2022-12-20 [SC] [expires: 2024-12-19]
+          000000000000000000000000AAAABBBBCCCCDDDD
+    uid           [ultimate] Alice Dev <adev@kernel.org>
+    ssb   cv25519 2022-12-20 [E] [expires: 2024-12-19]
+    ssb   ed25519 2022-12-20 [S]
+
+Remova também quaisquer arquivos ``secring.gpg`` do diretório ``~/.gnupg``
+que tenham restado de versões anteriores do GnuPG.
+
+Se você não tiver o diretório ``private-keys-v1.d``
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Se você não tiver o diretório ``~/.gnupg/private-keys-v1.d``, suas chaves
+secretas ainda estarão armazenadas no arquivo legado ``secring.gpg``, usado
+pelo GnuPG v1. Qualquer alteração na chave, como mudar a frase secreta ou
+adicionar uma subchave, deve converter automaticamente o formato antigo
+``secring.gpg`` para ``private-keys-v1.d``.
+
+Depois disso, exclua o arquivo obsoleto ``secring.gpg``, que ainda contém
+suas chaves privadas.
+
+Transfira as subchaves para um dispositivo criptográfico dedicado
+=================================================================
+
+Embora a chave de certificação agora esteja protegida contra exposição ou
+roubo, as subchaves continuam no diretório pessoal. Quem conseguir obtê-las
+poderá descriptografar suas comunicações ou falsificar suas assinaturas (se
+souber a frase secreta). Além disso, a cada operação do GnuPG, as chaves
+são carregadas na memória do sistema e podem ser roubadas por malware
+suficientemente avançado (como o que explora Meltdown e Spectre).
+
+Uma boa maneira de proteger totalmente suas chaves é transferi-las para um
+dispositivo de hardware especializado que ofereça suporte a operações de
+cartão inteligente.
+
+Vantagens dos cartões inteligentes
+----------------------------------
+
+Um cartão inteligente contém um chip criptográfico capaz de armazenar
+chaves privadas e executar operações criptográficas diretamente no próprio
+cartão. Como o conteúdo das chaves nunca sai do cartão, o sistema
+operacional do computador ao qual o dispositivo está conectado não consegue
+recuperar as chaves privadas. Isso difere bastante da mídia criptografada
+usada anteriormente para backup: enquanto ela estiver conectada e montada,
+o sistema operacional poderá acessar o conteúdo das chaves privadas.
+
+Usar uma mídia externa criptografada não substitui um dispositivo
+compatível com cartão inteligente.
+
+Dispositivos de cartão inteligente disponíveis
+----------------------------------------------
+
+A menos que todos os seus laptops e estações de trabalho tenham leitores de
+cartão inteligente, a opção mais simples é obter um dispositivo USB
+especializado que implemente essa funcionalidade. Há várias opções
+disponíveis:
+
+- `Nitrokey Start`_: hardware aberto e software
+  livre, baseado no `Gnuk`_, do FSI Japan. É uma das opções
+  mais baratas, mas oferece menos recursos de segurança (como resistência a
+  adulteração e a alguns ataques de canal lateral).
+- `Nitrokey 3`_: semelhante ao Nitrokey Start, mas mais resistente a
+  adulterações e oferece mais recursos de segurança e formatos USB. Oferece
+  suporte à criptografia de curva elíptica (ED25519 e NISTP).
+- `YubiKey 5`_: hardware e software proprietários, mas
+  mais barato que o Nitrokey e com conjunto de recursos semelhante. Oferece
+  suporte à criptografia de curva elíptica (ED25519 e NISTP).
+
+Sua escolha dependerá do custo, da disponibilidade de envio na sua região e
+de suas considerações sobre hardware aberto ou proprietário.
+
+.. note::
+
+    Se você estiver listado em uma entrada ``M:`` do arquivo MAINTAINERS ou
+    tiver uma conta em kernel.org, você tem direito a um
+    `Nitrokey Start gratuito`_, cortesia da Linux Foundation.
+
+.. _`Nitrokey Start`: https://www.nitrokey.com/products/nitrokeys
+.. _`Nitrokey 3`: https://www.nitrokey.com/products/nitrokeys
+.. _`YubiKey 5`: https://www.yubico.com/products/yubikey-5-overview/
+.. _Gnuk: https://www.fsij.org/doc-gnuk/
+.. _`Nitrokey Start gratuito`: https://www.kernel.org/nitrokey-digital-tokens-for-kernel-developers.html
+
+Configure seu dispositivo de cartão inteligente
+-----------------------------------------------
+
+Seu dispositivo de cartão inteligente deve simplesmente funcionar assim que
+for conectado a qualquer estação de trabalho Linux moderna. Confira
+executando::
+
+    $ gpg --card-status
+
+Se os detalhes completos do cartão forem exibidos, está tudo certo.
+Infelizmente, solucionar todos os possíveis motivos para o dispositivo não
+funcionar está fora do escopo deste guia. Se tiver problemas para fazê-lo
+funcionar com o GnuPG, procure ajuda nos canais de suporte habituais.
+
+Para configurar o cartão inteligente, use o sistema de menus do GnuPG, pois
+não há opções convenientes de linha de comando::
+
+    $ gpg --card-edit
+    [...omitted...]
+    gpg/card> admin
+    Admin commands are allowed
+    gpg/card> passwd
+
+Defina o PIN de usuário (1), o PIN de administrador (3) e o código de
+redefinição (4). Anote-os e guarde-os em um local seguro, especialmente o
+PIN de administrador e o código de redefinição (que permite apagar
+completamente o cartão). Como você raramente precisará do PIN de
+administrador, inevitavelmente o esquecerá se não o registrar.
+
+De volta ao menu principal do cartão, você também pode definir outros
+valores (como nome, gênero, dados de login etc.), mas isso não é necessário
+e, além disso, revelará informações sobre o cartão caso você o perca.
+
+.. note::
+
+    Apesar do nome “PIN”, nem o PIN de usuário nem o PIN de administrador
+    do cartão precisam ser números.
+
+.. warning::
+
+    Alguns dispositivos podem exigir que você transfira as subchaves para o
+    cartão antes de alterar a frase secreta. Consulte a documentação
+    fornecida pelo fabricante.
+
+Transfira as subchaves para o cartão inteligente
+------------------------------------------------
+
+Saia do menu do cartão (digitando ``q``) e salve todas as alterações. Em
+seguida, transfira as subchaves para o cartão inteligente. Na maioria das
+operações, você precisará da frase secreta da chave PGP e do PIN de
+administrador do cartão::
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
+O comando ``--edit-key`` abre novamente o modo de menu, e a listagem de
+chaves será um pouco diferente. A partir daqui, todos os comandos são
+executados nesse menu, indicado pelo prompt ``gpg>``.
+
+Primeiro, selecione a chave que será transferida para o cartão digitando
+``key 1`` (é a primeira da lista, a subchave **[E]**)::
+
+    gpg> key 1
+
+Na saída, ``ssb*`` deve aparecer agora na chave **[E]**. O ``*`` indica
+qual chave está “selecionada”. Ele funciona como um *alternador*: se você
+digitar ``key 1`` novamente, o ``*`` desaparecerá e a chave deixará de
+estar selecionada.
+
+Agora transfira essa chave para o cartão inteligente::
+
+    gpg> keytocard
+    Please select where to store the key:
+       (2) Encryption key
+    Your selection? 2
+
+Como essa é a chave **[E]**, escolha o espaço de criptografia. Ao confirmar
+a seleção, primeiro será solicitada a frase secreta da chave PGP e, depois,
+o PIN de administrador. Se o comando terminar sem erros, a chave terá sido
+transferida.
+
+**Importante**: digite ``key 1`` novamente para desmarcar a primeira chave
+e ``key 2`` para selecionar a chave **[S]**::
+
+    gpg> key 1
+    gpg> key 2
+    gpg> keytocard
+    Please select where to store the key:
+       (1) Signature key
+       (3) Authentication key
+    Your selection? 1
+
+A chave **[S]** pode ser usada tanto para assinatura quanto para
+autenticação, mas queremos colocá-la no espaço de assinatura; por isso,
+escolha (1). Mais uma vez, se o comando terminar sem erros, a operação foi
+bem-sucedida::
+
+    gpg> q
+    Save changes? (y/N) y
+
+Ao salvar as alterações, as chaves transferidas para o cartão serão
+removidas do diretório pessoal (mas tudo bem: temos backups caso precisemos
+repetir o procedimento para substituir o cartão).
+
+Verifique se as chaves foram transferidas
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Se você executar ``--list-secret-keys`` agora, verá uma pequena diferença
+na saída::
+
+    $ gpg --list-secret-keys
+    sec#  ed25519 2022-12-20 [SC] [expires: 2024-12-19]
+          000000000000000000000000AAAABBBBCCCCDDDD
+    uid           [ultimate] Alice Dev <adev@kernel.org>
+    ssb>  cv25519 2022-12-20 [E] [expires: 2024-12-19]
+    ssb>  ed25519 2022-12-20 [S]
+
+O caractere ``>`` em ``ssb>`` indica que a subchave está disponível apenas
+no cartão inteligente. Se você voltar ao diretório das chaves secretas,
+verá que os arquivos ``.key`` foram substituídos por arquivos stub::
+
+    $ cd ~/.gnupg/private-keys-v1.d
+    $ strings *.key | grep 'private-key'
+
+A saída deve conter ``shadowed-private-key``, indicando que esses arquivos
+são apenas stubs e que o conteúdo real está no cartão inteligente.
+
+Verifique se o cartão inteligente está funcionando
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Para verificar se o cartão inteligente está funcionando como esperado, crie
+uma assinatura::
+
+    $ echo "Hello world" | gpg --clearsign > /tmp/test.asc
+    $ gpg --verify /tmp/test.asc
+
+No primeiro comando, será solicitado o PIN do cartão inteligente; depois de
+executar ``gpg --verify``, deverá aparecer “Good signature”.
+
+Parabéns! Agora ficou extremamente difícil roubar sua identidade digital de
+desenvolvedor.
+
+Outras operações comuns do GnuPG
+--------------------------------
+
+Veja uma referência rápida de operações comuns que você precisará realizar
+com sua chave PGP.
+
+Monte seu armazenamento offline seguro
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Você precisará da chave de certificação para qualquer uma das operações
+abaixo. Primeiro, monte o armazenamento de backup offline e informe ao
+GnuPG que deve usá-lo::
+
+    $ export GNUPGHOME=/media/disk/foo/gnupg-backup
+    $ gpg --list-secret-keys
+
+Confira se aparece ``sec``, e não ``sec#`` (``#`` significa que a chave não
+está disponível e que você ainda está usando o diretório pessoal habitual).
+
+Estenda a data de expiração da chave
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Por padrão, a chave de certificação expira dois anos após a criação. Isso é
+feito por segurança e também faz com que chaves obsoletas desapareçam dos
+servidores de chaves com o tempo.
+
+Para estender a expiração da chave por um ano a partir da data atual,
+execute::
+
+    $ gpg --quick-set-expire [fpr] 1y
+
+Você também pode usar uma data específica, se for mais fácil de lembrar
+(por exemplo, seu aniversário, 1º de janeiro ou o Dia do Canadá)::
+
+    $ gpg --quick-set-expire [fpr] 2038-07-01
+
+Lembre-se de enviar a chave atualizada novamente aos servidores de chaves::
+
+    $ gpg --send-key [fpr]
+
+Atualize o diretório de trabalho após as alterações
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Depois de alterar a chave usando o armazenamento offline, importe essas
+alterações de volta para o diretório de trabalho habitual::
+
+    $ gpg --export | gpg --homedir ~/.gnupg --import
+    $ unset GNUPGHOME
+
+Use o gpg-agent via SSH
+~~~~~~~~~~~~~~~~~~~~~~~
+
+Você pode encaminhar o gpg-agent via SSH se precisar assinar tags ou
+commits em um sistema remoto. Consulte as instruções no wiki do GnuPG:
+
+- `Encaminhamento do agente via SSH`_
+
+O encaminhamento funciona melhor se você puder alterar as configurações do
+servidor sshd remoto.
+
+.. _`Encaminhamento do agente via SSH`: https://wiki.gnupg.org/AgentForwarding
+
+Use o PGP com o Git
+===================
+
+Um dos principais recursos do Git é sua natureza descentralizada: depois de
+clonar um repositório para o seu sistema, você tem todo o histórico do
+projeto, incluindo tags, commits e branches. Mas, com centenas de cópias de
+repositórios por aí, como verificar se a sua cópia de linux.git não foi
+adulterada por terceiros mal-intencionados?
+
+E se for descoberto código malicioso no kernel e a linha “Author” do commit
+disser que foi você, embora tenha certeza de que
+`não esteve envolvido`_?
+
+Para resolver esses dois problemas, o Git integrou o PGP. Tags assinadas
+comprovam a integridade do repositório, garantindo que seu conteúdo é
+exatamente igual ao da estação de trabalho de quem criou a tag. Já commits
+assinados tornam quase impossível alguém se passar por você sem acesso às
+suas chaves PGP.
+
+.. _`não esteve envolvido`: https://github.com/jayphelps/git-blame-someone-else
+
+Configure o Git para usar sua chave PGP
+---------------------------------------
+
+Se houver apenas uma chave secreta no seu chaveiro, não será necessário
+fazer nada: ela será usada por padrão. Se houver várias, você pode indicar
+ao Git qual delas deve usar (``[fpr]`` é a impressão digital da chave)::
+
+    $ git config --global user.signingKey [fpr]
+
+Como trabalhar com tags assinadas
+---------------------------------
+
+Para criar uma tag assinada, passe a opção ``-s`` ao comando ``tag``::
+
+    $ git tag -s [tagname]
+
+Recomendamos sempre assinar as tags do Git. Assim, outros desenvolvedores
+podem confirmar que o repositório do qual estão obtendo o código não foi
+adulterado maliciosamente.
+
+Como verificar tags assinadas
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Para verificar uma tag assinada, use o comando ``verify-tag``::
+
+    $ git verify-tag [tagname]
+
+Ao obter uma tag de outro fork do repositório do projeto, o Git deve
+verificar automaticamente a assinatura da tag que você está obtendo e
+mostrar o resultado durante a operação de merge::
+
+    $ git pull [url] tags/sometag
+
+A mensagem do merge será semelhante a esta::
+
+    Merge tag 'sometag' of [url]
+
+    [Tag message]
+
+    # gpg: Signature made [...]
+    # gpg: Good signature from [...]
+
+Para verificar a tag Git de outra pessoa, primeiro importe a chave PGP
+dela. Consulte a seção “:ref:`pt_BR_verify_identities`” abaixo.
+
+Configure o Git para sempre assinar tags anotadas
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Se você estiver criando uma tag anotada, provavelmente vai querer
+assiná-la. Para fazer com que o Git sempre assine tags anotadas, defina uma
+opção global de configuração::
+
+    $ git config --global tag.forceSignAnnotated true
+
+Como trabalhar com commits assinados
+------------------------------------
+
+Também é possível criar commits assinados, mas isso tem utilidade limitada
+no desenvolvimento do kernel Linux. O fluxo de contribuição depende do
+envio de patches, e a conversão de commits em patches não preserva as
+assinaturas PGP dos commits. Além disso, ao rebasear seu repositório sobre
+uma versão mais recente da árvore upstream, as assinaturas PGP dos commits
+são descartadas. Por isso, a maioria dos desenvolvedores do kernel não
+assina commits e ignora commits assinados em repositórios externos usados
+no trabalho.
+
+Ainda assim, se sua árvore Git de trabalho estiver disponível publicamente
+em algum serviço de hospedagem (kernel.org, infradead.org, ozlabs.org ou
+outros), recomenda-se assinar todos os seus commits, mesmo que os
+desenvolvedores upstream não se beneficiem diretamente disso.
+
+Recomendamos isso pelos seguintes motivos:
+
+1. Se algum dia for necessário fazer perícia no código ou rastrear sua
+   procedência, até mesmo árvores mantidas externamente com assinaturas PGP
+   nos commits serão valiosas para esses fins.
+2. Se você precisar clonar novamente seu repositório local (por exemplo,
+   após reinstalar o sistema), pode verificar a integridade do repositório
+   antes de continuar o trabalho.
+3. Se alguém precisar fazer cherry-pick dos seus commits, poderá verificar
+   rapidamente a integridade deles antes de aplicá-los.
+
+Crie commits assinados
+~~~~~~~~~~~~~~~~~~~~~~
+
+Para criar um commit assinado, passe a opção ``-S`` ao comando
+``git commit`` (é ``-S`` maiúsculo para não conflitar com outra opção)::
+
+    $ git commit -S
+
+Configure o Git para sempre assinar commits
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Você pode configurar o Git para sempre assinar commits::
+
+    git config --global commit.gpgSign true
+
+.. note::
+
+    Configure o ``gpg-agent`` antes de ativar essa opção.
+
+.. _pt_BR_verify_identities:
+
+Como trabalhar com patches assinados
+------------------------------------
+
+É possível usar sua chave PGP para assinar patches enviados às listas de
+desenvolvedores do kernel. Como os mecanismos de assinatura de email
+existentes (PGP-Mime ou PGP-inline) costumam atrapalhar a revisão de
+código, use a ferramenta criada pelo kernel.org para inserir assinaturas de
+atestação criptográfica nos cabeçalhos das mensagens, à semelhança do DKIM:
+
+- `Atestação de patches do Patatt`_
+
+.. _`Atestação de patches do Patatt`: https://pypi.org/project/patatt/
+
+Instale e configure o patatt
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. note::
+
+    Se você usa o B4 para enviar patches, o patatt já está instalado e
+    integrado ao seu fluxo de trabalho.
+
+O patatt já está empacotado em muitas distribuições; procure primeiro nos
+repositórios da sua distribuição. Também é possível instalá-lo pelo PyPI
+com ``pip install patatt``.
+
+Se sua chave PGP já estiver configurada no Git (pelo parâmetro
+``user.signingKey``), o patatt não precisa de nenhuma outra configuração.
+Para começar a assinar patches, instale o hook de git-send-email no
+repositório desejado::
+
+    patatt install-hook
+
+A partir daí, qualquer patch enviado com ``git send-email`` será assinado
+automaticamente com sua assinatura criptográfica.
+
+Verifique assinaturas do patatt
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Se você usa ``b4`` para obter e aplicar patches, ele tentará verificar
+automaticamente todas as assinaturas DKIM e patatt encontradas, por
+exemplo::
+
+    $ b4 am 20220720205013.890942-1-broonie@kernel.org
+    [...]
+    Checking attestation on all messages, may take a moment...
+    ---
+      ✓ [PATCH v1 1/3] kselftest/arm64: Correct buffer allocation for SVE Z registers
+      ✓ [PATCH v1 2/3] arm64/sve: Document our actual ABI for clearing registers on syscall
+      ✓ [PATCH v1 3/3] kselftest/arm64: Enforce actual ABI for SVE syscalls
+      ---
+      ✓ Signed: openpgp/broonie@kernel.org
+      ✓ Signed: DKIM/kernel.org
+
+.. note::
+
+    O patatt e o B4 ainda estão em desenvolvimento ativo. Consulte a
+    documentação mais recente desses projetos para conhecer recursos novos
+    ou atualizados.
+
+Como verificar a identidade de desenvolvedores do kernel
+========================================================
+
+Assinar tags e commits é simples, mas como verificar se a chave usada para
+assinar algo pertence de fato a um desenvolvedor do kernel, e não a um
+impostor mal-intencionado?
+
+Configure a obtenção automática de chaves com WKD e DANE
+--------------------------------------------------------
+
+Se você ainda não tem um conjunto amplo de chaves públicas de outros
+desenvolvedores, pode começar a montar seu chaveiro usando a descoberta e a
+obtenção automáticas de chaves. O GnuPG pode aproveitar outras tecnologias
+de confiança delegada — DNSSEC e TLS — para ajudar, caso pareça complicado
+criar do zero sua própria rede de confiança.
+
+Adicione o seguinte ao arquivo ``~/.gnupg/gpg.conf``::
+
+    auto-key-locate wkd,dane,local
+    auto-key-retrieve
+
+A autenticação de entidades nomeadas baseada em DNS (“DANE”) publica chaves
+públicas no DNS e as protege com zonas assinadas por DNSSEC. O Web Key
+Directory (“WKD”) é uma alternativa que usa consultas HTTPS para a mesma
+finalidade. Ao usar DANE ou WKD para localizar chaves públicas, o GnuPG
+valida as assinaturas DNSSEC ou os certificados TLS, respectivamente, antes
+de adicionar as chaves obtidas automaticamente ao seu chaveiro.
+
+O kernel.org publica o WKD de todos os desenvolvedores que têm contas no
+site. Depois de fazer as alterações acima em ``gpg.conf``, você pode obter
+automaticamente as chaves de Linus Torvalds e Greg Kroah-Hartman (caso
+ainda não as tenha)::
+
+    $ gpg --locate-keys torvalds@kernel.org gregkh@kernel.org
+
+Se você tiver uma conta no kernel.org,
+`adicione o UID do kernel.org à sua chave`_ para tornar o WKD
+mais útil aos demais desenvolvedores do kernel.
+
+.. _`adicione o UID do kernel.org à sua chave`: https://korg.docs.kernel.org/mail.html#adding-a-kernel-org-uid-to-your-pgp-key
+
+Rede de confiança (WOT) versus confiança no primeiro uso (TOFU)
+---------------------------------------------------------------
+
+O PGP incorpora um mecanismo de delegação de confiança chamado “Web of
+Trust” (rede de confiança). Em essência, ele tenta substituir a necessidade
+de autoridades certificadoras centralizadas, como no mundo HTTPS/TLS. Em
+vez de vários fabricantes de software determinarem quem deve ser sua
+entidade certificadora confiável, o PGP deixa essa responsabilidade para
+cada usuário.
+
+Infelizmente, poucas pessoas entendem como funciona a rede de confiança.
+Embora ela ainda seja uma parte importante da especificação OpenPGP,
+versões recentes do GnuPG (2.2 e posteriores) implementaram um mecanismo
+alternativo chamado “Trust on First Use” (TOFU, confiança no primeiro uso).
+Pense no TOFU como uma abordagem de confiança semelhante à do SSH: na
+primeira conexão com um sistema remoto, a impressão digital da chave é
+registrada e lembrada. Se a chave mudar no futuro, o cliente SSH alertará
+você e recusará a conexão, obrigando-o a decidir se confia ou não na chave
+alterada. Da mesma forma, quando você importa pela primeira vez a chave PGP
+de alguém, ela é considerada válida. Se futuramente o GnuPG encontrar outra
+chave com a mesma identidade, tanto a chave importada anteriormente quanto
+a nova serão marcadas para verificação; você precisará decidir manualmente
+qual manter.
+
+Recomendamos usar o modelo de confiança combinado TOFU+PGP (o novo padrão
+no GnuPG v2). Para configurá-lo, adicione ou altere a opção ``trust-model``
+em ``~/.gnupg/gpg.conf``::
+
+    trust-model tofu+pgp
+
+Use o repositório da rede de confiança do kernel.org
+----------------------------------------------------
+
+O kernel.org mantém um repositório Git com as chaves públicas dos
+desenvolvedores, substituindo a replicação de redes de servidores de chaves
+que, nos últimos anos, em grande parte deixaram de funcionar. A
+documentação completa para configurar esse repositório como fonte de chaves
+públicas está disponível aqui:
+
+- `Chaveiro PGP de desenvolvedores do kernel`_
+
+Se você é desenvolvedor do kernel, considere enviar sua chave para inclusão
+nesse chaveiro.
+
+.. _`Chaveiro PGP de desenvolvedores do kernel`: https://korg.docs.kernel.org/pgpkeys.html
-- 
2.56.0

