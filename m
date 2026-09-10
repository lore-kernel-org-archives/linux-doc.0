Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084CB4A689F
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 15:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053138; cv=none; b=OYP4XxhMZdhro4h1SwSPJJFDcmOzIv+LGQnRb1/+1+tKNIjCIyUTeinzlMmMzrT2t+3SukJj00AS0MupJM9i5tVus89CMzF8GKmzGT4fW2dO2q+/D6RlG+71k/KGq3rD41CD2SiHZJRG4Jtb1jDvvcurPJ2B9BJswmbo3AVhtFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053138; c=relaxed/simple;
	bh=3sNQWIDlE4N59r3fSHupqn0HMqAaBSiFCAxejvmr5Ck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JKxuvErmw6Ewu/jBLQv9QJc9e8ivjdBdS38R+kcjDA0Fb7GOTJN4TJTmHUDFIb5a9lfwkPD1jcYUMIhBu0o7pr6ZzGgqpP037yxsigMhEfNfMGNHRlvuJzfRtm0dOI16FvEyN8Ci3+Vr7dqTpK89u1G88ugC503OxYtSGVegRqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPNirOz0; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPNirOz0"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb766bfd6so17957421cf.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 08:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789053131; x=1789657931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U++VYFdufOt1VoK3zp95YIRmWwi5UJv4ZyowcDcMXAY=;
        b=YPNirOz0ODcZLlY5B8c7qUQufw2izsh4hsk3Gv3yBJVJFOwL3vQ6wKWqiaVEIAMA2D
         5BTIwy9Uc8qSrcMwZfFkrukhzLfnR3VTdfiGN5OuJWV61UZ2Pw0x4IBReVrues0lKYMf
         ty3I8Eojq0ryqXeGtwoiNuODwrxrCrT6YTv4WIC6+TQh1r59sSwXj38rO654So3r2/wo
         FL+Hqd35k2kHjCUwR80OZmZJVdJHvqBpkRna5cqdZ+aMLeFHbXwtcvoQ916+H3Idflk3
         mtpwF7YJBEJNQhN2ECk28q3SgGICOAguM8mxP03HZiDuVzVfGAoylh80lCnYh1RobVyp
         himA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789053131; x=1789657931;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U++VYFdufOt1VoK3zp95YIRmWwi5UJv4ZyowcDcMXAY=;
        b=rBZk74jlU6ROeZdp53PsgnaT485DkHMZN7g7F3znpTy98BBgkWkLBe6Zx/aQpStVVi
         qVZsWNX000bGe6CWVljpz81gv9y/IejcYQ3VQllxRxK2fQMe+VoIr7CET5Uv+oztgUPC
         ZdmMGE2gMyJWABalPI6PJKE1855Bx6vmGQOC4Jc0PQ1yQEHt7t6kcbofTIqle9v3xD0L
         lHSU4ncQTuqDrzlawBdAgju33BazwoRrIoc4bkAeRTsw7mPqCK8PCCIwhPG8SpAgkRCw
         LiJX16OkE5HY/N7ASzAOHdb5hs67pwHE1I7MACDJCnL6xZE6a+FmlIHG8fbRNcj/xXlS
         I3gg==
X-Gm-Message-State: AFuF++neo0QmrVjaD13dtQcbWeUitFhqL7iKZAgdpJJ9XYGErSKEwz7L
	fr7lXPzq2hQ//luY3RmarWyDPJG244a45gv8IOzIC9ptHKJ3sQnwNeChx8tbEQ==
X-Gm-Gg: AYBFou39JmaXseqRB19bp2ZAOel+hQcXd2O8qgs8IaK0zFU+OvitkG5Jzen/bgQD5yh
	L0ZLFJEo3+DxSuoBl7hjY3TxtNKPjcbPqfae2KsQxfZhMohRwRKgMv7gyCjKJ1RWAuKkzEHLg/u
	lXdgJ3qm8QicYT2jCmB2CYiRWKPFkBJyQbhSB4YhFwbOKyWxsavncY82fLhUDD/TiD7WKk9ed+D
	AmbQbxP9A/xsOVbOYRo9prNOYPNWptSltktGDyrDrtMllTiIwKiIhtfKzZcFRzIUOOx91YaIXsD
	AgIrPw/hQi00/2HS4umpw5Xy/gicDzejoBGEqvnyimOmi+5n0M271zXGQn0dcLS0i7tvfKSMRwb
	Ruw3M2XxPjpTtufBjKoFuh2mhOUZKo/9/eKBkO2INr7+yEfCh1yjfVOzqLHSiK2h5LAa7DhecT8
	zsr2w01r2oV4WsO1AAhUWujfGQdMkVOuxomV/1PAcHbSfO+ynckGZy8Z//BvbEb6A8xwAFYGidU
	g==
X-Received: by 2002:a05:622a:58c4:b0:530:42e4:f284 with SMTP id d75a77b69052e-530aef7f68bmr139002071cf.45.1789053130211;
        Thu, 10 Sep 2026 08:12:10 -0700 (PDT)
Received: from x-wing ([2804:14d:78b6:4583:a459:a51e:dab5:de9d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406b0f51sm172056476d6.42.2026.09.10.08.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:12:09 -0700 (PDT)
From: Fabio Pereira da Silva <silvapfabio@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Fabio Pereira da Silva <silvapfabio@gmail.com>
Subject: [PATCH] docs: translations: pt_BR: translate stable-kernel-rules.rst
Date: Thu, 10 Sep 2026 12:12:04 -0300
Message-ID: <20260910151204.1248-1-silvapfabio@gmail.com>
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

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 71eb024fbec8..fb3c5a951ceb 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -73,6 +73,7 @@ kernel e sobre como ver seu trabalho integrado.
    Requisitos mínimos <process/changes>
    CVEs <process/cve>
    Lista de verificação para patches <process/submit-checklist>
+   Tudo sobre lançamentos -stable <process/stable-kernel-rules>
    Interface de drivers do kernel Linux <process/stable-api-nonsense>
    Conclave (Continuidade do projeto) <process/conclave>
    Manuais dos mantenedores <process/maintainer-handbooks>
diff --git a/Documentation/translations/pt_BR/process/stable-kernel-rules.rst b/Documentation/translations/pt_BR/process/stable-kernel-rules.rst
new file mode 100644
index 000000000000..6050bfb1c543
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/stable-kernel-rules.rst
@@ -0,0 +1,249 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _stable_kernel_rules:
+
+Tudo o que você sempre quis saber sobre lançamentos -stable do Linux
+=====================================================================
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
