Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C6A3E1D00
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756171; cv=none; b=BBaMuxojDHyM6V8QORrLTe49Vrf7FZsWSBtPBxDU4Oy0plPJNZ1gSk9Y4IDFteWrUldN47LdtP4iPtk44tFu5zJlBvKN0voMIh7gT+Xou+Nh0l4DSIAgiqAdZSLuMj4vjv7pqJ6gdrdMW/6AD5smUdGnybHoVfAqNJ6a8eRfHSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756171; c=relaxed/simple;
	bh=+xooLDYot7HdUqqrrjoQiqBNzK6+XsE951E2cJlKvn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aSjG5+Itn1G5wKPAwoPBQSXiehJCtEmuVsnF+R1QnmS/HoclbFz6KrHgymTBJZd/lsysAXXM3jj6y6R1cHIBkzlgwrjfbGLshSjn35Atq0Fu9+I5sraImseqozpKgTveRw8tPg9cR+CojlQT+jG1wJi+U6KEV3HHcVfpT2VHy7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWZfcfZu; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWZfcfZu"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a62a2bb8cso9590327b3.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 07:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773756168; x=1774360968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5p50DlN+ku5mDqK2gEPUgW0QiDZAZmuHzUXaopRDyig=;
        b=FWZfcfZuAqm/7fRNo1X7Vbgxe3VZNTgqX9+V5GCTnrnXTx7ZfvXE61Q9M9L2e2alKF
         kaIGkQJHf67D3+T5aXFAeUna5zNypGiS5GYPfG+IaB9W16KyZt42bJWJ3gZPtvvnrWR7
         8HomQQHb1gXcDMhWbaVUIAgj2E6xGO5hoLxOrUMsbPH+mUSkCFxfy7orcC6lYr52vKmj
         Jgc+CdNyJKgP7s45440TviNpFXyMSlkGHvoJLXqxxQh/IRfsJsZsgU9it5eQmqvAZyai
         1zJJPmmr8TlIv8k9enLwEopbnVSJ8z8VhlLwCrmGOGm20kykFLT3Y+zym6mgPs6gYTaL
         5qJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756168; x=1774360968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5p50DlN+ku5mDqK2gEPUgW0QiDZAZmuHzUXaopRDyig=;
        b=aufEWXueNgjJFVcuk/rFq+sb93OSmnWFCdFrVVJp5jlDhxRs21SAxupGjx5uwK/m2W
         3o+EQO0NluWXU2ZDrVVFK/vC214ZL4zTF/yKj48X9M2n61i87uIp08uLsDycqLSYRHMN
         Q29GimifmTacBNjqtx3S5gZlHqetvqmN3hSSiQT6a078JxGjZZdRoCJr3AkmxJEya1Tl
         jT+IwlfG5PLXUcetSkwBX50ec4+WVn3yjFIMvTEM0gLi7GwJsfeXy5sPoti28uJ0oD7a
         xRrrYbxo3s28KwimZOszLPn4pjCujPFIntlHkY3Q/Dl5woVlixlxTBGY7S81mV1FUn5z
         wC8Q==
X-Gm-Message-State: AOJu0YzHXH4MPNIUuUOKBb/Qp03xs+gPKicPbT2o3nlmYlWq39GO/6yy
	uJMzCkdB1OND1HtGzHRrR6R0gx3xsXFE1a+pXbt4A3ce4NMfaYKuJTENKHJNBw==
X-Gm-Gg: ATEYQzzleZrgKS74g45+6PX+j3i+65XPEGJL1CVqLOqJsBAFSPVRi6iTxcpLXe/HRH7
	I6j8dLIWvcKqqAJJZYeYoduo8MlShP8LBcSCxm3J0DH8zjLsl8IOdZqGJlchPr/OmEr75Jkf9yS
	ErKU6QMRAaG/y6DtoRoWE5K3rGXKCtB+nzMyaGtIixJPMK3/IpiavIPAPRnNdxOtVs2Dq9Bfber
	X1lo5kcY6xR8xul5dbXC4qfKKFe5plAp3uOhZ0pau4quOVcRO8onw41B8vk4zVUeE5Zq5FeoLYH
	tkwCkxxC8OB+euKY1mTS2D7DhWFVwuo9wBzNO/ghNEAyGZMVSlixeSWBRsKyqf/g+TH5OSfJhk/
	PBumkDvLEWFAVTbZltzb2UM+aJ4DIJbg0yqcE1qaAB4qRQ5DOfc+/C9IgLp8E19zEOAMESP3/F4
	xKihu4BLuo0kM3md+odQ==
X-Received: by 2002:a05:690c:6e85:b0:798:23f:7933 with SMTP id 00721157ae682-79a1c18f8cbmr159138057b3.37.1773756167882;
        Tue, 17 Mar 2026 07:02:47 -0700 (PDT)
Received: from arch ([177.55.229.85])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a2de73263sm58206637b3.43.2026.03.17.07.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:47 -0700 (PDT)
From: Daniel Castro <arantescastro@gmail.com>
To: danielmaraboo@gmail.com
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	Daniel Castro <arantescastro@gmail.com>
Subject: [PATCH v2] docs: pt_BR: translate process/1.Intro.rst
Date: Tue, 17 Mar 2026 11:01:34 -0300
Message-ID: <20260317140136.29256-1-arantescastro@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316212435.19303-1-arantescastro@gmail.com>
References: <20260316212435.19303-1-arantescastro@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Brazilian Portuguese translation of the development process
introduction (Documentation/process/1.Intro.rst), covering the
executive summary, importance of mainline code, and licensing.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Daniel Castro <arantescastro@gmail.com>
---
Changes in v2:
- Remove duplicate reference label (.. _development_process_intro:)
- Fix "propriedade original" -> "titularidade original" (correct legal term)
- Reflow paragraphs for optimal line filling

 Documentation/translations/pt_BR/index.rst    |   1 +
 .../translations/pt_BR/process/1.Intro.rst    | 269 ++++++++++++++++++
 2 files changed, 270 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/1.Intro.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index de5c005f91d6..4f7fcc3c66fb 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -66,6 +66,7 @@ kernel e sobre como ver seu trabalho integrado.
 .. toctree::
    :maxdepth: 1
 
+   Introdução <process/1.Intro>
    Como começar <process/howto>
    Requisitos mínimos <process/changes>
    Manuais dos mantenedores <process/maintainer-handbooks>
diff --git a/Documentation/translations/pt_BR/process/1.Intro.rst b/Documentation/translations/pt_BR/process/1.Intro.rst
new file mode 100644
index 000000000000..2995fa49e4c4
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/1.Intro.rst
@@ -0,0 +1,269 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Introdução
+==========
+
+Sumário
+-------
+
+O restante desta seção cobre o processo de desenvolvimento do kernel e os
+tipos de frustração que os desenvolvedores e empresas podem encontrar pelo
+caminho. Existem diversas razões que justificam a recomendação para que seja
+feito o merge do código do kernel ao kernel principal ("mainline"), como
+disponibilidade automática aos usuários, suporte da comunidade em diversas
+formas, e a oportunidade de influenciar a direção do desenvolvimento do
+kernel. Contribuições ao kernel Linux obrigatoriamente devem estar disponíveis
+sob uma licença compatível com a GPL.
+
+:ref:`development_process` apresenta o processo de desenvolvimento, o ciclo de
+lançamento, e a mecânica da janela de merge. As várias fases no desenvolvimento
+de patch, revisão, e ciclo de merge são explicadas. Algumas ferramentas e
+listas de e-mail são discutidas. Desenvolvedores que queiram começar a
+desenvolver o kernel são encorajados a buscar e corrigir bugs como exercício
+inicial.
+
+:ref:`development_early_stage` cobre os primeiros passos do processo de
+desenvolvimento, com ênfase no envolvimento da comunidade de desenvolvedores o
+mais cedo possível.
+
+:ref:`development_coding` é sobre o processo de codificação; muitas armadilhas
+já encontradas por outros desenvolvedores são discutidas. Alguns requisitos
+para patches são explicados, e é feita uma introdução para algumas ferramentas
+que podem ajudar a garantir que os patches de kernel estão corretos.
+
+:ref:`development_posting` fala sobre o processo de envio de patches para
+revisão. Para serem levados em consideração pela comunidade desenvolvedora, os
+patches devem estar devidamente formatados e descritos, assim como devem estar
+no lugar correto. Seguir os conselhos dessa seção pode ajudar na recepção
+positiva do seu trabalho.
+
+:ref:`development_followthrough` cobre o que acontece após o envio dos patches;
+o trabalho ainda está longe de estar concluído. Trabalhar com os revisores é
+parte crucial do processo de desenvolvimento; essa seção oferece dicas de como
+evitar problemas nesse estágio importante. Desenvolvedores são alertados a não
+presumir que o trabalho acabou após o merge do patch no "mainline".
+
+:ref:`development_advancedtopics` introduz dois tópicos mais "avançados":
+gerenciamento de patches com git e revisão de patches por outros.
+
+:ref:`development_conclusion` conclui o documento com indicações de fontes com
+mais informações sobre o desenvolvimento do kernel.
+
+Sobre este documento
+--------------------
+
+O kernel Linux, com mais de 8 milhões de linhas de código e bem mais de 1000
+contribuintes a cada lançamento ("release"), é um dos maiores e mais ativos
+projetos de software livre em existência. Desde seu modesto início em 1991,
+este kernel evoluiu para se tornar um dos melhores componentes de sistemas
+operacionais, rodando em pequenos players de música digital, PCs de mesa, os
+maiores supercomputadores em existência, e todos os outros tipos de sistema
+entre eles. É robusto, eficiente, e uma solução escalável para quase toda
+situação.
+
+O crescimento do Linux trouxe o aumento no número de desenvolvedores (e
+empresas) desejando participar no seu desenvolvimento. Fabricantes de hardware
+querem garantir que o Linux suporte bem os seus produtos, tornando-os atrativos
+para usuários Linux. Fabricantes de sistemas embarcados, que usam o Linux como
+componente em um produto integrado, querem que o Linux seja tão capaz e
+adequado quanto possível para a tarefa em questão. Distribuidores de software
+que baseiam seus produtos em Linux têm claro interesse nas capacidades,
+performance, e confiabilidade do kernel Linux. É também comum que usuários
+finais queiram alterar o Linux para atender melhor suas necessidades.
+
+Uma das características mais atrativas do Linux é sua facilidade de acesso a
+esses desenvolvedores; qualquer um com as habilidades necessárias pode melhorar
+o Linux e influenciar a direção do seu desenvolvimento. Produtos proprietários
+não conseguem oferecer esse tipo de abertura, que é característico do processo
+de software livre. O kernel é ainda mais acessível que a maioria dos outros
+projetos de software livre. Um ciclo típico de três meses de desenvolvimento
+do kernel pode envolver mais de 1000 desenvolvedores trabalhando para mais de
+100 empresas (ou absolutamente nenhuma empresa).
+
+Trabalhar com a comunidade de desenvolvimento do kernel não é uma tarefa árdua.
+Contudo, muitos colaboradores potenciais passaram por dificuldades ao tentar
+trabalhar no kernel. A comunidade evoluiu suas próprias formas de funcionamento
+que permitem operar de forma fluida (e produzir um produto de alta qualidade)
+em um ambiente em que milhares de linhas de código são alteradas todos os dias.
+Não é surpresa que o processo de desenvolvimento do kernel Linux seja muito
+diferente dos modelos de desenvolvimento proprietários.
+
+O processo de desenvolvimento do kernel pode parecer estranho e intimidador
+para novos desenvolvedores, mas existem bons motivos e uma sólida experiência
+por trás disso. Um desenvolvedor que não entenda os caminhos próprios da
+comunidade kernel (ou pior, que tente menosprezá-los ou contorná-los) terá uma
+experiência frustrante pela frente. A comunidade de desenvolvimento ajuda
+aqueles que tentam aprender, mas gasta pouco tempo com aqueles que não escutam
+ou não ligam para o processo de desenvolvimento.
+
+Espera-se que aqueles que leiam este documento sejam capazes de evitar essa
+experiência frustrante. Há muito material aqui, mas o esforço envolvido na sua
+leitura valerá a pena. A comunidade de desenvolvimento sempre necessita de
+desenvolvedores que ajudem a melhorar o kernel; o texto a seguir deve ajudar
+você - ou aqueles trabalhando para você - a se juntar à nossa comunidade.
+
+Créditos
+--------
+
+Esse documento foi escrito por Jonathan Corbet, corbet@lwn.net. Aprimorado
+pelos comentários de Johannes Berg, James Berry, Alex Chiang, Roland Dreier,
+Randy Dunlap, Jake Edge, Jiri Kosina, Matt Mackall, Arthur Marsh, Amanda
+McPherson, Andrew Morton, Andrew Price, Tsugikazu Shibata, e Jochen Voß.
+
+Esse trabalho contou com o apoio da Linux Foundation; agradecimentos especiais
+para Amanda McPherson, que viu o valor desse esforço e fez tudo acontecer.
+
+A importância de levar o código até o "mainline"
+-------------------------------------------------
+
+Algumas empresas e desenvolvedores ocasionalmente se perguntam por que devem
+se importar em aprender como trabalhar com a comunidade do kernel e ter seu
+código no "mainline" (o kernel mantido por Linus Torvalds e usado como base
+para os distribuidores Linux). No curto prazo, contribuir com o código pode
+parecer um gasto evitável; parece mais fácil apenas manter o seu código à
+parte e oferecer suporte direto aos usuários. A verdade é que manter código
+fora da árvore principal ("out-of-tree") é uma falsa economia.
+
+Para ilustrar os custos do código "out-of-tree", aqui estão alguns aspectos
+relevantes do processo de desenvolvimento do kernel; a maioria será discutida
+com mais detalhes adiante neste documento. Considere:
+
+- Código integrado via merge ao "mainline" fica disponível para todos os
+  usuários Linux. Estará automaticamente presente em todas as distribuições
+  que o habilitarem. Não há necessidade de discos de armazenamento, downloads,
+  ou as complicações de dar suporte a múltiplas versões de variadas
+  distribuições; tudo simplesmente funciona, para o desenvolvedor e para o
+  usuário. Incorporação ao "mainline" resolve um grande número de problemas
+  de distribuição e suporte.
+
+- Enquanto desenvolvedores do kernel se esforçam para manter uma interface
+  estável para o espaço do usuário, a API interna está em constante mudança.
+  A ausência de uma interface interna estável é uma escolha deliberada de
+  design; permite que sejam feitas melhorias fundamentais a qualquer tempo e
+  resulta em código de qualidade superior. Uma consequência dessa política é
+  que código "out-of-tree" precisa ser constantemente atualizado para que
+  continue funcionando com novos kernels. Manter código "out-of-tree" requer
+  significativo trabalho apenas para mantê-lo funcionando.
+
+  Por sua vez, código que está no "mainline" não precisa dessa manutenção,
+  resultado de uma regra simples que exige que qualquer desenvolvedor que
+  altere uma API, também conserte qualquer código que deixe de funcionar como
+  resultado da alteração. Código que teve o merge realizado no "mainline" tem
+  custo significativamente menor de manutenção.
+
+- Além disso, código que está no kernel será muitas vezes melhorado por outros
+  desenvolvedores. Resultados surpreendentes podem surgir ao permitir que sua
+  comunidade de usuários e clientes melhore seu produto.
+
+- Código do kernel está sujeito a revisão, tanto antes como depois do merge ao
+  "mainline". Independentemente das habilidades do desenvolvedor original, o
+  processo de revisão invariavelmente encontra maneiras de evoluí-lo. Bugs
+  severos e problemas de segurança são constantemente encontrados durante o
+  processo de revisão. Isso é especialmente válido para código desenvolvido em
+  ambiente isolado; tais códigos se beneficiam fortemente ao serem revistos por
+  outros desenvolvedores. Código "out-of-tree" é código de baixa qualidade.
+
+- Participação no processo de desenvolvimento é a forma pela qual você pode
+  influenciar a direção do desenvolvimento do kernel. Usuários que se queixam
+  externamente são ouvidos, porém desenvolvedores ativos têm maior poder de
+  articulação - e a habilidade de implementar mudanças que façam o kernel
+  funcionar melhor para suas necessidades.
+
+- Quando o código é mantido à parte, sempre existe a possibilidade de que
+  terceiros contribuam para uma implementação diferente de uma funcionalidade
+  parecida. Se isso acontecer, ter seu código integrado via merge se tornará
+  muito mais difícil - ao ponto de ser impossível. Você enfrentará duas
+  alternativas desagradáveis, (1) manter uma funcionalidade "out-of-tree"
+  indefinidamente ou (2) abandonar seu código e migrar seus usuários para a
+  versão na árvore principal ("in-tree").
+
+- Contribuição de código é a ação fundamental que faz todo o processo
+  funcionar. Ao contribuir com seu código você pode adicionar nova
+  funcionalidade ao kernel e proporcionar capacidades e exemplos que podem ser
+  usados por outros desenvolvedores de kernel. Se você desenvolveu código para
+  o Linux (ou está pensando em desenvolver), você claramente tem interesse na
+  continuidade do sucesso dessa plataforma; contribuição de código é uma das
+  melhores maneiras de garantir esse sucesso.
+
+Todos os argumentos acima se aplicam a qualquer código "out-of-tree", incluindo
+código distribuído de maneira proprietária, em formato exclusivamente binário.
+Existem fatores adicionais que devem ser levados em consideração antes de
+qualquer distribuição de código de kernel apenas em binário, incluindo:
+
+- As questões legais da distribuição de kernel proprietário são, no melhor dos
+  casos, confusas; muitos detentores de direitos autorais do kernel acreditam
+  que a maioria dos módulos binários são produtos derivados do kernel e que,
+  como resultado, sua distribuição é uma violação da Licença Pública Geral GNU
+  ("GNU General Public License"), que será tratada com mais profundidade abaixo.
+  Este autor não é um advogado, e nada neste documento pode ser considerado
+  aconselhamento jurídico. O verdadeiro status de módulos privados ("closed
+  source") só pode ser determinado judicialmente. Independentemente disso, a
+  incerteza que cerca esses módulos existe.
+
+- Os módulos binários aumentam consideravelmente a dificuldade de depuração de
+  problemas do kernel ("debugging"), a ponto de a maioria dos desenvolvedores
+  de kernel sequer tentar. Portanto, a distribuição de módulos exclusivamente
+  binários tornará mais difícil que os seus usuários recebam suporte.
+
+- O suporte também é mais difícil para distribuidores de módulos exclusivamente
+  binários, que precisam fornecer uma versão do módulo para cada distribuição e
+  cada versão do kernel que desejam suportar. Dezenas de versões de um único
+  módulo podem ser necessárias para fornecer uma cobertura razoavelmente
+  abrangente, e seus usuários terão que atualizar seu módulo separadamente
+  sempre que atualizarem seu kernel.
+
+- Tudo o que foi dito acima sobre revisão de código se aplica em dobro ao
+  código fechado. Como esse código não está disponível, ele não pode ter sido
+  revisado pela comunidade e, sem dúvida, terá sérios problemas.
+
+Os fabricantes de sistemas embarcados, em particular, podem ser tentados a
+ignorar grande parte do que foi dito nesta seção, acreditando que estão
+lançando um produto autossuficiente que usa uma versão congelada do kernel e
+não requer mais desenvolvimento após o lançamento. Esse argumento ignora o
+valor de uma revisão de código abrangente e o valor de permitir que seus
+usuários adicionem recursos ao seu produto. Mas esses produtos também têm uma
+vida comercial limitada, após a qual uma nova versão deve ser lançada. Nesse
+ponto, os fornecedores cujo código está no "mainline" e bem mantido estarão em
+uma posição muito melhor para preparar o novo produto para o mercado
+rapidamente.
+
+Licenciamento
+-------------
+
+Código é submetido ao kernel do Linux sob diversas licenças, mas todo ele deve
+ser compatível com a versão 2 da Licença Pública Geral GNU (GPLv2), que é a
+licença que cobre a distribuição do kernel como um todo. Na prática, isso
+significa que todas as contribuições de código são cobertas pela GPLv2 (com,
+opcionalmente, uma linguagem que permita a distribuição sob versões posteriores
+da GPL) ou pela licença BSD de três cláusulas. Quaisquer contribuições que não
+sejam cobertas por uma licença compatível não serão aceitas no kernel.
+
+A cessão de direitos autorais não é exigida (nem solicitada) para o código
+contribuído para o kernel. Todo o código incorporado ao kernel principal mantém
+sua titularidade original; como resultado, o kernel agora tem milhares de
+proprietários.
+
+Uma implicação dessa estrutura de propriedade é que qualquer tentativa de
+alterar o licenciamento do kernel está fadada ao fracasso quase certo. Existem
+poucos cenários práticos em que o acordo de todos os detentores de direitos
+autorais poderia ser obtido (ou seu código removido do kernel). Portanto, em
+particular, não há perspectiva de migração para a versão 3 da GPL em um futuro
+próximo.
+
+É imprescindível que todo o código contribuído para o kernel seja legitimamente
+software livre. Por esse motivo, código de contribuidores sem identidade
+conhecida ou contribuidores anônimos não será aceito. Todos os contribuidores
+são obrigados a "assinar" seu código, declarando que ele pode ser distribuído
+com o kernel sob a GPL. Código que não tenha sido licenciado como software
+livre por seu proprietário, ou que apresente risco de criar problemas
+relacionados a direitos autorais para o kernel (como código derivado de
+esforços de engenharia reversa sem as devidas salvaguardas) não pode ser
+contribuído.
+
+Questões sobre direitos autorais são comuns em listas de discussão de
+desenvolvimento Linux. Normalmente, essas perguntas recebem muitas respostas,
+mas é importante lembrar que as pessoas que respondem a essas perguntas não são
+advogados e não podem fornecer aconselhamento jurídico. Se você tiver dúvidas
+jurídicas relacionadas ao código-fonte do Linux, não há substituto para
+conversar com um advogado especializado nessa área. Confiar em respostas
+obtidas em listas de discussão técnicas é arriscado.
-- 
2.53.0

