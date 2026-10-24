Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792848130;
	b=pDFwGKev982nDCq7Lp0AtZw569VJZqgCnq1/uD/xqYwcm33xTpPK9nyeLyKLVlyEz/4I
	 lh/EHhuD24OkOZT+PLxk24oeH75Wm4ardNSRK52ceZvB6y7zhLzw02dXdLFzVK1InF3Rc
	 8ISIn2bex21yeggduviUigArVS3uu+abeSKkX7lXx/4C0zk1sLEebUQ0FZjtweIMU4DxJ
	 7L3vMRDiRQhHc0G+GOLULAaE/W5yRkLusGZGZZKuMuwn4NhZL3ixprRx/0qZwD5hTD6Mc
	 ldJ3NmSrL1XRh60seOC4qXu0OmvS64N8RiGnJYh6QZJ4VFAwESc8ZZC71uSQ/jWuzAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JwBAHzeQLASA2mmHsTu/3mAr7UQKFZ/Q3H0+s9nKcqU=;
	b=R2jJjEhVLNxJH2IYRYxZ4rWU3ZcUEvtmpSoesKwwDcg6sXSQRKX8dy5bqIvwIaVNahW3
	 a+gV+dc9cPuiMLzGNRAqj2ihXP8zfDQ5AKzUT5mTNlf7Q18F3ngUggLIC0MX+2wrF9C3g
	 28f1Ip9F1dFLMCyUmPjFC9D0M0FcIrlfp8FJ3ibxV5owGtcMhN0F5c78SZwgtO5DTaZco
	 X3ZOFNc0Kd89PX0RNHxa38VS2Q3a1VzcZAETP2D6G/gxEY4zNFbbpG8H/eOMCSTldVKQ4
	 cVnTNkvK9bJlJv6G5MeaxMClaPEDXCMQRTYGAKPBadveBY6sF8XMzh8ua5ZYr0LZ1gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V4xcPRci;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5993A606A320
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 13:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5993A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V4xcPRci
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so2789077c88.0
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 06:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792848129; x=1793452929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JwBAHzeQLASA2mmHsTu/3mAr7UQKFZ/Q3H0+s9nKcqU=;
        b=V4xcPRci/dLwNE2axJfEQ3qd2XkypHSrT/pZ6NdPHmnTnVQiSz2crEhzNVPOEJlH1k
         QGnK85PLf4Ed2p1UMlcNYlPIrpjbLhHTNwrb6mdaEQQfkifP4KkUsUmBHti9ycxfjPU8
         5S+kHfPBYtyhXmhqHr7szp5PuRRJcGFqmFRtINhezBEda2g86SeKXxG/Lk4RWq78dhmP
         LD75f/7BT97j+OsRu4qxOfyoi5pLsof/kV7RIKKQM4044RWL05d+s7Xlm5IQ7XeDNGD3
         5xIlCJu19FYVsUBdqLJ/98DkgyhoXnQbnBBJ1bV5dtzAL+Mz0+GUrQujJK6MgExKwfSj
         2TlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792848129; x=1793452929;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JwBAHzeQLASA2mmHsTu/3mAr7UQKFZ/Q3H0+s9nKcqU=;
        b=QciWWKKAbuZgVY8OB0Pj/Fa+geKQyn0uGTeqjq4KZplbsXFvcTM/4nvFByNCz4kPnS
         UtHtPvRYSHXNd2BLv98qzGMcLlHdTzb/Nuq4qJ79exudNokUSRDPd9n914+sGQleyRxz
         ocqjccicSBEj3uczLqSmnAzMQnOTXCwoDFyWJlECaiqNjwdykWv33Xg2P/mgpBqIkfwF
         BFhWTu62YioP9MahuU0fgso3cTmqkEO19k2bAO+Vj1uRcXCkcd2B1s4MnIQB24nc1htJ
         0C5Yg5jrR1SKyT+AtmkJKIfuvFMdg36iseIQsFLifCDWL0BIo0N4zGdDkoKgATlTIz2E
         uRIA==
X-Forwarded-Encrypted: i=1; AKwUvBysVkuFDZqeBZ1YgfX70mnqpJjKp7BdVf2P1Hh+YZrFsCOohf9gi9xO9Ep3p1J+gBabn57ZUejpAnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjQyWJSrm3M3Pbwmao6nN28Imv4VIBE4c4wU3su0jgpLLxzaN8
	+KWeT7XU9zZ9C/pqiK2cGb3+Mpl8o0Zrw2mO9xMYT8/8Ldalg8zrrkOf
X-Gm-Gg: AYBFou0J4OSFUoem6MevligOAElCGAlKQxct1Ta/6Ra5DFdm6tpUjkpeKR3lV4z/tXy
	RESShypQdxy0Kr+FHGqpJ2N15hX+ErOk1TuXlyngE3wWf9MIRJKl8/ZRa07Uo5+THm0dHbEZ/eH
	y6XstoHqyD+S6WCq8RO1MmX46gsrU0nfyrqNdJggGmVKCxG1UdccNGaKDGJF/e3q+ddmau9zpCd
	SjNGZfhyWrMxwJSAb/ISz644hSsIn2btmfVCnhkMJzuIrxJOiBJ8ofCQxyOcdW4nvAy+6rlrRxl
	NgEn4kPe1nAwGc8ZSbtVEWsGZaoUez8tKWzXaYeoqAv4Ih8E0AyKuXYCilb+QaeHt9zZ10TV84b
	mnOEO7DNKuZSH4rbwfEMpzoPRKrTyinUgopK2CsvShkzwb2xPJbeeBsxQasBy8P1v0phbvUL6GG
	3aWjTXEDM4bNX+u7VjUT2ciPmeW+LrBHmAukE3eRxgY+4uEtOK84sZZ7sYVLVi4rdGpr4UO/3oW
	UUTZF1Mdyc5xrVTTvnZzJ+gY666WCnAsP893/SrvhsRx4X0B2/+KXk+NhPs7nIDIj02GUwy8ZCb
	OY7MaWTjsfFxLkP0NOW32i5xNMLYzQAL8BdSEFzzK+y3oW+yYR1gS2vaw9UtsgeG2i8xbal2svD
	iy1jLdb8f
X-Received: by 2002:a05:701b:465c:b0:19a:9a93:c9b2 with SMTP id a92af1059eb24-19a9a93cdbbmr1554264c88.13.1792848129040;
        Sat, 24 Oct 2026 06:22:09 -0700 (PDT)
Received: from localhost.localdomain ([177.75.70.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm15757768eec.23.2026.10.24.06.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:22:08 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 03/11] docs/translations/pt_BR: process: security-bugs.rst: sync with English
Date: Sat, 24 Oct 2026 10:21:50 -0300
Message-ID: <20261024132158.39493-4-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024132158.39493-1-danielmaraboo@gmail.com>
References: <20261024132158.39493-1-danielmaraboo@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sync with the English version:

- the report must give the affected kernel version range using a stable
  identifier (commit ID or exact version); time-dependent versions and
  distro kernel versions are not accepted;
- add the closing part of the "Responsible use of AI to find bugs"
  section, with the minimum procedure an AI assistant must follow and
  the two mandatory report steps.

Also fix the "reproducer" labels, translated as a verb and as a word
that does not exist in Portuguese, restore the "instead" that was
dropped and the bold emphasis lost in four places.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/process/security-bugs.rst           | 53 ++++++++++++++-----
 1 file changed, 41 insertions(+), 12 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/security-bugs.rst b/Documentation/translations/pt_BR/process/security-bugs.rst
index 321575657..dac456f6e 100644
--- a/Documentation/translations/pt_BR/process/security-bugs.rst
+++ b/Documentation/translations/pt_BR/process/security-bugs.rst
@@ -20,8 +20,13 @@ você não tiver certeza sobre quais informações são úteis. As seguintes
 informações são absolutamente necessárias em **qualquer** relatório de falha de
 segurança:
 
-  * **versão do kernel afetada**: sem indicação de versão, seu relatório não
-    será processado. Uma parte significativa dos relatórios é de bugs que já
+  * **intervalo de versões do kernel afetadas**: sem indicação de versão, seu
+    relatório não será processado. Observe que uma versão dependente do tempo,
+    como "o mainline mais recente", não é aceitável. É necessário um
+    identificador estável, como o ID de um commit ou uma versão exata. Versões
+    que designam kernels que não vêm do kernel.org (como kernels de
+    distribuições) não têm significado para os mantenedores e não serão
+    processadas. Uma parte significativa dos relatórios é de bugs que já
     foram corrigidos, portanto, é extremamente importante que as
     vulnerabilidades sejam verificadas em versões recentes (árvore de
     desenvolvimento ou a versão estável mais recente), pelo menos verificando
@@ -31,7 +36,7 @@ segurança:
     mostrando sua manifestação, e por que você considera o comportamento
     observado como um problema no Kernel, é necessária.
 
-  * **reproduzir**: os desenvolvedores precisarão ser capazes de reproduzir o
+  * **reprodutor**: os desenvolvedores precisarão ser capazes de reproduzir o
     problema para considerar uma correção como eficaz. Isso inclui tanto uma
     maneira de acionar o problema quanto uma maneira de confirmar que ele
     ocorre. Será necessário um reprodutor com dependências de baixa
@@ -87,7 +92,7 @@ apenas bugs comuns que foram qualificados incorretamente como bugs de segurança
 devido à falta de conhecimento do modelo de ameaças do kernel Linux, conforme
 descrito em Documentation/process/threat-model.rst, e deveriam ter sido
 enviados através dos canais normais descritos em
-Documentation/admin-guide/reporting-issues.rst
+Documentation/admin-guide/reporting-issues.rst, em vez disso.
 
 A lista de segurança existe para bugs urgentes que concedem a um atacante uma
 capacidade que ele não deveria ter em um sistema de produção corretamente
@@ -175,7 +180,7 @@ ou este para a lista mais ampla::
   dev1@example.com, dev2@example.org, dev3@example.com, dev4@example.org
 
 Se a esta altura você ainda estiver enfrentando dificuldades para identificar
-os mantenedores corretos, e apenas neste caso, é possível enviar seu
+os mantenedores corretos, **e apenas neste caso**, é possível enviar seu
 relatório apenas para a equipe de segurança do kernel Linux. Sua mensagem
 será triada e você receberá instruções sobre quem contatar, se necessário.
 Sua mensagem poderá igualmente ser encaminhada como está para os mantenedores
@@ -203,8 +208,8 @@ a tornar esses relatórios desnecessariamente difíceis de lidar:
   * **Formatação**: A maioria dos relatórios gerados por IA está repleta de
     tags Markdown. Essas decorações complicam a busca por informações
     importantes e não sobrevivem aos processos de citação envolvidos no
-    encaminhamento ou nas respostas. Por favor, sempre converta seu relatório
-    para texto simples sem quaisquer decorações de formatação antes de
+    encaminhamento ou nas respostas. Por favor, **sempre converta seu relatório
+    para texto simples** sem quaisquer decorações de formatação antes de
     enviá-lo.
 
   * **Avaliação de Impacto**: Muitos relatórios gerados por IA carecem de uma
@@ -216,17 +221,17 @@ a tornar esses relatórios desnecessariamente difíceis de lidar:
     especulativas. Faça com que sua ferramenta leia esta documentação como
     parte do processo de avaliação.
 
-  * **Reproduzidor**: As ferramentas baseadas em IA são frequentemente capazes
-    de gerar reproduzidores. Por favor, certifique-se sempre de que sua
-    ferramenta forneça um e teste-o exaustivamente. Se o reproduzidor não
+  * **Reprodutor**: As ferramentas baseadas em IA são frequentemente capazes
+    de gerar reprodutores. Por favor, certifique-se sempre de que sua
+    ferramenta forneça um e **teste-o exaustivamente**. Se o reprodutor não
     funcionar, ou se a ferramenta não puder produzir um, a validade do
     relatório deve ser seriamente questionada. Observe que, como o relatório
-    será postado em uma lista pública, o reproduzidor só deve ser compartilhado
+    será postado em uma lista pública, o reprodutor só deve ser compartilhado
     mediante solicitação dos mantenedores.
 
   * **Propor uma Correção:** muitas ferramentas de IA são na verdade melhores
     em escrever código do que em avaliá-lo. Por favor, peça à sua ferramenta
-    para propor uma correção e teste-a antes de relatar o problema.
+    para propor uma correção e **teste-a** antes de relatar o problema.
     Se a correção não puder ser testada porque depende de hardware raro ou de
     protocolos de rede quase extintos, é provável que o problema não seja um
     bug de segurança. Em qualquer caso, se uma correção for proposta, ela deve
@@ -245,6 +250,30 @@ um mantenedor com um relatório sem importância. Se o problema for claramente
 trivial e publicamente detectável, você deve relatá-lo diretamente às listas
 de discussão públicas.
 
+No mínimo, ao usar um assistente de IA para encontrar e relatar bugs, faça com
+que o assistente leia este arquivo e o Documentation/process/threat-model.rst
+antes de prosseguir, e que ele siga o procedimento descrito em
+coding-assistants.rst: trabalhar em uma árvore mainline atualizada e anotar o
+ID do commit, verificar se o bug é real, escrever uma correção, compilá-la sem
+avisos e sem apontamentos do checkpatch, fazer o commit com uma tag Fixes e
+identificar os mantenedores com o get_maintainer.pl.
+
+Além desse procedimento, o assistente de IA **DEVE**:
+
+1. Preparar um relatório em texto simples explicando o problema. Ele deve
+   conter os quatro itens listados no topo deste arquivo como absolutamente
+   necessários: a versão afetada ou o ID do commit anotado ao seguir o
+   procedimento acima, a descrição do problema, o reprodutor ou o seu status,
+   e as condições de acionamento.
+2. Iniciar o relatório com uma seção temporária listando os endereços dos
+   destinatários (mantenedores+lista para o patch, apenas mantenedores para o
+   relatório e o reprodutor), e com instruções lembrando o relator de verificar
+   se o seu cliente de e-mail está configurado corretamente (veja
+   email-clients.rst), e deixar a cargo do relator a remoção dessa seção
+   temporária.
+
+Um processo mais detalhado é descrito em https://github.com/masoncl/kres.git.
+
 Enviando o relatório
 --------------------
 
-- 
2.47.3

