Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87503BA245
	for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 12:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616183; cv=none; b=SlnCXnhuUSKJAPtOEGrXIjBVPPNC4AB2MmIg9kC+ZxchEwt95ZGDR3X6dgk03N3UVa/FydZ7Fjlfb9wZl5PG6ftayxpzRlpKBfRF+1LgHJoXLPk8HcSYOnMMHf2fvWalqvGniUB48wOdthlRx7OyW2mWyWdsNdDpks1YqE0Kv1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616183; c=relaxed/simple;
	bh=N7dTKFMwuF4p6U0pqOPB9cFIDt+DRfdL9m3SIwCLE7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j+t0usxHVIcBMILnyJ1vdjMBamVTyjjwL4QU6CwsY81JDr0fd9PKTdxs8Ted5H8JFA8kjZpMYounUHkc86NNLSnsf87kdbS9UqGfZ9fx11hijiHjUTvuK7qqMArhdqliOVdTjZYwAtimkSsIotAbvfHzHZYGdfDjw+5u5078iak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZG+lwRlO; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZG+lwRlO"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94ac5cb71feso629620241.2
        for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 05:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774616181; x=1775220981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaIuJEaNixPKJ9zPN+fy2BnN+kmZsbo777GT7Z0z9Lk=;
        b=ZG+lwRlOJnafIrWs3jYCWEE+1VOEJjh2bKvpGdXI0xUtApAhxht8r/VkcB2tDHdTiU
         RSGMrwmHC+qooVBYAtYuRyF1VgnQaoYcqfe4kvHInuVwHuFclUiGuF/dXETpF/paBZIZ
         TVKZDXPs63CbwxvVn+3zUvXctydM1W3LtGo9mjbG5WpZMtb8cboWUrFIQVpztyzXIvag
         om0hGron5k1vIYxbdc42WeA/MWCY6FK1xRVFbLxJ2C3cEQ+1ldsHplRywxgLtqgKzWEB
         2f6nYx2T111LmGa7L391mGkYcDRb5umM5iZosf37iSqC+vTfIdZrXc1Hc2NIZXjmEP0J
         bcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616181; x=1775220981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FaIuJEaNixPKJ9zPN+fy2BnN+kmZsbo777GT7Z0z9Lk=;
        b=UdGC6BoQVp5cFLW7hRlcXpVHqLkToDjC6PfCyI42dINuTbJrBWDdRjob9MwLAGnibq
         S4A1Wfh/HpnyeKYBmiJtQDxwcj2nS+jlLYKMdPhRrC+RVYVq4bZ+6f6nw5x3SVkCB14t
         Jr+Qsrk//UUqArB7RdT6fpkx1Rd9myXuuqNOsrdHe7o+C274zPNnJZV58WmarxxFmSOr
         mD3ZaF/Damt7bZtoZAbJUsHuzFB102sExL/vUZGqIiNrvpbh/5Vcic4Gbkww2NADwN8o
         5PxQFobfpmEHmz+w/jWLRYr58cdwcbSrY4HXLNEdQFDLdfgzhRXKmghWyTUw5C/0EHEX
         3n7Q==
X-Gm-Message-State: AOJu0YwpL+Ekyh6WfmvG1zg3vYXBLetFGpqRqDIE1elif6Zcng1SZCtx
	pUMkCG5RhcTBHyUpiKZBABEhYZH1W8uJHZD+3LEgr/nnM1RrjYahfBrZ
X-Gm-Gg: ATEYQzx86UCPYLv1qQO4Yw+S+NJqlEglVlHaHUnY4hfTe0u8Zm749SXJfa1AwuLyMEL
	CWMGET9QaWJEgEM13K5/Rpv8uprRsygpaOvEqBczFLQTkrEewHZXguu1Ghz1Go7pmIFzggRUKM+
	a3pYyC1P/qwGzlQTi1hn/G03A0rBlv79tIS525DwuxPLEL0poBsiBrp2duEsfecUVlvkM3Yozhx
	rkFM3Lg70aowNkIJEcxNtBnaCzDFMEzIQ2w5husmcKnZo6yQIHIr9norMsXS6947+d4+Ej2FAil
	x5Cje5mGUDux+WaR7rfbOloTIwTLAktphbiWg6rbjgOPxwRXO1MmmYxApq843iQQLhSaWyCRo2G
	Fn85LI3MciPF2O4JssI472vSHJg8kUOTNmVgGW0HS3Dz48UvtztURzi26u0k7uMeb4dU1oWSry7
	zDEKptEs7Rk6Iuy4jZdT8xRFRCOhk9uhhrlH8QCAcneXlu8Kte6iKJE6xrp4+xeWbE0qKsgymnc
	g==
X-Received: by 2002:a05:6102:54a0:b0:5ff:1130:bdad with SMTP id ada2fe7eead31-604f904c9damr782198137.6.1774616180322;
        Fri, 27 Mar 2026 05:56:20 -0700 (PDT)
Received: from parrot.dimenoc.com ([2804:29b8:512d:4c55:1868:543f:1aeb:fd26])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d50c928asm6259318137.5.2026.03.27.05.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:56:20 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 4/5] docs: pt_BR: continue PGP guide: Git and maintenance
Date: Fri, 27 Mar 2026 09:55:35 -0300
Message-ID: <20260327125538.581064-5-danielmaraboo@gmail.com>
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

Continue the PGP guide translation covering Git integration,
key maintenance, and the use of the patatt tool.

This update includes:
- Procedures for moving subkeys to hardware (keytocard) and verifying
  the transfer.
- PGP maintenance tasks: extending expiration dates and working with
  offline backups.
- Git configuration for signing tags and commits automatically.
- Introduction to agent forwarding over SSH and the patatt patch
  attestation tool.

Internal Sphinx labels (e.g., 'pgp_with_git', 'verify_identities') were
renamed with a '_pt' suffix to ensure a unique namespace and avoid
build warnings.

The file was verified with checkpatch.pl and passes with 0 errors
and 0 warnings.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/process/maintainer-pgp-guide.rst    | 291 +++++++++++++++++-
 1 file changed, 290 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
index 280207498..e4cc9211b 100644
--- a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
@@ -488,4 +488,293 @@ maioria das operações::
 
 Usar ``--edit-key`` nos coloca no modo de menu novamente, e você notará que a
 listagem das chaves é um pouco diferente. De aqui em diante, todos os comandos
-são feitos de dentro deste modo de menu, conforme indicado por ``gpg>``.
\ No newline at end of file
+são feitos de dentro deste modo de menu, conforme indicado por ``gpg>``.
+
+Primeiro, vamos selecionar a chave que colocaremos no cartão -- você faz isso
+digitando ``key 1`` (é a primeira na listagem, a subchave **[E]**)::
+
+    gpg> key 1
+
+Na saída, você deverá ver agora ``ssb*`` na chave **[E]**. O ``*`` indica qual
+chave está atualmente "selecionada". Ele funciona como uma *alternância*
+(toggle), o que significa que se você digitar ``key 1`` novamente, o ``*``
+desaparecerá e a chave não estará mais selecionada.
+
+Agora, vamos mover essa chave para o smartcard::
+
+    gpg> keytocard
+    Please select where to store the key:
+       (2) Encryption key
+    Your selection? 2
+
+Como é a nossa chave **[E]**, faz sentido colocá-la no slot de Criptografia
+(Encryption). Quando você enviar sua seleção, será solicitada primeiro a frase
+secreta da sua chave PGP e, em seguida, o PIN de administrador. Se o comando
+retornar sem erros, sua chave foi movida.
+
+**Importante**: Agora digite ``key 1`` novamente para desmarcar a primeira chave
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
+Você pode usar a chave **[S]** tanto para Assinatura quanto para Autenticação,
+mas queremos garantir que ela esteja no slot de Assinatura, então escolha (1).
+Mais uma vez, se o seu comando retornar sem erros, a operação foi
+bem-sucedida::
+
+    gpg> q
+    Save changes? (y/N) y
+
+Salvar as alterações excluirá as chaves que você moveu para o cartão de seu
+diretório pessoal (mas não há problema, pois as temos em nossos backups caso
+precisemos fazer isso novamente para um smartcard de substituição).
+
+Verificando se as chaves foram movidas
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Se você executar ``--list-secret-keys`` agora, verá uma diferença sutil na
+saída::
+
+    $ gpg --list-secret-keys
+    sec#  ed25519 2022-12-20 [SC] [expires: 2024-12-19]
+          000000000000000000000000AAAABBBBCCCCDDDD
+    uid           [ultimate] Alice Dev <adev@kernel.org>
+    ssb>  cv25519 2022-12-20 [E] [expires: 2024-12-19]
+    ssb>  ed25519 2022-12-20 [S]
+
+O ``>`` na saída ``ssb>`` indica que a subchave está disponível apenas no
+smartcard. Se você voltar ao diretório de chaves secretas e observar o
+conteúdo, notará que os arquivos ``.key`` foram substituídos por stubs::
+
+    $ cd ~/.gnupg/private-keys-v1.d
+    $ strings *.key | grep 'private-key'
+
+A saída deve conter ``shadowed-private-key`` para indicar que esses arquivos
+são apenas stubs e o conteúdo real está no smartcard.
+
+Verificando se o smartcard está funcionando
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Para verificar se o smartcard está funcionando conforme o esperado, você pode
+criar uma assinatura::
+
+    $ echo "Hello world" | gpg --clearsign > /tmp/test.asc
+    $ gpg --verify /tmp/test.asc
+
+Isso deve solicitar o PIN do seu smartcard no primeiro comando e, em seguida,
+mostrar "Good signature" após você executar ``gpg --verify``.
+
+Parabéns, você conseguiu tornar extremamente difícil o roubo da sua identidade
+digital de desenvolvedor!
+
+Outras operações comuns do GnuPG
+--------------------------------
+
+Aqui está uma referência rápida para algumas operações comuns que você
+precisará realizar com sua chave PGP.
+
+Montando seu armazenamento offline seguro
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Você precisará da sua chave de Certificação para qualquer uma das operações
+abaixo, portanto, primeiro precisará montar seu armazenamento offline de backup
+e dizer ao GnuPG para usá-lo::
+
+    $ export GNUPGHOME=/media/disk/foo/gnupg-backup
+    $ gpg --list-secret-keys
+
+Certifique-se de ver ``sec`` e não ``sec#`` na saída (o símbolo ``#``
+significa que a chave não está disponível e você ainda está usando o local
+padrão do seu diretório pessoal).
+
+Estendendo a data de expiração da chave
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A chave de Certificação tem uma data de expiração padrão de 2 anos a partir da
+data de criação. Isso é feito tanto por razões de segurança quanto para fazer
+com que chaves obsoletas eventualmente desapareçam dos servidores de chaves
+(keyservers).
+
+Para estender a expiração da sua chave em um ano a partir da data atual, basta
+executar::
+
+    $ gpg --quick-set-expire [fpr] 1y
+
+Você também pode usar uma data específica se for mais fácil de lembrar (por
+exemplo, seu aniversário ou 1º de janeiro)::
+
+    $ gpg --quick-set-expire [fpr] 2038-07-01
+
+Lembre-se de enviar a chave atualizada de volta para os servidores de chaves::
+
+    $ gpg --send-key [fpr]
+
+Atualizando seu diretório de trabalho após alterações
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Depois de fazer qualquer alteração em sua chave usando o armazenamento offline,
+você desejará importar essas alterações de volta para o seu diretório de
+trabalho normal::
+
+    $ gpg --export | gpg --homedir ~/.gnupg --import
+    $ unset GNUPGHOME
+
+Usando gpg-agent sobre SSH
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Você pode encaminhar seu gpg-agent sobre SSH se precisar assinar tags ou
+commits em um sistema remoto. Por favor, consulte as instruções fornecidas
+na wiki do GnuPG:
+
+- `Encaminhamento de Agent sobre SSH (pt)`_
+
+Funciona de forma mais fluida se você puder modificar as configurações do
+servidor sshd na extremidade remota.
+
+.. _`Encaminhamento de Agent sobre SSH (pt)`: https://wiki.gnupg.org/AgentForwarding
+
+Usando PGP com Git
+==================
+
+Uma das principais características do Git é sua natureza descentralizada --
+uma vez que um repositório é clonado em seu sistema, você tem o histórico
+completo do projeto, incluindo todas as suas tags, commits e branches. No
+entanto, com centenas de repositórios clonados por aí, como alguém verifica
+se sua cópia do linux.git não foi adulterada por um terceiro mal-intencionado?
+
+Ou o que acontece se um código malicioso for descoberto no kernel e a linha
+"Author" no commit disser que foi feito por você, enquanto você tem certeza
+de que `não teve relação com isso (pt)`_?
+
+Para resolver ambas as questões, o Git introduziu a integração com PGP. Tags
+assinadas provam a integridade do repositório, garantindo que seu conteúdo é
+exatamente o mesmo que estava na estação de trabalho do desenvolvedor que
+criou a tag, enquanto commits assinados tornam quase impossível para alguém
+se passar por você sem ter acesso às suas chaves PGP.
+
+.. _`não teve relação com isso (pt)`: https://github.com/jayphelps/git-blame-someone-else
+
+Configure o git para usar sua chave PGP
+---------------------------------------
+
+Se você tiver apenas uma chave secreta em seu chaveiro, não precisará fazer
+nada extra, pois ela se torna sua chave padrão. No entanto, se você tiver
+várias chaves secretas, poderá informar ao git qual chave deve ser usada
+(``[fpr]`` é a impressão digital da sua chave)::
+
+    $ git config --global user.signingKey [fpr]
+
+Como trabalhar com tags assinadas
+---------------------------------
+
+Para criar uma tag assinada, passe a opção ``-s`` para o comando tag::
+
+    $ git tag -s [tagname]
+
+Nossa recomendação é sempre assinar as tags do git, pois isso permite que outros
+desenvolvedores garantam que o repositório git do qual estão baixando não foi
+alterado de forma maliciosa.
+
+Como verificar tags assinadas
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Para verificar uma tag assinada, use o comando ``verify-tag``::
+
+    $ git verify-tag [tagname]
+
+Se você estiver baixando (pulling) uma tag de outro fork do repositório do
+projeto, o git deve verificar automaticamente a assinatura na ponta (tip) que
+você está baixando e mostrar os resultados durante a operação de merge::
+
+    $ git pull [url] tags/sometag
+
+A mensagem de merge conterá algo como isto::
+
+    Merge tag 'sometag' of [url]
+
+    [Tag message]
+
+    # gpg: Signature made [...]
+    # gpg: Good signature from [...]
+
+Se você estiver verificando a tag git de outra pessoa, primeiro precisará
+importar a chave PGP dela. Por favor, consulte a seção
+":ref:`verificar_identidades_pt`" abaixo.
+
+Configure o git para sempre assinar tags anotadas
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+É provável que, se você estiver criando uma tag anotada, você desejará
+assiná-la. Para forçar o git a sempre assinar tags anotadas, você pode definir
+uma opção de configuração global::
+
+    $ git config --global tag.forceSignAnnotated true
+
+Como trabalhar com commits assinados
+------------------------------------
+
+Também é possível criar commits assinados, mas eles têm utilidade limitada no
+desenvolvimento do kernel Linux. O fluxo de trabalho de contribuição do kernel
+depende do envio de patches, e a conversão de commits em patches não preserva
+as assinaturas de commit do git. Além disso, ao fazer o rebase do seu próprio
+repositório em um upstream mais recente, as assinaturas PGP de commit acabarão
+sendo descartadas. Por esse motivo, a maioria dos desenvolvedores do kernel não
+se preocupa em assinar seus commits e ignorará commits assinados em quaisquer
+repositórios externos nos quais dependam para o seu trabalho.
+
+Dito isso, se você tem sua árvore git de trabalho disponível publicamente em
+algum serviço de hospedagem git (kernel.org, infradead.org, ozlabs.org ou
+outros), a recomendação é que você assine todos os seus commits do git, mesmo
+que os desenvolvedores upstream não se beneficiem diretamente dessa prática.
+
+Recomendamos isso pelos seguintes motivos:
+
+1. Caso haja necessidade de realizar uma análise forense de código ou rastrear a
+   proveniência do código, mesmo as árvores mantidas externamente contendo
+   assinaturas PGP de commit serão valiosas para tais fins.
+2. Se você precisar clonar novamente seu repositório local (por exemplo, após
+   reinstalar seu sistema), isso permite verificar a integridade do repositório
+   antes de retomar seu trabalho.
+3. Se alguém precisar fazer o cherry-pick dos seus commits, isso permite que
+   verifiquem rapidamente a integridade deles antes de aplicá-los.
+
+Criando commits assinados
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Para criar um commit assinado, passe a flag ``-S`` para o comando
+``git commit`` (é um ``-S`` maiúsculo devido à colisão com outra flag)::
+
+    $ git commit -S
+
+Configure o git para sempre assinar commits
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Você pode informar ao git para sempre assinar os commits::
+
+    git config --global commit.gpgSign true
+
+.. note::
+
+    Certifique-se de configurar o ``gpg-agent`` antes de ativar esta opção.
+
+.. _verificar_identidades_pt:
+
+Como trabalhar com patches assinados
+------------------------------------
+
+É possível usar sua chave PGP para assinar patches enviados para as listas de
+discussão de desenvolvedores do kernel. Como os mecanismos existentes de
+assinatura de e-mail (PGP-Mime ou PGP-inline) tendem a causar problemas com as
+tarefas regulares de revisão de código, você deve usar a ferramenta que o
+kernel.org criou para este fim, que coloca assinaturas de atestação
+criptográfica nos cabeçalhos das mensagens (estilo DKIM):
+
+- `Atestação de Patch Patatt (pt)`_
+
+.. _`Atestação de Patch Patatt (pt)`: https://pypi.org/project/patatt/
\ No newline at end of file
-- 
2.47.3

