Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9181E1C11
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 18:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783101949; cv=none; b=S95RdUroh29+JIzomI8zNzgLSRUXhM/euhVwsYor3R8RX+Qykk5P7YJfo+9Tpc1Sz9J/mYRQOpzbIRMDx5+GNTuw7LxmuQV3CCP0y0TUy82z7ymMMQKRoA4TYY+V86wTew6xhIQpPtrR8YO9EYI4iP59QuqnNl94X3RrEsJ8roQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783101949; c=relaxed/simple;
	bh=QlRfLuEc7hUoyWIzSevZRhoQcEWjHDlTyc9d5ZZSSnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pr0wYSBED2MrEAB4B6XSRl8QFCT64IiRETKwE4t4HYLA/+RlSfQvIXOwntXvxoKLBFsWnQdLbd5+VutrM3auQspBjAckylixh132eYqjIrWMNvi3j34G20xq+DKlOJMgL2L9RPOv1TB50oveKPph9xG6mZcM7YOWPGAcBFWq7m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxlxasCk; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxlxasCk"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c9ed0c7fc7so10906925ad.1
        for <linux-doc@vger.kernel.org>; Fri, 03 Jul 2026 11:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783101947; x=1783706747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j4o3PJxbXy/nnTKvnWRb8EbYMo8CR9CRg9kHk4KhlcU=;
        b=JxlxasCkoiHVLotG7RH3F5jP2p0IXw948sRn9TU/DRV99ZlHxdCsa4ZnVGgrndIHys
         iYaOOxWUgSWVqvJc0qhX90qGBKe8bIKtMHguAkCvZghC1eE9edvhaamCaLZehDscfepA
         6ieHkAkRe7wcMLsHLbJ1bSAQUw+ZooLqsahlALRUbe21AM2rliw1d2ReXtR0SEQOdL2Z
         svjzmdRKk0cJWgZ9LFjy7pu5jhKQwR+SVunOuufvaoact7pgiXJryIuqYSTIwaXYBBCZ
         F2j6Qsy57NMEXN/cvtshZi5fa/sa39zTZjabuA7n1vNnQY+oFYCKCP3tSqM9OTCI7nrL
         vRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783101947; x=1783706747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4o3PJxbXy/nnTKvnWRb8EbYMo8CR9CRg9kHk4KhlcU=;
        b=hipW8g3NpkzFv3Dy9GVrgiKU7m+MNWeskAhJD24dGJwQHdCcWwCc6GT7GiI1JiFqED
         vXHkd8Q+nHOBAnZvD9lX6aX046T8iOoBrMyTQgMYibTG8y5SlH4cqs1LJFa/vHcQrVSs
         cLE76tURrJCRoOrZ7oHR3AB90JpX2y8k6macFsFuPgwU41Z6n9KlcLOdE7Q3hzCg9tJP
         d/1rOc4+MdJ5EcdDI67cp1DzH4oSUa92jHO+/uLqQjmOPrK6ag8vmoYRydRPlrCwv7xw
         echztEJmcZa6GbyiSVZ3+KXaI+bOCWVcU39QDB774hZQrCvlekfG0EWSgoHA0FYSUlh6
         Abzw==
X-Gm-Message-State: AOJu0Yx9/YepWHn/vFLwjvMn9enYSZjbNn8eSWLFOZ6o2oSxO6bGKlQK
	dvTj7RvsVaOXE4xKNJrO0i53PrK3zgUDwvvUEKghmbcEn3XSSW6BRJVt
X-Gm-Gg: AfdE7clj6Ipc8FiEMXlL5kSNcI+Tu3Gt95WFoc+z72Qw9AzhGwEbtZajOR+j1JJfEcC
	RJBhdQGN7x1amjhI934FNPsFi9nm0PbSqy4kKBQqf6SP4aCcS2iVmS8MtXLkT7OORXy+zNwOaJf
	c/5DPYZHct7RGIFiV+M6b2NBHKLFOwlJbW/NZalYjquuat6xNSmVVjp9uNO9Oj2yGteaN7xr38M
	A6LS6/BH2uSA3r/whLAKLPmEwUOgjmwOQvjDMIiaHPk1Zk+6mfG6FPWsDcWm8YDEc4zS7Ot1atu
	gYdSbDoDKO66w7YY5PHyULpPH+M4HCyOkyN9QWNH/7ucw/L5Bn2vAZueq+fcw0ckt9XUS/xz1ZA
	Lf7hlkM0KK9NC6vfCF1d3qiR0pBlgAwJwG4AMl5numGabPnt6fwK6hjW6ctDoP6wISP1iwDhKed
	aIOPYX/O+20YzUzgKGwirdDg==
X-Received: by 2002:a17:902:d4c7:b0:2c9:e69f:edce with SMTP id d9443c01a7336-2cbb9f03555mr3026185ad.44.1783101946794;
        Fri, 03 Jul 2026 11:05:46 -0700 (PDT)
Received: from localhost ([2804:7f0:3d7:1ef2:9a22:90ef:2ded:a7d3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm27585899c88.12.2026.07.03.11.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 11:05:46 -0700 (PDT)
From: =?UTF-8?q?Amanda=20Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	=?UTF-8?q?Amanda=20Corr=C3=AAa?= <amandacorreades@hotmail.com>
Subject: [PATCH] docs: pt_BR: translate the management-style.rst to Brazilian Portuguese
Date: Fri,  3 Jul 2026 15:05:42 -0300
Message-ID: <20260703180542.46098-1-amandacorreasilvax@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amanda Corrêa <amandacorreades@hotmail.com>

Key changes include:
- Translated management-style.rst into and adapted idiomatic expressions
  and humor to sound natural in Brazilian Portuguese while maintaining
  the original tone.

Signed-off-by: Amanda Corrêa <amandacorreades@hotmail.com>
---
 Documentation/translations/pt_BR/index.rst    |   1 +
 .../pt_BR/process/management-style.rst        | 265 ++++++++++++++++++
 2 files changed, 266 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/management-style.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 7a488f662..e17a62758 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -77,4 +77,5 @@ kernel e sobre como ver seu trabalho integrado.
    Processo do subsistema de rede (netdev) <process/maintainer-netdev>
    Processo do subsistema SoC <process/maintainer-soc>
    Conformidade de DTS para SoC <process/maintainer-soc-clean-dts>
+   Estilo de gerenciamento do kernel Linux <process/management-style>
    Processo do subsistema KVM x86 <process/maintainer-kvm-x86>
diff --git a/Documentation/translations/pt_BR/process/management-style.rst b/Documentation/translations/pt_BR/process/management-style.rst
new file mode 100644
index 000000000..b92f8705c
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/management-style.rst
@@ -0,0 +1,265 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Estilo de gerenciamento do kernel Linux
+=======================================
+
+Este é um documento curto descrevendo o estilo de gerenciamento preferido (ou
+inventado, dependendo de quem você perguntar) para o kernel do Linux. Ele se
+destina a espelhar o documento :ref:`process/coding-style.rst <codingstyle>` em
+algum grau, e foi escrito principalmente para evitar responder [#f1]_ as mesmas
+(ou semelhantes) perguntas repetidamente.
+
+Estilo de gerenciamento é muito pessoal e muito mais difícil de quantificar do
+que simples regras de estilo de codificação, então este documento pode ou não ter
+qualquer coisa a ver com a realidade. Começou como uma brincadeira, mas isso não
+significa que não possa ser verdade. Você terá que decidir por si mesmo.
+
+A propósito, quando falamos sobre "gerente do kernel", trata-se de pessoas líderes
+técnicas, e não das pessoas que fazem gerenciamento tradicional dentro das empresas.
+Se você assina pedidos de compra ou tem alguma ideia sobre o orçamento do seu grupo,
+você quase certamente não é um gerente do kernel. Essas sugestões podem ou não se
+aplicar a você.
+
+Primeiro, eu sugeriria comprar "Os Sete Hábitos das Pessoas Altamente Eficazes"
+e NÃO lê-lo. Queime-o, é um ótimo gesto simbólico.
+
+.. [#f1] Este documento faz isso não respondendo tanto à pergunta, mas torna
+  dolorosamente óbvio para o questionador que não temos ideia de qual é a resposta.
+
+De qualquer maneira, aqui vai:
+
+.. _decisoes:
+
+1) Decisões
+-----------
+
+Todo mundo pensa que os gerentes tomam decisões, e que a tomada de decisões é
+importante. Quanto maior e mais dolorosa a decisão, maior deve ser o gerente para
+tomá-la. Isso é muito profundo e óbvio, mas na verdade não é verdade.
+
+O nome do jogo é **evitar** ter que tomar uma decisão. Em particular, se alguém
+lhe disser "escolha (a) ou (b), realmente precisamos que você decida sobre isso",
+você está em apuros como gerente. As pessoas que você gerencia devem conhecer os
+detalhes melhor do que você, então se elas vierem até você para uma decisão técnica,
+você está ferrado. Você claramente não é competente para tomar essa decisão por elas.
+
+(Consequência: Se as pessoas que você gerencia não conhecem os detalhes melhor
+do que você, você também está ferrado, embora por um motivo totalmente diferente.
+Isso significa que você está no trabalho errado, e que **elas** deveriam estar
+gerenciando sua genialidade em vez disso).
+
+Então o nome do jogo é **evitar** decisões, pelo menos as grandes e dolorosas.
+Tomar decisões pequenas e sem consequências é bom, e faz você parecer que sabe
+o que está fazendo, então o que um gerente do kernel precisa fazer é transformar
+as grandes e dolorosas em pequenas coisas com as quais ninguém realmente se importa.
+
+Ajuda a perceber que a diferença fundamental entre uma grande decisão e uma pequena
+é se você pode consertar sua decisão depois. Qualquer decisão pode ser pequena
+garantindo sempre que, se você estiver errado (e você **vai** estar errado), você
+sempre pode desfazer o dano mais tarde voltando atrás. De repente, você demonstra
+o dobro de capacidade como gerente por tomar **duas** decisões inconsequentes
+- a errada **e** a certa.
+
+E as pessoas verão isso como verdadeira liderança (*cof cof* besteira *cof cof*).
+
+Portanto a chave para evitar grandes decisões torna-se apenas evitar fazer coisas
+que não podem ser desfeitas. Não se deixe encurralar em um canto do qual você não
+possa escapar. Um rato encurralado pode ser perigoso - um gerente encurralado é
+apenas lamentável.
+
+Como ninguém seria estúpido o suficiente para realmente deixar um gerente do kernel
+ter uma enorme responsabilidade fiscal **de qualquer maneira**, é geralmente
+bastante fácil voltar atrás. Como você não vai ser capaz de desperdiçar enormes
+quantidades de dinheiro que você pode não ser capaz de reembolsar, a única coisa que
+você pode voltar atrás é uma decisão técnica, e lá o retrocesso é muito fácil:
+apenas diga a todos que você era um imbecil incompetente, peça desculpas e desfaça
+todo o trabalho inútil em que você fez as pessoas trabalharem no último ano.
+De repente, a decisão que você tomou há um ano não era uma grande decisão afinal,
+já que poderia ser facilmente desfeita.
+
+Acontece que algumas pessoas têm problemas com essa abordagem, por dois motivos:
+
+ - admitir que você foi um idiota é mais difícil do que parece. Todos nós gostamos
+   de manter as aparências, e sair em público para dizer que você estava errado
+   às vezes é muito difícil mesmo.
+ - ter alguém falando que o que você trabalhou no último ano não valeu a pena
+   depois de tudo pode ser difícil para os pobres engenheiros humildes também,
+   e enquanto o **trabalho** real foi fácil de desfazer apenas excluindo-o, você
+   pode ter perdido irrevogavelmente a confiança desse engenheiro. E lembre-se:
+   "irrevogável" era o que tentamos evitar em primeiro lugar, e sua decisão acabou
+   sendo uma grande decisão afinal.
+
+Felizmente, ambas essas razões podem ser mitigadas efetivamente apenas admitindo
+de antemão que você não tem a menor ideia, e dizendo às pessoas antes do fato
+que sua decisão é puramente preliminar, e pode ser a coisa errada. Você deve
+sempre reservar o direito de mudar de ideia, e fazer com que as pessoas estejam
+muito **cientes** disso. E é muito mais fácil admitir que você é estúpido quando
+você ainda não fez a coisa realmente estúpida.
+
+Então, quando realmente se revela estúpido, as pessoas apenas reviram os olhos
+e dizem "Ops, não de novo".
+
+Essa admissão preventiva de incompetência também pode fazer com que as pessoas
+que realmente fazem o trabalho também pensem duas vezes sobre se vale a pena ou
+não. Afinal, se **elas** não têm certeza se é uma boa ideia, você com certeza não
+deve encorajá-las prometendo que o que elas trabalham será incluído. Faça com que
+elas pelo menos pensem duas vezes antes de embarcar em um grande empreendimento.
+
+Lembre-se: eles devem saber mais sobre os detalhes do que você, e geralmente já
+pensam que têm a resposta para tudo. A melhor coisa que você pode fazer como
+gerente é não incutir confiança, mas sim uma dose saudável de pensamento crítico
+sobre o que eles fazem.
+
+A propósito, um outro jeito de evitar uma decisão é simplesmente choramingar "não
+podemos fazer os dois?" e parecer patético. Confie em mim, funciona. Se não estiver
+claro qual abordagem é melhor, eles eventualmente descobrirão. A resposta pode
+acabar sendo que ambas as equipes ficam tão frustradas com a situação que apenas
+desistem.
+
+Isso pode soar como uma falha, mas geralmente é um sinal de que havia algo errado
+com ambos os projetos, e a razão pela qual as pessoas envolvidas não conseguiram
+decidir foi que ambas estavam erradas. Você acaba saindo por cima, e evitou mais
+uma decisão que poderia ter estragado.
+
+2) Pessoas
+----------
+
+A maioria das pessoas é idiota, e ser um gerente significa que você terá que lidar
+com isso, e talvez mais importante, que **elas** terão que lidar com **você**.
+
+Aconteceu que enquanto é fácil desfazer erros técnicos, não é tão fácil desfazer
+distúrbios de personalidade. Você só tem que conviver com os deles - e com os seus.
+
+Entretanto, para se preparar como gerente do kernel, é melhor lembrar de não queimar
+nenhuma ponte, bombardear nenhum vilarejo inocente ou alienar muitos desenvolvedores
+do kernel. Acontece que alienar pessoas é bastante fácil, e reverter esse afastamento
+é difícil. Assim, "alienar" cai imediatamente sob o título de "não reversível",
+e se torna um não-não de acordo com :ref:`decisoes`.
+
+Existem apenas algumas regras simples aqui:
+
+ (1) não chame as pessoas de imbecis (pelo menos não em público)
+ (2) aprenda a pedir desculpas quando você esquecer a regra (1)
+
+O problema com #1 é que é muito fácil de fazer, já que você pode dizer "você é
+um imbecil" de milhões de maneiras diferentes [#f2]_, às vezes sem nem perceber,
+e quase sempre com uma convicção ardente de que você está certo.
+
+E quanto mais convencido você estiver de que está certo (e vamos encarar, você
+pode chamar praticamente qualquer pessoa de imbecil, e muitas vezes você **vai**
+estar certo), mais difícil acaba sendo se desculpar depois.
+
+Para resolver esse problema, você realmente só tem duas opções:
+
+ - fique muito bom em pedir desculpas
+ - espalhe o "amor" de forma tão uniforme que ninguém realmente acabe se sentindo
+   injustamente alvo. Torne-o inventivo o suficiente, e eles podem até se divertir.
+
+A opção de ser infalivelmente educado realmente não existe. Ninguém confiará em
+alguém que está claramente escondendo seu verdadeiro caráter.
+
+.. [#f2] Paul Simon cantou "Fifty Ways to Leave Your Lover", porque francamente,
+  "A Million Ways to Tell a Developer They're a D*ckhead" não soa tão bem. Mas
+  tenho certeza de que ele pensou sobre isso.
+
+
+3) Pessoas II - o tipo bom
+--------------------------
+
+Embora no final das contas a maioria das pessoas seja idiota, a consequência disso
+é tristemente que você também é, e que enquanto todos nós podemos nos deleitar na
+segura convicção de que somos melhores do que a pessoa média (vamos encarar, ninguém
+nunca acredita que é mediano ou abaixo da média), também devemos admitir que não
+somos a faca mais afiada por aí, e haverá outras pessoas que são menos idiotas
+do que você.
+
+Algumas pessoas reagem mal a pessoas inteligentes. Outras se aproveitam delas.
+
+Tenha certeza de que você, como mantenedor do kernel, está no segundo grupo.
+Puxe o saco delas, porque são as pessoas que tornarão seu trabalho mais fácil.
+Em particular, elas serão capazes de tomar suas decisões por você, que é tudo
+sobre o jogo.
+
+Então quando você encontrar alguém mais inteligente do que você, apenas siga o
+fluxo. Suas responsabilidades de gerenciamento tornam-se em grande parte dizer
+"Parece uma boa ideia - pode ir fundo", ou "Isso parece bom, mas e quanto a xxx?".
+A segunda versão, em particular, é uma ótima maneira de aprender algo novo sobre
+"xxx" ou parecer **extra** gerencial ao apontar algo que a pessoa mais inteligente
+não havia pensado. Em qualquer caso, você vence.
+
+Uma coisa a se observar é perceber que a grandeza em uma área não se traduz
+necessariamente em outras áreas. Então você pode instigar as pessoas em direções
+específicas, mas vamos encarar, elas podem ser boas no que fazem e péssimas em
+tudo o mais. A boa notícia é que as pessoas tendem a naturalmente voltar para o
+que são boas, então não é como se você estivesse fazendo algo irreversível quando
+você **as** instiga em alguma direção, apenas não pressione demais.
+
+4) Colocando a culpa
+--------------------
+
+As coisas vão dar errado, e as pessoas querem alguém para culpar. Pronto, a culpa
+é sua.
+
+Não é realmente tão difícil aceitar a culpa, especialmente se as pessoas perceberem
+que não foi **toda** a sua culpa. O que nos leva à melhor maneira de assumir a
+culpa: faça isso por outra pessoa. Você se sentirá bem por assumir a culpa, eles
+se sentirão bem por não serem culpados, e a pessoa que perdeu toda a coleção de
+pornografia de 36 GB por causa da sua incompetência vai admitir relutantemente que
+pelo menos você não tentou se esquivar disso.
+
+Então faça o desenvolvedor que realmente estragou (se você conseguir encontrá-lo)
+saber **em particular** que ele estragou. Não apenas para que ele possa evitar isso
+no futuro, mas para que ele saiba que lhe deve uma. E, talvez ainda mais importante,
+ele provavelmente é a pessoa que pode consertar. Porque, vamos encarar, com certeza
+não é você.
+
+Levar a culpa também é o motivo pelo qual você se torna gerente em primeiro lugar.
+É parte do que faz as pessoas confiarem em você, e permite a você a glória potencial,
+porque você é quem pode dizer "Eu estraguei". E se você seguiu as regras anteriores,
+você será muito bom em dizer isso agora.
+
+5) Coisas para evitar
+---------------------
+
+Tem uma coisa que as pessoas odeiam ainda mais do que ser chamado de "idiota", e
+isso é ser chamado de "idiota" com uma voz moralista. O primeiro você pode se
+desculpar, o segundo você realmente não terá a chance. Eles provavelmente não
+estarão mais ouvindo, mesmo que você faça um bom trabalho de outra forma.
+
+Todos nós pensamos que somos melhores do que qualquer outra pessoa, o que significa
+que quando alguém posa de superior, isso realmente nos irrita. Você pode ser moral
+e intelectualmente superior a todos ao seu redor, mas não tente tornar isso muito
+óbvio, a menos que você realmente **pretenda** irritar alguém [#f3]_.
+
+Semelhantemente, não seja muito educado ou sutil sobre as coisas. A educação
+facilmente acaba indo longe demais e escondendo o problema, e como dizem, "Na
+internet, ninguém pode ouvir você sendo sutil". Use um grande objeto contundente
+para martelar o ponto, porque você realmente não pode depender das pessoas
+entenderem o seu ponto de outra forma.
+
+Um pouco de humor pode ajudar a amortecer tanto a franqueza quanto a moralização.
+Ir além do limite a ponto de ser ridículo pode transmitir um ponto sem tornar
+doloroso para o destinatário, que apenas pensa que você está sendo bobo. Isso pode
+ajudar a superar o bloqueio mental pessoal que todos nós temos sobre críticas.
+
+.. [#f3] Dica: grupos de discussão na internet que não estão diretamente relacionados
+  ao seu trabalho são ótimas maneiras de descarregar suas frustrações nos outros.
+  Escreva posts insultuosos com sarcasmo apenas para entrar em uma boa discussão
+  de vez em quando, e você se sentirá aliviado. Só não faça sujeira muito perto
+  de casa (ou seja, não crie problemas onde isso possa afetar sua vida pessoal).
+
+6) Por que eu?
+--------------
+
+Já que a sua maior responsabilidade parece ser assumir a culpa pelos erros de outras
+pessoas, e tornar dolorosamente óbvio para todos os outros que você é incompetente,
+a pergunta óbvia se torna: por que fazer isso em primeiro lugar?
+
+Primeiramente, embora você possa ou não receber adolescentes gritando (meninas ou
+meninos, não vamos ser preconceituosos ou sexistas aqui) batendo na porta do seu
+camarim, você **vai** receber uma imensa sensação de realização pessoal por estar
+"no comando". Não importa o fato de que você realmente está liderando tentando
+acompanhar todos os outros e correndo atrás deles o mais rápido que puder. Todos
+ainda vão pensar que você é a pessoa no comando.
+
+É um ótimo trabalho se você conseguir aguentar.
-- 
2.43.0

