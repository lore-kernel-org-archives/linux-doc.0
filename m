Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBBF433E92
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 17:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783098437; cv=none; b=B+HeLubxPVPobQXTmCu0NdZPgkfRN8/NLdJ5BIfY4s9nSAy71FOoSvmHbmPXMh5Dvm1IHG2HBbhZGSkPWPo9xKYtwC/fgLsfGTrIl5cv57rlr9YxlCsQYA8zgNaZRqShnrZFr2AFu7tlJC4Zr4GkN4KO8R6rc6PVA4bNQ5ud46Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783098437; c=relaxed/simple;
	bh=Mz9/oAG57I4a5BJtj/VsHHAgtvRlhmL4N68haQmHu6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=afeGjy/Hlg40b3hU8xHovJInazFH/F9y9ITbvPCiXX9XJe2niqp0jjdzghEOTzsrHIsOgRRZ43L5Egn+h9ChbNTX1BRN561y+9/d2v2HKDfNy8wjq9OpjsUSONRH6YFSrTPRsjtDlQqSJ9wN8B0sr+feG5g2/W6a5GYpewmPKEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQj15dsQ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQj15dsQ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c821a50615so6016835ad.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Jul 2026 10:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783098434; x=1783703234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Emf8MUOawezzOgbDhWHGFkRKpN0IPTZNDFI4oJL9RPQ=;
        b=BQj15dsQ6NH8KbB5Rk2AeRrRrQYnAUOj37qZU7MeUhdRo9xgH1CjzNV5u+MOEHIbcj
         AXznDEwHgR4c08eJeoNlt2W9D0ICooAruEHV6yg+N+gmPLDUYcfKjM+jGqVCbqWyhXc2
         NSHqM3TNKLPPISzojpx+dppyEdoXxN71vmN+1NOspOJ4ELJh9jeQNTGBvEsYCrV14Pc7
         5InU4RMHoMPXVchtKF43kL4pfJYSU8rcHtILSydS71rdipBAavylapS3UCX+r++jCo3U
         77zUgvQb9T1CAY5sfS2ALgv4nnnhorAKNHlR3aAKgHtHq8yqGFoJmKWUKs3B9FPnKfjV
         ST8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783098434; x=1783703234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Emf8MUOawezzOgbDhWHGFkRKpN0IPTZNDFI4oJL9RPQ=;
        b=DeSmJkXarY8Br9vAhP/6PrH4MWxOfgSMEunEAPHmxXWnCy6UAofEqqG1D6CmNY+Zse
         USmgIwCr6ELWSyaGNopS7jkB1pPrfodl239hevrxJkQj8TZEjM08dDM+c9HNOI5fwZwF
         LcMT5Diq83uoa2JCI78R9fwHLTAdelE6WBBWnfaKYg3sItPCrBob+R6W3b3Vdiw3e8Cc
         OIk16+AVJa0VC1yePu/o1vULSVax0zj24+oZMZ5Ol++4BKc3vtJQLmnHmGletmAkhSfk
         +R0rtO6ky9iU/M1foMXLP2hHuIsgldro0gTggh3FH4zUeNmdk97eN50VNXFolbaagVK8
         cY8w==
X-Gm-Message-State: AOJu0YyGz4erHJU1W81ZbS/8csiiPFUNqRcMxAxH087DmmKXCL9goxtc
	ZyqkXdI4KHrBSvxESlKNcFcj7sMQxjOCE1H/y94oV50sua/873S7rR4/
X-Gm-Gg: AfdE7ckD/8D0sfrSZtaSGW4BRQvu9GGRNaByhcvbnD/IfS/r0CJ7SxAptMoypLChBY4
	0JmTma5gO6q2Qkn0SqY7mk8vXRVNEC8OH2Qs1W9M/4fpO5sG779jGf+xDxgcUqF1NJYXyGnHCQy
	Nt4z1NZxC96Sn8tRrxT25AXCxU1Mw5pAu4WybExP06PYx1q4r8Fue2jQBsLCQlSFq5uHH5jVsXo
	Q6W0b+R5q/atVWA7tk8OYEEg+TBu6U4d9j5WkTAoNVpkxSf51pai1BUb4ig0KBDUIdAO8pSMSxH
	pJ6BXP06pCOUSAL1tsV9r30sQcGEXSFUCA4hHzO6Z8W/cvaMwr6dPoB7M/1ycmkcKf/5yKTHQzc
	KYjyyMQf/bVvmyw8d6lQ0wBxnpf6nL12c8wLuy+5tObFJwra/DFEQmcG2p0bb1/CD81s/esGP0V
	xVfFncxRacR6IuW7hm6VGH67zfAJ38yH94VCkeb9Sebx6YIFWPfihU+NsJlnQaHeV68p/FY4DX/
	Yq9A9kzbnXsaYSsT2YTnlq0qjwuk8b7lJ/NQmLqrxFsCeTJhcU=
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr1324405ad.17.1783098434110;
        Fri, 03 Jul 2026 10:07:14 -0700 (PDT)
Received: from parrot.meuintelbras.local ([45.179.5.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c876ea9sm19643688c88.13.2026.07.03.10.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 10:07:13 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH v2 2/7] docs: pt_BR: process: translate 7.AdvancedTopics and 8.Conclusion
Date: Fri,  3 Jul 2026 14:05:42 -0300
Message-ID: <20260703170552.174764-3-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703170552.174764-1-danielmaraboo@gmail.com>
References: <20260703170552.174764-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Translate the "Advanced topics" and "Conclusion" sections into Brazilian
Portuguese, creating the 7.AdvancedTopics.rst and 8.Conclusion.rst
documents, and updating development-process.rst to include them.

This translation covers patch management practices with Git, community
guidelines for patch review, and the closing overview of the kernel
development cycle.

Ensure all text conforms to the strict 80-column line length limit
to maintain Sphinx rendering alignment.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/process/7.AdvancedTopics.rst        | 201 ++++++++++++++++++
 .../pt_BR/process/8.Conclusion.rst            |  73 +++++++
 .../pt_BR/process/development-process.rst     |   2 +
 3 files changed, 276 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/7.AdvancedTopics.rst
 create mode 100644 Documentation/translations/pt_BR/process/8.Conclusion.rst

diff --git a/Documentation/translations/pt_BR/process/7.AdvancedTopics.rst b/Documentation/translations/pt_BR/process/7.AdvancedTopics.rst
new file mode 100644
index 000000000..97466fad1
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/7.AdvancedTopics.rst
@@ -0,0 +1,201 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Tópicos avançados
+=================
+
+Neste ponto, esperamos que você já tenha uma boa noção de como funciona o
+processo de desenvolvimento. No entanto, ainda há mais a aprender! Esta seção
+cobrirá uma série de tópicos que podem ser úteis para desenvolvedores que
+desejam se tornar parte regular do processo de desenvolvimento do kernel Linux.
+
+Gerenciamento de patches com o git
+----------------------------------
+
+O uso de controle de versão distribuído para o kernel começou no início de
+2002, quando Linus começou a testar o aplicativo proprietário BitKeeper.
+Embora o BitKeeper fosse controverso, a abordagem de gerenciamento de versão
+de software que ele incorporava certamente não era. O controle de versão
+distribuído permitiu uma aceleração imediata do projeto de desenvolvimento do
+kernel. Atualmente, existem várias alternativas gratuitas ao BitKeeper. Para o
+bem ou para o mal, o projeto do kernel adotou o git como sua ferramenta de
+escolha.
+
+Gerenciar patches com o git pode facilitar muito a vida do desenvolvedor,
+especialmente à medida que o volume desses patches cresce. O git também tem suas
+pontas soltas e apresenta certos riscos; é uma ferramenta jovem e poderosa que
+ainda está sendo refinada por seus desenvolvedores. Este documento não tentará
+ensinar o leitor a usar o git; isso seria material suficiente para um documento
+longo por si só. Em vez disso, o foco aqui será em como o git se encaixa
+especificamente no processo de desenvolvimento do kernel. Os desenvolvedores
+que desejam se atualizar com o git encontrarão mais informações em:
+
+	https://git-scm.com/
+
+	https://www.kernel.org/pub/software/scm/git/docs/user-manual.html
+
+e em vários tutoriais encontrados na web.
+
+A primeira ordem do dia é ler os sites acima e obter uma compreensão sólida de
+como o git funciona antes de tentar usá-lo para disponibilizar patches para
+outros. Um desenvolvedor que utiliza o git deve ser capaz de obter uma cópia do
+repositório principal, explorar o histórico de revisões, comitar alterações na
+árvore, usar branches, etc. A compreensão das ferramentas do git para a
+reescrita de histórico (como o rebase) também é útil. O git vem com sua própria
+terminologia e conceitos; um novo usuário do git deve saber sobre refs, remote
+branches, o index, fast-forward merges, pushes e pulls, detached HEADs, etc.
+Tudo isso pode ser um pouco intimidante no início, mas os conceitos não são tão
+difíceis de entender com um pouco de estudo.
+
+Usar o git para gerar patches para submissão por e-mail pode ser um bom exercício
+enquanto você se atualiza.
+
+Quando estiver pronto para começar a disponibilizar árvores git para que outros
+possam examinar, você, logicamente, precisará de um servidor a partir do qual um
+pull possa ser feito. Configurar um servidor desse tipo com o git-daemon é
+relativamente simples se você tiver um sistema acessível à internet. Caso
+contrário, sites de hospedagem públicos e gratuitos (o GitHub, por exemplo)
+estão começando a surgir na rede. Desenvolvedores estabelecidos podem obter uma
+conta no kernel.org, mas estas não são fáceis de conseguir; consulte
+https://kernel.org/faq/ para mais informações.
+
+O fluxo de trabalho normal do git envolve o uso de muitas branches. Cada linha
+de desenvolvimento pode ser separada em uma "topic branch" distinta e mantida de
+forma independente. Branches no git são baratas, não há razão para não fazer um
+uso livre delas. E, em qualquer caso, você não deve fazer o seu desenvolvimento
+em nenhuma branch a partir da qual pretenda pedir para que outros deem pull.
+Branches disponíveis publicamente devem ser criadas com cuidado; mescle patches
+de branches de desenvolvimento quando eles estiverem em sua forma final e prontos
+para seguir em frente — não antes.
+
+O git fornece algumas ferramentas poderosas que podem permitir que você
+reescreva o seu histórico de desenvolvimento. Um patch inconveniente (um que
+quebre o bisection, por exemplo, ou que tenha algum outro tipo de bug óbvio)
+pode ser corrigido localmente ou feito desaparecer completamente do histórico.
+Uma série de patches pode ser reescrita como se tivesse sido escrita no topo da
+linha principal de hoje, mesmo que você esteja trabalhando nela há meses. As
+alterações podem ser movidas de forma transparente de uma branch para outra. E
+assim por diante. O uso criterioso da capacidade do git de revisar o histórico
+pode ajudar na criação de conjuntos de patches limpos e com menos problemas.
+
+O uso excessivo dessa capacidade pode levar a outros problemas, no entanto, além
+de uma simples obsessão pela criação do histórico de projeto perfeito. Reescrever
+o histórico reescreverá as alterações contidas nele, transformando uma árvore do
+kernel testada (assim se espera) em uma não testada. Mas, além disso, os
+desenvolvedores não podem colaborar facilmente se não tiverem uma visão
+compartilhada do histórico do projeto; se você reescrever o histórico que outros
+desenvolvedores já deram pull em seus repositórios, tornará a vida deles muito
+mais difícil. Portanto, uma regra prática simples se aplica aqui: o histórico
+que foi exportado para terceiros deve ser visto geralmente como imutável dali em
+diante.
+
+Sendo assim, uma vez que você faz o push de um conjunto de alterações para o seu
+servidor disponível publicamente, essas alterações não devem ser reescritas. O
+git tentará aplicar essa regra se você tentar dar push em alterações que não
+resultem em um fast-forward merge (ou seja, alterações que não compartilham o
+mesmo histórico). É possível anular essa verificação, e pode haver momentos em
+que seja necessário reescrever uma árvore exportada. Mover changesets entre
+árvores para evitar conflitos na linux-next é um exemplo. No entanto, tais ações
+devem ser raras. Esta é uma das razões pelas quais o desenvolvimento deve ser
+feito em branches privadas (que podem ser reescritas, se necessário) e apenas
+movido para branches públicas quando estiver em um estado razoavelmente avançado.
+
+À medida que a linha principal (ou outra árvore na qual um conjunto de
+alterações se baseia) avança, é tentador fazer o merge com essa árvore para
+permanecer na vanguarda. Para uma branch privada, o rebasing pode ser uma maneira
+fácil de acompanhar outra árvore, mas o rebasing não é uma opção uma vez que uma
+árvore é exportada para o mundo. Quando isso acontece, um merge completo deve
+ser feito. Fazer merges ocasionalmente faz todo o sentido, mas merges excessivamente
+frequentes podem poluir o histórico desnecessariamente. A técnica sugerida neste
+caso é fazer merges raramente, e geralmente apenas em release points específicos
+(como um lançamento -rc da linha principal). Se você estiver inseguro sobre
+mudanças específicas, sempre poderá realizar merges de teste em uma branch
+privada. A ferramenta "rerere" do git pode ser útil nessas situações; ela se
+lembra de como os conflitos de merge foram resolvidos para que você não precise
+fazer o mesmo trabalho duas vezes.
+
+Uma das maiores reclamações recorrentes sobre ferramentas como o git é esta: o
+movimento em massa de patches de um repositório para outro torna fácil a
+inclusão de mudanças desaconselháveis que entram na linha principal abaixo do
+radar de revisão. Os desenvolvedores do kernel costumam ficar descontentes quando
+veem esse tipo de coisa acontecer; disponibilizar uma árvore git com patches não
+revisados ou fora do tópico pode afetar a sua capacidade de ter suas árvores
+puxadas no futuro. Citando Linus:
+
+::
+
+    Você pode me enviar patches, mas para eu puxar um patch git de você, eu
+    preciso saber que você sabe o que está fazendo, e preciso ser capaz de
+    confiar nas coisas *sem* ter que ir lá e verificar cada mudança
+    individualmente à mão.
+
+(https://lwn.net/Articles/224135/).
+
+Para evitar esse tipo de situação, certifique-se de que todos os patches
+dentro de uma determinada branch permaneçam estritamente alinhados ao tópico
+associado; uma branch de "correções de drivers" não deveria fazer alterações no
+código central de gerenciamento de memória. E, acima de tudo, não use uma árvore
+git para burlar o processo de revisão. Publique ocasionalmente um resumo da
+árvore na lista de discussão relevante e, quando for o momento certo, solicite
+que a árvore seja incluída na linux-next.
+
+Se e quando outros começarem a enviar patches para inclusão em sua árvore, não
+se esqueça de revisá-los. Certifique-se também de manter as informações corretas
+de autoria; a ferramenta "am" do git faz o melhor que pode a esse respeito, mas
+você pode ter que adicionar uma linha "From:" ao patch se ele tiver sido
+retransmitido a você por terceiros.
+
+Ao solicitar um pull, certifique-se de fornecer todas as informações
+relevantes: onde está a sua árvore, qual branch deve ser puxada e quais
+alterações resultarão do pull. O comando git request-pull pode ser útil a esse
+respeito; ele formatará a solicitação da maneira que outros desenvolvedores
+esperam e também verificará se você se lembrou de dar push nessas alterações
+para o servidor público.
+
+
+Revisão de patches
+------------------
+
+Alguns leitores certamente objetarão a inclusão desta seção em "tópicos
+avançados" sob o argumento de que mesmo desenvolvedores iniciantes do kernel
+deveriam estar revisando patches. É certamente verdade que não há melhor maneira
+de aprender a programar no ambiente do kernel do que examinando o código
+postado por outros. Além disso, revisores estão sempre em falta; ao examinar o
+código, você pode fazer uma contribuição significativa para o processo como um
+todo.
+
+Revisar código pode ser uma perspectiva intimidadora, especialmente para um novo
+desenvolvedor do kernel que pode se sentir nervoso em questionar — em público —
+um código que foi postado por aqueles com mais experiência. No entanto, mesmo o
+código escrito pelos desenvolvedores mais experientes pode ser aprimorado. Talvez
+o melhor conselho para revisores (todos os revisores) seja este: formule os
+comentários de revisão como perguntas em vez de críticas. Perguntar "como o lock
+é liberado neste caminho?" sempre funcionará melhor do que afirmar "o bloqueio
+aqui está errado."
+
+Outra técnica útil em caso de desacordo é pedir que outros se manifestem. Se uma
+discussão chegar a um impasse após algumas trocas de mensagens, peça a opinião
+de outros revisores ou mantenedores. Frequentemente, aqueles que concordam com
+um revisor permanecem em silêncio, a menos que sejam solicitados. A opinião de
+múltiplas pessoas carrega exponencialmente mais peso.
+
+Diferentes desenvolvedores revisarão o código sob diferentes pontos de vista.
+Alguns estão preocupados principalmente com o estilo de codificação e se as
+linhas de código possuem espaços em branco no final (trailing white space).
+Outros se concentrarão principalmente em saber se a alteração implementada pelo
+patch como um todo é algo bom para o kernel ou não. Ainda assim, outros buscarão
+por bloqueios problemáticos, uso excessivo de pilha (stack usage), possíveis
+problemas de segurança, duplicação de código encontrado em outros lugares,
+documentação adequada, efeitos adversos no desempenho, alterações na ABI do
+espaço do usuário (user-space ABI), etc. Todos os tipos de revisão, se levarem a
+um código melhor entrando no kernel, são bem-vindos e valem a pena.
+
+Não há exigência estrita para o uso de tags específicas como ``Reviewed-by``. Na
+verdade, revisões em texto simples são mais informativas e incentivadas mesmo
+quando uma tag é fornecida, por exemplo: "Analisei os aspectos A, B e C deste
+envio e tudo me parece correto." Alguma forma de mensagem de revisão ou resposta
+é obviamente necessária, caso contrário, os mantenedores não saberão que o
+revisor sequer examinou o patch!
+
+Por último, mas não menos importante, a revisão de patches pode se tornar um
+processo negativo, focado em apontar problemas. Por favor, reserve um elogio de
+vez em quando, particularmente para os novatos!
diff --git a/Documentation/translations/pt_BR/process/8.Conclusion.rst b/Documentation/translations/pt_BR/process/8.Conclusion.rst
new file mode 100644
index 000000000..d5af31e7c
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/8.Conclusion.rst
@@ -0,0 +1,73 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Para mais informações
+=====================
+
+Há inúmeras fontes de informação sobre o desenvolvimento do kernel Linux e
+tópicos relacionados. A primeira delas sempre será o diretório Documentation
+encontrado na distribuição do código-fonte do kernel. Comece com o arquivo de
+nível superior :ref:`process/howto.rst <process_howto>`; leia também
+:ref:`process/submitting-patches.rst <submittingpatches>`. Muitas APIs internas
+do kernel são documentadas usando o mecanismo kerneldoc; "make htmldocs" ou
+"make pdfdocs" podem ser usados para gerar esses documentos em formato HTML ou
+PDF (embora a versão do TeX fornecida por algumas distribuições esbarre em
+limites internos e falhe em processar os documentos corretamente).
+
+Vários sites discutem o desenvolvimento do kernel em todos os níveis de
+detalhes. O autor gostaria de sugerir humildemente o https://lwn.net/ como uma
+fonte; informações sobre muitos tópicos específicos do kernel podem ser
+encontradas através do índice do kernel do LWN em:
+
+	https://lwn.net/Kernel/Index/
+
+Além disso, um recurso valioso para os desenvolvedores do kernel é:
+	https://kernelnewbies.org/
+
+E, claro, não se deve esquecer o https://kernel.org/, o local definitivo
+para informações sobre os lançamentos do kernel.
+
+Há uma série de livros sobre o desenvolvimento do kernel:
+
+	Linux Device Drivers, 3rd Edition (Jonathan Corbet, Alessandro
+	Rubini, and Greg Kroah-Hartman).  Online at
+	https://lwn.net/Kernel/LDD3/.
+
+	Linux Kernel Development (Robert Love).
+
+    Understanding the Linux Kernel (Daniel Bovet and Marco Cesati).
+
+Todos esses livros, no entanto, sofrem de um defeito comum: eles tendem a estar
+um pouco obsoletos quando chegam às prateleiras, e já estão nelas há algum
+tempo. Ainda assim, há uma boa quantidade de informações úteis a serem
+encontradas ali.
+
+A documentação para o git pode ser encontrada em:
+
+	https://www.kernel.org/pub/software/scm/git/docs/
+
+	https://www.kernel.org/pub/software/scm/git/docs/user-manual.html
+
+
+Conclusão
+=========
+
+Parabéns a qualquer pessoa que tenha chegado ao fim deste documento longo e
+detalhado. Esperamos que ele tenha fornecido uma compreensão útil de como o
+kernel Linux é desenvolvido e de como você pode participar desse processo.
+
+No fim das contas, é a participação que importa. Qualquer projeto de software
+de código aberto não é nada mais do que a soma do que seus colaboradores
+dedicam a ele. O kernel Linux progrediu tão rápido e tão bem porque foi ajudado
+por um grupo impressionantemente grande de desenvolvedores, todos trabalhando
+para torná-lo melhor. O kernel é um exemplo primordial do que pode ser feito
+quando milhares de pessoas trabalham juntas em direção a um objetivo comum.
+
+O kernel, no entanto, sempre pode se beneficiar de uma base maior de
+desenvolvedores. Há sempre mais trabalho a fazer. Mas, de forma igualmente
+importante, a maioria dos outros participantes do ecossistema Linux pode se
+beneficiar ao contribuir para o kernel. Colocar o código na linha principal
+(mainline) é a chave para uma maior qualidade de código, menores custos de
+manutenção e distribuição, um nível mais alto de influência sobre a direção do
+desenvolvimento do kernel e muito mais. É uma situação em que todos os
+envolvidos ganham. Abra o seu editor e venha se juntar a nós; você será mais do
+que bem-vindo.
diff --git a/Documentation/translations/pt_BR/process/development-process.rst b/Documentation/translations/pt_BR/process/development-process.rst
index ca86b481a..d303ab92b 100644
--- a/Documentation/translations/pt_BR/process/development-process.rst
+++ b/Documentation/translations/pt_BR/process/development-process.rst
@@ -23,3 +23,5 @@ conhecimento profundo de programação de kernel para ser compreendida.
    4.Coding
    5.Posting
    6.Followthrough
+   7.AdvancedTopics
+   8.Conclusion
-- 
2.47.3

