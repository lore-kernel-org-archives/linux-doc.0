Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C7140DFC2
	for <linux-doc@vger.kernel.org>; Sun, 29 Mar 2026 16:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774803074; cv=none; b=LWcDsb0ze90U3CYcIzAf2pJt2U3KeVm4Kl6TwyLPAEG+4FNbUqYi5p/ClB1UUWEwMjSLr4UQmeJLdoIGlvlHOc8Vx1wahXrjtp1gbL+nk/mQqqrhjTAw6S8q5D4e6e68LVPXsFtP5Enj7i2tdlhyNfgkdoyjZeyAch+LYfwqwbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774803074; c=relaxed/simple;
	bh=Ds9pOIeFsGbeJIjzp/0yZju5RUdimR9fVA6CW4Sjsy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RMhAl6uOgijPg2pytWjbJB9TBTFFbFLoRcTVg5L3Kj3fPOrqaYfol6WMdESl75QBEWfQX+wkZLqimviKw6l7goDgTXMIIgrnMMvUOhq2j2IXc+jWFMzKmByyBr0jyZ+GQu6y1KSNaGPmKyE07NRrBm+CoBeq5xmVOzuS6A6jYnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rw93gJIk; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rw93gJIk"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56adf76631cso1748908e0c.1
        for <linux-doc@vger.kernel.org>; Sun, 29 Mar 2026 09:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774803072; x=1775407872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iweSTs0a6mUlergXdqMpfSJyRYIZ3pzdWyqNMZbAlhk=;
        b=Rw93gJIkrje4rh772C8BXPGEgKpHKINNMS/gFyhXS4aMtCLtdhzWqAyZq9yzC9TILJ
         bCnGsCAZAv9nKut4LaW2AnYHBrVLWLNYXIRC/SMlWRPOsvj+vzgHR7rlhY9Ig0NacabF
         AzMsX+f2dHGryhes2BjNK2uPaZdQ67W9+yNDmA5J2/dgAOk2pwQNc0F3BAddF6yvOPjk
         P0cw/N7RRVX1WABVSZHphzeP8vUzGcYidFYqSSLIErLyKcDjNTcHUXot9Ol4TcqkJ9t3
         KWJToEzLbuikyuJPFQpDMKEPfRzTxPQqKUezTlHeaNvheY0w65cfLU5OWmRxBAF5dGsG
         kxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774803072; x=1775407872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iweSTs0a6mUlergXdqMpfSJyRYIZ3pzdWyqNMZbAlhk=;
        b=WrxtV/hu9CqfajeEXo+m632mxmOewHKJVJMdhBummJdLn0CKPcBKDBzWazcAXegzm+
         U0DJ9EzdH0W+3SQmuvjDdwEgW2n/CIu1bqMfxylsV+b4PSYPpe4dCYD2y7aU86FIR+um
         4hxhKf5so6aTlZ5POmZVlE1f+qStOpsYniKEu3unQs4+z74UiFHxU972jD9I8SMrc+KV
         hEUm04wx0eXTPrJvypbi+dzfLhTvvhAy9uXG9yfFs+frCdds0/uI5OmixkZ0cqto73lS
         BR8OYvxGbxHAWoUX8+/5rgiPrdH3HfEQcZQfLpdNprXCuMSoAjbCZuJ/brlKCRn/baLD
         zWyA==
X-Gm-Message-State: AOJu0YxGDpzpkvG0Sn8QwFy8cWBbYZfsNL9rQk4gGP+s6VzrlvKstW0K
	sim4udIhtcYb6jj4KxxWWWu5+38/XJIQ9JDr0WiiVlVI/l+Se1Z3bmQEF58otA==
X-Gm-Gg: ATEYQzyR96imItOaXm0mcPubNzM6+Qspe95eU27UI/VWH3xTtW0vCJcbemLNkD/DuHf
	Fq/EpeWsVmCN/bhwVD0Dttr0YVgkazb2jzmGWzJKpexvCo5/cTvsv+c0MxviTX9tv/5JYGjoRX/
	eoyddh9Fw4F5YIaRKNDSxo4cYbKlu7XraqWBRxeHdlLu1WOuniVcaOUlVU/j58nySz5Ailtel+o
	EvGJzVX68C3BcEPxpVS4SZdhJknQwHQ67MXgC/tsUukc8/6Tl1ZWb2XDSjqg7eGwSNQ+t0dFytW
	sLsMQUpyMHvkSgHMPH0pvFadvcn8p7MrV64pT51SOujXhJwl4JqMSC7jIiHdmgL3JN0yXcPSaNb
	NYgcQscTMX3GqcjhdR6zJqyp8zy82cRQ8Cc1ogNrnZBLsZmDKFH7ybZVxOexPbgr5AlH4cw3BEQ
	vQkex64TOCEAqkgvaJvmI91DF3wtnK3BUsTI4cpn4REdCG9JUjHB6kQChnLDS/g3dzruNRn8NKs
	N0v
X-Received: by 2002:a05:6122:1b0c:b0:56a:e25f:fc87 with SMTP id 71dfb90a1353d-56d4a531acdmr3434422e0c.7.1774803071513;
        Sun, 29 Mar 2026 09:51:11 -0700 (PDT)
Received: from localhost.localdomain ([2804:1690:81f:ccbb:2e4d:21dc:8ad9:527c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a7ba96sm5549740e0c.17.2026.03.29.09.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:51:10 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH v2 4/5] docs: pt_BR: continue PGP guide: Git and maintenance
Date: Sun, 29 Mar 2026 13:50:38 -0300
Message-ID: <20260329165041.831369-5-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260329165041.831369-1-danielmaraboo@gmail.com>
References: <20260329165041.831369-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 .../pt_BR/process/maintainer-pgp-guide.rst    | 289 ++++++++++++++++++
 1 file changed, 289 insertions(+)

diff --git a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
index f7b312014..3501756fd 100644
--- a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
@@ -489,3 +489,292 @@ maioria das operações::
 Usar ``--edit-key`` nos coloca no modo de menu novamente, e você notará que a
 listagem das chaves é um pouco diferente. De aqui em diante, todos os comandos
 são feitos de dentro deste modo de menu, conforme indicado por ``gpg>``.
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
-- 
2.47.3

