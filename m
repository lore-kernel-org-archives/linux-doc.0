Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C617385521
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 19:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789067284; cv=none; b=OHzh6QGMMIU7Cb8PPE0ex4Xk6F7QqBKQ/HwZg7Zq37PKVYqf8OV3v/Zcjg88jwh5zWIWMO/Di1z5f8v3qRCUa+zONP4VVz1Xi1solU1D2grXBExlYUM1y3yIu9j4pUQlSIgh5y7KasdgdsvoD8g+0wkHSdH9HPNMUNvXCqZeXs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789067284; c=relaxed/simple;
	bh=u/0dTbbqepNClja1zIO/vLnXEkKBw/pQUjJaQL5ltmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bKaIp3xdZWVwakLd1ZQ3WzE/b9EZ2miBZDVLBBNytUOMs4X4gOkZ/ZgBRguYxzxIdGTIts3cR/WLLu9+/vTsjw1+VwYTX6PBSr31FoLT9nhVM0aaaaERfhL0l5gErHZaFHE3358zL/LAjEaGrPOvMHDVJIXVEnuiCh0lfgoCG2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pLMiqSfX; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pLMiqSfX"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e4d9197so171066e0c.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 12:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789067281; x=1789672081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nta9YJQGhypuCF2vqNw2PosLbFu/KIuZnGsYvK19NI=;
        b=pLMiqSfX/MBNs0Rp4xRYSKbt0jD50bG7qlLTyowu1ALrSJGYMmLMffs7uCudxoD215
         f6dN16L9ccIu2lSC1dEvSjeYT6dlT8isP16H68ZUtSM/xexMRnyIln4lPZceB57t/gOe
         SvNChWfv/nt5Ge1Yu9g1etCw0TOQ2e4819B4s2DvdS4viDleNctyvwV5FZBjhdMT5OEE
         58hOFYDxKJ/T7BAiybWX7QvvKTgfmz88TWXZBNSeEkw3bo45ZY5fSIuCxna11uye7CU6
         GfkoALGKjIG32SgT0cqSu4Isq3OWpUUf+NmVqEUv5CIUqXLpdm+lRGYrsXq+reh3p7RN
         cPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789067281; x=1789672081;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9nta9YJQGhypuCF2vqNw2PosLbFu/KIuZnGsYvK19NI=;
        b=kYhmEfcFWNHEi6rYVlOM1CzmOlwd7fenXuJ0+hGyVGi1xIqx8E0c/oK+wTvoKgu2Ff
         LMz7QdsRepAT9m5V2uCWKPBhCScTxqSNQFgHONshU6v82wJyu0uJtA8TRkN5n7N1Ir0U
         uoXy14mH4byKTyLIU4cGjMCJPswRhmFJ8h5/EXUk2aDKxkuUYRhhV+OPEPIFfojwPP/9
         5FbEGJiecBtj/5oAh0WOfb7hfAjA7txO1PlrrTF0stjMGV5s0+pieWM4Vv1ex+RC/ES1
         rRYbtMMhv+8avuFiyL0yJhFKMIinC0DZQUFDvse/eftnVGKZJjLzPzqp6MvdKPVxxsCN
         nDSA==
X-Gm-Message-State: AFuF++nJ8L0PE7HpEyrQpCUQUV/U3pE90GWcn+fO75Wk4Xnb1B1u04E6
	psgAAgFo2lCohJxsqxe/dd/9RhOoxHf25oD8NoaGTrQHvv6oMzlAjivN
X-Gm-Gg: AYBFou359e0XHF24L4gKKfoqTnXr+zWosx0JxGTzuUZeGIXJjBhIsqtF5o+fy4RThKU
	eQurwHb3mrl6NS3dJ/OXSc4uaVNfgCYzr9lb1MuUAWrH1J9TlFp/Xht4exe3WRtN5J7cYZoIhtG
	5x0hhOyEE3jl4phZlEi99cKdOxv/wEcT9P6wWZ3uWeEdmUgx/xJ0OVGq6L0YzU29EVlnXJM9oLt
	SEk271mOcoPSEXjzHdMvenSBzyyHjUg9vB/yiQpRlf3p/tWAe5rJn4T4uy2bFsgMiQ8FBgRtp6Z
	P+l2k1gdpqy3iAYWvW7ehuKZhhikkoMtPTMQVc/YP8GAfv0ttplMQ4+bZnkuyglRG5p6usFqOqP
	QpjokP85cD8frKO7eXrsoPL+NNviLmnMVphqx0JnrgUxKJZ9HImMMuS5axbXBdMpiZbqH3FHBq1
	HSaPTPqasd0gAAQfEXtS3HR1eRr6i5BhjNbjoYlTu96iYSLKbHv+gJ57P3hHljICnKQxfi8tuUO
	w==
X-Received: by 2002:a05:6122:1b0a:b0:5c6:58e0:b2e0 with SMTP id 71dfb90a1353d-5c8462c4e61mr782205e0c.7.1789067280883;
        Thu, 10 Sep 2026 12:08:00 -0700 (PDT)
Received: from x-wing ([2804:14d:78b6:4583:bc62:f651:fe2f:303b])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470add08sm299205e0c.3.2026.09.10.12.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:08:00 -0700 (PDT)
From: Fabio Pereira da Silva <silvapfabio@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Fabio Pereira da Silva <silvapfabio@gmail.com>
Subject: [PATCH v2] docs: translations: pt_BR: translate stable-kernel-rules.rst
Date: Thu, 10 Sep 2026 16:07:54 -0300
Message-ID: <20260910190754.1687-1-silvapfabio@gmail.com>
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

Assisted-by: Opus 5:Opus 5-3-opus
Signed-off-by: Fabio Pereira da Silva <silvapfabio@gmail.com>
---
Changes in v2:
- Add document to Documentation/translations/pt_BR/process/index.rst
  instead of the top-level index.
- Remove top-of-file Sphinx label to prevent build error.
- Fix title underline length.
- Include Assisted-by: Opus 5:Opus 5-3-opus trailer as per documentation.

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

