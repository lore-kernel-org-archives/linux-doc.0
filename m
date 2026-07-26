Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3963FFD
	for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 23:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785110047; cv=none; b=m9+3g7FZBJxv16kqZ3+cMT96gqnmEhxq+Ky1oYv3uEgrJ66Sk87Si8ShofR7CCnQZocpy/6pLgGo9JxSNYCwGmdOuCJ8hSH58TY2qVhnEBP2hGe7AZVJOTrDMDZy0gPy5CGehmwAKl+9UWmPlkWNomgei/IqWEOV4y1voZsPhvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785110047; c=relaxed/simple;
	bh=XB6nGWKE+WrcUp8yzMzMgqdUE4P3GyN8TWJxl6jK9ys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pVhj/9e1eZejJPw9O3WC1fqmVkJHUlW/0LzD0Ev3vRnsDnhLrts2MWp2YkLpjpk6hy3pS4a9O048yl1dFz7446enM8BzJpQ/KDNUPIpZGAaLl5sMmV90ytk4MwuTtyv1e1omsTxbD/nRFoeq+nkK0eG26cdqvkuE6uxwFPUhc2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhFeBZdM; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhFeBZdM"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-738a5cc517eso1567633137.2
        for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 16:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785110044; x=1785714844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmn8O8FSHQJHKdXKsF+eQUY5GEFY4YJaukqckh0z+kU=;
        b=GhFeBZdMXYSImITrzakWqNzR0Iey25dw8sLXvuFK3YMYFO4mLy+e/tDuz2K1nQxzIH
         yQfYx/gza0J48P7W4e2GkhBaS62SN/sjomtKZb+Mw2DCr42x23Tpe3nSk1dICwutxRHP
         WmtpWyLZx6K630b76EgybvLBSo17mFeDqMDIMnCZ55xyBQgnJvrebJH4WYpFSkWNFWZk
         Qg3x3AK3QYTDnw8VqdFQa2n077hmI82aymggli2cdGxM6Pz8tJ4Z8tCp38GtwjNmQnlB
         1f2rSFY3+SyfR7yUf5uzknGH7OM7JN/neJngrJA6fZkviJuUZIpte+FtQlVK7PWVkTGi
         MOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785110044; x=1785714844;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hmn8O8FSHQJHKdXKsF+eQUY5GEFY4YJaukqckh0z+kU=;
        b=Spd1LpEgFAXWHCwBl7IJVVi2J6tadJjFZn9C3BPMZASq/fbz35HVqF5npCfoyjqtR4
         sZ1WN9/k2Vd5mMBhZIA5F9GT9IMdJkyMh/tGS5AqNcztr9FLxL/Ieos82JodB60EIveQ
         mJsZXar1iOd3RZwBr5uXViQoZpK6IcALMJ7QO83Z5NCCXP46oMVfA0Jw7LCuYb0E4UqL
         7oj0pfv/gYii1tKsTZygldpkm2VXwKtbPMNjz/XD51C0yn3KmjufLR9YgDkNUDF9gy0x
         MRs2vhgwpnKKzrpp8g0566FhS3eM/eVOIH8gjdtgEYls5Ou6bGNvHarvVgRFlYHZpOth
         eY6A==
X-Gm-Message-State: AOJu0YzY2hsiTo1M9WgEKSJJN2d8op1seTnaSbcU7k5JDXvuqCvsreiW
	6+cicuNClyR9WxejzbWJAAJUHt/twaD2Vbduu/2Iq+T1hJf2fx7kT+kK
X-Gm-Gg: AR+sD13ZFaEm6eH9sXK7C0tZwl5/XK6iwl8XDT94r23wDN2DrKst4SLjREtjZ8+vm/E
	xDJNmGVSNpDRsBvIWDnLFHojGCCdw7veTpT1p+DLAlgQ7GsQuM6HatG6vCRYIXTUDbXrPx4D5TJ
	ttnUbe7ls9QIMkAAsZ98yOi6fjgCxRydX2gGen5RgcADQyWyQtRwsdwAN9okY3d1C/XLmcQym7E
	+8SvjssKUfrDuekD97JY73QEp8A35HcOCd9ADn9yAagUDZQhMNue7d4P5FRj85r3C+fPj2y3Zi1
	j/VKi/mGO0AmAXur6hMKr0bSxabVB2CoRryi6BIJE9WmCh09hZLBRxUGowu3i5h2EWTMUwWQ/OW
	nelm3ZQEzakuqp6jOscE60eehn/qLi96na2QCEY2MEJZScEbxE3UFqjzA6pGK89rQZV8RG6CxvT
	c3RL4=
X-Received: by 2002:a05:6102:570f:b0:740:2717:a1b2 with SMTP id ada2fe7eead31-7503e05d281mr3610751137.1.1785110043874;
        Sun, 26 Jul 2026 16:54:03 -0700 (PDT)
Received: from cachyos ([2804:7f0:9f83:2607:bdb7:58ab:5bf:2b3b])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7503436fc5csm4377901137.5.2026.07.26.16.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 16:54:03 -0700 (PDT)
From: Ygor Otavio <ygorotavio.sjc@gmail.com>
To: danielmaraboo@gmail.com
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	Ygor Otavio <ygorotavio.sjc@gmail.com>
Subject: [PATCH v4] docs: translations: pt_BR: fix email-clients.rst and add to index
Date: Sun, 26 Jul 2026 20:53:48 -0300
Message-ID: <20260726235352.3926-1-ygorotavio.sjc@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For V1 Translates the documentation regarding email clients info for
Linux into Brazilian Portuguese, maintaining consistency with original
formatting rules.
For V2, the erros "bullet list ends without a blank line" and "inline
interpreted text start-string without end-string" were fixed. The others
erros that appeared after the submission of V2 ware also fixed.
For V3, the spelling errors pointed out during the review were
corrected, and the missing index.rst file was added
For V4, The last spelling and character errors have been corrected.

Signed-off-by: Ygor Otavio <ygorotavio.sjc@gmail.com>
---
 Documentation/translations/pt_BR/index.rst    |   1 +
 .../pt_BR/process/email-clients.rst           | 368 ++++++++++++++++++
 2 files changed, 369 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/email-clients.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 232d18f7c..ab533bf3f 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -76,6 +76,7 @@ kernel e sobre como ver seu trabalho integrado.
    Como começar <process/howto>
    Requisitos mínimos <process/changes>
    Conclave (Continuidade do projeto) <process/conclave>
+   Informações sobre clientes de email para Linux <process/email-clients>
    Modelos de Maturidade para Contribuição no Kernel Linux <process/contribution-maturity-model.rst>
    Manuais dos mantenedores <process/maintainer-handbooks>
    Processo do subsistema de rede (netdev) <process/maintainer-netdev>
diff --git a/Documentation/translations/pt_BR/process/email-clients.rst b/Documentation/translations/pt_BR/process/email-clients.rst
new file mode 100644
index 000000000..ed8c810d3
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/email-clients.rst
@@ -0,0 +1,368 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Informações sobre clientes de email para Linux
+==============================================
+
+Git
+---
+
+Hoje em dia a maioria dos desenvolvedores usa ``git send-email`` em vez de
+clientes de email comuns. A página de manual desse comando é bem útil. No lado
+de quem recebe, os mantenedores usam ``git am`` para aplicar os patches.
+
+Se você é novo no ``git``, envie seu primeiro patch para si mesmo. Salve-o
+como texto bruto, incluindo todos os cabeçalhos. Execute ``git am raw_email.txt``
+e então revise o changelog com ``git log``. Quando isso funcionar, envie o
+patch para a(s) lista(s) de discussão apropriada(s).
+
+Preferências Gerais
+-------------------
+
+Os patches para o kernel Linux são enviados por email, preferencialmente como
+texto inline no corpo da mensagem. Alguns mantenedores aceitam anexos, mas,
+nesse caso, os anexos devem ter o content-type ``text/plain``. Contudo, anexos
+são, em geral, desaconselhados porque dificultam citar trechos do patch durante
+o processo de revisão.
+
+Também é altamente recomendável que você use plain text no corpo do email, tanto
+para patches quanto para outras mensagens. https://useplaintext.email pode ser
+útil para obter informações sobre como configurar seu cliente de email preferido,
+além de listar clientes de email recomendados caso você ainda não tenha preferência.
+
+Clientes de email usados para patches do kernel Linux devem enviar o texto do
+patch sem alterações. Por exemplo, eles não devem modificar ou apagar tabs ou
+espaços, mesmo no início ou no fim das linhas.
+
+Não envie patches com ``format=flowed``. Isso pode causar quebras de linha
+inesperadas e indesejadas.
+
+Não deixe seu cliente de email fazer quebra automática de linha para você.
+Isso também pode corromper seu patch.
+
+Clientes de email não devem modificar a codificação do conjunto de caracteres do
+texto. Patches enviados por email devem usar apenas codificação ASCII ou UTF-8.
+Se você configurar seu cliente de email para enviar mensagens com codificação
+UTF-8, você evita alguns possíveis problemas de charset.
+
+Clientes de email devem gerar e manter "References:" ou "In-Reply-To:"
+cabeçalhos para que o encadeamento de mensagens não seja quebrado.
+
+Copiar e colar (ou recortar e colar) geralmente não funciona para patches
+porque tabs são convertidos em espaços. Usar xclipboard, xclip e/ou xcutsel
+pode funcionar, mas é melhor testar isso você mesmo ou simplesmente evitar
+copiar e colar.
+
+Não use assinaturas PGP/GPG em emails que contenham patches. Isso quebra muitos
+scripts que leem e aplicam os patches.
+(Isso deve ser corrigível.)
+
+É uma boa ideia enviar um patch para si mesmo, salvar a mensagem recebida e
+aplicá-la com sucesso com o comando 'patch' antes de enviar patches para as
+listas de discussão do Linux.
+
+Algumas dicas de clientes de email (MUA)
+----------------------------------------
+
+Aqui estão algumas dicas específicas de configuração de MUA para editar e enviar
+patches para o kernel Linux. Estas dicas não pretendem ser resumos completos da
+configuração dos pacotes de software.
+
+Legenda:
+
+- TUI = Interface de Usuário Baseada em Texto
+- GUI = Interface Gráfica de Usuário
+
+Alpine (TUI)
+************
+
+Opções de configuração:
+
+Na seção :menuselection:`Preferências de Envio`:
+
+- :menuselection:`Não Envie Texto com Quebra de Linha Automática` deve estar ``habilitado``
+- :menuselection:`Remover Espaços em Branco Antes de Enviar` deve estar ``desabilitado``
+
+Ao compor a mensagem, o cursor deve ser posicionado onde o patch deverá aparecer,
+e então pressionar `CTRL-R` permite especificar o arquivo de patch a ser
+inserido na mensagem.
+
+Claws Mail (GUI)
+****************
+
+Funciona. Algumas pessoas usam isso com sucesso para patches.
+
+Para inserir um patch, use :menuselection:`Mensagem-->Inserir Arquivo`(`CTRL-I`)
+ou um editor externo.
+
+Se o patch inserido precisar ser editado na janela de composição do
+Claws, a opção "Quebra automática" em
+:menuselection:`Configuração-->Preferências-->Escrever-->Quebra de linha`
+deve estar desabilitada.
+
+Evolution (GUI)
+***************
+
+Algumas pessoas usam isso com sucesso para patches.
+
+Ao compor o e-mail, selecione: Preformatado
+  em :menuselection:`Formatar-->Estilo de Parágrafo-->Preformatado` (`CTRL-7`)
+  ou na barra de ferramentas
+
+Depois use:
+:menuselection:`Inserir-->Arquivo de Texto...` (`ALT-N x`)
+para inserir o patch.
+
+Você também pode usar ``diff -Nru old.c new.c | xclip``, selecionar
+:menuselection:`Preformatado`, depois colar com o botão do meio.
+
+Kmail (GUI)
+***********
+
+Algumas pessoas usam o KMail com sucesso para patches.
+
+A configuração padrão de não compor em HTML é apropriada; não a habilite.
+
+Ao compor um email, em opções, desmarque “quebra de linha automática”. A única
+desvantagem é que qualquer texto que você digitar no email não será quebrado
+automaticamente, então você terá que quebrar manualmente o texto antes do patch.
+A maneira mais fácil é compor o email com quebra de linha automática habilitado,
+depois salvá-lo como rascunho. Depois de abri-lo novamente dos rascunhos, ele
+estará com quebras de linha rígidas e você poderá desmarcar “quebra de linha
+automática” sem perder a quebra existente.
+
+No final do seu email, coloque o delimitador de patch comumente usado antes de
+inserir o patch: três hífens (``---``).
+
+Então, no menu :menuselection:`Mensagem`, selecione :menuselection:`inserir arquivo`
+e escolha o seu patch. Como benefício adicional, você pode personalizar a barra
+de ferramentas de criação de mensagens e colocar o ícone :menuselection:`inserir arquivo` lá.
+
+Deixe a janela do compositor larga o suficiente para que nenhuma linha seja
+quebrada. A partir do KMail 1.13.5 (KDE 4.5.4), o KMail aplica quebra de linha
+ao enviar o email se as linhas quebrarem na janela do compositor. Ter a quebra de
+linha desativada no menu Opções não é suficiente. Por isso se o seu patch tiver
+linhas muito longas, você deve deixar a janela do seu compositor bem larga antes
+de enviar o email. Veja: https://bugs.kde.org/show_bug.cgi?id=174034
+
+Você pode assinar anexos com GPG com segurança, mas texto em linha é preferido
+para patches, então não os assine com GPG. Assinar patches que foram inseridos
+como texto em linha torna mais difícil extraí-los de sua codificação 7 bits.
+
+Se você absolutamente precisar enviar patches como anexos em vez de inseri-los
+como texto, clique com o botão direito no anexo e selecione
+:menuselection:`propriedades`, e destaque :menuselection:`Sugerir exibição automática`
+para fazer o anexo ser exibido como texto inserido e ficar mais fácil de
+visualizar.
+
+Ao salvar patches enviados como texto inserido, selecione o email que contém o
+patch no painel da lista de mensagens, clique com o botão direito e selecione
+:menuselection:`salvar como`. Você pode usar o email inteiro sem alterações como
+patch se ele tiver sido composto corretamente. Emails são salvos como leitura e
+escrita apenas para o usuário, então você terá que alterar as permissões para
+torná-los legíveis por grupo e por todos se copiá-los para outro lugar.
+
+Lotus Notes (GUI)
+*****************
+
+Fuja dele.
+
+IBM Verse (Web GUI)
+*******************
+
+Veja Lotus Notes.
+
+Mutt (TUI)
+**********
+
+Muitos desenvolvedores Linux usam ``mutt``, então deve funcionar muito bem.
+
+O mutt não vem com editor, então qualquer editor que você use deve ser usado de
+forma que não haja quebras de linha automáticas. A maioria dos editores tem uma
+opção :menuselection:`Inserir Arquivo` que insere o conteúdo de um arquivo sem
+alterações.
+
+Para usar ``vim`` com o mutt::
+
+  set editor="vi"
+
+Se estiver usando xclip, digite o comando::
+
+  :set paste
+
+antes do botão do meio ou shift-insert ou use::
+
+  :r filename
+
+se você quiser incluir o patch inline.
+(a)ttach funciona bem sem ``set paste``.
+
+Você também pode gerar patches com ``git format-patch`` e depois usar o Mutt
+para enviá-los::
+
+    $ mutt -H 0001-some-bug-fix.patch
+
+Opções de configuração:
+
+Deve funcionar com as configurações padrão. No entanto, é uma boa ideia definir
+o ``send_charset`` como::
+
+  set send_charset="us-ascii:utf-8"
+
+O Mutt é altamente personalizável. Aqui está uma configuração mínima para
+começar a usar o Mutt para enviar patches pelo Gmail::
+
+  # .muttrc
+  # ================  IMAP  ====================
+  set imap_user = 'seuusuario@gmail.com'
+  set imap_pass = 'suasenha'
+  set spoolfile = imaps://imap.gmail.com/INBOX
+  set folder = imaps://imap.gmail.com/
+  set record="imaps://imap.gmail.com/[Gmail]/Sent Mail"
+  set postponed="imaps://imap.gmail.com/[Gmail]/Drafts"
+  set mbox="imaps://imap.gmail.com/[Gmail]/All Mail"
+
+  # ================  SMTP  ====================
+  set smtp_url = "smtp://usuario@smtp.gmail.com:587/"
+  set smtp_pass = $imap_pass
+  set ssl_force_tls = yes # Exige conexão criptografada
+
+  # ================  Composição  ====================
+  set editor = `echo \$EDITOR`
+  set edit_headers = yes  # Exibe os cabeçalhos ao editar
+  set charset = UTF-8     # valor de $LANG; também usado como
+                          # fallback para send_charset
+  # Remetente, endereço de e-mail e linha de assinatura devem
+  # corresponder
+  unset use_domain        # porque joe@localhost é constrangedor
+  set realname = "SEU NOME"
+  set from = "usuario@gmail.com"
+  set use_from = yes
+
+A documentação do Mutt tem muito mais informações:
+
+    https://gitlab.com/muttmua/mutt/-/wikis/UseCases/Gmail
+
+    http://www.mutt.org/doc/manual/
+
+Pine (TUI)
+**********
+
+O Pine já teve alguns problemas de truncamento de espaços em branco no passado,
+mas isso deve estar todo corrigido agora.
+
+Use o alpine (sucessor do pine) se possível.
+
+Opções de configuração:
+
+- ``quell-flowed-text`` é necessário para versões recentes
+- a opção ``no-strip-whitespace-before-send`` é necessária
+
+
+Sylpheed (GUI)
+**************
+
+- Funciona bem para inserir texto inline (ou usando anexos).
+- Permite o uso de um editor externo.
+- É lento em pastas grandes.
+- Não fará autenticação TLS SMTP sobre uma conexão não-SSL.
+- Tem uma barra de régua útil na janela de composição.
+- Adicionar endereços ao catálogo de endereços não reconhece corretamente o nome
+  de exibição.
+
+Thunderbird (GUI)
+*****************
+
+O Thunderbird é um clone do Outlook que gosta de bagunçar o texto, mas há formas
+de convencê-lo a se comportar.
+
+Depois de fazer as modificações, incluindo a instalação das extensões, você
+precisa reiniciar o Thunderbird.
+
+- Permitir o uso de um editor externo:
+
+  A forma mais fácil de trabalhar com patches no Thunderbird é usar extensões
+  que abrem seu editor externo favorito.
+
+  Aqui estão alguns exemplos de extensões capazes de fazer isso.
+
+  - "Editor Externo Reativado"
+
+    https://github.com/Frederick888/external-editor-revived
+
+    https://addons.thunderbird.net/en-GB/thunderbird/addon/external-editor-revived/
+
+    É necessário instalar um "host de mensagens nativas".
+    Leia a wiki, que pode ser encontrada aqui:
+    https://github.com/Frederick888/external-editor-revived/wiki
+
+  - "Editor Externo"
+
+    https://github.com/exteditor/exteditor
+
+    Para isso, baixe e instale a extensão, depois abra a janela de
+    :menuselection:`compor`, adicione um botão para ela usando
+    :menuselection:`Visualizar-->Barras de Ferramentas-->Personalizar...`
+    e então basta clicar no novo botão quando quiser usar o editor externo.
+
+    Observe que o "Editor Externo" exige que seu editor não faça fork, ou seja,
+    o editor não deve retornar antes de fechar. Pode ser necessário passar flags
+    adicionais ou alterar as configurações do seu editor. Principalmente se você
+    estiver usando o gvim, deve passar a opção -f para o gvim colocando
+    ``/usr/bin/gvim --nofork"`` (se o binário estiver em ``/usr/bin``) no campo
+    de editor de texto nas configurações de :menuselection:`editor externo`. Se
+    estiver usando outro editor, consulte seu manual para descobrir como fazer isso.
+
+Para colocar juízo no editor interno, faça o seguinte:
+
+- Edite as configurações do Thunderbird para que ele não use ``format=flowed``!
+  Vá até a janela principal e encontre o botão do menu suspenso principal.
+  :menuselection:`Menu Principal-->Preferências-->Geral-->Editor de Configurações...`
+  para abrir o editor de registro do Thunderbird.
+
+  - Defina ``mailnews.send_plaintext_flowed`` como ``false``
+
+    - Altere ``mailnews.wraplength`` de ``72`` para ``0`` **ou** instale a
+      extensão "Toggle Line Wrap"
+
+      https://github.com/jan-kiszka/togglelinewrap
+
+      https://addons.thunderbird.net/thunderbird/addon/toggle-line-wrap
+
+      para controlar esse registro dinamicamente.
+
+- Não escreva mensagens em HTML! Vá até a janela principal
+  :menuselection:`Menu Principal-->Configurações da Conta-->suaconta@servidor.algo-->Composição e Endereçamento`!
+  Lá você pode desabilitar a opção "Compor mensagens em formato HTML".
+
+- Abra mensagens apenas como texto simples! Vá até a janela principal
+  :menuselection:`Menu Principal-->Visualizar-->Corpo da Mensagem Como-->Texto Simples`!
+
+TkRat (GUI)
+***********
+
+Funciona. Use "Inserir arquivo..." ou um editor externo.
+
+Gmail (Web GUI)
+***************
+
+Não funciona para enviar patches.
+
+O cliente web do Gmail converte tabulações em espaços automaticamente.
+
+Ao mesmo tempo, ele quebra linhas a cada 78 caracteres com quebras de linha no
+estilo CRLF, embora o problema de tab para espaço possa ser resolvido com um
+editor externo.
+
+Outro problema é que o Gmail codifica em base64 qualquer mensagem que tenha um
+caractere não-ASCII. Isso inclui coisas como nomes europeus.
+
+HacKerMaiL (TUI)
+****************
+
+HacKerMaiL (hkml) é uma ferramenta simples de gerenciamento de e-mails baseada
+em public-inbox que não exige inscrição em listas de discussão. É desenvolvida
+e mantida pelo mantenedor do DAMON e visa oferecer suporte a fluxos de trabalho
+de desenvolvimento simples para o DAMON e para subsistemas gerais do kernel.
+Consulte o README (https://github.com/sjp38/hackermail/blob/master/README.md)
+para mais detalhes.
+
-- 
2.55.0

