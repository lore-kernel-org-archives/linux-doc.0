Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7C53769E9
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787318541; cv=none; b=B2mwpF6EjFGvXSGzT5RqLWgNshHgKsMT/xYftEnjXxujSm91bkRKKezsmeZf22orMMrX/VBoNWBm6uID3XG5XYoY/A+xSTclLYtnvgpkyABn2ZEswEZI7ALA+UF6dZD0XB59rZCCsFZynoylNANadVjBgKJj4+ZKkM98zqgVOdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787318541; c=relaxed/simple;
	bh=BAyBGdY5R59IZ2X7Kx76TF9SuCwi5V19TEBUExdLL8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rsVCz4cEAneWPf1cZQV3aAuN7FqwHTlewEfdaejGnl5Ob/Jl+hjKuEQUbJoZ8GEYZbnihUezlHT6CF0d1uT2/IqAJYgdgYXoSEG3mXdRSW8jcp+aZcq7W/l4XuYiyWsE3YXbOkudr0k/thcZ0+5q5Or7l057I1OSHw8IAFfVKp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrVJWXUj; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrVJWXUj"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81ff017d420so30565967b3.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787318533; x=1787923333; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bwEiFx6fpVbLNRTvN8TsAw1/7zLIHkL0ilf8cWzr0W8=;
        b=NrVJWXUjKa7wXI1w6DLWIaRAqGSfb3ETLLLq5wPqvoqngX69AvQNEtVPpLLMyWTne1
         XD7xNeApq+0uWb7Li0foUs7g2Kl7S/S6mMozM8lz02cC1blYCqFZmI+wT6FdRXGFkTcN
         E8m3lfuDHXkFtP5bxgth4EZM+I5UWS8NX2fAU3zj9mu/kGQL+BBuMBqEVcd1NQGbqrtf
         w+6HYq6wz2jmXe7PsSo7tbgp/R6Zyw7fdna3zzpxh9q0GjcwhEHDO62YV0ZN0pOBzI35
         XyCwVB7/FKLcqn7nXI8v1GgPl0IFgyATbY1ZjcS1cwergHTSXuBGaNx73vk/XrBoem5n
         nNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787318533; x=1787923333;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bwEiFx6fpVbLNRTvN8TsAw1/7zLIHkL0ilf8cWzr0W8=;
        b=UxDY24H79I2YDmL9uvfvch1gwNkApa7gdbb7mABAU+wVJqfMd/PXurEOPjuV9Nf8xr
         RMfzwRh8fMXLLy1xX7cIfvRlkvOwXM01thdF29AZoxKnNKK3emc+YYPAm+nJUEgGMthK
         sOsx7bBX2H05XwOdHmaDFYAAYBWmv3zs3b1f2D+VdZlQtYsl0FfrgLIG6mdyI0yLEWR3
         zm3e7NRN5YZgecXYpE9wJ78KAJVg7G/aWBE6czNEVzYdmjfkeC3UBgJUsrKr5nhoFb4h
         mO8tENY15cpuSVJuiqeLX79llQ56erOblIs17oZOgDeZ5O+3ZeyXZkA5f4GxrSchelDO
         RXyQ==
X-Gm-Message-State: AFuF++ksXNe2KUTmn3LsOCEN63vECcLTNN+omQFWWbYHpJgtRFGgYs8k
	0yf78ltLMu/lOJW/One0vcZJ1gG0+joAMKfi2NTgZi8KQeDsoTXH62PS
X-Gm-Gg: AR+sD13sN9kUf4n8T/XCUOiA3OKE5lGtUvgDb6WWOiEtW/Gi2MAi270tdckXLQWeziV
	JmB0SLlBp8FxLRuOAbpI1Pi5phFHawnNCVQYBccNo8jsHrRL/dvQvElCOGVKhogIAK0g+XUoJPH
	hFlUpD7YilyIcCdHBIMyDxS8W9W2Di6W9EmrvNsiKzPcxETHgXxGFByioSbt/rIWwLPr+Ib5PC1
	p55+5LeLBEvoRbseMf4JVRKTcO/R9TAV52nGOQpAtwY2vFSFzJvrowVAVBq2uwwPZWqeMjukI3Z
	2Oe+4yNyrLTNEFeNQf24vzuSR0kpr3HqrKgg9rM1vsEBZ+uB2sqqWBkbEE9ZdH/3V7uetzmCtUY
	glCCHn0fxpex/RYBEGuoost9uPd5U5ofXAFEwIzdOdsOmkrOVRSK4ZwqtU9xxDXSJ2nZQZqCG34
	jFvUj8Aj7EHtlmngBvHHA+n0P9793e4eBE5Nm3SgVZCgBW06oFjM3hZ1anc4gFeuRL8ZeSwm8=
X-Received: by 2002:a05:690c:e0d0:10b0:80c:16ad:2f16 with SMTP id 00721157ae682-84a16f25227mr15783807b3.8.1787318533261;
        Fri, 21 Aug 2026 06:22:13 -0700 (PDT)
Received: from [192.168.50.238] ([206.42.51.82])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84518a9d7c8sm40237967b3.40.2026.08.21.06.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:22:12 -0700 (PDT)
From: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Date: Fri, 21 Aug 2026 10:22:01 -0300
Subject: [PATCH v2] docs: translations: pt_BR: translate
 stable-api-nonsense.rst
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260821-ptbr-stable-api-nonsense-v2-1-f07df4a0fc3b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQqDMBBEf0X23C1JNKX25H8UDzFudEETSURax
 H9vKr0W5vIG5s0OiSJTgkexQ6SNEwefQV0KsKPxAyH3mUEJdRN3WeOydhHTarqJ0CyMPvhEOWi
 rsleVNsbpGvJ8ieT4daqfbeaR0xri+3za5Lf9SZX4L90kShRlJZ3Wjqzqm2E2PF1tmKE9juMDc
 4c0vcAAAAA=
X-Change-ID: 20260819-ptbr-stable-api-nonsense-c43d245aaf59
To: Daniel Pereira <danielmaraboo@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lucas Adryell Ramalho <lucasadramalho@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787318529; l=13735;
 i=lucasadramalho@gmail.com; h=from:subject:message-id;
 bh=BAyBGdY5R59IZ2X7Kx76TF9SuCwi5V19TEBUExdLL8I=;
 b=mHOn4QAqTf5VjLbNXQsJ3VGimr6vFj59MQY9Sx5S+mlrw665zKmPaHA9EjCXeNJQ8xQPc1OcA
 pV8w+wByaZbDD73PIjXvaoCbVhlF9+Cy0NnkOCIn5ATj2DOok22V3bI
X-Developer-Key: i=lucasadramalho@gmail.com; a=ed25519;
 pk=m3TQ0mH3ARCg0EdGRQWOTlBoFnDen6VWMNGjXW+W4NM=

Translate Documentation/process/stable-api-nonsense.rst into Brazilian
Portuguese.

Assisted-by: ChatGPT:GPT-5.5
Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
---
Changes in v2:
- Remove the unnecessary top-of-file label that caused a duplicate-label warning during the documentation build.
- Add disclosure for generative tools used while preparing and reviewing the translation.
- Build the documentation with make htmldocs and verify that the translated document introduces no new warnings or errors.
- Link to v1: https://lore.kernel.org/r/20260820-ptbr-stable-api-nonsense-v1-1-0341f55fec2d@gmail.com

I used ChatGPT and DeepL to help me clarify some Portuguese sentences that did not sound entirely natural or clear to me.
---
 Documentation/translations/pt_BR/process/index.rst |   1 +
 .../pt_BR/process/stable-api-nonsense.rst          | 216 +++++++++++++++++++++
 2 files changed, 217 insertions(+)

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index eda2a3fc5..1fb2f325f 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -58,6 +58,7 @@ Estas são as regras pelas quais tentamos viver na comunidade do kernel
    Interpretação do Código de Conduta do Kernel Linux <code-of-conduct-interpretation>
    Modelos de Maturidade para Contribuição no Kernel Linux <contribution-maturity-model.rst>
    Declaração sobre Drivers do Kernel <kernel-driver-statement>
+   A interface de drivers do kernel Linux <stable-api-nonsense>
    Estilo de gerenciamento do kernel Linux <management-style>
    Conclave (Continuidade do projeto) <conclave>
 
diff --git a/Documentation/translations/pt_BR/process/stable-api-nonsense.rst b/Documentation/translations/pt_BR/process/stable-api-nonsense.rst
new file mode 100644
index 000000000..526cac3f2
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/stable-api-nonsense.rst
@@ -0,0 +1,216 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+A interface de drivers do kernel Linux
+=======================================
+
+(todas as suas perguntas respondidas e mais algumas)
+
+Greg Kroah-Hartman <greg@kroah.com>
+
+Este texto foi escrito para tentar explicar por que o Linux **não possui uma
+interface binária do kernel nem uma interface estável do kernel**.
+
+.. note::
+
+   Observe que este artigo descreve as interfaces **internas do kernel**, e não
+   as interfaces entre o kernel e o espaço de usuário.
+
+   A interface entre o kernel e o espaço de usuário é aquela utilizada pelos
+   aplicativos: a interface de chamadas de sistema (syscalls). Essa
+   interface é **muito** estável ao longo do tempo e não será quebrada. Tenho
+   programas antigos, compilados em uma versão do kernel anterior à 0.9 e alguma
+   coisa, que ainda funcionam perfeitamente na versão mais recente do kernel
+   2.6. Essa é a interface cuja estabilidade os usuários e desenvolvedores de
+   aplicativos podem considerar garantida.
+
+
+Resumo executivo
+----------------
+
+Você acha que quer uma interface estável do kernel, mas, na verdade, não quer,
+e nem sabe disso. O que você realmente quer é um driver que continue
+funcionando de maneira estável, e isso só é possível se o seu driver estiver
+na árvore principal do kernel. Você também obtém muitos outros benefícios se
+o seu driver fizer parte da árvore principal do kernel. São esses benefícios
+que ajudaram a tornar o Linux um sistema operacional tão robusto, estável e
+maduro — justamente a razão pela qual você o está usando.
+
+
+Introdução
+----------
+
+Apenas quem escreve drivers para o kernel precisa se preocupar com as mudanças
+nas interfaces internas do kernel. Para a grande maioria das pessoas, essas
+interfaces nem sequer são visíveis e tampouco são motivo de preocupação.
+
+Antes de mais nada, não abordarei **nenhuma** questão jurídica relacionada a
+código-fonte fechado, código-fonte oculto, blobs binários, wrappers de
+código-fonte ou qualquer outro termo usado para descrever drivers do kernel
+cujo código-fonte não seja disponibilizado sob a GPL. Consulte um advogado
+caso tenha alguma dúvida jurídica. Sou programador e, portanto, descreverei
+aqui apenas as questões técnicas (isso não significa que as questões
+jurídicas sejam pouco importantes; elas são reais e você precisa estar sempre
+ciente delas).
+
+Portanto, há dois tópicos principais: interfaces binárias do kernel e
+interfaces estáveis de código-fonte do kernel. Ambos dependem um do outro,
+mas discutiremos primeiro a parte referente às interfaces binárias para
+deixá-la de lado.
+
+
+Interface binária do kernel
+---------------------------
+
+Supondo que tivéssemos uma interface estável de código-fonte para o kernel,
+uma interface binária surgiria naturalmente também, certo? Errado. Considere
+os seguintes fatos sobre o kernel Linux:
+
+  - Dependendo da versão do compilador C utilizada, diferentes estruturas de
+    dados do kernel terão diferentes alinhamentos e poderão até mesmo incluir
+    funções de maneiras distintas (por exemplo, tornando determinadas funções
+    inline ou não). A organização das funções individuais não é tão importante,
+    mas as diferenças no preenchimento das estruturas de dados são muito
+    importantes.
+
+  - Dependendo das opções selecionadas durante a compilação do kernel, uma
+    grande variedade de comportamentos pode ser assumida pelo kernel:
+
+      - diferentes estruturas podem conter campos diferentes;
+      - algumas funções podem nem sequer ser implementadas (por exemplo,
+        determinados bloqueios são completamente eliminados durante a
+        compilação em kernels sem SMP);
+      - a memória dentro do kernel pode ser alinhada de maneiras diferentes,
+        dependendo das opções de compilação.
+
+  - O Linux é executado em uma grande variedade de arquiteturas de
+    processadores. Não há como drivers binários compilados para uma arquitetura
+    funcionarem corretamente em outra.
+
+Vários desses problemas podem ser contornados simplesmente compilando o módulo
+para uma configuração específica e exata do kernel, utilizando exatamente o
+mesmo compilador C empregado na compilação do kernel. Isso é suficiente caso
+você queira fornecer um módulo para uma determinada versão de uma distribuição
+Linux específica. Porém, multiplique essa única compilação pelo número de
+distribuições Linux existentes e pelo número de versões suportadas de cada
+distribuição e você rapidamente terá um pesadelo de diferentes opções de
+compilação em diferentes versões. Além disso, cada versão de uma distribuição
+Linux contém vários kernels, cada um ajustado para diferentes tipos de
+hardware (diferentes tipos de processadores e diferentes opções). Portanto,
+mesmo para uma única versão, você precisará criar várias versões do seu módulo.
+
+Acredite em mim: com o tempo, você enlouquecerá se tentar oferecer suporte a
+esse tipo de distribuição. Aprendi isso da maneira mais difícil há muito
+tempo...
+
+Interfaces estáveis de código-fonte do kernel
+----------------------------------------------
+
+Esse é um tópico um pouco mais "volátil" se você conversar com alguém que está
+tentando manter atualizado, ao longo do tempo, um driver do kernel Linux que
+não está na árvore principal do kernel.
+
+O desenvolvimento do kernel Linux é contínuo e ocorre em ritmo acelerado,
+sem desacelerar. Por isso, os desenvolvedores do kernel encontram bugs nas
+interfaces existentes ou descobrem maneiras melhores de fazer as coisas.
+Quando isso acontece, eles corrigem as interfaces atuais para que funcionem
+melhor. Nesse processo, nomes de funções podem mudar, estruturas podem crescer
+ou diminuir e parâmetros de funções podem ser reformulados. Quando isso
+acontece, todos os locais dentro do kernel que utilizam essa interface são
+corrigidos ao mesmo tempo, garantindo que tudo continue funcionando
+corretamente.
+
+Como exemplos específicos disso, as interfaces USB internas do kernel
+passaram por pelo menos três reformulações diferentes ao longo da existência
+desse subsistema. Essas reformulações foram feitas para resolver diversos
+problemas:
+
+  - Uma mudança de um modelo síncrono de fluxos de dados para um modelo
+    assíncrono. Isso reduziu a complexidade de vários drivers e aumentou a
+    taxa de transferência de todos os drivers USB, de modo que atualmente
+    executamos quase todos os dispositivos USB na maior velocidade possível.
+
+  - Foi feita uma mudança na maneira como os pacotes de dados eram alocados
+    pelos drivers USB a partir do núcleo USB, de modo que todos os drivers
+    passaram a precisar fornecer mais informações ao núcleo USB, corrigindo
+    diversos deadlocks documentados.
+
+Isso contrasta fortemente com vários sistemas operacionais de código fechado,
+que tiveram de manter suas interfaces USB antigas ao longo do tempo. Isso
+permite que novos desenvolvedores utilizem acidentalmente interfaces antigas
+e façam as coisas de maneira inadequada, prejudicando a estabilidade do
+sistema operacional.
+
+Em ambos os casos, todos os desenvolvedores concordaram que essas eram
+mudanças importantes que precisavam ser feitas, e elas foram realizadas com
+relativamente pouco esforço. Se o Linux tivesse de garantir a preservação de
+uma interface de código-fonte estável, uma nova interface teria de ser criada,
+enquanto a interface antiga e defeituosa teria de continuar sendo mantida ao
+longo do tempo, resultando em trabalho adicional para os desenvolvedores USB.
+Como todos os desenvolvedores USB do Linux realizam esse trabalho em seu
+próprio tempo, pedir que programadores façam trabalho extra, sem nenhum
+benefício e gratuitamente, não é uma possibilidade.
+
+Questões de segurança também são muito importantes para o Linux. Quando um
+problema de segurança é encontrado, ele é corrigido em um período muito curto.
+Em diversas ocasiões, isso fez com que interfaces internas do kernel fossem
+reformuladas para impedir que o problema de segurança ocorresse. Quando isso
+acontece, todos os drivers que utilizam essas interfaces também são corrigidos
+ao mesmo tempo, garantindo que o problema de segurança seja resolvido e não
+possa reaparecer acidentalmente no futuro. Se as interfaces internas não
+pudessem ser alteradas, não seria possível corrigir esse tipo de problema de
+segurança e garantir que ele não voltasse a ocorrer.
+
+As interfaces do kernel são aprimoradas ao longo do tempo. Se ninguém estiver
+utilizando uma determinada interface, ela é removida. Isso garante que o
+kernel permaneça o menor possível e que todas as interfaces existentes possam
+ser testadas da melhor maneira possível (é praticamente impossível testar
+adequadamente a validade de interfaces que não são utilizadas).
+
+
+O que fazer
+-----------
+
+Então, se você possui um driver do kernel Linux que não está na árvore
+principal do kernel, o que você, como desenvolvedor, deve fazer? Distribuir
+um driver binário para cada versão diferente do kernel em cada distribuição
+é um pesadelo, e tentar acompanhar uma interface do kernel que está em
+constante mudança também é uma tarefa difícil.
+
+Simples: coloque seu driver na árvore principal do kernel (lembre-se de que
+estamos falando aqui de drivers distribuídos sob uma licença compatível com
+a GPL; se seu código não se enquadra nessa categoria, boa sorte, você está
+por conta própria aqui, seu parasita). Se seu driver estiver na árvore e uma
+interface do kernel mudar, ele será corrigido pela própria pessoa que realizou
+a alteração no kernel. Isso garante que seu driver continue sempre compilável
+e funcionando ao longo do tempo, exigindo muito pouco esforço de sua parte.
+
+Os excelentes efeitos colaterais de ter seu driver na árvore principal do
+kernel são:
+
+  - A qualidade do driver aumentará, enquanto os custos de manutenção
+    (para o desenvolvedor original) diminuirão.
+
+  - Outros desenvolvedores adicionarão funcionalidades ao seu driver.
+
+  - Outras pessoas encontrarão e corrigirão bugs no seu driver.
+
+  - Outras pessoas encontrarão oportunidades de otimização no seu driver.
+
+  - Outras pessoas atualizarão o driver para você quando mudanças em
+    interfaces externas exigirem isso.
+
+  - O driver será automaticamente distribuído por todas as distribuições
+    Linux, sem que seja necessário pedir às distribuições que o adicionem.
+
+Como o Linux oferece suporte, "pronto para uso", a um número maior de
+dispositivos diferentes do que qualquer outro sistema operacional, e oferece
+suporte a esses dispositivos em mais arquiteturas de processadores diferentes
+do que qualquer outro sistema operacional, esse modelo comprovado de
+desenvolvimento deve estar fazendo alguma coisa certa :)
+
+
+------
+
+Agradecimentos a Randy Dunlap, Andrew Morton, David Brownell, Hanna Linder,
+Robert Love e Nishanth Aravamudan pela revisão e pelos comentários sobre
+este documento.

---
base-commit: 791e420360669d55b7f90ca0c6d61b10e4992aec
change-id: 20260819-ptbr-stable-api-nonsense-c43d245aaf59

Best regards,
-- 
Lucas Adryell Ramalho <lucasadramalho@gmail.com>

