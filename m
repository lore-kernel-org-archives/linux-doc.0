Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795363736;
	b=hVNOW3uPyg1S2AoVSGSd5rGs4oClwSlsY9p79uVUIhM+Z+iSKHvxv/QvpboHtw5mgk/l
	 xt83pJyw05gg915dqZKMJuXHhZPJw2Ohf+BUQusGSGsFELIwk0bRBYGQvW33znYAAqeVJ
	 B9gKEQEnCB16pqSP4fVS7PKorWZ9ZklQ2X4jNqs5kB3Hbtlfg9Gr9VxzE/1CSS5shdJkp
	 LBxoFA/IG+ysQBSp0+2JbB2BX/l9SJrB8MgFLt3BSgyfyZvh0HcB1AwMAp5cRh+BE9L21
	 0cM07EK8nQZayr8Q12JIZAZXwNtbGAyqulWmBq3azjfXe0iC/xZa9IC62gYL+HCIpsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363736;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qLKvS0tcbAuvCz/KjDGE+nTfKhA90YBwcro3yAIjtdE=;
	b=FmSdASiPYznrpZDjxTB7G1zRjbT+Vng7Yg7UoGVmqJM5B/KKi4wKooiXGxdBE2DSMNCA
	 /7knVyVZIaZIUSAlDyH8YCBTZZE6W77gZqlcm9cjzb/xFyHcNuWZ+0x8rNez+VYxK/f56
	 RNRnrJRQ7HPSHoeKP3eS0otEyg1H1Wg/mljCDizdssuiaw0c0YJx4sOnhfKHmOMZRNSte
	 dcbD7xaF24b6/f7j7/73D9LI5vTtzvh8Gc7WUIwGMSwLfeVvBv1Ui3QdgT1NNQegToST7
	 vknp2tx93jwudG4bRbQizvDI+J87NQzQNgQ+lSWSkdxapW+WRtH1TdvWTjjoBmi79TQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bNmeR5qy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F009C606A320
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bNmeR5qy
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795363735;
	b=fsyjFW98EAjkWFvpAqAsS2cceJSb3c9cBgQJQeXN0BgIm8FAtPrWaeD+GjkFSFEaNR1q
	 ADusuhyZqMep4EvsTbYaC0fMTVlfclNZIMEKbz/455XL64bbRNrvkCOwux69kdJ5XWASz
	 zk6Ffp09ecScZsa+s1r8TEkKZ31HEbLTN1tv0Nig3DVDBMlX2+80aWOVt8gmuNC+Os03G
	 O8xjoYLs8IsSlB++s5HFVp6uHjDOjzXyHqmYwoXX9KB46gEO8LZY9H5rcDQw/PObmmDkL
	 NZzMMmglo1rID5s/o/4RxZX7SR3n7CvX++/SYI2/wQkA3wSSe5YXpS2h/LKz8uStmiA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795363735;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qLKvS0tcbAuvCz/KjDGE+nTfKhA90YBwcro3yAIjtdE=;
	b=AJhKGMNVFfTHLzlp9ID2DeDYS0M7HvlGE9/F7ZtJP3XXBQy+epUMMaWxN00AoCf6ukFh
	 svEEojf4qigwoIU6/bOwbxQb/sdMFXMIrpp6B3t5l6EFO/6p0LZoDtzebsMqLgY21U0xX
	 0x3Mhre/sSmtOKUVSNBm6ymzQWP54E8D1e1b9SlFQYYrj3vmNNaBAzDgMKv5KKuBJ1Nlm
	 XZrw+MJ99SlH2VB/+jVKZzeq41HFnxkqKqXFoUBR9uDJzg9AuntVb/6oc/vJIrOh+fLGD
	 xV01MmFzKvn/MJEicGrkt3LLoPBQ46vBbEsVbWNmiEnvvv/WOe+yOOeBUY25R/+/EDg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D8C11F000CF;
	Sun, 22 Nov 2026 16:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795363735;
	bh=qLKvS0tcbAuvCz/KjDGE+nTfKhA90YBwcro3yAIjtdE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bNmeR5qyAOrxgG/s3unmDGWgIdlv8lIGE92khiUZ5U1uSYr0PYTqJxNwi9Y6xUaah
	 HBEktP0q5q5B3V7qOy0VoeiA5RbwmYA9wDiWHz8T4Srb/ofoyRPqJDPgSKz2jOJs+g
	 0CZlKUXfWVQLKUrT7pZsgwqB59KfjjcqViLjN4Wk6TS8UDAsxhUjX3/c8VKi3umECi
	 LdiYMh+zjzX+Gs3LmYc1Bv+9OGcHfGWZ0LTOBubn71/dAidi/vmXyGtgNT3dYoR7no
	 ciHaLJEw6zDPvaRX81sEL+mQfhozZa2DJTNXe/pAxkxzzt17CdaXOmWP/NfcP+GymD
	 YSQqsYW4VzdoQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9EA8B4C123;
	Sun, 22 Nov 2026 16:08:43 +0000 (UTC)
From: Eduardo Pereira Cruz via B4 Relay <devnull+dreduardocruz.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 13:08:45 -0300
Subject: [PATCH 3/4] docs/translations/pt_BR: process: add
 maintainer-pgp-guide.rst (3/4)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-maintainer-pgp-guide-pt-br-v1-3-01ce5941c5c2@gmail.com>
References: <20261122-maintainer-pgp-guide-pt-br-v1-0-01ce5941c5c2@gmail.com>
In-Reply-To: <20261122-maintainer-pgp-guide-pt-br-v1-0-01ce5941c5c2@gmail.com>
To: linux-doc@vger.kernel.org
Cc: danielmaraboo@gmail.com, corbet@lwn.net, skhan@linuxfoundation.org, 
 rdunlap@infradead.org, Eduardo Pereira Cruz <dreduardocruz@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795363722; l=12589;
 i=dreduardocruz@gmail.com; s=20261119; h=from:subject:message-id;
 bh=dKjQNIRvWhJaoEymbenBs7geHxnGG0xFt20nDZATkXg=;
 b=i1fq3Bs1GcO8wb9kAgq2PMwSQvUuS5g0wTPswoWuYW0yQKcsElcy9tW8AiV2l6TBERfy3AStm
 Sc1PEOfet+2B7RGvW8P9FWRE80a5NlliqUQWVnwOM5YTKcmteQWTVds
X-Developer-Key: i=dreduardocruz@gmail.com; a=ed25519;
 pk=2dtL+BL/x70sROmAvlskv9dbjj274zlPkLBVu4gJJiA=
X-Endpoint-Received: by B4 Relay for dreduardocruz@gmail.com/20261119 with
 auth_id=1571
X-Original-From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
Reply-To: dreduardocruz@gmail.com
Content-Transfer-Encoding: 8bit

From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>

Translate the smartcard chapter, including the device recommendations,
the card configuration through gpg --card-edit and the migration of the
subkeys to the card, plus the quick reference of common GnuPG
operations.

Signed-off-by: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
---
 .../pt_BR/process/maintainer-pgp-guide.rst         | 286 +++++++++++++++++++++
 1 file changed, 286 insertions(+)

diff --git a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
index 4e07d49e36d0..7808ef4730ae 100644
--- a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
@@ -358,3 +358,289 @@ que ainda contém as suas chaves privadas.
 
 .. _smartcards:
 
+Mova as subchaves para um dispositivo criptográfico dedicado
+============================================================
+
+Embora a chave de Certificação esteja agora protegida contra vazamento ou
+roubo, as subchaves continuam no seu diretório home. Qualquer pessoa que
+consiga pôr as mãos nelas poderá decifrar a sua comunicação ou forjar as suas
+assinaturas (se souber a passphrase). Além disso, a cada operação do GnuPG as
+chaves são carregadas na memória do sistema e podem ser roubadas de lá por
+malware suficientemente avançado (pense em Meltdown e Spectre).
+
+Uma boa forma de proteger completamente as suas chaves é movê-las para um
+dispositivo de hardware especializado, capaz de operações de smartcard.
+
+Os benefícios dos smartcards
+-----------------------------
+
+Um smartcard contém um chip criptográfico capaz de armazenar chaves privadas e
+realizar operações criptográficas diretamente no próprio cartão. Como o
+conteúdo das chaves nunca sai do smartcard, o sistema operacional do
+computador em que você conecta o dispositivo não consegue recuperar as chaves
+privadas. Isso é muito diferente da mídia criptografada que usamos antes para
+backup -- enquanto aquele dispositivo está conectado e montado, o sistema
+operacional consegue acessar o conteúdo das chaves privadas.
+
+Usar mídia externa criptografada não substitui ter um dispositivo com
+capacidade de smartcard.
+
+Dispositivos de smartcard disponíveis
+-------------------------------------
+
+A menos que todos os seus laptops e estações de trabalho tenham leitores de
+smartcard, o mais fácil é obter um dispositivo USB especializado que
+implemente a funcionalidade de smartcard. Há várias opções disponíveis:
+
+- `Nitrokey Start`_: hardware aberto e software livre, baseado no `Gnuk`_ da
+  FSI Japan. Uma das opções mais baratas, mas oferece menos recursos de
+  segurança (como resistência a adulteração ou a alguns ataques de canal
+  lateral).
+- `Nitrokey 3`_: semelhante ao Nitrokey Start, mas mais resistente a
+  adulteração e com mais recursos de segurança e formatos USB. Suporta
+  criptografia ECC (ED25519 e NISTP).
+- `Yubikey 5`_: hardware e software proprietários, mas mais barato que o
+  Nitrokey e com conjunto semelhante de recursos. Suporta criptografia ECC
+  (ED25519 e NISTP).
+
+A sua escolha dependerá de custo, disponibilidade de envio na sua região
+geográfica e considerações sobre hardware aberto ou proprietário.
+
+.. note::
+
+    Se você estiver listado em uma entrada `M:` no MAINTAINERS ou tiver uma
+    conta no kernel.org, você `tem direito a um Nitrokey Start gratuito`_,
+    cortesia da Linux Foundation.
+
+.. _`Nitrokey Start`: https://www.nitrokey.com/products/nitrokeys
+
+.. _`Nitrokey 3`: https://www.nitrokey.com/products/nitrokeys
+
+.. _`Yubikey 5`: https://www.yubico.com/products/yubikey-5-overview/
+
+.. _Gnuk: https://www.fsij.org/doc-gnuk/
+
+.. _`tem direito a um Nitrokey Start gratuito`: https://www.kernel.org/nitrokey-digital-tokens-for-kernel-developers.html
+
+Configure o seu dispositivo de smartcard
+----------------------------------------
+
+O seu dispositivo de smartcard deve simplesmente funcionar (TM) no momento em
+que você o conecta a qualquer estação de trabalho Linux moderna. Você pode
+verificar executando::
+
+    $ gpg --card-status
+
+Se você vir os detalhes completos do smartcard, está tudo certo.
+Infelizmente, diagnosticar todas as razões possíveis pelas quais as coisas
+podem não funcionar para você está muito além do escopo deste guia. Se estiver
+com dificuldade para fazer o cartão funcionar com o GnuPG, procure ajuda nos
+canais de suporte habituais.
+
+Para configurar o seu smartcard, você precisará usar o sistema de menus do
+GnuPG, pois não há opções convenientes de linha de comando::
+
+    $ gpg --card-edit
+    [...omitted...]
+    gpg/card> admin
+    Admin commands are allowed
+    gpg/card> passwd
+
+Você deve definir o PIN do usuário (1), o PIN de administrador (3) e o Código
+de Reset (4). Não deixe de anotar e guardar esses valores em local seguro --
+especialmente o PIN de administrador e o Código de Reset (que permite apagar
+completamente o smartcard). Você raramente precisará usar o PIN de
+administrador, então inevitavelmente esquecerá qual é, se não anotar.
+
+Voltando ao menu principal do cartão, você também pode definir outros valores
+(como nome, gênero, dados de login etc.), mas isso não é necessário e ainda
+vazaria informação sobre o seu smartcard caso você o perca.
+
+.. note::
+
+    Apesar do nome "PIN", nem o PIN do usuário nem o PIN de administrador do
+    cartão precisam ser numéricos.
+
+.. warning::
+
+    Alguns dispositivos podem exigir que você mova as subchaves para o
+    dispositivo antes de poder alterar a passphrase. Verifique a documentação
+    fornecida pelo fabricante do dispositivo.
+
+Mova as subchaves para o seu smartcard
+--------------------------------------
+
+Saia do menu do cartão (usando "q") e salve todas as alterações. Em seguida,
+vamos mover as suas subchaves para o smartcard. Você precisará tanto da
+passphrase da sua chave PGP quanto do PIN de administrador do cartão para a
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
+Usar ``--edit-key`` nos coloca novamente no modo de menu, e você notará que
+a listagem de chaves é um pouco diferente. Daqui em diante, todos os comandos
+são feitos dentro desse modo de menu, indicado por ``gpg>``.
+
+Primeiro, vamos selecionar a chave que colocaremos no cartão -- você faz isso
+digitando ``key 1`` (é a primeira da listagem, a subchave **[E]**)::
+
+    gpg> key 1
+
+Na saída, você deve agora ver ``ssb*`` na chave **[E]**. O ``*`` indica qual
+chave está "selecionada" no momento. Funciona como um *toggle*, ou seja,
+se você digitar ``key 1`` novamente, o ``*`` desaparece e a chave deixa de
+estar selecionada.
+
+Agora, vamos mover essa chave para o smartcard::
+
+    gpg> keytocard
+    Please select where to store the key:
+       (2) Encryption key
+    Your selection? 2
+
+Como é a nossa chave **[E]**, faz sentido colocá-la no slot de Criptografia.
+Ao enviar a sua seleção, será pedida primeiro a passphrase da chave PGP e
+depois o PIN de administrador. Se o comando retornar sem erro,
+a sua chave foi movida.
+
+**Importante**: agora digite ``key 1`` novamente para desmarcar a primeira
+chave, e ``key 2`` para selecionar a chave **[S]**::
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
+mas queremos garantir que ela fique no slot de Assinatura, então escolha
+(1). Mais uma vez, se o seu comando retornar sem erro, a operação foi bem-sucedida::
+
+    gpg> q
+    Save changes? (y/N) y
+
+Salvar as alterações excluirá do seu diretório home as chaves que você moveu
+para o cartão (mas não há problema, porque as temos nos nossos backups, caso
+precisemos fazer isso de novo para um smartcard de reposição).
+
+Verificando que as chaves foram movidas
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
+smartcard. Se você voltar ao seu diretório de chaves secretas e olhar o
+conteúdo, notará que os arquivos ``.key`` de lá foram substituídos por
+stubs::
+
+    $ cd ~/.gnupg/private-keys-v1.d
+    $ strings *.key | grep 'private-key'
+
+A saída deve conter ``shadowed-private-key`` para indicar que esses arquivos
+são apenas stubs e o conteúdo real está no smartcard.
+
+Verificando que o smartcard está funcionando
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Para verificar que o smartcard funciona como pretendido, você pode criar uma
+assinatura::
+
+    $ echo "Hello world" | gpg --clearsign > /tmp/test.asc
+    $ gpg --verify /tmp/test.asc
+
+O primeiro comando deve pedir o PIN do seu smartcard, e depois de executar
+``gpg --verify`` a saída deve mostrar "Good signature".
+
+Parabéns, você acabou de tornar extremamente difícil roubar a sua identidade
+digital de desenvolvedor!
+
+Outras operações comuns do GnuPG
+--------------------------------
+
+Aqui está uma referência rápida para algumas operações comuns que você
+precisará fazer com a sua chave PGP.
+
+Montando o seu armazenamento offline seguro
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Você precisará da sua chave de Certificação para qualquer uma das operações
+abaixo, então primeiro será preciso montar o seu armazenamento de backup
+offline e informar ao GnuPG para usá-lo::
+
+    $ export GNUPGHOME=/media/disk/foo/gnupg-backup
+    $ gpg --list-secret-keys
+
+Você quer garantir que vê ``sec`` e não ``sec#`` na saída (o ``#`` significa
+que a chave não está disponível e você ainda está usando o local habitual do
+diretório home).
+
+Estendendo a data de expiração da chave
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A chave de Certificação tem, por padrão, data de expiração de 2 anos a partir
+da criação. Isso é feito tanto por razões de segurança quanto para que chaves
+obsoletas acabem sumindo dos keyservers.
+
+Para estender a expiração da sua chave em um ano a partir da data atual,
+basta executar::
+
+    $ gpg --quick-set-expire [fpr] 1y
+
+Você também pode usar uma data específica, se for mais fácil de lembrar (por
+exemplo, seu aniversário, 1º de janeiro ou o Canada Day)::
+
+    $ gpg --quick-set-expire [fpr] 2038-07-01
+
+Lembre-se de enviar a chave atualizada de volta aos keyservers::
+
+    $ gpg --send-key [fpr]
+
+Atualizando o seu diretório de trabalho após quaisquer mudanças
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Depois de fazer qualquer mudança na sua chave usando o armazenamento offline,
+você vai querer importar essas mudanças de volta ao seu diretório de trabalho
+habitual::
+
+    $ gpg --export | gpg --homedir ~/.gnupg --import
+    $ unset GNUPGHOME
+
+Usando o gpg-agent por ssh
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Você pode encaminhar o seu gpg-agent por ssh se precisar assinar tags ou
+commits em um sistema remoto. Consulte as instruções fornecidas no wiki do
+GnuPG:
+
+- `Agent Forwarding over SSH`_
+
+Funciona melhor se você puder modificar as configurações do servidor sshd na
+outra ponta.
+
+.. _`Agent Forwarding over SSH`: https://wiki.gnupg.org/AgentForwarding
+
+.. _pgp_with_git:
+

-- 
2.53.0


