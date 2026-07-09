Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DED9279903
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602743; cv=none; b=i0k9Z+reNBOGNeQMhkHzJKxP6c+/hLPdtddRa4Mdpczfy9fvMWp6qQ9Uzk3t82avipJWznHi4kig2fI9fpt3W+7+ZoMjlIek3SGh0Yshsw/tdnxBrZ8m12+f/BimUqYI8qOa1EHlu3hwCkLkD4yg8dfVtqHHaNNG0PQNvQU/xp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602743; c=relaxed/simple;
	bh=xW808fuPPWsltOQ2b7g49MQqOmp4eBJWZLNHomx9uzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P9hrGG7Yq18qdXgJITI5YiBNxXSjsgw2JowmR6Vpk+wwovAQLiSC/36LmYMCiEX+nMokofoonJpLP7xnzYl8NYCLC0cnBL5u0GARqBP0IHI481WkGpLGavzc31MXRJFBo7O+Sm6xarw43PQLULNqAkc8IrCtCfl+Iqq69mgQryI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sC0rjWiS; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sC0rjWiS"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6651bc5730dso2823441d50.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 06:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783602738; x=1784207538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BOha3PyFvY0LqRGYAsh8D3QLL9jBKYEJb2OG4/6I7eI=;
        b=sC0rjWiSkACC27Ij2nzz/V4Qd/xSbsJiyqLXmSiZw2XNYyMX6IW5Wx/APClVivOXsk
         fwllQkw1dXshVD080p1famTf5tllkgNahaeMIsJw2zu0p4L5rcCKPxNBLedg8PQqJdA0
         nOJqCKEhRPmCgiBkFDM6u1vSQhNatUTAY2W+hhOj8yL8dovyV73pCj5/or+A9SutEp+O
         bL4+A2Lg4cSvhN4G/l4AS/pRQRrCVqjWcUpwA/yd9x+zsycS8k1KZs/5bU5hAEaJDelI
         1Ltjuj1oafQikHgist4op6QOirp+bosV/v912f/RDUMEyqDAVjF22FbB15Xht4To0NfO
         JIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602738; x=1784207538;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BOha3PyFvY0LqRGYAsh8D3QLL9jBKYEJb2OG4/6I7eI=;
        b=kOhg6pIhWWQcbmxFUWgim+fwj95P4stzL/plzLx0+XMW5sa4YMvXN2HuLw3KTrmoSB
         Q9ssI8sWG03LCdddHHK7kS4byf78hPuR0MBzWK7VD/kCCEMPvLp6DroHbvJmiSBowvkr
         mHZYXvkPvv3rZhD16PxqGcAw1wtEIS1+XXtDC95g+KvKsaQ7oijIphaCOv/MWKNGXCvn
         lWkjjKkSDRoDJZyoVbKlzL0ha5YFEtlnoDb3f01azuaqQrOG8eNtfophf7yrSz55PV9G
         vkVotfyfxaIx3VqC+x6riEukpjy6uGU1E/BRpAXss6ZRvzT6+QhuM9y4DsSu/PfXJZxQ
         U2Kg==
X-Gm-Message-State: AOJu0YxLqXEWOnHMUYMVdg26VzA4rk4cRMh0IQ5pYuWaycdbDV/DKOng
	9N7lfuOjbf5uNMPwjHmae0qlP8BfMnxu5hV1EV1jypZDYpcjabY5OaHa
X-Gm-Gg: AfdE7clUzL45bOPPz6j6zTvBJ/rZcoslMLsXf94PEWBTkIXwSGCq1lCLJnsi/GWLiRC
	xlPU1IZ9W1Ezd/oREzjfYvNrI8GD1g45QdA36oq6LDs5Gl5KGkXAL7+FJngXNLTakkpvvsVx70V
	Q+cC4gTGJaHNwyBwjT4bJo0irkbCcuGlFzgMOBwZNQHClk95QjKlil57SaO1nTvQPK98IHZ3+Dd
	2qm/5v4Yh76687kuPDAlIctLE2+BMN9RRrgSDc13WoJjdQWPpX3gFVmqvK2U9aZ8YfsHB9bcKSk
	dd7CTti6syFt3QRQ4NOh4A6cW/2OAniCMCvc3hoLZJ8WSxj19OQIWZ9+7g4nyyZIgJIn8WdjrGN
	WM+WAeUdzJbYoJPT3ReyX8m0MsHf3V72JLsMgJ4yL0c7IoIWcKiK3DZdz0ryDOq9NvSyB33kMJT
	iwLFXP26Nnz2nGLpo=
X-Received: by 2002:a05:690e:d08:b0:667:902c:db76 with SMTP id 956f58d0204a3-6679f140a3fmr5043392d50.64.1783602737510;
        Thu, 09 Jul 2026 06:12:17 -0700 (PDT)
Received: from x-wing ([2804:7f0:7c80:39ba:e431:f4cb:6514:a2c2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c1a439asm16906497b3.27.2026.07.09.06.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:12:16 -0700 (PDT)
From: Fabio Pereira da Silva <silvapfabio@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH v2] docs: pt_BR: process: Translate CVE documentation
Date: Thu,  9 Jul 2026 10:12:12 -0300
Message-ID: <20260709131213.1216-1-silvapfabio@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/process/cve.rst into Brazilian Portuguese and
link it from the pt_BR documentation index.

Changes in v2:
- replace "conhecimento especializado" with "conhecimento técnico"
- change "atribuído contra o kernel Linux" to "atribuído ao kernel Linux"
- reduce repetition in the applicability paragraph
- replace "árvore de fontes" with "árvore de códigos-fonte"
- replace "grandes números" with "grandes quantidades"
- remove the repeated "qualquer" wording in the same paragraph

Signed-off-by: Fabio Pereira da Silva <silvapfabio@gmail.com>
---
 Documentation/translations/pt_BR/index.rst    |   1 +
 .../translations/pt_BR/process/cve.rst        | 125 ++++++++++++++++++
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/cve.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 76936710b06e..dcc238a5ecfe 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -71,6 +71,7 @@ kernel e sobre como ver seu trabalho integrado.
    Regras de licenciamento <process/license-rules>
    Como começar <process/howto>
    Requisitos mínimos <process/changes>
+   CVEs <process/cve>
    Conclave (Continuidade do projeto) <process/conclave>
    Manuais dos mantenedores <process/maintainer-handbooks>
    Processo do subsistema de rede (netdev) <process/maintainer-netdev>
diff --git a/Documentation/translations/pt_BR/process/cve.rst b/Documentation/translations/pt_BR/process/cve.rst
new file mode 100644
index 000000000000..3612ec3c3679
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/cve.rst
@@ -0,0 +1,125 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====
+CVEs
+====
+
+Os números Common Vulnerabilities and Exposure (CVE®) foram desenvolvidos
+como uma forma inequívoca de identificar, definir e catalogar vulnerabilidades
+de segurança divulgadas publicamente. Com o tempo, sua utilidade diminuiu em
+relação ao projeto do kernel, e os números CVE foram frequentemente atribuídos
+de formas inadequadas e por motivos inadequados. Por causa disso, a comunidade
+de desenvolvimento do kernel tendeu a evitá-los. No entanto, a combinação da
+pressão contínua para atribuir CVEs e outras formas de identificadores de
+segurança, e abusos contínuos por indivíduos e empresas de fora da comunidade
+do kernel, deixou claro que a comunidade do kernel deve controlar
+essas atribuições.
+
+A equipe de desenvolvedores do kernel Linux tem a capacidade de atribuir CVEs
+para possíveis problemas de segurança do kernel Linux. Essa atribuição é
+independente do processo normal de relato de bugs de segurança do kernel
+Linux, descrito em :ref:`securitybugs`.
+
+Uma lista de todos os CVEs atribuídos ao kernel Linux pode ser encontrada nos
+arquivos da lista de discussão linux-cve, como visto em
+https://lore.kernel.org/linux-cve-announce/. Para receber notificações sobre
+os CVEs atribuídos, por favor, `inscreva-se
+<https://subspace.kernel.org/subscribing.html>`_ nessa lista de discussão.
+
+Processo
+========
+
+Como parte do processo normal de lançamento estável, alterações do kernel que
+são potencialmente problemas de segurança são identificadas pelos
+desenvolvedores responsáveis pelas atribuições de números CVE e recebem
+automaticamente números CVE. Essas atribuições são publicadas na lista de
+discussão linux-cve-announce como anúncios frequentes.
+
+Observe que, devido à camada em que o kernel Linux se encontra em um sistema,
+quase qualquer bug pode ser explorável para comprometer a segurança do kernel,
+mas a possibilidade de exploração muitas vezes não é evidente quando o bug é
+corrigido. Por causa disso, a equipe de atribuição de CVEs é excessivamente
+cautelosa e atribui números CVE a qualquer correção de bug que identificar.
+Isso explica o número aparentemente grande de CVEs emitidos pela equipe do
+kernel Linux.
+
+Se a equipe de atribuição de CVEs deixar passar uma correção específica que
+qualquer usuário considere que deveria receber um CVE, por favor envie um
+e-mail para <cve@kernel.org> e a equipe trabalhará com você nisso. Observe
+que nenhum possível problema de segurança deve ser enviado para esse alias;
+ele é SOMENTE para atribuição de CVEs a correções que já estejam em árvores de
+kernel lançadas. Se você acredita ter encontrado um problema de segurança
+ainda
+não corrigido, por favor siga o processo normal de relato de bugs de segurança do kernel
+Linux, descrito em :ref:`securitybugs`.
+
+Nenhum CVE será atribuído automaticamente para problemas de segurança ainda
+não corrigidos no kernel Linux; a atribuição só acontecerá automaticamente
+depois que uma correção estiver disponível e aplicada a uma árvore de kernel
+estável, e ela será rastreada dessa forma pelo ID do commit git da correção
+original. Se alguém desejar que um CVE seja atribuído antes que um problema
+seja resolvido com um commit, por favor entre em contato com a equipe de
+atribuição de CVEs do kernel em <cve@kernel.org> para obter um identificador
+atribuído a partir de seu lote de identificadores reservados.
+
+Nenhum CVE será atribuído para qualquer problema encontrado em uma versão do
+kernel que atualmente não esteja sendo mantida ativamente pela equipe de kernel
+Stable/LTS. Uma lista dos ramos de kernel atualmente suportados pode ser
+encontrada em https://kernel.org/releases.html
+
+Contestações de CVEs atribuídos
+===============================
+
+A autoridade para contestar ou modificar um CVE atribuído a uma alteração
+específica do kernel pertence exclusivamente aos mantenedores do subsistema
+relevante afetado. Esse princípio garante um alto grau de precisão e
+responsabilização no relato de vulnerabilidades. Somente esses indivíduos, com
+profundo conhecimento técnico e conhecimento íntimo do subsistema, podem
+avaliar de forma eficaz a validade e o escopo de uma vulnerabilidade relatada e
+determinar sua designação CVE apropriada. Qualquer tentativa de modificar ou
+contestar um CVE fora dessa autoridade designada pode levar a confusão, relato
+impreciso e, em última análise, sistemas comprometidos.
+
+CVEs inválidos
+==============
+
+Se um problema de segurança for encontrado em um kernel Linux que é suportado
+apenas por uma distribuição Linux devido às alterações feitas por essa
+distribuição, ou porque a distribuição oferece suporte a uma versão do kernel
+que não é mais uma das versões suportadas pelo kernel.org, então um CVE não
+pode ser atribuído pela equipe de CVEs do kernel Linux e deve ser solicitado à
+própria distribuição Linux.
+
+Qualquer CVE atribuído ao kernel Linux para uma versão de kernel
+ativamente suportada, por qualquer grupo que não seja a equipe de atribuição de
+CVEs do kernel, não deve ser tratado como um CVE válido. Por favor, notifique
+a equipe de atribuição de CVEs do kernel em <cve@kernel.org> para que ela
+possa trabalhar para invalidar essas entradas por meio do processo de remediação
+da CNA.
+
+Aplicabilidade de CVEs específicos
+==================================
+
+Como o kernel Linux pode ser usado de múltiplas maneiras, com diversas
+formas de acesso por usuários externos, ou sem nenhum acesso, a
+aplicabilidade de qualquer CVE específico cabe ao usuário do Linux determinar;
+isso não cabe à equipe de atribuição de CVEs. Por favor, não entre em contato
+conosco para tentar determinar a aplicabilidade de qualquer CVE específico.
+
+Além disso, como a árvore de códigos-fonte é muito grande, e cada sistema usa
+apenas um pequeno subconjunto dessa árvore, o usuário do Linux deve estar
+ciente de que grandes quantidades de CVEs atribuídos não são relevantes para
+seus sistemas.
+
+Em resumo, não conhecemos o seu caso de uso e não sabemos quais partes do
+kernel você usa, portanto não há como determinarmos se um CVE específico é
+relevante para o seu sistema.
+
+Como sempre, o melhor é adotar todas as alterações de kernel lançadas, pois
+elas são testadas em conjunto como um todo unificado por muitos membros da
+comunidade, e não como alterações individuais selecionadas. Observe também que,
+para muitos bugs, a solução do problema geral não é encontrada em uma única
+alteração, mas pela soma de muitas correções umas sobre as outras. Idealmente,
+CVEs serão atribuídos a todas as correções de todos os problemas, mas às vezes
+podemos deixar de perceber algumas correções; portanto, presuma que algumas alterações
+sem um CVE atribuído podem ser relevantes para adotar.
\ No newline at end of file
-- 
2.43.0
