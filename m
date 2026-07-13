Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F4F40F8C3
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 12:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947088; cv=none; b=I/zL2rZs1I38Xgks7Ocd4VXL7p5wNpzJvvomUKg3+ZYz14dZ/swRRAaFPMicZXRiw2HdpAY9l4hwCc/blwGUETnC+OFd3i44gSuUyifMFclMrmr8znpmu0F6gg8TP60GPYsDDzWBqIB+u2Jhfi+SQw85WTljyIHfHjwh3/4pHZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947088; c=relaxed/simple;
	bh=Y/vNhEh/1Ys9U1vNFpzOkgHdw1OKod1IDAxywi0WXEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZZvNE3mkzEHNmEiN1IoLyVr+3WL9aX1i3KDIFktgi1upM+TpCvn5B06w2ANjLpQjvS+T+47QTfKoSlhMoPOux0FdPrtCVa6kl/FvPalxxPH0Zt4Hr0SZZ2OVgihYCPEdPTXPu2s2/NgbW03fnJLZvNshuzikLXNBM4Va5iqNsbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1Ie19fD; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1Ie19fD"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81e86df8987so32339617b3.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 05:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783947082; x=1784551882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMzVeObCD6X7h8viTz5BTLSTQ/ANDZXExiaRS8yKLBs=;
        b=J1Ie19fDo/wFGHpodv+RRIorhiZd5wZDZajBK6PcRnzw0KCvEBHw2F0CwXAgSHbsTi
         Ibn+Ad6ZgGQ+G6yNqUIMQIxyp/CVxdvg5YLi5BYQ3YGJogo6GW8lIIV0CA5A9ROcp96Y
         VNqtpAjqLwHID7Ce1sUk7co602Q8bBhPK6nfjqFCcSN9U4csMw46sfukfVNb6deJjtXD
         wmQB0h2TnC+XxsAA1W3trUM5Ggb4IVv/4gs5w+rzrAUzfCnAXBzK4pQKdCFzEzcBk42p
         RsYhxpE8wOngO3p9hwVSrUQqve/1zSNBVnS16vD4kty+vzAm7JyNxyokyVKlWUbEDsoh
         CilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947082; x=1784551882;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IMzVeObCD6X7h8viTz5BTLSTQ/ANDZXExiaRS8yKLBs=;
        b=gOR18R6T9bOPpKGkFGMM/GA+3KR16WNLwwZ+rNFEoz09ty78XnGA2rBmQyoaNqwdYh
         jzKMcZgFGzlS9w6hZsJfh1u8BPKgpTpAz0oG9pp1nlPYrR3P7tte9GCIRaWT9poYgXej
         onz7Cw6YuHePWs6Ce3A2Qu3PdNwm3N2wqxXtH5jNmn3qjsBqyyNNfoqc2Y5lL/Z078i3
         EW5L6j48JxWCODynUDoUz43RzQUvX58O0y2wysbF/2WFatpKfpls+J4NTHCtyNduNcQ6
         WSvGJhlnn8YrW/zpvNSR8BE4nS7SoewuP6ioqrsizsneirqMG5i+OQVn0jkRz64fX01t
         uYSA==
X-Gm-Message-State: AOJu0YwghRSTzsC6404z2jQvxbQJZSqVBtfGOF7vrb18ykORtafCAXN4
	s1Fn2+EvA5grlwrjX5Ys2lXrqKGb7r3YO4Tdu7VuGHD47aFGIyao1C1Q01ccGHJD
X-Gm-Gg: AfdE7ckMwMMwtVTU65Ech2mkEOJnDxkbvvToZLN5E1k6gXpgEb+/qm6eZIh7wiV2oh7
	hJ8CWUpPgpYW1TKGIF2vkzf03xtims76tKy3TYbIlY5M2UUPO218o0BKG6/s03h/rsUcNlzF+y1
	RrFYyfWkaBYdkdWmcly6/8v8z8ilFHTm5iCmWpsmXj9RxknRBY7b0A7l8UGZgjFl38MJzJJt/hj
	bb+lu/uzgXMYlIWgzcnp59Kxrh4qwxB6tijL81gHRXKzPzfdLThGuO1m18dDRrv4tpa3mtqmIsU
	Y0aTLwCinRoVYru93p+EtaZ0l6oZU8NTjF8ftO3jYDbroIMybQLqZst5FPqVbbzdewNQfv136sW
	Om9b/TuyVtvmG1exLuBAFCOLw54B8yvWsn3FZn8NSBzKBAY6hgvRWBNV1CgDe6PMa0RRjQavsTS
	qhFe30jxvmbOUNTzsC6pADluOVFfVePHZuTO8pcXvcQAufhr5HpRkMGg==
X-Received: by 2002:a05:690c:4b90:b0:81d:4174:6818 with SMTP id 00721157ae682-81e90031fb9mr66177187b3.13.1783947081861;
        Mon, 13 Jul 2026 05:51:21 -0700 (PDT)
Received: from HDBR-NT-105.dimenoc.com (smtp.hostdime.com.br. [187.45.177.18])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6bef1bdcsm113228167b3.12.2026.07.13.05.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:51:21 -0700 (PDT)
From: Matheus Patriota <matheuslinuxdeb@gmail.com>
To: danielmaraboo@gmail.com
Cc: linux-doc@vger.kernel.org,
	Matheus Patriota <matheuslinuxdeb@gmail.com>
Subject: [PATCH v3] docs: pt_BR: process: Translate stable kernel rules guide
Date: Mon, 13 Jul 2026 09:51:13 -0300
Message-ID: <20260713125113.20976-1-matheuslinuxdeb@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translates the documentation regarding stable kernel rules into
Brazilian Portuguese, maintaining consistency with original
formatting rules.

Changes in v3:
- Removed the Sphinx label to avoid conflict with the original
 documentation, as suggested by Daniel Pereira.
- Removed duplicated/incorrectly named files from the commit.

Changes in v2:
- I changed the patch name to avoid conflicts with the original patch.
- I adjusted the dashes by replacing them with commas.
- Regarding the typo, I corrected "concluídasamp" to "concluídas".

Signed-off-by: Matheus Patriota <matheuslinuxdeb@gmail.com>
---
 Documentation/translations/pt_BR/index.rst    |   1 +
 .../pt_BR/process/stable-kernel-rules.rst     | 232 ++++++++++++++++++
 2 files changed, 233 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/stable-kernel-rules.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 7a488f662..e761ee0eb 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -78,3 +78,4 @@ kernel e sobre como ver seu trabalho integrado.
    Processo do subsistema SoC <process/maintainer-soc>
    Conformidade de DTS para SoC <process/maintainer-soc-clean-dts>
    Processo do subsistema KVM x86 <process/maintainer-kvm-x86>
+   Regras para kernels estáveis <process/stable-kernel-rules>
diff --git a/Documentation/translations/pt_BR/process/stable-kernel-rules.rst b/Documentation/translations/pt_BR/process/stable-kernel-rules.rst
new file mode 100644
index 000000000..22fc83a73
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/stable-kernel-rules.rst
@@ -0,0 +1,232 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. _pt_BR_stable_kernel_rules:
+
+Tudo o que você sempre quis saber sobre as versões -stable do Linux
+===================================================================
+
+Regras sobre que tipos de patches são aceitos, e quais não são, na árvore
+"-stable":
+
+- Ele, ou uma correção equivalente, já deve existir na linha principal (upstream) do Linux.
+- Deve ser obviamente correto e testado.
+- Não deve conter mais de 100 linhas, incluindo o contexto.
+- Deve seguir as
+  :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`
+  regras.
+- Deve corrigir um bug real que incomoda as pessoas ou simplesmente adicionar um ID de dispositivo.
+
+Para detalhar o primeiro ponto:
+
+  - Ele corrige um problema como um "oops", um travamento, corrupção de dados, uma falha de segurança
+    real, uma peculiaridade de hardware, um erro de compilação (mas não para itens marcados
+    como CONFIG_BROKEN) ou algum problema do tipo "oh, isso não é bom".
+  - Problemas graves relatados por um usuário de um kernel de distribuição também
+    podem ser considerados se corrigirem um problema notável de desempenho ou interatividade.
+    Como essas correções não são tão óbvias e apresentam um risco maior de uma sutil
+    regressão, elas só devem ser enviadas por um mantenedor de kernel de distribuição
+    e incluir um adendo com link para um registro no Bugzilla (caso exista) e
+    informações adicionais sobre o impacto visível para o usuário.
+  - Nada do tipo "isso poderia ser um problema...", como uma "condição de corrida
+    teórica", a menos que também seja fornecida uma explicação de como o bug pode ser explorado.
+  - Nada de correções "triviais" que não tragam benefícios aos usuários (alterações de ortografia, limpeza
+    de espaços em branco, etc.).
+
+Procedimento para enviar patches para a árvore -stable
+------------------------------------------------------
+
+.. note::
+
+   Correções de segurança não devem ser tratadas (exclusivamente) pelo processo de revisão da
+   série estável, mas devem seguir os procedimentos descritos em
+   :ref:`Documentation/process/security-bugs.rst <securitybugs>`.
+
+Existem três opções para enviar mudanças para as árvores -stable:
+
+1. Adicionar uma 'tag stable' na descrição de um patch que você envia para
+   inclusão na linha principal.
+2. Pedir à equipe do stable para incluir um patch que já tenha sido integrado à linha principal.
+3. Enviar um patch para a equipe do stable que seja equivalente a uma alteração já
+   integrada à linha principal.
+
+As seções abaixo descrevem cada uma das opções com mais detalhes.
+
+A :ref:`option_1` é **fortemente** preferida, sendo a mais fácil e comum.
+A :ref:`option_2` destina-se principalmente a alterações para as quais o backporting não foi considerado
+no momento da submissão. A :ref:`option_3` é uma alternativa às duas opções anteriores
+para casos em que um patch integrado à linha principal precisa de ajustes para ser aplicado em séries
+mais antigas (por exemplo, devido a alterações na API).
+
+Ao utilizar as opções 2 ou 3, você pode solicitar que sua alteração seja incluída em séries
+estáveis específicas. Ao fazer isso, certifique-se de que a correção ou uma equivalente seja aplicável,
+submetida ou já esteja presente em todas as árvores estáveis mais recentes que ainda recebem suporte. Isso é
+feito para evitar regressões que os usuários poderiam encontrar posteriormente ao atualizar se,
+e.g. uma correção integrada ao 5.19-rc1 fosse retroportada para o 5.10.y, mas não para o 5.15.y.
+
+.. _option_1:
+
+Opção 1
+*******
+
+Para que um patch que você envia para inclusão na linha principal seja automaticamente coletado mais tarde
+para as árvores estáveis, adicione esta tag na área de sign-off::
+
+  Cc: stable@vger.kernel.org
+
+Use ``Cc: stable@kernel.org`` em vez disso ao corrigir vulnerabilidades não divulgadas:
+reduz a chance de expor acidentalmente a correção ao público por meio do
+'git send-email', já que e-mails enviados para esse endereço não são entregues em lugar nenhum.
+
+Assim que o patch estiver na linha principal, ele será aplicado à árvore estável sem
+que nada mais precise ser feito pelo autor ou mantenedor do subsistema.
+
+Para enviar instruções adicionais à equipe do stable, use um comentário inline no estilo shell
+para passar notas arbitrárias ou predefinidas:
+
+* Especifique quaisquer pré-requisitos adicionais de patch para o cherry picking::
+
+    Cc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
+    Cc: <stable@vger.kernel.org> # 3.3.x: 1b9508f: sched: Rate-limit newidle
+    Cc: <stable@vger.kernel.org> # 3.3.x: fd21073: sched: Fix affinity logic
+    Cc: <stable@vger.kernel.org> # 3.3.x
+    Signed-off-by: Ingo Molnar <mingo@elte.hu>
+
+A sequência de tags tem o significado de::
+
+    git cherry-pick a1f84a3
+    git cherry-pick 1b9508f
+    git cherry-pick fd21073
+    git cherry-pick <este commit>
+
+Observe que, para uma série de patches, você não precisa listar como pré-requisitos os
+patches presentes na própria série. Por exemplo, se você tiver a seguinte
+série de patches::
+
+    patch1
+    patch2
+
+onde o patch2 depende do patch1, você não precisa listar o patch1 como
+pré-requisito do patch2 se você já tiver marcado o patch1 para inclusão no
+stable.
+
+* Indique os pré-requisitos de versão do kernel::
+
+    Cc: <stable@vger.kernel.org> # 3.3.x
+
+A tag tem o significado de::
+
+    git cherry-pick <este commit>
+
+Para cada árvore "-stable" começando com a versão especificada.
+
+  Nota, essa marcação é desnecessária se a equipe do stable puder derivar as
+  versões apropriadas a partir das tags Fixes:.
+
+* Adiar a coleta de patches::
+
+    Cc: <stable@vger.kernel.org> # after -rc3
+
+* Apontar problemas conhecidos::
+
+    Cc: <stable@vger.kernel.org> # see patch description, needs adjustments for <= 6.3
+
+Além disso, existe uma variante da tag stable que você pode usar para fazer com que as ferramentas de
+backporting da equipe do stable (por exemplo, AUTOSEL ou scripts que buscam commits
+contendo uma tag 'Fixes:') ignorem uma alteração::
+
+    Cc: <stable+noautosel@kernel.org> # o motivo vai aqui, e deve estar presente
+
+.. _option_2:
+
+Opção 2
+*******
+
+Se o patch já tiver sido mesclado à linha principal, envie um e-mail para
+stable@vger.kernel.org contendo o assunto do patch, o ID do commit,
+por que
+você acha que ele deve ser aplicado e para quais versões do kernel você deseja que ele
+seja aplicado.
+
+.. _option_3:
+
+Opção 3
+*******
+
+Envie o patch, após verificar se ele segue as regras acima, para
+stable@vger.kernel.org e mencione as versões do kernel às quais você deseja que ele seja aplicado.
+Ao fazer isso, você deve anotar o ID do commit upstream no changelog da sua
+submissão com uma linha separada acima do texto do commit, desta forma::
+
+    commit <sha1> upstream.
+
+Ou, alternativamente::
+
+   [ Upstream commit <sha1> ]
+
+Se o patch enviado divergir do patch upstream original (por exemplo
+porque teve que ser ajustado para a API mais antiga), isso deve ser muito claramente
+documentado e justificado na descrição do patch.
+
+Após a submissão
+----------------
+
+O remetente receberá um ACK quando o patch tiver sido aceito na
+fila, ou um NAK se o patch for rejeitado. Esta resposta pode levar alguns
+dias, de acordo com as agendas dos membros da equipe do stable.
+
+Se aceito, o patch será adicionado à fila -stable, para revisão por outros
+desenvolvedores e pelo mantenedor do subsistema relevante.
+
+Ciclo de revisão
+----------------
+
+- Quando os mantenedores do -stable decidirem por um ciclo de revisão, os patches serão
+  enviados para o comitê de revisão, e para o mantenedor da área afetada do
+  patch (a menos que o remetente seja o mantenedor da área) e CC: para
+  a lista de discussão linux-kernel.
+- O comitê de revisão tem 48 horas para dar ACK ou NAK no patch.
+- Se o patch for rejeitado por um membro do comitê, ou membros da lista linux-kernel
+  reclamarem do patch, trazendo problemas que os mantenedores e
+  membros não perceberam, o patch será descartado da fila.
+- Os patches que receberam ACK serão postados novamente como parte de uma versão candidata (-rc)
+  para serem testados por desenvolvedores e testadores.
+- Normalmente apenas um lançamento -rc é feito, no entanto, se houver quaisquer problemas
+  pendentes, alguns patches podem ser modificados ou descartados ou patches adicionais podem
+  ser enfileirados. Lançamentos -rc adicionais são então lançados e testados até que nenhum
+  problema seja encontrado.
+- Responder aos lançamentos -rc pode ser feito na lista de discussão enviando
+  um e-mail "Tested-by:" com qualquer informação de teste desejada. As tags "Tested-by:"
+  serão coletadas e adicionadas ao commit de lançamento.
+- Ao final do ciclo de revisão, o novo lançamento -stable será lançado
+  contendo todos os patches enfileirados e testados.
+- Patches de segurança serão aceitos na árvore -stable diretamente da
+  equipe de segurança do kernel, e não passarão pelo ciclo normal de revisão.
+  Entre em contato com a equipe de segurança do kernel para mais detalhes sobre este procedimento.
+
+Árvores
+-------
+
+- As filas de patches, tanto para versões concluídas, quanto para versões em
+  andamento podem ser encontradas em:
+
+    https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git
+
+- Os lançamentos finalizados e marcados (tagged) de todos os kernels estáveis podem ser encontrados
+  em branches separados por versão em:
+
+    https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
+
+- A versão candidata de todas as versões estáveis do kernel pode ser encontrada em:
+
+    https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/
+
+  .. warning::
+     A árvore -stable-rc é um instantâneo no tempo da árvore stable-queue e
+     mudará frequentemente, portanto, passará por rebase com frequência.
+     Ela deve ser utilizada apenas para
+     fins de teste (por exemplo, para ser consumida por sistemas de CI).
+
+Comitê de revisão
+-----------------
+
+- Este é composto por um número de desenvolvedores de kernel que se voluntariaram para
+  esta tarefa, e alguns que não o fizeram.
-- 
2.53.0

