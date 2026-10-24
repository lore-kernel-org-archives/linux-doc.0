Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792848127;
	b=xvldXY3IsV6FlFT5/hCG5631N9TzPfcuiyQ6YXVLp29HAJMf1+bfjah6s4xkEFXa2Pmt
	 bObJGD4zHuIcyDVv4ak+Upkz1GjD169vlB5ici3uxnrBEyeZSdR/G8YaTPFKTxxWNWrRb
	 99gWYK1PjP/VKpD6rP4g+wPeMEZ02VaqfGZixJ4aRW8MEUMN4dfkfJQfJx2rzOhPXK7w1
	 ic79zfwOUrxYGXTqxhrYNc+ITq4oThwLRSAwC7JRO5XymFqVmO2eMGTfMdfdNWoywXA8R
	 ygfuPTfmQoez9c7aIAn1ibVlHCgVElHPxiv/utFkoqG3/o4bgYOIDHyltDTOQpz7UYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bxecMDUT5MokJs+IqesNAw5mm/JZOp/rkOpsEd4p67Y=;
	b=IelqlY0bOJpOb0BmgbynH1ccWZW7CSpAwOFt1RVbNAsU4Qk16Q3IaVPwLMjc126QO1zg
	 ItEDTwKbqqQxJNP6cXoAD/weaGy7TqbLSfABdgwsJwARUWDBMKtl3BDcCIHaYYa2c6piA
	 YKPw/wQH0tp+ExiWII+xuoKL5zWdjy1p+EeFeAjEhOlyBaNAei2EtOVIShEtH2tayUNyw
	 9MsGkoZAfbojE6oH+3L9xuWCKPWvnJ9eNYryXqNvrj46D6xjKiiaAAhip8m4NO6/1oWax
	 vrtPaHPco34o7Acr/ghV/g0hvK7BbZlVZ7IDWb+tUBE/a44SsHir+UlTI5Tba8vUc9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K+2rx+l1;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD92B606A31A
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 13:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD92B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K+2rx+l1
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so2789014c88.0
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 06:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792848126; x=1793452926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bxecMDUT5MokJs+IqesNAw5mm/JZOp/rkOpsEd4p67Y=;
        b=K+2rx+l1792p+52fA5Ktc+LiGzgQ9F/+V0Z4G2zMMvKHTkFEXX8hT0YpXUZwLa9C7w
         9/I+rfGebQmFEONCroyc0eYI8808E2+mGkQ4RCD69uDDaj/t7+JKgGWHrIlYFPmY2q8B
         pd9MjlznZ8KD0YBotujsJFAShKZlCGA16RlGB0il7/rd4BUWYgVgAbo/6pHF5Glhe+c0
         4++83H89uo+TrMiLByADIn5AKpusdoc8+CwBEA52+3HF5wMWltdXJfeA8tKEmdOisz3k
         7Se0/FYAEA5NguEZce74tYxgry2NLwQr0Gkb+MxdJdSuQR8SaV9pA75dytF6LTIzJ8zE
         UNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792848126; x=1793452926;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxecMDUT5MokJs+IqesNAw5mm/JZOp/rkOpsEd4p67Y=;
        b=TjGh+S2IopnVaFWbuXpzh2BI4N8VLXjD1jWYWIKKjrai+uDFkMzgeGkBSCkrMv9ovl
         iLHkcFg8u0Q/m6gikGAhmlvCnww0htbeuDeMicKeB4Pf53bQ/jGtJv9EKJVfy9ZPsfmK
         5q2RhcjrpvGGHAZABlk+bZJmVKciH5afAKu7LGalcJ/i9WgAnrWcdjON6Tci41YBPaXH
         585dt6UExgVtL8tOE0hvomL8cyFfWW69rx6lPT8PTCrJYJe2qXV9gTLHBRZZau9CUMBU
         3X3HqSmsSkkh/IjOycKoy5kXK2F6rrOGj46dvmzEFHusSIuBekBgN1vVjVS5S1Q/CdJh
         4NUQ==
X-Forwarded-Encrypted: i=1; AKwUvByd5awHAxqgc4CTBk7ppX29HvNoFUiTNEPXbjZKOEfjLRJsHUIY8aXP1lERbgBFYrmCpoGMvZMh9i4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ1sQ8zs/5FLRcTV4J3oE8F81PpnpYfzg4mrmGXerNX9+aL9sO
	k/HXlobC+bYAt17QHSW4xisudaTF9raDEX0Bjx9i+XdlKGTlq93TqKiv
X-Gm-Gg: AYBFou3bpwFRWcmBL4DA5lPhhwZqnEwAq2oL47dCu0Zrk5Ti4AlCKOvn8SPXnUZWKS4
	gV7cjnB82gb/m3DVRgh9wBx6jzcSIoLIiF39JXgzxncvnnCPuOnpWXv5aSWWAVbkRejG2uk7MlP
	CRNhURBwPl7O97nySMWBU6ksq96r5gQkQGZhScbeACItVg3bknbsM+WKmlErfgUbnPEYCl2jOiN
	QnX8PIsPnP7IEv/pCDg+SjUr6hjWY4fmSGA2t3HiF10ywJ+gQ485kX21zmLOn6NZBAXYACf7pYk
	vqeqQwUFxS/+QQm38L+fa6un3EyrZLJdX0nlDtzIMbZy5+8hNn2VWdwB8/dRtQLi7PU2hdYllUp
	h+Y0D1uzaebQ9SgXP27nGWXpILkz77YFb8Bg/tYy/GWWZqJOT+mJ0LmHNf1pF5eWunFn3KhDYT3
	oleXHYVotXd3LTxFc4Rj+2MJuCbKvwLqSxEgG/iHYGSYuXBWafTJOD62/clgzmb7d0iNPAMEKcX
	jNKs5PGMBEWXP4udGR+GClx4sH1UbaHqcarLy5AdTCJMupH6TXtTPPsBMJoKwzPLa64m1w9BKZe
	A8IA21wAvAOa8aNjwvs6IaIP1Pyf+rV3t/5w9qGWsBi1jPzo9BnD5PzTm3p8s5poJoidqT2/YLN
	3DghxyRZM
X-Received: by 2002:a05:701b:465c:b0:19a:9a93:c9b2 with SMTP id a92af1059eb24-19a9a93cdbbmr1554101c88.13.1792848125052;
        Sat, 24 Oct 2026 06:22:05 -0700 (PDT)
Received: from localhost.localdomain ([177.75.70.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm15757768eec.23.2026.10.24.06.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:22:04 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 01/11] docs/translations/pt_BR: process: fix 1.Intro.rst and add labels
Date: Sat, 24 Oct 2026 10:21:48 -0300
Message-ID: <20261024132158.39493-2-danielmaraboo@gmail.com>
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

Review 1.Intro.rst against the English original and fix the
translation:

- Fix mistranslations: "driver disks", "proprietary kernel modules",
  "sent to the right place", "reviewing patches posted by others"
  (it said the patches were reviewed by others), "language" in the
  licensing section (legal wording, not a programming language),
  "foreseeable future", "developers and their employers" and the
  grouping of "the patch development, review, and merging cycle".
- Restore words that were dropped, such as "and other software
  vendors", "nonstandard", "binary-only", "from the community",
  "outside developers", "legal status", "however" and "help ensure".
- Use the same terms throughout the document and as the rest of the
  pt_BR translation: "contribuidores", "comunidade de desenvolvimento",
  "listas de discussão", "kernel Linux" and "mainline".
- Fix grammar and style issues (agreement, prepositions, gerunds and
  anglicisms such as "em existência").
- Rename "Sumário" to "Resumo executivo" ("Executive summary").

The :ref: links in 1.Intro.rst pointed to the labels of the English
documents, so they sent the reader out of the translation. Add
pt_BR_development_* labels to 1.Intro.rst through 8.Conclusion.rst,
mirroring the labels of the English documents with the pt_BR_ prefix
used by the other pt_BR documents, and use them in the references.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/process/1.Intro.rst    | 382 +++++++++---------
 .../translations/pt_BR/process/2.Process.rst  |   2 +
 .../pt_BR/process/3.Early-stage.rst           |   2 +
 .../translations/pt_BR/process/4.Coding.rst   |   2 +
 .../translations/pt_BR/process/5.Posting.rst  |   2 +
 .../pt_BR/process/6.Followthrough.rst         |   2 +
 .../pt_BR/process/7.AdvancedTopics.rst        |   2 +
 .../pt_BR/process/8.Conclusion.rst            |   2 +
 8 files changed, 210 insertions(+), 186 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/1.Intro.rst b/Documentation/translations/pt_BR/process/1.Intro.rst
index 2995fa49e..3592e573b 100644
--- a/Documentation/translations/pt_BR/process/1.Intro.rst
+++ b/Documentation/translations/pt_BR/process/1.Intro.rst
@@ -1,264 +1,274 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_development_process_intro:
+
 Introdução
 ==========
 
-Sumário
--------
-
-O restante desta seção cobre o processo de desenvolvimento do kernel e os
-tipos de frustração que os desenvolvedores e empresas podem encontrar pelo
-caminho. Existem diversas razões que justificam a recomendação para que seja
-feito o merge do código do kernel ao kernel principal ("mainline"), como
-disponibilidade automática aos usuários, suporte da comunidade em diversas
-formas, e a oportunidade de influenciar a direção do desenvolvimento do
-kernel. Contribuições ao kernel Linux obrigatoriamente devem estar disponíveis
-sob uma licença compatível com a GPL.
-
-:ref:`development_process` apresenta o processo de desenvolvimento, o ciclo de
-lançamento, e a mecânica da janela de merge. As várias fases no desenvolvimento
-de patch, revisão, e ciclo de merge são explicadas. Algumas ferramentas e
-listas de e-mail são discutidas. Desenvolvedores que queiram começar a
-desenvolver o kernel são encorajados a buscar e corrigir bugs como exercício
-inicial.
-
-:ref:`development_early_stage` cobre os primeiros passos do processo de
-desenvolvimento, com ênfase no envolvimento da comunidade de desenvolvedores o
+Resumo executivo
+----------------
+
+O restante desta seção cobre o escopo do processo de desenvolvimento do kernel
+e os tipos de frustração que os desenvolvedores e seus empregadores podem
+encontrar pelo caminho. Há inúmeras razões pelas quais o código do kernel deve
+ser integrado ao kernel oficial ("mainline"), entre elas a disponibilidade
+automática para os usuários, o suporte da comunidade em diversas formas e a
+capacidade de influenciar a direção do desenvolvimento do kernel. O código
+contribuído ao kernel Linux deve ser disponibilizado sob uma licença compatível
+com a GPL.
+
+:ref:`pt_BR_development_process` apresenta o processo de desenvolvimento, o
+ciclo de lançamento do kernel e a mecânica da janela de merge. As várias fases
+do ciclo de desenvolvimento, revisão e merge de patches são explicadas. Também
+são abordadas algumas ferramentas e listas de discussão. Desenvolvedores que
+queiram começar no desenvolvimento do kernel são encorajados a localizar e
+corrigir bugs como exercício inicial.
+
+:ref:`pt_BR_development_early_stage` cobre o planejamento de projetos em
+estágio inicial, com ênfase no envolvimento da comunidade de desenvolvimento o
 mais cedo possível.
 
-:ref:`development_coding` é sobre o processo de codificação; muitas armadilhas
-já encontradas por outros desenvolvedores são discutidas. Alguns requisitos
-para patches são explicados, e é feita uma introdução para algumas ferramentas
-que podem ajudar a garantir que os patches de kernel estão corretos.
+:ref:`pt_BR_development_coding` é sobre o processo de codificação; várias
+armadilhas já encontradas por outros desenvolvedores são discutidas. Alguns
+requisitos para patches são explicados, e é feita uma introdução a algumas das
+ferramentas que podem ajudar a garantir que os patches de kernel estejam
+corretos.
 
-:ref:`development_posting` fala sobre o processo de envio de patches para
-revisão. Para serem levados em consideração pela comunidade desenvolvedora, os
-patches devem estar devidamente formatados e descritos, assim como devem estar
-no lugar correto. Seguir os conselhos dessa seção pode ajudar na recepção
-positiva do seu trabalho.
+:ref:`pt_BR_development_posting` fala sobre o processo de envio de patches para
+revisão. Para serem levados a sério pela comunidade de desenvolvimento, os
+patches devem estar devidamente formatados e descritos, e devem ser enviados ao
+lugar correto. Seguir os conselhos dessa seção deve ajudar a garantir a melhor
+recepção possível para o seu trabalho.
 
-:ref:`development_followthrough` cobre o que acontece após o envio dos patches;
-o trabalho ainda está longe de estar concluído. Trabalhar com os revisores é
-parte crucial do processo de desenvolvimento; essa seção oferece dicas de como
-evitar problemas nesse estágio importante. Desenvolvedores são alertados a não
-presumir que o trabalho acabou após o merge do patch no "mainline".
+:ref:`pt_BR_development_followthrough` cobre o que acontece após o envio dos
+patches; nesse ponto, o trabalho ainda está longe de estar concluído. Trabalhar
+com os revisores é parte crucial do processo de desenvolvimento; essa seção
+oferece diversas dicas sobre como evitar problemas nesse estágio importante.
+Desenvolvedores são alertados para não presumir que o trabalho acabou após o
+merge do patch no "mainline".
 
-:ref:`development_advancedtopics` introduz dois tópicos mais "avançados":
-gerenciamento de patches com git e revisão de patches por outros.
+:ref:`pt_BR_development_advancedtopics` introduz dois tópicos "avançados":
+gerenciamento de patches com Git e revisão de patches enviados por outros.
 
-:ref:`development_conclusion` conclui o documento com indicações de fontes com
-mais informações sobre o desenvolvimento do kernel.
+:ref:`pt_BR_development_conclusion` conclui o documento com indicações de
+fontes com mais informações sobre o desenvolvimento do kernel.
 
 Sobre este documento
 --------------------
 
 O kernel Linux, com mais de 8 milhões de linhas de código e bem mais de 1000
-contribuintes a cada lançamento ("release"), é um dos maiores e mais ativos
-projetos de software livre em existência. Desde seu modesto início em 1991,
-este kernel evoluiu para se tornar um dos melhores componentes de sistemas
-operacionais, rodando em pequenos players de música digital, PCs de mesa, os
-maiores supercomputadores em existência, e todos os outros tipos de sistema
-entre eles. É robusto, eficiente, e uma solução escalável para quase toda
-situação.
-
-O crescimento do Linux trouxe o aumento no número de desenvolvedores (e
-empresas) desejando participar no seu desenvolvimento. Fabricantes de hardware
-querem garantir que o Linux suporte bem os seus produtos, tornando-os atrativos
-para usuários Linux. Fabricantes de sistemas embarcados, que usam o Linux como
-componente em um produto integrado, querem que o Linux seja tão capaz e
-adequado quanto possível para a tarefa em questão. Distribuidores de software
-que baseiam seus produtos em Linux têm claro interesse nas capacidades,
-performance, e confiabilidade do kernel Linux. É também comum que usuários
-finais queiram alterar o Linux para atender melhor suas necessidades.
-
-Uma das características mais atrativas do Linux é sua facilidade de acesso a
-esses desenvolvedores; qualquer um com as habilidades necessárias pode melhorar
-o Linux e influenciar a direção do seu desenvolvimento. Produtos proprietários
+contribuidores a cada lançamento ("release"), é um dos maiores e mais ativos
+projetos de software livre existentes. Desde seu modesto início em 1991, este
+kernel evoluiu para se tornar um componente de sistema operacional de primeira
+linha, que roda em players de música digital de bolso, em PCs de mesa, nos
+maiores supercomputadores existentes e em todos os tipos de sistema
+intermediários. É uma solução robusta, eficiente e escalável para quase
+qualquer situação.
+
+O crescimento do Linux trouxe um aumento no número de desenvolvedores (e
+empresas) que desejam participar do seu desenvolvimento. Fabricantes de
+hardware querem garantir que o Linux suporte bem os seus produtos, tornando-os
+atrativos para usuários Linux. Fabricantes de sistemas embarcados, que usam o
+Linux como componente em um produto integrado, querem que o Linux seja tão
+capaz e adequado quanto possível para a tarefa em questão. Distribuidores e
+outros fornecedores de software que baseiam seus produtos em Linux têm claro
+interesse nas capacidades, no desempenho e na confiabilidade do kernel Linux.
+Usuários finais também costumam querer alterar o Linux para que ele atenda
+melhor às suas necessidades.
+
+Uma das características mais atrativas do Linux é ser acessível a esses
+desenvolvedores; qualquer um com as habilidades necessárias pode melhorar o
+Linux e influenciar a direção do seu desenvolvimento. Produtos proprietários
 não conseguem oferecer esse tipo de abertura, que é característico do processo
-de software livre. O kernel é ainda mais acessível que a maioria dos outros
-projetos de software livre. Um ciclo típico de três meses de desenvolvimento
-do kernel pode envolver mais de 1000 desenvolvedores trabalhando para mais de
-100 empresas (ou absolutamente nenhuma empresa).
-
-Trabalhar com a comunidade de desenvolvimento do kernel não é uma tarefa árdua.
-Contudo, muitos colaboradores potenciais passaram por dificuldades ao tentar
-trabalhar no kernel. A comunidade evoluiu suas próprias formas de funcionamento
-que permitem operar de forma fluida (e produzir um produto de alta qualidade)
-em um ambiente em que milhares de linhas de código são alteradas todos os dias.
-Não é surpresa que o processo de desenvolvimento do kernel Linux seja muito
-diferente dos modelos de desenvolvimento proprietários.
+de software livre. Na verdade, o kernel é ainda mais aberto que a maioria dos
+outros projetos de software livre. Um ciclo típico de três meses de
+desenvolvimento do kernel pode envolver mais de 1000 desenvolvedores
+trabalhando para mais de 100 empresas diferentes (ou para nenhuma empresa).
+
+Trabalhar com a comunidade de desenvolvimento do kernel não é especialmente
+difícil. Ainda assim, muitos contribuidores em potencial passaram por
+dificuldades ao tentar trabalhar no kernel. A comunidade do kernel desenvolveu
+formas próprias e distintas de funcionamento, que lhe permitem operar de forma
+fluida (e produzir um produto de alta qualidade) em um ambiente em que milhares
+de linhas de código são alteradas todos os dias. Portanto, não é surpresa que o
+processo de desenvolvimento do kernel Linux seja muito diferente dos métodos de
+desenvolvimento proprietários.
 
 O processo de desenvolvimento do kernel pode parecer estranho e intimidador
 para novos desenvolvedores, mas existem bons motivos e uma sólida experiência
-por trás disso. Um desenvolvedor que não entenda os caminhos próprios da
-comunidade kernel (ou pior, que tente menosprezá-los ou contorná-los) terá uma
-experiência frustrante pela frente. A comunidade de desenvolvimento ajuda
-aqueles que tentam aprender, mas gasta pouco tempo com aqueles que não escutam
-ou não ligam para o processo de desenvolvimento.
+por trás dele. Um desenvolvedor que não entenda os costumes da comunidade do
+kernel (ou, pior, que tente desrespeitá-los ou contorná-los) terá uma
+experiência frustrante pela frente. A comunidade de desenvolvimento, embora
+ajude aqueles que tentam aprender, tem pouco tempo para aqueles que não escutam
+ou não se importam com o processo de desenvolvimento.
 
-Espera-se que aqueles que leiam este documento sejam capazes de evitar essa
+Espera-se que aqueles que lerem este documento sejam capazes de evitar essa
 experiência frustrante. Há muito material aqui, mas o esforço envolvido na sua
-leitura valerá a pena. A comunidade de desenvolvimento sempre necessita de
-desenvolvedores que ajudem a melhorar o kernel; o texto a seguir deve ajudar
-você - ou aqueles trabalhando para você - a se juntar à nossa comunidade.
+leitura será recompensado em pouco tempo. A comunidade de desenvolvimento
+sempre necessita de desenvolvedores que ajudem a melhorar o kernel; o texto a
+seguir deve ajudar você - ou aqueles que trabalham para você - a se juntar à
+nossa comunidade.
 
 Créditos
 --------
 
-Esse documento foi escrito por Jonathan Corbet, corbet@lwn.net. Aprimorado
-pelos comentários de Johannes Berg, James Berry, Alex Chiang, Roland Dreier,
-Randy Dunlap, Jake Edge, Jiri Kosina, Matt Mackall, Arthur Marsh, Amanda
-McPherson, Andrew Morton, Andrew Price, Tsugikazu Shibata, e Jochen Voß.
+Este documento foi escrito por Jonathan Corbet, corbet@lwn.net. Ele foi
+aprimorado com comentários de Johannes Berg, James Berry, Alex Chiang, Roland
+Dreier, Randy Dunlap, Jake Edge, Jiri Kosina, Matt Mackall, Arthur Marsh,
+Amanda McPherson, Andrew Morton, Andrew Price, Tsugikazu Shibata e Jochen Voß.
 
-Esse trabalho contou com o apoio da Linux Foundation; agradecimentos especiais
-para Amanda McPherson, que viu o valor desse esforço e fez tudo acontecer.
+Este trabalho contou com o apoio da Linux Foundation; agradecimentos especiais
+a Amanda McPherson, que viu o valor desse esforço e fez tudo acontecer.
 
 A importância de levar o código até o "mainline"
 -------------------------------------------------
 
-Algumas empresas e desenvolvedores ocasionalmente se perguntam por que devem
-se importar em aprender como trabalhar com a comunidade do kernel e ter seu
-código no "mainline" (o kernel mantido por Linus Torvalds e usado como base
-para os distribuidores Linux). No curto prazo, contribuir com o código pode
-parecer um gasto evitável; parece mais fácil apenas manter o seu código à
-parte e oferecer suporte direto aos usuários. A verdade é que manter código
-fora da árvore principal ("out-of-tree") é uma falsa economia.
+Algumas empresas e desenvolvedores ocasionalmente se perguntam por que deveriam
+se preocupar em aprender a trabalhar com a comunidade do kernel e em levar seu
+código ao "mainline" (o kernel mantido por Linus Torvalds e usado como base
+pelos distribuidores Linux). No curto prazo, contribuir com código pode parecer
+um gasto evitável; parece mais fácil apenas manter o código à parte e oferecer
+suporte direto aos usuários. A verdade é que manter código fora da árvore
+principal ("out-of-tree") é uma falsa economia.
 
 Para ilustrar os custos do código "out-of-tree", aqui estão alguns aspectos
 relevantes do processo de desenvolvimento do kernel; a maioria será discutida
 com mais detalhes adiante neste documento. Considere:
 
 - Código integrado via merge ao "mainline" fica disponível para todos os
-  usuários Linux. Estará automaticamente presente em todas as distribuições
-  que o habilitarem. Não há necessidade de discos de armazenamento, downloads,
-  ou as complicações de dar suporte a múltiplas versões de variadas
-  distribuições; tudo simplesmente funciona, para o desenvolvedor e para o
-  usuário. Incorporação ao "mainline" resolve um grande número de problemas
-  de distribuição e suporte.
-
-- Enquanto desenvolvedores do kernel se esforçam para manter uma interface
-  estável para o espaço do usuário, a API interna está em constante mudança.
-  A ausência de uma interface interna estável é uma escolha deliberada de
-  design; permite que sejam feitas melhorias fundamentais a qualquer tempo e
-  resulta em código de qualidade superior. Uma consequência dessa política é
-  que código "out-of-tree" precisa ser constantemente atualizado para que
-  continue funcionando com novos kernels. Manter código "out-of-tree" requer
-  significativo trabalho apenas para mantê-lo funcionando.
-
-  Por sua vez, código que está no "mainline" não precisa dessa manutenção,
-  resultado de uma regra simples que exige que qualquer desenvolvedor que
-  altere uma API, também conserte qualquer código que deixe de funcionar como
-  resultado da alteração. Código que teve o merge realizado no "mainline" tem
-  custo significativamente menor de manutenção.
+  usuários Linux. Estará automaticamente presente em todas as distribuições que
+  o habilitarem. Não há necessidade de discos de drivers, downloads ou das
+  complicações de dar suporte a múltiplas versões de múltiplas distribuições;
+  tudo simplesmente funciona, para o desenvolvedor e para o usuário. A
+  incorporação ao "mainline" resolve um grande número de problemas de
+  distribuição e suporte.
+
+- Embora os desenvolvedores do kernel se esforcem para manter uma interface
+  estável para o espaço do usuário, a API interna do kernel está em constante
+  mudança. A ausência de uma interface interna estável é uma decisão deliberada
+  de design; ela permite que melhorias fundamentais sejam feitas a qualquer
+  momento e resulta em código de qualidade superior. Mas uma consequência dessa
+  política é que qualquer código "out-of-tree" exige manutenção constante para
+  funcionar com novos kernels. Manter código "out-of-tree" requer um trabalho
+  significativo apenas para que ele continue funcionando.
+
+  Por sua vez, o código que está no "mainline" não precisa desse trabalho,
+  graças a uma regra simples que exige que qualquer desenvolvedor que altere
+  uma API também conserte qualquer código que deixe de funcionar como resultado
+  dessa alteração. Portanto, o código que passou pelo merge no "mainline" tem
+  custos de manutenção significativamente menores.
 
 - Além disso, código que está no kernel será muitas vezes melhorado por outros
   desenvolvedores. Resultados surpreendentes podem surgir ao permitir que sua
   comunidade de usuários e clientes melhore seu produto.
 
-- Código do kernel está sujeito a revisão, tanto antes como depois do merge ao
-  "mainline". Independentemente das habilidades do desenvolvedor original, o
-  processo de revisão invariavelmente encontra maneiras de evoluí-lo. Bugs
-  severos e problemas de segurança são constantemente encontrados durante o
-  processo de revisão. Isso é especialmente válido para código desenvolvido em
-  ambiente isolado; tais códigos se beneficiam fortemente ao serem revistos por
-  outros desenvolvedores. Código "out-of-tree" é código de baixa qualidade.
-
-- Participação no processo de desenvolvimento é a forma pela qual você pode
-  influenciar a direção do desenvolvimento do kernel. Usuários que se queixam
-  externamente são ouvidos, porém desenvolvedores ativos têm maior poder de
-  articulação - e a habilidade de implementar mudanças que façam o kernel
-  funcionar melhor para suas necessidades.
+- O código do kernel está sujeito a revisão, tanto antes como depois do merge
+  no "mainline". Por mais sólidas que sejam as habilidades do desenvolvedor
+  original, esse processo de revisão invariavelmente encontra maneiras de
+  melhorar o código. Com frequência, a revisão encontra bugs graves e problemas
+  de segurança. Isso é especialmente válido para código desenvolvido em
+  ambiente fechado; esse tipo de código se beneficia muito da revisão por
+  desenvolvedores externos. Código "out-of-tree" é código de qualidade
+  inferior.
+
+- A participação no processo de desenvolvimento é a forma pela qual você pode
+  influenciar a direção do desenvolvimento do kernel. Usuários que reclamam de
+  fora são ouvidos, mas desenvolvedores ativos têm uma voz mais forte - e a
+  capacidade de implementar mudanças que façam o kernel funcionar melhor para
+  suas necessidades.
 
 - Quando o código é mantido à parte, sempre existe a possibilidade de que
-  terceiros contribuam para uma implementação diferente de uma funcionalidade
-  parecida. Se isso acontecer, ter seu código integrado via merge se tornará
-  muito mais difícil - ao ponto de ser impossível. Você enfrentará duas
-  alternativas desagradáveis, (1) manter uma funcionalidade "out-of-tree"
-  indefinidamente ou (2) abandonar seu código e migrar seus usuários para a
-  versão na árvore principal ("in-tree").
-
-- Contribuição de código é a ação fundamental que faz todo o processo
-  funcionar. Ao contribuir com seu código você pode adicionar nova
-  funcionalidade ao kernel e proporcionar capacidades e exemplos que podem ser
-  usados por outros desenvolvedores de kernel. Se você desenvolveu código para
-  o Linux (ou está pensando em desenvolver), você claramente tem interesse na
-  continuidade do sucesso dessa plataforma; contribuição de código é uma das
-  melhores maneiras de garantir esse sucesso.
-
-Todos os argumentos acima se aplicam a qualquer código "out-of-tree", incluindo
-código distribuído de maneira proprietária, em formato exclusivamente binário.
-Existem fatores adicionais que devem ser levados em consideração antes de
-qualquer distribuição de código de kernel apenas em binário, incluindo:
-
-- As questões legais da distribuição de kernel proprietário são, no melhor dos
-  casos, confusas; muitos detentores de direitos autorais do kernel acreditam
-  que a maioria dos módulos binários são produtos derivados do kernel e que,
-  como resultado, sua distribuição é uma violação da Licença Pública Geral GNU
-  ("GNU General Public License"), que será tratada com mais profundidade abaixo.
-  Este autor não é um advogado, e nada neste documento pode ser considerado
-  aconselhamento jurídico. O verdadeiro status de módulos privados ("closed
-  source") só pode ser determinado judicialmente. Independentemente disso, a
-  incerteza que cerca esses módulos existe.
+  terceiros contribuam com uma implementação diferente de uma funcionalidade
+  parecida. Se isso acontecer, conseguir o merge do seu código se tornará muito
+  mais difícil - a ponto de ser impossível. Então você se verá diante das
+  alternativas desagradáveis de (1) manter indefinidamente uma funcionalidade
+  não padronizada "out-of-tree" ou (2) abandonar seu código e migrar seus
+  usuários para a versão na árvore principal ("in-tree").
+
+- A contribuição de código é a ação fundamental que faz todo o processo
+  funcionar. Ao contribuir com seu código, você pode adicionar novas
+  funcionalidades ao kernel e fornecer capacidades e exemplos úteis para outros
+  desenvolvedores do kernel. Se você desenvolveu código para o Linux (ou está
+  pensando em fazê-lo), você claramente tem interesse no sucesso contínuo dessa
+  plataforma; contribuir com código é uma das melhores maneiras de ajudar a
+  garantir esse sucesso.
+
+Todos os argumentos acima se aplicam a qualquer código de kernel "out-of-tree",
+incluindo código distribuído em formato proprietário e exclusivamente binário.
+Existem, no entanto, fatores adicionais que devem ser levados em conta antes de
+considerar qualquer tipo de distribuição de código de kernel exclusivamente
+binário. Entre eles:
+
+- As questões legais em torno da distribuição de módulos de kernel
+  proprietários são, no melhor dos casos, nebulosas; muitos detentores de
+  direitos autorais do kernel acreditam que a maioria dos módulos
+  exclusivamente binários são produtos derivados do kernel e que, como
+  resultado, sua distribuição é uma violação da Licença Pública Geral GNU ("GNU
+  General Public License"), que será tratada com mais profundidade abaixo. Este
+  autor não é advogado, e nada neste documento pode ser considerado
+  aconselhamento jurídico. O verdadeiro status jurídico dos módulos de código
+  fechado ("closed source") só pode ser determinado judicialmente.
+  Independentemente disso, a incerteza que cerca esses módulos existe.
 
 - Os módulos binários aumentam consideravelmente a dificuldade de depuração de
   problemas do kernel ("debugging"), a ponto de a maioria dos desenvolvedores
-  de kernel sequer tentar. Portanto, a distribuição de módulos exclusivamente
-  binários tornará mais difícil que os seus usuários recebam suporte.
+  de kernel nem sequer tentar. Portanto, a distribuição de módulos
+  exclusivamente binários tornará mais difícil que os seus usuários recebam
+  suporte da comunidade.
 
 - O suporte também é mais difícil para distribuidores de módulos exclusivamente
   binários, que precisam fornecer uma versão do módulo para cada distribuição e
-  cada versão do kernel que desejam suportar. Dezenas de versões de um único
-  módulo podem ser necessárias para fornecer uma cobertura razoavelmente
-  abrangente, e seus usuários terão que atualizar seu módulo separadamente
-  sempre que atualizarem seu kernel.
+  cada versão do kernel que desejam suportar. Dezenas de compilações ("builds")
+  de um único módulo podem ser necessárias para fornecer uma cobertura
+  razoavelmente abrangente, e seus usuários terão que atualizar seu módulo
+  separadamente sempre que atualizarem seu kernel.
 
 - Tudo o que foi dito acima sobre revisão de código se aplica em dobro ao
-  código fechado. Como esse código não está disponível, ele não pode ter sido
-  revisado pela comunidade e, sem dúvida, terá sérios problemas.
+  código fechado. Como esse código não está disponível de forma alguma, ele não
+  pode ter sido revisado pela comunidade e, sem dúvida, terá sérios problemas.
 
 Os fabricantes de sistemas embarcados, em particular, podem ser tentados a
 ignorar grande parte do que foi dito nesta seção, acreditando que estão
 lançando um produto autossuficiente que usa uma versão congelada do kernel e
 não requer mais desenvolvimento após o lançamento. Esse argumento ignora o
-valor de uma revisão de código abrangente e o valor de permitir que seus
-usuários adicionem recursos ao seu produto. Mas esses produtos também têm uma
-vida comercial limitada, após a qual uma nova versão deve ser lançada. Nesse
-ponto, os fornecedores cujo código está no "mainline" e bem mantido estarão em
-uma posição muito melhor para preparar o novo produto para o mercado
-rapidamente.
+valor de uma revisão de código ampla e o valor de permitir que seus usuários
+adicionem recursos ao seu produto. Mas esses produtos também têm uma vida
+comercial limitada, após a qual uma nova versão deve ser lançada. Nesse ponto,
+os fornecedores cujo código está no "mainline" e é bem mantido estarão em uma
+posição muito melhor para preparar rapidamente o novo produto para o mercado.
 
 Licenciamento
 -------------
 
-Código é submetido ao kernel do Linux sob diversas licenças, mas todo ele deve
+Código é contribuído ao kernel Linux sob diversas licenças, mas todo ele deve
 ser compatível com a versão 2 da Licença Pública Geral GNU (GPLv2), que é a
 licença que cobre a distribuição do kernel como um todo. Na prática, isso
 significa que todas as contribuições de código são cobertas pela GPLv2 (com,
-opcionalmente, uma linguagem que permita a distribuição sob versões posteriores
-da GPL) ou pela licença BSD de três cláusulas. Quaisquer contribuições que não
+opcionalmente, um texto que permita a distribuição sob versões posteriores da
+GPL) ou pela licença BSD de três cláusulas. Quaisquer contribuições que não
 sejam cobertas por uma licença compatível não serão aceitas no kernel.
 
 A cessão de direitos autorais não é exigida (nem solicitada) para o código
-contribuído para o kernel. Todo o código incorporado ao kernel principal mantém
-sua titularidade original; como resultado, o kernel agora tem milhares de
+contribuído ao kernel. Todo o código incorporado ao "mainline" mantém sua
+titularidade original; como resultado, o kernel agora tem milhares de
 proprietários.
 
 Uma implicação dessa estrutura de propriedade é que qualquer tentativa de
 alterar o licenciamento do kernel está fadada ao fracasso quase certo. Existem
 poucos cenários práticos em que o acordo de todos os detentores de direitos
 autorais poderia ser obtido (ou seu código removido do kernel). Portanto, em
-particular, não há perspectiva de migração para a versão 3 da GPL em um futuro
-próximo.
+particular, não há perspectiva de migração para a versão 3 da GPL no futuro
+previsível.
 
-É imprescindível que todo o código contribuído para o kernel seja legitimamente
+É imprescindível que todo o código contribuído ao kernel seja legitimamente
 software livre. Por esse motivo, código de contribuidores sem identidade
-conhecida ou contribuidores anônimos não será aceito. Todos os contribuidores
-são obrigados a "assinar" seu código, declarando que ele pode ser distribuído
-com o kernel sob a GPL. Código que não tenha sido licenciado como software
-livre por seu proprietário, ou que apresente risco de criar problemas
-relacionados a direitos autorais para o kernel (como código derivado de
-esforços de engenharia reversa sem as devidas salvaguardas) não pode ser
-contribuído.
+conhecida ou de contribuidores anônimos não será aceito. Todos os
+contribuidores são obrigados a "assinar" ("sign off") seu código, declarando
+que ele pode ser distribuído com o kernel sob a GPL. Código que não tenha sido
+licenciado como software livre por seu proprietário, ou que apresente risco de
+criar problemas relacionados a direitos autorais para o kernel (como código
+derivado de esforços de engenharia reversa sem as devidas salvaguardas), não
+pode ser contribuído.
 
 Questões sobre direitos autorais são comuns em listas de discussão de
 desenvolvimento Linux. Normalmente, essas perguntas recebem muitas respostas,
diff --git a/Documentation/translations/pt_BR/process/2.Process.rst b/Documentation/translations/pt_BR/process/2.Process.rst
index 0019b7404..a0b6decfa 100644
--- a/Documentation/translations/pt_BR/process/2.Process.rst
+++ b/Documentation/translations/pt_BR/process/2.Process.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_development_process:
+
 Como funciona o processo de desenvolvimento
 ===========================================
 
diff --git a/Documentation/translations/pt_BR/process/3.Early-stage.rst b/Documentation/translations/pt_BR/process/3.Early-stage.rst
index 86c228353..9d9513e5c 100644
--- a/Documentation/translations/pt_BR/process/3.Early-stage.rst
+++ b/Documentation/translations/pt_BR/process/3.Early-stage.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_development_early_stage:
+
 Planejamento em estágio inicial
 ===============================
 
diff --git a/Documentation/translations/pt_BR/process/4.Coding.rst b/Documentation/translations/pt_BR/process/4.Coding.rst
index 7c7567165..914a3d4c5 100644
--- a/Documentation/translations/pt_BR/process/4.Coding.rst
+++ b/Documentation/translations/pt_BR/process/4.Coding.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_development_coding:
+
 Escrever o código corretamente
 ==============================
 
diff --git a/Documentation/translations/pt_BR/process/5.Posting.rst b/Documentation/translations/pt_BR/process/5.Posting.rst
index 2ac7e5557..60e12c1ee 100644
--- a/Documentation/translations/pt_BR/process/5.Posting.rst
+++ b/Documentation/translations/pt_BR/process/5.Posting.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_development_posting:
+
 Enviando patches
 ================
 
diff --git a/Documentation/translations/pt_BR/process/6.Followthrough.rst b/Documentation/translations/pt_BR/process/6.Followthrough.rst
index dbdf479bb..c016f9e57 100644
--- a/Documentation/translations/pt_BR/process/6.Followthrough.rst
+++ b/Documentation/translations/pt_BR/process/6.Followthrough.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_development_followthrough:
+
 Acompanhamento
 ==============
 
diff --git a/Documentation/translations/pt_BR/process/7.AdvancedTopics.rst b/Documentation/translations/pt_BR/process/7.AdvancedTopics.rst
index 97466fad1..bd98927c4 100644
--- a/Documentation/translations/pt_BR/process/7.AdvancedTopics.rst
+++ b/Documentation/translations/pt_BR/process/7.AdvancedTopics.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_development_advancedtopics:
+
 Tópicos avançados
 =================
 
diff --git a/Documentation/translations/pt_BR/process/8.Conclusion.rst b/Documentation/translations/pt_BR/process/8.Conclusion.rst
index 2696ea167..6691627b2 100644
--- a/Documentation/translations/pt_BR/process/8.Conclusion.rst
+++ b/Documentation/translations/pt_BR/process/8.Conclusion.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_development_conclusion:
+
 Para mais informações
 =====================
 
-- 
2.47.3

