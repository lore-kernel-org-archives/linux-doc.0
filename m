Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB803BFAF7
	for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 16:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020692; cv=none; b=NqQ2QMDfIGuMluVxQ5s80SOXSJgUhax1rEIybFeNhX62wi5flfToSS/XS+QlP0yeXRgzZSM924CLcDS4udzdTpmB9zDEnaDnZFoBPVd/z3l3+cFxrVu8+ZbDzrTIBBB/ILRNTqa5oDKlGIlneFVgb4DaTLocumjS9Xst5opRPog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020692; c=relaxed/simple;
	bh=mnUbx2EPDkZm520knKHSOk5doXn4FDWSwO+886rV6q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cG0kq/28a8OWhtcXcUqBdRpfwy8KaaFNBtWZC3Wq7qnbQpFNJ4xYHhdsBVwYEFE2+1PvPyEYSx+cSfiUQVs96sFVG8fZcDs1mcZHdyLH4rkUXg9vlVShwTVKDbtThsHsOIjofDxRHzdAvMAllIQO0kFDR6GDTpW7uq1/QcKUzD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dlt7EPA+; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dlt7EPA+"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39647184c73so2980097a91.1
        for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 09:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788020690; x=1788625490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wrMvvr8iUoL7qhDam4HvgTGNpEcC00b9rYS8mAamuis=;
        b=Dlt7EPA+9z02tvsro/UNa35tsfPYcn9JBm4Y+kWC/g1aETb7XnG7Td5Fm1ttaGdmbH
         sINmiUWFPVDX3YopH+9efkmFE6yhixi68kgkMPdYxmPK5mrCRikFnt7clixGL2kPNL02
         /r18Wz31t07nhYvfqoN1YifFmFsIny6FYT8UVengncDkUkTvkuzrnjEyiVFzwQZ0Znsc
         ZWPNmGYdw3CO6D90iUUe/qgk6a5882O0Co9uUU4IHglTdmdV/UgydOTDiyx325mvxCW4
         uekCnEwzvRCJI5nszt6PEBQl/yPrSr56ke1tIXxEnPqW9KqpH3sYndgtQ/2avYeEa6Ua
         FbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788020690; x=1788625490;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wrMvvr8iUoL7qhDam4HvgTGNpEcC00b9rYS8mAamuis=;
        b=deM/chm3i8zCxcBCFU0xyDLSkTFmphuQQNS36z2YExtst1Se89xQyTPPVYTw+LuYVK
         RJyevLTfhVh6x5QaUBT3s4OAfjvKSAaMZlLzDGHpYYzdYm1hz92BF5Jb6pE+nlCRyuI7
         hXPr6bpPZq/wub0DQH9eGd6bgaQXfYviOoO9eCf/N4aPf3DPyScAJ/5rtMfgir/as0N/
         RZQny8dNFZq/zUdGoH3ljtc82J/k2EDsaRmteB4kHTuU/PD0xGZmdr63UILOu9+q54vZ
         mfHMgqLPAERVCa0nKvhK6c7U6xvQ65eDfLMrE97DtDZNT2J181n2yyYZ7eZnQ241w6Ls
         6iWA==
X-Gm-Message-State: AFuF++l9oSjvwSTd0UZzDb05U1WtBoOxzVhxFE/t1fsS8Qab0ad2xZ/5
	19ksawRWVuLHu4NyZQl5ggg2usKaRfjs9e1+qj7puCKxEjeYUgkUEhwr
X-Gm-Gg: AYBFou1SEptnRY56Do6ahsAM8rhD8L9u/nnBDCz6RFW48ODjesrTRWwpJZhAITw3xdl
	/6VBq1WPZlPv7zFXaTOwJDqWiyByxBIxjWCN2UG7sXlxZscbBnOlTr7CKinZFqBRKRuK3Yw/rqH
	zanS1BghePw8OHZnck4/O6UQeB6cFWe6zIaYdh5Mf0+LtXpQXkkivlMXDMuRmz0CG/eba5h8uVP
	V2RidhciWrn8hAjuPCOQOQpMaFEVN5xY9NppZClCRq5YcMWRxZMB3cOzFrppTX9hDJgBlpf+dxN
	GitkEbQGZvvB9fQfvH+DctbV2qB9tPCH5PAU+5zBjlqvcBr8yGFWw/2ChjY6qQmiIIOugHqIRI/
	WyUCrrwdyDdL4o3XWJ42FW+0LYden+odtpnfMwuf2CaIBsf3oxQyvk8sFmr03rZLpfqwUg1UWsy
	BwRGriNywjC37Oe+t5rqjhKhSaf7/bTN6fOJfYd1vrg3Y4McLmega/SU13ICy8sh+j613L9a/c9
	cuFdNqHSuZebO0etgtRznOim789vNdMbvmUpbZWsA1YrEYp2jDov3W046g0OW/BGj17T2INR5lZ
	CoO9U9FOYMoJx2tL5Ol4w8rkJQ==
X-Received: by 2002:a17:90b:17c3:b0:398:9beb:a2bc with SMTP id 98e67ed59e1d1-3989beba839mr4561501a91.30.1788020689505;
        Sat, 29 Aug 2026 09:24:49 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm25183814c88.0.2026.08.29.09.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:24:49 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 2/3] docs: translations: pt_BR: update process translation files
Date: Sat, 29 Aug 2026 13:24:34 -0300
Message-ID: <20260829162438.13039-3-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260829162438.13039-1-danielmaraboo@gmail.com>
References: <20260829162438.13039-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Fix minor typographical, punctuation, and untranslated text errors in
the Brazilian Portuguese translations of Documentation/process/2.Process.rst,
3.Early-stage.rst, 4.Coding.rst, and 5.Posting.rst to better match the
original text and improve readability.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/process/2.Process.rst         | 12 ++++++------
 .../translations/pt_BR/process/3.Early-stage.rst     | 10 +++++-----
 .../translations/pt_BR/process/4.Coding.rst          |  6 +++---
 .../translations/pt_BR/process/5.Posting.rst         | 12 ++++++------
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/2.Process.rst b/Documentation/translations/pt_BR/process/2.Process.rst
index 5ff35f10a..03e288d46 100644
--- a/Documentation/translations/pt_BR/process/2.Process.rst
+++ b/Documentation/translations/pt_BR/process/2.Process.rst
@@ -75,16 +75,16 @@ Como exemplo, veja como ocorreu o ciclo de desenvolvimento da versão 5.4
 (todas as datas são de 2019):
 
 	==============  ===============================
-	Setembro 15	5.3 Lançamento estável do 5.3
+	Setembro 15	Lançamento estável do 5.3
 	Setembro 30	5.4-rc1, fechamento da janela de integração
 	Outubro 6	5.4-rc2
 	Outubro 13	5.4-rc3
 	Outubro 20	5.4-rc4
-	October 27	5.4-rc5
+	Outubro 27	5.4-rc5
 	Novembro 3	5.4-rc6
 	Novembro 10	5.4-rc7
 	Novembro 17	5.4-rc8
-	Novembro 24	5.4 Lançamento estável do 5.4
+	Novembro 24	Lançamento estável do 5.4
 	==============  ===============================
 
 Como os desenvolvedores decidem quando encerrar o ciclo de desenvolvimento
@@ -330,7 +330,7 @@ A árvore de fontes do kernel contém o diretório drivers/staging/, onde reside
 muitos subdiretórios para drivers ou sistemas de arquivos que estão a caminho
 de serem adicionados à árvore do kernel. Eles permanecem em drivers/staging/
 enquanto ainda precisam de mais trabalho; uma vez concluídos, podem ser movidos
-para o kernel proper Esta é uma maneira de acompanhar drivers que não estão à
+para o kernel propriamente dito. Esta é uma maneira de acompanhar drivers que não estão à
 altura dos padrões de codificação ou de qualidade do kernel Linux, mas que as
 pessoas podem querer usar e acompanhar o desenvolvimento.
 
@@ -433,7 +433,7 @@ Existem algumas dicas que podem ajudar na sobrevivência na lista linux-kernel:
   caixa de entrada principal. É preciso ser capaz de ignorar o fluxo de e-mails
   por períodos prolongados de tempo.
 
-- Não tente acompanhar cada conversa ninguém mais faz isso. É importante
+- Não tente acompanhar cada conversa, ninguém mais faz isso. É importante
   filtrar tanto pelo tópico de interesse (embora note que conversas longas
   podem se desviar do assunto original sem que a linha de assunto do e-mail
   seja alterada) quanto pelas pessoas que estão participando.
@@ -461,7 +461,7 @@ Existem algumas dicas que podem ajudar na sobrevivência na lista linux-kernel:
   ponto de encontro geral, mas não é o melhor lugar para encontrar desenvolvedores
   de todos os subsistemas.
 
-O último ponto, encontrar a lista de discussão correta  é um lugar comum
+O último ponto, encontrar a lista de discussão correta, é um lugar comum
 onde os desenvolvedores iniciantes costumam errar. Alguém que faça uma pergunta
 relacionada a redes na lista linux-kernel quase certamente receberá uma
 sugestão educada para perguntar na lista netdev em seu lugar, já que essa é a
diff --git a/Documentation/translations/pt_BR/process/3.Early-stage.rst b/Documentation/translations/pt_BR/process/3.Early-stage.rst
index 74e741766..86c228353 100644
--- a/Documentation/translations/pt_BR/process/3.Early-stage.rst
+++ b/Documentation/translations/pt_BR/process/3.Early-stage.rst
@@ -74,7 +74,7 @@ Discussão inicial
 
 Ao planejar um projeto de desenvolvimento do kernel, faz todo o sentido realizar
 discussões com a comunidade antes de iniciar a implementação. A comunicação
-inicial pode economizar tempo e problemas de várias maneiras:number of ways:
+inicial pode economizar tempo e problemas de várias maneiras:
 
  - Pode muito bem ser que o problema já seja tratado pelo kernel de maneiras
    que você não compreendeu. O kernel Linux é grande e possui uma série de
@@ -121,8 +121,8 @@ comunidade do kernel. Alguns exemplos incluem:
    consideradas inseguras e não confiáveis. Essa preocupação (entre outras)
    manteve o AppArmor fora do kernel principal (*mainline*) por anos.
 
-In each of these cases, a great deal of pain and extra work could have been
-avoided with some early discussion with the kernel developers.
+Em cada um desses casos, muito sofrimento e trabalho extra poderiam ter sido
+evitados com alguma discussão inicial com os desenvolvedores do kernel.
 
 
 Como encontrar os mantenedores?
@@ -200,8 +200,8 @@ prosseguir, mantendo a comunidade informada à medida que avança.
 Obter a aprovação oficial
 -------------------------
 
-Se o seu trabalho estiver sendo realizado em um ambiente corporativo  como é o
-caso da maior parte do trabalho no kernel do Linux —, você deve, obviamente, ter
+Se o seu trabalho estiver sendo realizado em um ambiente corporativo, como é o
+caso da maior parte do trabalho no kernel do Linux, você deve, obviamente, ter
 a permissão de gerentes devidamente autorizados antes de poder publicar os
 planos ou o código da sua empresa em uma lista de discussão pública.
 A publicação de código que não tenha sido liberado para lançamento sob uma
diff --git a/Documentation/translations/pt_BR/process/4.Coding.rst b/Documentation/translations/pt_BR/process/4.Coding.rst
index ca4c74774..7c7567165 100644
--- a/Documentation/translations/pt_BR/process/4.Coding.rst
+++ b/Documentation/translations/pt_BR/process/4.Coding.rst
@@ -197,8 +197,8 @@ a ferramenta certa para o trabalho. Códigos que mostrem falta de atenção à
 concorrência terão um caminho difícil para entrar no mainline.
 
 
-Regressions
-***********
+Regressões
+**********
 
 Um perigo final que vale a pena mencionar é este: pode ser tentador fazer uma
 alteração (que pode trazer grandes melhorias) que faça algo quebrar para os
@@ -258,7 +258,7 @@ Note que nem todos os avisos do compilador ficam ativados por padrão. Compile o
 kernel com "make KCFLAGS=-W" para obter o conjunto completo.
 
 O kernel fornece várias opções de configuração que ativam recursos de
-depuração; a maioria delas é encontrada no submanu "kernel hacking". Várias
+depuração; a maioria delas é encontrada no submenu "kernel hacking". Várias
 dessas opções devem ser ativadas para qualquer kernel usado para fins de
 desenvolvimento ou teste. Em particular, você deve ativar:
 
diff --git a/Documentation/translations/pt_BR/process/5.Posting.rst b/Documentation/translations/pt_BR/process/5.Posting.rst
index 820a56b66..2ac7e5557 100644
--- a/Documentation/translations/pt_BR/process/5.Posting.rst
+++ b/Documentation/translations/pt_BR/process/5.Posting.rst
@@ -37,7 +37,7 @@ Antes de criar patches
 ----------------------
 
 Há uma série de coisas que devem ser feitas antes de você considerar o envio
-de patches para la comunidade de desenvolvimento. Elas incluem:
+de patches para a comunidade de desenvolvimento. Elas incluem:
 
  - Teste o código tanto quanto puder. Faça uso das ferramentas de depuração
    do kernel, garanta que o kernel seja compilado com todas as combinações
@@ -106,7 +106,7 @@ que podem ajudar consideravelmente:
 
  - Como uma forma de reafirmar a diretriz acima: não misture diferentes tipos de
    alterações no mesmo patch. Se um único patch corrige uma falha crítica de
-   segurança, reorganiza algumas estruturas e reformatará o código, há uma grande
+   segurança, reorganiza algumas estruturas e reformata o código, há uma grande
    chance de que ele seja ignorado e a correção importante seja perdida.
 
  - Cada patch deve resultar em um kernel que compile e funcione corretamente; se
@@ -199,7 +199,7 @@ a alteração em um sistema de controle de versão. Ele será seguido por:
    diff associará os nomes das funções às alterações, tornando o patch resultante
    mais fácil de ser lido por outras pessoas.
 
-As tags  já mencionadas brevemente acima são usados para fornecer
+Os marcadores (tags) já mencionados brevemente acima são usados para fornecer
 informações sobre como o patch surgiu. Eles são descritos em detalhes no
 documento :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`;
 o que se segue aqui é um breve resumo.
@@ -215,7 +215,7 @@ documento com uma especificação implementada pelo patch::
 
   Link: https://example.com/somewhere.html  optional-other-stuff
 
-De acordo com as orientações do Pinguim-Chefe, um marcador Link
+De acordo com as orientações do Pinguim-Chefe, um marcador Link:
 só deve ser adicionado a um commit se ele levar a informações úteis que não
 são encontradas no próprio commit.
 
@@ -279,7 +279,7 @@ Os marcadores de uso comum são:
 
 Tenha cuidado ao adicionar os marcadores mencionados acima aos seus patches, pois
 todos, exceto Cc:, Reported-by: e Suggested-by:, precisam de permissão explícita
-fontes da pessoa nomeada. Para esses três, a permissão implícita é suficiente se
+da pessoa nomeada. Para esses três, a permissão implícita é suficiente se
 a pessoa contribuiu para o kernel Linux usando esse nome e endereço de e-mail de
 acordo com os arquivos do lore ou o histórico de commits — e, no caso de
 Reported-by: e Suggested-by:, se fizeram o relato ou a sugestão publicamente.
@@ -322,7 +322,7 @@ kernel incentiva as pessoas a pecarem pelo excesso, enviando cópias demais; nã
 assuma que as pessoas relevantes verão sua publicação nas listas de discussão. Em
 particular, as cópias devem ir para:
 
-- O(s) mantenedor(es) do(s) subsistema(s) afetado(s). Como descrito antes, o
+ - O(s) mantenedor(es) do(s) subsistema(s) afetado(s). Como descrito antes, o
    arquivo MAINTAINERS é o primeiro lugar para procurar por essas pessoas.
 
  - Outros desenvolvedores que estiveram trabalhando na mesma área — especialmente
-- 
2.47.3

