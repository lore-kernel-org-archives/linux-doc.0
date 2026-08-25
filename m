Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EE2446829
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 21:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693413; cv=none; b=UKZTFLwP00H0dzURWfDRsvprtNAD3gZlaLCiCjuG35JD52fRXTh+3tshZ7CKfW12JP/ehWvJt0TIZo1MN1DrnI5MxNawN2ntcQczpMIprtxMKirX3+J66KZ5QPLe/thb0kKo1lGrrcx7hdR4GZAD5mkidnZe7ZvYTmrNtuPZELA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693413; c=relaxed/simple;
	bh=apf+ml9iuWzb/OpKPwCbN31d5Hp/n07jnr1CoP8vqe0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OysyrhuRSaMDNItTaU8YRdFho+KbmpBeNga6c/R15F4JsOYAzycFqPT68SZAmkLiSN7axRVhufx8UsWzRqX8vVN/79mh0OEoIyW937PPIoi11iQHcNnqIt+wrvv8ylYLJ/yCmmUC/Uzfs9s+zVbR9zFKVI4I7JAL7LWy8+affFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhPTjidB; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhPTjidB"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-74ab99038afso192318137.3
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 14:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787693411; x=1788298211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0XdOaj2eZmYYf1LUuewzOCokVu4CIKwl/LaYlIW/bLg=;
        b=GhPTjidBU1yZqBJkIPn1jxQh5SSQynNYyY7VbEfHz1Q0xFBcAOaURE5+IgMwLfTCjw
         UHgQnDPhlimAzD2sew4FX3xxacgP5utDAum7sMjbIixzxvIxJHvqYh+5lxFo58RvTARI
         zZuOeffdeQ1s7gsac6dG+EPWSp5ranoC7Q6gxSZiq2r1rYOVwEqhsEtZvT0ax8fBZurc
         ISNdJ+3Htyy7qJj1iXdHs8SLHc0XG3qiAeeJgN25A1tzz/4cKelfNrxO25/IhDOfYiDn
         kGo1A4XHb5icLChiZ5hvFXj9ZhfTJWL5ZeYqIsR8AUfrnPUgIKttrlQ7vtoUK8h5fE+m
         uCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787693411; x=1788298211;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0XdOaj2eZmYYf1LUuewzOCokVu4CIKwl/LaYlIW/bLg=;
        b=TaDuYHfLoC6mzvQKdSrU8D6d3u8nEhl1wEDLCqf43zngDJQWRdzTCAzcAaksPq9WSU
         H2oCf7QUFYAFRCWrbgq+YbvWhYa7FeMlOU5li5HAU1pcr36hxssD1OVJ53HgIKbu1bHA
         xASsWSsSCZZXB9mZ+tBsAZmmCK6AAafUnjvUbXj7lkuOLRYghl4I3hfUe/Y33Ldo7fIw
         iRIWbm34KLFmpI1yIsohKta2pGKlmjgVVlIJo6gT6+c6hOcZPwEGUbuy23JUuKp/lbQ7
         9y6kK9m6prcM0PK+fc87uY/URywXtZkYaRSt4ftQ9YE4HiuUzs9Ji9qnDpbeVXs5ZLz0
         uFPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqgb1rsfrn7psyGZRMwoWwCw68d45S9WnSGw56uXAyuT5XMaXu3yNSuA/u8F1mXZnDZvL7v73a87ss=@vger.kernel.org
X-Gm-Message-State: AFuF++l3WQKlR8dI/+YCut+g9bocbdQvav01/elVGAl9M2IjQ4Kbmod1
	ybo67AUH2ilfG7yIS4ezyHlnW8e4vXm2Dk9INdtQ+RzShZvRL78coRTMOfw7NQ==
X-Gm-Gg: AR+sD10+6QX43rQrLbAf/jKixfKvVMO2jPFMHqsJpuoV3XBvQNrsBoncyQFoPJTtPWD
	5ea3487wKx4oQT87m5IO0FLwX4nNFuSCRHFikwxbmr77UbkWLO4c2/b46juSMeo8Py+P+jOzDKx
	zft6uWu4iBzJpFt96I9cywqLh5fhwH6ssd1S9FkWRZZCS+ggjj/2Y+vf16JcTkTGU3q/W3Im/ek
	rW3n7EE6xRs1MPOy1MNXJetiqAGOdqWVXxOGQkGMYzVS71eoc/YrNWjY/T7h4AdJXNFwEOBgv2u
	dCTlpAg/s9WKnwtJUSdIyGkGxrHO3EHPRXejlQDMqDE+R8GknmoK0ktwJGWT9ssiTJvu9cWaYBk
	lZZuSpICAN7Y5O3PTYszeOEzMzM1vSQx42RXezwMABEg67IjDAAB6ara2yjTwfwtLXiMRmoZlJV
	WFubF8zMShouIDujzrRcQHUNVk5dIFPCfSBfzZMmu7izEyqJt5jPV72VEogWDOA3CqfwU=
X-Received: by 2002:a05:6102:3ecf:b0:77b:b14e:b6c5 with SMTP id ada2fe7eead31-782c19fbed6mr854745137.9.1787693410539;
        Tue, 25 Aug 2026 14:30:10 -0700 (PDT)
Received: from x-wing ([177.181.5.26])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7830581026csm97793137.3.2026.08.25.14.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 14:30:09 -0700 (PDT)
From: Fabio Pereira da Silva <silvapfabio@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: pt_BR: process: Translate stable API nonsense
Date: Tue, 25 Aug 2026 18:30:01 -0300
Message-ID: <20260825213001.12714-1-silvapfabio@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/process/stable-api-nonsense.rst into Brazilian Portuguese and link it from the pt_BR documentation index.

Signed-off-by: Fabio Pereira da Silva <silvapfabio@gmail.com>
---
 Documentation/translations/pt_BR/index.rst    |   1 +
 .../pt_BR/process/stable-api-nonsense.rst     | 205 ++++++++++++++++++
 2 files changed, 206 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/stable-api-nonsense.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index c09afbe8e22c..71eb024fbec8 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -73,6 +73,7 @@ kernel e sobre como ver seu trabalho integrado.
    Requisitos mínimos <process/changes>
    CVEs <process/cve>
    Lista de verificação para patches <process/submit-checklist>
+   Interface de drivers do kernel Linux <process/stable-api-nonsense>
    Conclave (Continuidade do projeto) <process/conclave>
    Manuais dos mantenedores <process/maintainer-handbooks>
    Processo do subsistema de rede (netdev) <process/maintainer-netdev>
diff --git a/Documentation/translations/pt_BR/process/stable-api-nonsense.rst b/Documentation/translations/pt_BR/process/stable-api-nonsense.rst
new file mode 100644
index 000000000000..778a897e226a
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/stable-api-nonsense.rst
@@ -0,0 +1,205 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _pt_stable_api_nonsense:
+
+A interface de drivers do kernel Linux
+======================================
+
+(todas as suas perguntas respondidas, e mais algumas)
+
+Greg Kroah-Hartman <greg@kroah.com>
+
+Este texto foi escrito para tentar explicar por que o Linux **não possui uma
+interface binária de kernel, nem possui uma interface estável de kernel**.
+
+.. note::
+
+  Entenda que este artigo descreve as interfaces **dentro do kernel**, não as
+  interfaces entre o kernel e o espaço de usuário.
+
+  A interface entre o kernel e o espaço de usuário é aquela usada pelos
+  programas de aplicação, a interface de chamadas de sistema. Essa interface é
+  **muito** estável ao longo do tempo e não será quebrada. Tenho programas
+  antigos que foram construídos em um kernel anterior à série 0.9-alguma-coisa
+  e que ainda funcionam perfeitamente no lançamento mais recente do kernel 2.6.
+  Essa é a interface com cuja estabilidade usuários e programadores de
+  aplicações podem contar.
+
+
+Resumo executivo
+----------------
+
+Você acha que quer uma interface estável de kernel, mas na verdade não quer, e
+nem sabe disso. O que você quer é um driver em execução estável, e você só
+consegue isso se o seu driver estiver na árvore principal do kernel. Você também
+obtém vários outros bons benefícios se o seu driver estiver na árvore principal
+do kernel; todos eles ajudaram a transformar o Linux em um sistema operacional
+forte, estável e maduro, que é justamente o motivo pelo qual você o utiliza.
+
+
+Introdução
+----------
+
+Somente a pessoa incomum que deseja escrever um driver de kernel precisa se
+preocupar com a mudança das interfaces internas do kernel. Para a maior parte
+do mundo, essa interface não é vista nem importa.
+
+Primeiro, não vou abordar **nenhuma** questão jurídica sobre código-fonte
+fechado, código-fonte oculto, blobs binários, wrappers de código-fonte ou
+qualquer outro termo que descreva drivers de kernel cujo código-fonte não é
+lançado sob a GPL. Consulte um advogado se tiver dúvidas jurídicas; sou
+programador e, portanto, vou descrever apenas as questões técnicas aqui (sem
+minimizar as questões jurídicas: elas são reais, e você precisa estar sempre
+ciente delas).
+
+Portanto, há dois tópicos principais aqui: interfaces binárias de kernel e
+interfaces estáveis de código-fonte do kernel. Elas dependem uma da outra, mas
+discutiremos primeiro a parte binária para resolver esse ponto primeiro.
+
+
+Interface binária de kernel
+---------------------------
+
+Supondo que tivéssemos uma interface estável de código-fonte do kernel, uma
+interface binária também surgiria naturalmente, certo? Errado. Considere os
+seguintes fatos sobre o kernel Linux:
+
+  - Dependendo da versão do compilador C usada, diferentes estruturas de dados
+    do kernel terão diferentes alinhamentos de estruturas e possivelmente
+    incluirão diferentes funções de formas diferentes (colocando funções inline
+    ou não). A organização individual das funções não é tão importante, mas o
+    preenchimento diferente das estruturas de dados é muito importante.
+
+  - Dependendo das opções de compilação do kernel selecionadas, uma ampla variedade
+    de coisas diferentes pode ser assumida pelo kernel:
+
+      - estruturas diferentes podem conter campos diferentes;
+      - algumas funções podem não ser implementadas, (isto é, algumas travas
+        desaparecem por completo em compilações não SMP);
+      - a memória dentro do kernel pode ser alinhada de formas diferentes,
+        dependendo das opções de compilação.
+
+  - O Linux executa em uma ampla variedade de arquiteturas de processador. Não
+    há como drivers binários de uma arquitetura executarem corretamente em outra
+    arquitetura.
+
+Vários desses problemas podem ser resolvidos simplesmente compilando seu módulo
+para a configuração exata e específica do kernel, usando exatamente o mesmo
+compilador C com que o kernel foi construído. Isso é suficiente se você quiser
+fornecer um módulo para uma versão específica de lançamento de uma distribuição
+Linux específica. Mas multiplique esse única compilação pelo número de diferentes
+distribuições Linux e pelo número de lançamentos suportados dessas distribuições
+e você rapidamente terá um pesadelo de diferentes opções de compilação em diferentes
+lançamentos. Perceba também que cada lançamento de uma distribuição Linux contém
+vários kernels diferentes, todos ajustados para tipos diferentes de hardware
+(tipos diferentes de processador e opções diferentes), portanto, mesmo para um
+único lançamento, você precisará criar várias versões do seu módulo.
+
+Acredite, com o tempo você ficará sobrecarregado se tentar dar suporte a esse tipo de
+lançamento; aprendi isso da pior forma há muito tempo...
+
+
+Interfaces estáveis de código-fonte do kernel
+---------------------------------------------
+
+Este é um tópico muito mais "volátil" quando você conversa com pessoas que
+tentam manter atualizado, ao longo do tempo, um driver de kernel Linux que não
+está na árvore principal do kernel.
+
+O desenvolvimento do kernel Linux é contínuo e ocorre em ritmo rápido, sem
+parar para desacelerar. Assim, os desenvolvedores do kernel encontram bugs nas
+interfaces atuais ou descobrem uma forma melhor de fazer as coisas. Quando isso
+acontece, eles corrigem as interfaces atuais para que funcionem melhor. Nesse
+processo, nomes de funções podem mudar, estruturas podem crescer ou diminuir, e
+parâmetros de funções podem ser retrabalhados. Quando isso acontece, todas as
+instâncias em que essa interface é usada dentro do kernel são corrigidas ao
+mesmo tempo, garantindo que tudo continue funcionando corretamente.
+
+Como exemplo específico, as interfaces USB internas do kernel passaram por pelo
+menos três retrabalhos diferentes durante a vida desse subsistema. Esses
+retrabalhos foram feitos para tratar vários problemas diferentes:
+
+  - Uma mudança de um modelo síncrono de fluxos de dados para um assíncrono.
+    Isso reduziu a complexidade de vários drivers e aumentou a vazão de todos
+    os drivers USB, de modo que agora executamos quase todos os dispositivos USB
+    na velocidade máxima possível.
+  - Foi feita uma mudança na forma como pacotes de dados eram alocados a partir
+    do núcleo USB pelos drivers USB, de modo que todos os drivers passaram a
+    precisar fornecer mais informações ao núcleo USB para corrigir vários
+    deadlocks documentados.
+
+Isso contrasta fortemente com vários sistemas operacionais de código fechado,
+que precisaram manter suas interfaces USB antigas ao longo do tempo. Isso
+permite que novos desenvolvedores usem acidentalmente interfaces antigas e
+façam as coisas de formas inadequadas, prejudicando a estabilidade do sistema
+operacional.
+
+Em ambos os casos, todos os desenvolvedores concordaram que essas eram mudanças
+importantes que precisavam ser feitas, e elas foram feitas com relativamente
+pouco sofrimento. Se o Linux precisasse garantir a preservação de uma interface estável
+de código-fonte, uma nova interface teria sido criada, e a antiga, quebrada,
+teria de ser mantida ao longo do tempo, levando a trabalho extra para os
+desenvolvedores USB. Como todos os desenvolvedores USB do Linux trabalham em seu
+próprio tempo, pedir a programadores que façam trabalho extra, sem ganho e de
+graça, não é uma possibilidade.
+
+Questões de segurança também são muito importantes para o Linux. Quando um
+problema de segurança é encontrado, ele é corrigido em um período muito curto.
+Várias vezes isso fez com que interfaces internas do kernel fossem retrabalhadas
+para impedir que o problema de segurança ocorresse. Quando isso acontece, todos
+os drivers que usam essas interfaces também são corrigidos ao mesmo tempo,
+garantindo que o problema de segurança seja corrigido e não possa voltar
+acidentalmente no futuro. Se as interfaces internas não pudessem mudar,
+corrigir esse tipo de problema de segurança e garantir que ele não ocorresse
+novamente não seria possível.
+
+As interfaces do kernel são limpas ao longo do tempo. Se ninguém estiver usando
+uma interface atual, ela é removida. Isso garante que o kernel permaneça tão
+pequeno quanto possível e que todas as interfaces potenciais sejam testadas da
+melhor forma possível (interfaces não usadas são praticamente impossíveis de
+testar quanto à validade).
+
+
+O que fazer
+-----------
+
+Então, se você tem um driver de kernel Linux que não está na árvore principal
+do kernel, o que você, como desenvolvedor, deve fazer? Lançar um driver binário
+para cada versão diferente de kernel em cada distribuição é um pesadelo, e
+tentar acompanhar uma interface de kernel em constante mudança também é uma
+tarefa difícil.
+
+Simples: coloque seu driver de kernel na árvore principal do kernel (lembre-se
+de que estamos falando de drivers lançados sob uma licença compatível com a GPL;
+se o seu código não se enquadra nessa categoria, boa sorte, você está por conta
+própria). Se o seu driver estiver na árvore e uma interface de kernel mudar, ele
+será corrigido pela pessoa que fez a mudança no kernel em primeiro lugar. Isso
+garante que o seu driver sempre possa ser compilado e funcione ao longo do tempo
+com muito pouco esforço da sua parte.
+
+Os efeitos colaterais muito positivos de ter seu driver na árvore principal do
+kernel são:
+
+  - A qualidade do driver aumentará, pois os custos de manutenção (para o
+    desenvolvedor original) diminuirão.
+  - Outros desenvolvedores adicionarão recursos ao seu driver.
+  - Outras pessoas encontrarão e corrigirão bugs no seu driver.
+  - Outras pessoas encontrarão oportunidades de ajuste no seu driver.
+  - Outras pessoas atualizarão o driver para você quando mudanças em interfaces
+    externas exigirem isso.
+  - O driver passa a ser distribuído automaticamente em todas as distribuições
+    Linux, sem que seja necessário pedir às distribuições que o adicionem.
+
+Como o Linux suporta um número maior de dispositivos diferentes "prontos para
+uso" do que qualquer outro sistema operacional, e suporta esses dispositivos em
+mais arquiteturas de processador diferentes do que qualquer outro sistema
+operacional, esse tipo comprovado de modelo de desenvolvimento deve estar
+fazendo alguma coisa certa :)
+
+
+
+------
+
+Agradecimentos a Randy Dunlap, Andrew Morton, David Brownell, Hanna Linder,
+Robert Love e Nishanth Aravamudan por suas revisões e comentários sobre os
+rascunhos iniciais deste artigo.
\ No newline at end of file
-- 
2.55.0.windows.2

