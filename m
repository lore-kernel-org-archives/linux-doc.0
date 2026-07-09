Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32143932F7
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 12:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599972; cv=none; b=pEAejCKg/IWQq5mLhoVLvUm3/DLnYNW0xpnch5wMjD8SPNyXb6NDc1GhplncCTcGO2Ku4oihXQwRIhc6BZ0BEx5fR7Le17e4a+I+pw179HlE8YJ4hxEqZVeJZIkEYTskh3pNEQlrfXN6XvErQM7QoGRkyMffcl0tLfMwyqIFkVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599972; c=relaxed/simple;
	bh=4LDYiZFdVzzJoK6HtQ74nhEmh60tsbuHBAnIJvLb2Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ule62Wr+hHPGBZyw8/9fSKiD9o8jp5eDQM6YV29T+dyAKZec1VQNJFvhprhWsxyckWoOPiJf5Th8kRzxvWN64jf++4fk4ui95KQRiGmB5KR5eiY0YRy54Y41pGLeNVZiARggBwugp2jMM9u2j/0b7rnIo/laybKdzhdOXpUjSVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQZo3n1o; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQZo3n1o"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81e69a2db34so12437217b3.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 05:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783599969; x=1784204769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VntlbTaIqXLJ7H4QcvEZdFhRlyqF5j7kFNfbvdoMoCU=;
        b=bQZo3n1o9z+i2Q9VDa1IlP1bZtYp99FwKOS82VnaPFy8gqyTUc7H+E7V5t1HwiV2nw
         8MMZgCkGZxzNh+757vV4fFNSjtpxCFdWCLawvqui7VxKWBsFMEKnRacPEaHDovkbilHZ
         VZEvtPTtX45WcVFHitv+7/Avaw7F9bbhs6/7qwfVBuDbJKGEEAsZ6BYlB5aw6zM85PXF
         fYyL+RZUqW7cDrjDecdMS1mMLPg2or5PZmlnI3zs/IDOUN/GdEHRAg50jW0mCiUxpdrd
         ULbIYBdCtEdX58vGfDAuBqlF8MRvAEFqiFzlWfM/IABH0T/wxOHtC5yC8W80/Fr/L2gw
         UnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783599969; x=1784204769;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VntlbTaIqXLJ7H4QcvEZdFhRlyqF5j7kFNfbvdoMoCU=;
        b=A0+bxbU68sE3D0F+EQ+aST9Dw1aPqwOV4ffjJUA565Osh/Pw/z3jxshpa7gHvdrB1H
         0kjQWC2LM9q2xbbIxJNO+qBuvcAJkERotSwVm3KZfP84yAzNXBg/CG/IYT9Lggx44BdO
         /zFXt3I8OQZxIgVETOZ//94QRG1ymNRvcSNrHa9iPlYfe27faNaiK9wATgotzMojlecO
         9ahsl4aP00m1sGC+RwpuN28OeV8Qb1wJmCIGnQVoHml9hfuiW01WNFQHM35HdprAM9eT
         dNsvySUpQ6pV14gBpgynVBKYvKPh4h1H6Gj8Ja5dMpFeJQide72UcVYHtcttWbAAwyN1
         Zi/w==
X-Gm-Message-State: AOJu0Ywi+bfJzJjEtkNP3Sp/T0TCY1i+uA2eQJAj6TZAgNvjmCBb8MD2
	t0CpJ0BCL7MNv96spFergp3JgaJZ+LM+krhKWYQ/m+CeJ7+eQadjo5hK
X-Gm-Gg: AfdE7cknke7ewjxY5evoxJ4KGCJTFcp0yfxMogxOsZyX1OwLWRKyIMg7DaRa2y557yw
	I+6jb3/0udBLan26BZNstAZUlFj/urBzu6aUaOyttTIAghc2dBbZ63uoqu8oYb/Rk9Jjlx/zoEB
	nziTW5Hw869kebfSy9IuY9Hz0Q40+PQ4/54JsjjozOlI/OaWeEKOIoY9ISNf5XKYWwaoQJpVHz0
	6UCCscBc3MEUKZXz9b9F40Ee4JyjibvTf4LewxT5Le3zokjz1BAdhROlEpZlElVpUJSv45I4nR7
	v+44YyKRHjRZFZlvcCEvKx38uQkQM2h6qVP7TM4QpojQd9xWDi9ScAmjdvXzZntIrGJYe80UR5C
	zGcdsS/FKryVqBe1/Vs6swseYIwLUF698Xap4FfcEOfBRHuSMZCl8jL5W8HxTR+Gy93rOSx2p61
	RUzn+ap7Y05gkLXajd49/PR83ZD4RHstg4Pj4mrP7goDoc6KWOUTGLEg==
X-Received: by 2002:a05:690c:9692:b0:81e:69fe:a5a8 with SMTP id 00721157ae682-81e69fea820mr28137357b3.38.1783599969207;
        Thu, 09 Jul 2026 05:26:09 -0700 (PDT)
Received: from HDBR-NT-105.dimenoc.com (smtp.hostdime.com.br. [187.45.177.18])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c1fba59sm15864417b3.39.2026.07.09.05.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:26:08 -0700 (PDT)
From: Matheus Patriota <matheuslinuxdeb@gmail.com>
To: danielmaraboo@gmail.com
Cc: linux-doc@vger.kernel.org,
	Matheus Patriota <matheuslinuxdeb@gmail.com>
Subject: [PATCH v2] docs: pt_BR: process: Translate stable kernel rules guide
Date: Thu,  9 Jul 2026 09:25:58 -0300
Message-ID: <20260709122558.16266-1-matheuslinuxdeb@gmail.com>
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

Changes in v2::

I changed the patch name to avoid conflicts with the original patch.
I adjusted the dashes by replacing them with commas.
Regarding the typo, I corrected "concluidasamp" to "concluídas".

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
index 000000000..e0b0ff3ed
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/stable-kernel-rules.rst
@@ -0,0 +1,232 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. _stable_kernel_rules:
+
+Tudo o que você sempre quis saber sobre as versões -stable do Linux
+===================================================================
+
+Regras sobre que tipos de patches são aceitos — e quais não são — na árvore
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
+- As filas de patches, tanto para versões concluídasamp; quanto para versões em
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

