Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECB73AB285
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 19:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789069894; cv=none; b=T7z1QDIQSd9dnjIVshXrZJFIE0w/jPBtWu2Qdy5Zfps7dwRE/WwWIQ0EOmbmW/v94RJuUhgW7hVkNtji2W+XqS4RhM6DCbtKvJbObI0TjEseXspIoW6qMH0/ai2/65cvAy3UX4leTQeOdMerfNoAWVskvRnbvlWl23WCGMrti6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789069894; c=relaxed/simple;
	bh=7mdIpA4IM81cjWoVRTI7ah5nKogw5lBxjImEEbwf920=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pB0hdS08NeKAnP1B93H81bz+RjHIH1zTJImkAluuwLscHJ/MODZaeGVprnH9eCXmyTsnjKKqKHC+R74sbD1ZAfrl0vtyBlVkPVnPk2GKd8pLGJHpdxjv689isXdd+xrvjZqYyo8pnRafjlz+2iYMcii9gQWw3cVBnsdmP+nk3go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGPwkOOM; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGPwkOOM"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c84060045aso167905e0c.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 12:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789069885; x=1789674685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCgQnI4/8gLCvVnFP9bIuvBSCDRRI2Q9VxwWu4arnBg=;
        b=VGPwkOOMH4pvXg9JMyzYoamaP8ICnOiKyk9anXf4hI1kd73TnNEX4forRidWfxNgpH
         MuriKAEb0t/QDjOVnTSx93QpqBFFhmJkXCFcqBtVwtQxwgXrqLArVTWLbH4ka2ocWaNe
         MNy3nNMCFPXBQVJW+XZtU2MWi2q7MMIepWOq2qhe8GhgmHY3MxvfeXQfMIF7a8K9Nmsf
         ejmSRaI/ajkZWcgdduNiqo73myux3xhxHPWjHEMFXfCoXDj3V+G1FnDFmAvjrP6GI5ZC
         eoK9Zdy62WF8oWM/b9qUc0uXcvjfmiSmOqt4wl6deDwDVQH1u5wmetxK2+WszH8CLVhW
         ZsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789069885; x=1789674685;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZCgQnI4/8gLCvVnFP9bIuvBSCDRRI2Q9VxwWu4arnBg=;
        b=f3wQONRsMGcuizoziJ04YcJBOQPjTmikb4LiBTq+ybWV4y0gjOEsvPhvykPLKbdMZG
         srs+bJBRYgSJo/hQFK57NVThFZTtpVHNBhkGvZtIo9w0wnUws265oXHhSuduOeLXc9zx
         2ybPc62SSQPmDmUu+GhsQMza/eyF1MZeifU+boIzfp6NTUEBmoQau4sauwlxDp7igqz9
         I5Xz7bafk1FzR5L61USyWsPpmEDI+IHR3WzZF40x9EAuVsYP1n9jiLhaQxspeKWgfRLe
         FVlBC5rRFLYb2cn5/Gv4hMPZ6cb9RbzkNjOr0gLbZbRZ5pi33VJEsN7hDQ3kChpYb02f
         6doQ==
X-Gm-Message-State: AFuF++mLZgA9pjLStBYio1SqqJp7W6RXzRGj4QW1+8nv1I3YZjzTy7vr
	IU0J8p8b9z6Fsn/ath3RUjS9mZ3KsqhG16+jSiFhKLot1wvoLi3ajMfWA5u7bQ==
X-Gm-Gg: AYBFou1m8g9mB8jYuKN1UGxw8k7g/WVBkLEdqqESTVJb+02RrmC6ZI3+B72kxcOcoJO
	SU51CBIrucWkv9XEFcVsPrxYGawmccDqEB4GFaEkyG3ReK+HqCDHQDdD35HF2BmfoJv3BN4TmWh
	/0k+7pV4FnSPtczLwkq3b9NVXn3Npng2A0s8yqVOXI0/Ekvm0U9lcn1H47/IAi/AZx0RonKffmM
	urg6GQmX7Er1JzDLX8E9xybHlvjp+cnPjvKZc+6Mp7etPv3rdNiYy5lTgQgAzyAHDUj03OwiyHi
	oqKLlO4jj1CV9bomoJ/sQY0WNdhvVGHFvpDEV0d0KSg/uLUlQ6evx3p/U/kWa5at0czs/A1ID4S
	elG+XK7g1KfeYe3vvoDyLDMIiYvb8+Wo0D5TUwYm8WLprOP7a7aGbWnLVArGO1LSgCuO7TZdZeW
	NuAPfyuQ/rrhC/1wE1s00JBLeEdQVHGPPq2DAR7oGlxPQzHxJi0lRrbb8fI/Ep6dRNwGq02yMAg
	w==
X-Received: by 2002:a05:6122:289a:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5c845f51272mr2426796e0c.1.1789069885327;
        Thu, 10 Sep 2026 12:51:25 -0700 (PDT)
Received: from x-wing ([2804:14d:78b6:4583:ad1c:1455:3098:a6a8])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c84711aee4sm437022e0c.13.2026.09.10.12.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:51:24 -0700 (PDT)
From: Fabio Pereira da Silva <silvapfabio@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Fabio Pereira da Silva <silvapfabio@gmail.com>
Subject: [PATCH v3] docs: translations: pt_BR: translate stable-kernel-rules.rst
Date: Thu, 10 Sep 2026 16:51:18 -0300
Message-ID: <20260910195119.1723-1-silvapfabio@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate stable-kernel-rules.rst into Brazilian Portuguese and add it
to the pt_BR process documentation index.

Signed-off-by: Fabio Pereira da Silva <silvapfabio@gmail.com>
---
Changes in v3:
- Remove Assisted-by trailer.

Changes in v2:
- Add document to Documentation/translations/pt_BR/process/index.rst
  instead of the top-level index.
- Remove top-of-file Sphinx label to prevent build error.
- Fix title underline length.

v2: https://lore.kernel.org/r/20260910190754.1687-1-silvapfabio@gmail.com
v1: https://lore.kernel.org/r/20260910151204.1248-1-silvapfabio@gmail.com

 .../translations/pt_BR/process/index.rst      |   1 +
 .../pt_BR/process/stable-kernel-rules.rst     | 247 ++++++++++++++++++
 2 files changed, 248 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/stable-kernel-rules.rst

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index 7841eca..0e72c45 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -59,6 +59,7 @@ Estas são as regras pelas quais tentamos viver na comunidade do kernel
    Interpretação do Código de Conduta do Kernel Linux <code-of-conduct-interpretation>
    Modelos de Maturidade para Contribuição no Kernel Linux <contribution-maturity-model.rst>
    Declaração sobre Drivers do Kernel <kernel-driver-statement>
+   Tudo sobre lançamentos -stable <stable-kernel-rules>
    Estilo de gerenciamento do kernel Linux <management-style>
    Assistentes de código <coding-assistants>
    Conclave (Continuidade do projeto) <conclave>
diff --git a/Documentation/translations/pt_BR/process/stable-kernel-rules.rst b/Documentation/translations/pt_BR/process/stable-kernel-rules.rst
new file mode 100644
index 0000000..8f732c4
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/stable-kernel-rules.rst
@@ -0,0 +1,247 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Tudo o que você sempre quis saber sobre lançamentos -stable do Linux
+====================================================================
+
+Regras sobre que tipo de patches são aceitos, e quais não são, na árvore
+"-stable":
+
+- O patch ou uma correção equivalente já deve existir na mainline do Linux
+  (upstream).
+- Deve ser obviamente correto e testado.
+- Não pode ter mais de 100 linhas, incluindo contexto.
+- Deve seguir as regras de
+  :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`.
+- Deve corrigir um bug real que incomoda as pessoas ou apenas adicionar um ID
+  de dispositivo. Detalhando o primeiro caso:
+
+  - Corrige um problema como um oops, uma travada (hang), corrupção de dados,
+    uma questão real de segurança, uma peculiaridade de hardware, um erro de
+    compilação (mas não para coisas marcadas como CONFIG_BROKEN), ou algum
+    problema do tipo "isso não é bom".
+  - Problemas sérios relatados por um usuário de um kernel de distribuição
+    também podem ser considerados se corrigirem um problema notável de
+    desempenho ou de interatividade. Como essas correções não são tão óbvias
+    e têm um risco maior de uma regressão sutil, elas só devem ser enviadas
+    por um mantenedor de kernel de distribuição e devem incluir um adendo
+    apontando para uma entrada no bugzilla, se existir, e informações
+    adicionais sobre o impacto visível para o usuário.
+  - Nada do tipo "isso poderia ser um problema...", como uma "condição de
+    corrida teórica", a menos que uma explicação de como o bug pode ser
+    explorado também seja fornecida.
+  - Nenhuma correção "trivial" sem benefício para os usuários (mudanças de
+    ortografia, limpeza de espaços em branco, etc.).
+
+
+Procedimento para submeter patches para a árvore -stable
+---------------------------------------------------------
+
+.. note::
+
+   Patches de segurança não devem ser tratados (apenas) pelo processo de
+   revisão -stable, mas devem seguir os procedimentos descritos em
+   :ref:`Documentation/process/security-bugs.rst <securitybugs>`.
+
+Existem três opções para submeter uma alteração para as árvores -stable:
+
+1. Adicionar uma 'tag stable' à descrição de um patch que você então submete
+   para inclusão na mainline.
+2. Pedir para o time -stable pegar um patch que já está na mainline.
+3. Submeter ao time -stable um patch equivalente a uma alteração já presente
+   na mainline.
+
+As seções abaixo descrevem cada uma das opções em mais detalhes.
+
+:ref:`option_1` é **fortemente** preferida, é a mais fácil e mais comum.
+:ref:`option_2` é voltada principalmente para alterações em que o backport
+não foi considerado no momento da submissão. :ref:`option_3` é uma alternativa
+às duas opções anteriores para os casos em que um patch já presente na
+mainline precisa de ajustes para se aplicar em séries mais antigas (por
+exemplo, devido a mudanças de API).
+
+Ao usar a opção 2 ou 3, você pode pedir que sua alteração seja incluída em
+séries -stable específicas. Ao fazer isso, garanta que a correção ou uma
+equivalente seja aplicável, submetida, ou já esteja presente em todas as
+árvores -stable mais novas ainda suportadas. Isso serve para evitar
+regressões que os usuários possam encontrar posteriormente ao atualizar, se,
+por exemplo, uma correção mesclada para a 5.19-rc1 fosse retroportada para a
+5.10.y, mas não para a 5.15.y.
+
+.. _option_1:
+
+Opção 1
+*******
+
+Para que um patch que você submete para inclusão na mainline seja
+automaticamente pego para as árvores -stable posteriormente, adicione esta
+tag na área de sign-off::
+
+  Cc: stable@vger.kernel.org
+
+Use ``Cc: stable@kernel.org`` em vez disso ao corrigir vulnerabilidades ainda
+não publicadas: isso reduz a chance de expor acidentalmente a correção ao
+público por meio do 'git send-email', já que e-mails enviados para esse
+endereço não são entregues a lugar nenhum.
+
+Depois que o patch é mesclado na mainline, ele será aplicado à árvore stable
+sem que nada mais precise ser feito pelo autor ou pelo mantenedor do
+subsistema.
+
+Para enviar instruções adicionais ao time -stable, use um comentário embutido
+no estilo shell para passar notas arbitrárias ou predefinidas:
+
+* Especifique quaisquer pré-requisitos adicionais de patches para cherry
+  picking::
+
+    Cc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
+    Cc: <stable@vger.kernel.org> # 3.3.x: 1b9508f: sched: Rate-limit newidle
+    Cc: <stable@vger.kernel.org> # 3.3.x: fd21073: sched: Fix affinity logic
+    Cc: <stable@vger.kernel.org> # 3.3.x
+    Signed-off-by: Ingo Molnar <mingo@elte.hu>
+
+  A sequência de tags tem o significado de::
+
+    git cherry-pick a1f84a3
+    git cherry-pick 1b9508f
+    git cherry-pick fd21073
+    git cherry-pick <this commit>
+
+  Note que, para uma série de patches, você não precisa listar como
+  pré-requisitos os patches presentes na própria série. Por exemplo, se você
+  tiver a seguinte série de patches::
+
+    patch1
+    patch2
+
+  em que patch2 depende de patch1, você não precisa listar patch1 como
+  pré-requisito de patch2 se já tiver marcado patch1 para inclusão em stable.
+
+* Aponte pré-requisitos de versão do kernel::
+
+    Cc: <stable@vger.kernel.org> # 3.3.x
+
+  A tag tem o significado de::
+
+    git cherry-pick <this commit>
+
+  Para cada árvore "-stable" a partir da versão especificada.
+
+  Note que essa marcação é desnecessária se o time -stable puder derivar as
+  versões apropriadas a partir das tags Fixes:.
+
+* Atrase a coleta de patches::
+
+    Cc: <stable@vger.kernel.org> # after -rc3
+
+* Aponte problemas conhecidos::
+
+    Cc: <stable@vger.kernel.org> # see patch description, needs adjustments for <= 6.3
+
+Existe ainda uma variante da tag stable que você pode usar para fazer com que
+as ferramentas de backport do time -stable (por exemplo, AUTOSEL ou scripts
+que procuram commits contendo uma tag 'Fixes:') ignorem uma alteração::
+
+     Cc: <stable+noautosel@kernel.org> # reason goes here, and must be present
+
+.. _option_2:
+
+Opção 2
+*******
+
+Se o patch já foi mesclado na mainline, envie um e-mail para
+stable@vger.kernel.org contendo o assunto do patch, o ID do commit, por que
+você acha que ele deve ser aplicado, e para quais versões do kernel você
+deseja que ele seja aplicado.
+
+.. _option_3:
+
+Opção 3
+*******
+
+Envie o patch, depois de verificar que ele segue as regras acima, para
+stable@vger.kernel.org e mencione as versões do kernel para as quais deseja
+que ele seja aplicado. Ao fazer isso, você deve anotar o ID do commit
+upstream no changelog da sua submissão em uma linha separada acima do texto
+do commit, assim::
+
+  commit <sha1> upstream.
+
+Ou, alternativamente::
+
+  [ Upstream commit <sha1> ]
+
+Se o patch submetido se desviar do patch upstream original (por exemplo,
+porque precisou ser ajustado para uma API mais antiga), isso deve ser muito
+claramente documentado e justificado na descrição do patch.
+
+
+Após a submissão
+------------------
+
+O remetente receberá um ACK quando o patch tiver sido aceito na fila, ou um
+NAK se o patch for rejeitado. Essa resposta pode levar alguns dias, de acordo
+com a agenda dos membros do time -stable.
+
+Se aceito, o patch será adicionado à fila -stable, para revisão por outros
+desenvolvedores e pelo mantenedor relevante do subsistema.
+
+
+Ciclo de revisão
+------------------
+
+- Quando os mantenedores -stable decidem por um ciclo de revisão, os patches
+  serão enviados ao comitê de revisão, e ao mantenedor da área afetada pelo
+  patch (a menos que o submissor seja o mantenedor da área), com CC: para a
+  lista de discussão linux-kernel.
+- O comitê de revisão tem 48 horas para dar ACK ou NAK ao patch.
+- Se o patch for rejeitado por um membro do comitê, ou se membros da
+  linux-kernel se opuserem ao patch, levantando questões que os mantenedores
+  e membros não perceberam, o patch será removido da fila.
+- Os patches que receberam ACK serão postados novamente como parte de um
+  release candidate (-rc) para serem testados por desenvolvedores e
+  testadores.
+- Normalmente, apenas um lançamento -rc é feito; porém, se houver quaisquer
+  problemas pendentes, alguns patches podem ser modificados ou removidos, ou
+  patches adicionais podem ser enfileirados. Lançamentos -rc adicionais são
+  então lançados e testados até que nenhum problema seja encontrado.
+- Responder aos lançamentos -rc pode ser feito na lista de discussão enviando
+  um e-mail "Tested-by:" com qualquer informação de teste desejada. As tags
+  "Tested-by:" serão coletadas e adicionadas ao commit de lançamento.
+- Ao final do ciclo de revisão, o novo lançamento -stable será lançado
+  contendo todos os patches enfileirados e testados.
+- Patches de segurança serão aceitos na árvore -stable diretamente pelo time
+  de segurança do kernel, e não passarão pelo ciclo normal de revisão.
+  Entre em contato com o time de segurança do kernel para mais detalhes
+  sobre esse procedimento.
+
+
+Árvores
+--------
+
+- As filas de patches, tanto para versões concluídas quanto para versões em
+  andamento, podem ser encontradas em:
+
+    https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git
+
+- Os lançamentos finalizados e marcados de todos os kernels stable podem ser
+  encontrados em branches separados por versão em:
+
+    https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
+
+- O release candidate de todas as versões do kernel stable pode ser
+  encontrado em:
+
+    https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/
+
+  .. warning::
+     A árvore -stable-rc é um snapshot no tempo da árvore stable-queue e
+     mudará com frequência, sendo portanto rebaseada com frequência. Ela deve
+     ser usada apenas para fins de teste (por exemplo, para ser consumida por
+     sistemas de CI).
+
+
+Comitê de revisão
+-------------------
+
+- É composto por vários desenvolvedores do kernel que se voluntariaram para
+  essa tarefa, e alguns que não se voluntariaram.
-- 
2.43.0

