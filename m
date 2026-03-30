Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A25928DC4
	for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 18:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774893750; cv=none; b=YKN/PfeXCNRERZTcwklshO/R4NYTLxKfCOEYDUkiYXx4yJq6MjHzovRKdXnKepXmovNUhPD0+o6vHbvI3opUn/3lGEUdFC68G2BAv0sLmnViXyeUzYZdq0/kc6j1mDgeJzR9oZafwyHus3jlVGlDHR7xpSIVXjpICxAg1I1ZT0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774893750; c=relaxed/simple;
	bh=luTHiQ2Vsko6ZJyRsI+/KJe4tTj0CznByVv/m5czjv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NtyfeiXCOTt/vtgp2/u5IO8FAFu5vKLhd6+kpJsizwkGRMXmufRGd0xnNoJ34TB3FsD4fQ4Y2PGGNccDhWd5rYlg6oWbyGPboB9E3WeM4dBrgX2hUeUjI7w/NayLHw2RP4uaq6xL+UuvQH+TKqzYgwX/LkvmBlLUu8piRoZvNZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyB2UEig; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyB2UEig"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56ce5c899fcso1412983e0c.3
        for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 11:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774893747; x=1775498547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sIhyli2iWYYQ7ANaqTzu6SWuHmuK/XIccdNxBeYGUZE=;
        b=eyB2UEig1G3QzDOU6xga6FTDv7mTU6pxdGAJjBK9ohZdAGX981zQ+iBd/k4erIOjyM
         WD3OvAk8Gw/W61RoKbtwEFLJv9AFcvqCkpV94NWO82Whkl0D0ARNSiqQuIf+JHSOSSCj
         rKV628UU6fUVm0czkmMuNtf3kCZ3mzEUrjgsCCGU5wyub201pDv5Xzk3KhxblSYz356A
         fTdOwrFfPki/YLqK3UOvZKx7jvy0RrTlLu0e6X5NiMkyhbXYnDDDvNxazMgksCMvrpbx
         f1EzjzpriYSCrLt9pryZGHjYuxwYx5faZp3Y2V5MrLCdLJuK/S309NXcK3gXp0zEPdVU
         nwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774893747; x=1775498547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIhyli2iWYYQ7ANaqTzu6SWuHmuK/XIccdNxBeYGUZE=;
        b=Fhr3f9mYBH/SCIRBbKd8IhRezoqyEWCfWQqV+ukGKVYgWXKoO0YSeIDdR2R2LCc4Yq
         HDo7vXGxOLr1hvBRQtkRJKsNR7hjJM+uvaHdluBlB1dsmzQ+xXVxuM+61h1iSOWyORXa
         6EwjKTQAyPOIXLqfR836+kje1i76HAo0t1cwVBLdE1SJUfJhLy3aJgDIT1i+CbuUrfXA
         EYSxZ0lUHgz78pyV51zhz3DUVbN9+9fbGH686xILXkx/pGiU83MwgUd81n3HDelBF56R
         64A7tYqkpyL2TvGnRV0yNVqjlfgmNC2AfcyfMzQZYk3iTCPB4e5mCymU1h5hBakrNlcn
         lOCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtkpyidQi/3CvsuLZXTR5kV3t9XT4DniOsDIAcoh7D5raA00QkDA8lQMXTRvxJwpjEDfRQRJCV9Fc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX6ax0eZi/tdrBkr6DEC0CAZoyBIOO4Xu7bG8ul2VM4bkNxxPH
	WVUzJ9aW+LyV7YwVD3DykFpMFFicCO9IV44Lr+PKLbK6BMG7sRvStmFy
X-Gm-Gg: ATEYQzy2VYfHJ3CS7F39TTeajcI/RzQImRRLfdAfnVZEUonmcsiLfTyX5UM/ZNAS5lm
	ziZLiubEIUK5f6SHWXvLPkUCTjK/LO45+LeXI2bWsBqAETEj9MMaecxkzBmNTnD4fTjYLMD1yum
	trsUPJxZ892ySohDmYqPvCdtNi4GWuYl5pD1a408TcMOA/bnWwsnkSzkQgaX/HoTfoAvGg9A0MW
	pCawdCzYsJLU6gw8MLv9FbCydquQQS0SGeeRddZkqC+wcWQ7StOpIU5qWCQZa1MmRgGoiiae2o7
	dvJDUgw6W1xji1lrmwMVu09jjEfHYrdyl1L6PksLFDZuhWxYJKqAuEtXjM9xDoCQWqtzhHeyi/R
	B4q78P4UC5TwpByNksw4EXV2YVyFFue79cIqwFgxYWIRVHlgxBx7oj77ii+t7VnFaRhNyzb2j89
	z+AMCbW5Ut/6MiQABk7EKnlxbt5OvspX9ZNfnsiWMarg==
X-Received: by 2002:a05:6123:2e5:b0:56b:5e7e:d3fa with SMTP id 71dfb90a1353d-56d4a51a042mr5062738e0c.7.1774893733973;
        Mon, 30 Mar 2026 11:02:13 -0700 (PDT)
Received: from arch ([177.55.229.79])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9539e2a0891sm7694656241.4.2026.03.30.11.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:02:12 -0700 (PDT)
From: Daniel Castro <arantescastro@gmail.com>
To: danielmaraboo@gmail.com
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Daniel Castro <arantescastro@gmail.com>
Subject: [PATCH v2] docs: pt_BR: translate process/2.Process.rst
Date: Mon, 30 Mar 2026 15:02:07 -0300
Message-ID: <20260330180207.30224-1-arantescastro@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Brazilian Portuguese translation of the development process
document (Documentation/process/2.Process.rst), covering the
development cycle overview, patch lifecycle, subsystem trees,
staging trees, tools, mailing lists, and getting started with
kernel development.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Daniel Castro <arantescastro@gmail.com>
---
v2: Fix stray line breaks throughout the file.

 Documentation/translations/pt_BR/index.rst    |   1 +
 .../translations/pt_BR/process/2.Process.rst  | 502 ++++++++++++++++++
 2 files changed, 503 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/2.Process.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 4f7fcc3c66fb..edf19ddf8916 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -69,4 +69,5 @@ kernel e sobre como ver seu trabalho integrado.
    Introdução <process/1.Intro>
    Como começar <process/howto>
    Requisitos mínimos <process/changes>
+   Como o processo de desenvolvimento funciona <process/2.Process>
    Manuais dos mantenedores <process/maintainer-handbooks>
diff --git a/Documentation/translations/pt_BR/process/2.Process.rst b/Documentation/translations/pt_BR/process/2.Process.rst
new file mode 100644
index 000000000000..a3ab18c0f8d6
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/2.Process.rst
@@ -0,0 +1,502 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Como o processo de desenvolvimento funciona
+===========================================
+
+O desenvolvimento do kernel Linux no início da década de 1990 era bastante
+informal, com um número relativamente pequeno de usuários e desenvolvedores
+envolvidos. Com uma base de usuários na casa dos milhões e cerca de 2.000
+desenvolvedores envolvidos ao longo de um ano, o kernel teve que desenvolver uma
+série de processos para manter o desenvolvimento fluindo sem problemas. Um
+sólido conhecimento de como o processo funciona é necessário para participar
+efetivamente dele.
+
+Visão geral
+-----------
+
+O kernel Linux utiliza um modelo de desenvolvimento contínuo ("rolling release")
+baseado em prazos flexíveis.  Uma nova versão principal do kernel (que
+chamaremos, por exemplo, de 9.x) [1]_ ocorre a cada dois ou três meses, trazendo
+novos recursos, alterações internas na API e muito mais. Uma versão típica pode
+conter cerca de 13.000 conjuntos de alterações, com mudanças em várias centenas
+de milhares de linhas de código.  Versões recentes, juntamente com suas datas,
+podem ser encontradas na `Wikipedia
+<https://en.wikipedia.org/wiki/Linux_kernel_version_history>`_.
+
+.. [1] Rigorosamente falando, o kernel Linux não utiliza o esquema de
+       versionamento semântico. Em vez disso, o par 9.x identifica a
+       versão principal como um número inteiro. Para cada versão, x é
+       incrementado, mas 9 é incrementado apenas se x for considerado
+       grande o suficiente (por exemplo, o Linux 5.0 é lançado após o
+       Linux 4.20).
+
+Segue-se um procedimento relativamente simples quanto à integração de patches
+para cada lançamento. No início de cada ciclo de desenvolvimento, a janela de
+fusão ("merge window") é considerada aberta. Nesse momento, o código que é
+considerado suficientemente estável (e que é aceito pela comunidade de
+desenvolvimento) é integrado ao kernel principal. A maior parte das alterações
+para um novo ciclo de desenvolvimento (e todas as principais alterações) será
+integrada durante esse período, a uma taxa próxima de 1.000 alterações
+("patches" ou "conjuntos de alterações") por dia.
+
+(Vale observar que as alterações integradas durante a janela de merge não surgem
+do nada; elas foram coletadas, testadas e preparadas com antecedência.  O
+funcionamento desse processo será descrito em detalhes mais adiante).
+
+A janela de merge dura aproximadamente duas semanas. Ao final desse período,
+Linus Torvalds declarará que a janela está fechada e lançará o primeiro dos
+kernels "rc". Para o kernel que está destinado a ser o 9.x, por exemplo, o
+lançamento que ocorre ao final da janela de merge será chamado de 9.x-rc1. O
+lançamento -rc1 é o sinal de que o tempo para incorporar novos recursos passou e
+que o tempo para estabilizar o próximo kernel começou.
+
+Nas próximas seis a dez semanas, somente patches que corrijam problemas devem
+ser enviados para a versão principal ("mainline"). Ocasionalmente, uma mudança
+mais significativa será permitida, mas tais ocasiões são raras; desenvolvedores
+que tentam integrar novos recursos fora da janela de merge tendem a receber uma
+recepção pouco calorosa.  Como regra geral, se você perder a janela de merge
+para um determinado recurso, o melhor a fazer é esperar pelo próximo ciclo de
+desenvolvimento. (Uma exceção ocasional é feita para drivers para hardware
+anteriormente não suportado; se eles não alterarem nenhum código já presente na
+árvore ("in-tree"), não podem causar regressões e podem ser adicionados com
+segurança a qualquer momento).
+
+À medida que as correções são incorporadas à mainline, o ritmo de envio de
+patches diminui gradualmente. Linus lança novos kernels -rc aproximadamente uma
+vez por semana; uma série normal costuma chegar entre o -rc6 e o -rc9 antes que
+o kernel seja considerado suficientemente estável para o lançamento da versão
+final. Nesse ponto, todo o processo se reinicia.
+
+Como exemplo, veja como foi o ciclo de desenvolvimento da versão 5.4 (todas as
+datas em 2019):
+
+	==============  ===================================================
+	15 de setembro	Lançamento da versão estável 5.3
+	30 de setembro	5.4-rc1, janela de merge fechada
+	6 de outubro	5.4-rc2
+	13 de outubro	5.4-rc3
+	20 de outubro	5.4-rc4
+	27 de outubro	5.4-rc5
+	3 de novembro	5.4-rc6
+	10 de novembro	5.4-rc7
+	17 de novembro	5.4-rc8
+	24 de novembro	5.4 lançamento da versão estável ("stable release")
+	==============  ===================================================
+
+Como os desenvolvedores decidem quando encerrar o ciclo de desenvolvimento e
+criar a versão estável? A métrica mais importante utilizada é a lista de
+regressões em relação às versões anteriores. Nenhum bug é bem-vindo, mas aqueles
+que quebram sistemas que funcionavam no passado são considerados especialmente
+graves. Por esse motivo, patches que causam regressões são vistos com maus olhos
+e têm grande probabilidade de serem revertidas durante o período de
+estabilização.
+
+O objetivo dos desenvolvedores é corrigir todas as regressões conhecidas antes
+do lançamento da versão estável.  Na prática, esse nível de perfeição é difícil
+de alcançar; há muitas variáveis em um projeto desse porte.  Chega um ponto em
+que adiar o lançamento final só piora o problema; a pilha de alterações
+aguardando a próxima janela de merge aumentará, criando ainda mais regressões na
+próxima vez. Portanto, a maioria dos kernels é lançada com algumas regressões
+conhecidas, embora, idealmente, nenhuma delas seja grave.
+
+Assim que uma versão estável é lançada, sua manutenção contínua é transferida
+para a equipe estável ("stable team"), atualmente composta por Greg
+Kroah-Hartman e Sasha Levin. A equipe estável lançará atualizações ocasionais
+para a versão estável usando o esquema de numeração 9.x.y.
+
+Para ser considerado para uma versão de atualização ("update release"), um patch
+deve (1) corrigir um bug significativo e (2) já ter sido incorporado à mainline
+do próximo kernel de desenvolvimento. Os kernels normalmente recebem
+atualizações estáveis por um pouco mais de um ciclo de desenvolvimento após o
+lançamento inicial. Assim, por exemplo, o histórico do kernel 5.2 era o seguinte
+(todas as datas em 2019):
+
+	==============  ===============================
+	7 de julho		5.2 versão estável
+	14 de julho		5.2.1
+	21 de julho		5.2.2
+	26 de julho		5.2.3
+	28 de julho		5.2.4
+	31 de julho		5.2.5
+	...			...
+	11 de outubro	5.2.21
+	==============  ===============================
+
+A versão 5.2.21 foi a última atualização estável da série 5.2.
+
+Alguns kernels são designados como kernels de "longo prazo"; eles receberão
+suporte por um período mais longo. Consulte o seguinte link para obter a lista
+de versões de kernel de longo prazo ativas e seus respectivos mantenedores:
+
+	https://www.kernel.org/category/releases.html
+
+A seleção de um kernel para suporte a longo prazo ("long-term support") é
+puramente uma questão de um mantenedor ter a necessidade e o tempo para manter
+essa versão.  Não há planos conhecidos para suporte a longo prazo para qualquer
+versão futura específica.
+
+O ciclo de vida de um patch
+---------------------------
+
+Os patches não vão diretamente do teclado do desenvolvedor para o kernel
+principal ("mainline").  Em vez disso, existe um processo razoavelmente complexo
+(embora relativamente informal) projetado para garantir que cada patch seja
+revisado quanto à qualidade e que cada patch implemente uma alteração desejável
+no kernel mainline.
+
+Esse processo pode ser rápido para correções menores ou, no caso de mudanças
+grandes e controversas, levar anos. Grande parte da frustração dos
+desenvolvedores vem da falta de compreensão desse processo ou de tentativas de
+contorná-lo.
+
+Na esperança de reduzir essa frustração, este documento descreverá como um patch
+é inserido no kernel. O que se segue é uma introdução que descreve o processo de
+forma um tanto idealizada. Uma abordagem muito mais detalhada será apresentada
+em seções posteriores.
+
+As etapas pelas quais um patch passa são, geralmente:
+
+ - Projeto ("Design"). É aqui que os requisitos reais para o patch - e a
+   maneira como esses requisitos serão atendidos - são definidos. O trabalho
+   de projeto geralmente é feito sem envolver a comunidade, mas é melhor
+   fazer esse trabalho de forma aberta, se possível; isso pode economizar
+   muito tempo com reformulações posteriores.
+
+ - Revisão inicial ("Early review"). Os patches são enviados para a lista
+   de discussão relevante, e os desenvolvedores dessa lista respondem com
+   quaisquer comentários que possam ter. Esse processo deve revelar quaisquer
+   problemas importantes com um patch, se tudo correr bem.
+
+ - Revisão mais ampla ("Wider review"). Quando o patch estiver quase pronto
+   para inclusão na mainline, ele deve ser aceito por um mantenedor de
+   subsistema relevante - embora essa aceitação não seja uma garantia de que
+   o patch chegará à mainline. O patch aparecerá na árvore do subsistema do
+   mantenedor e nas árvores -next (descritas abaixo). Quando o processo
+   funciona, esta etapa leva a uma revisão mais extensa do patch e à
+   descoberta de quaisquer problemas resultantes da integração deste patch
+   com o trabalho que está sendo feito por outros.
+
+-  Observe que a maioria dos mantenedores também tem empregos regulares,
+   portanto, o merge do seu patch pode não ser a prioridade máxima deles.
+   Se o seu patch estiver recebendo feedback sobre mudanças necessárias,
+   você deve implementá-las ou justificar por que não devem ser feitas.
+   Se o seu patch não tiver reclamações de revisão, mas não estiver sendo
+   integrado pelo mantenedor do subsistema ou driver apropriado, você deve
+   persistir na atualização do patch para o kernel atual para que ele se
+   aplique corretamente e continuar enviando-o para revisão e merge.
+
+ - Integração na mainline. Por fim, um patch bem-sucedido será incorporado
+   ao repositório mainline gerenciado por Linus Torvalds. Novos comentários
+   ou problemas podem surgir nesta etapa; é fundamental que o desenvolvedor
+   responda prontamente a eles e solucione quaisquer falhas que surjam.
+
+ - Versão estável. A base de usuários afetada pelo patch agora é ampla;
+   consequentemente, novas falhas podem ser detectadas.
+
+ - Manutenção a longo prazo ("long-term maintenance"). Embora seja plenamente
+   possível que um desenvolvedor se esqueça de seu código após a integração,
+   tal comportamento tende a causar uma má impressão na comunidade. A
+   incorporação do código alivia parte do fardo da manutenção, uma vez que
+   outros desenvolvedores corrigirão possíveis falhas decorrentes de mudanças
+   na API. Contudo, o autor original deve manter a responsabilidade sobre o
+   código, caso deseje que ele permaneça útil a longo prazo.
+
+Um dos maiores erros cometidos pelos desenvolvedores do kernel (ou seus
+empregadores) é tentar reduzir o processo a uma única etapa de "integração à
+mainline".  Essa abordagem invariavelmente leva à frustração de todos os
+envolvidos.
+
+Como os patches chegam ao Kernel
+--------------------------------
+
+Existe apenas uma pessoa que pode incorporar patches ao repositório mainline do
+kernel: Linus Torvalds. No entanto, dos mais de 9.500 patches integrados ao
+kernel 2.6.38, por exemplo, apenas 112 (cerca de 1,3%) foram selecionados
+diretamente por ele. O projeto do kernel há muito superou a escala em que um
+único desenvolvedor seria capaz de inspecionar e filtrar todas as contribuições
+sem auxílio. A solução adotada pela comunidade para gerenciar esse crescimento
+foi a implementação de uma hierarquia de mantenedores fundamentada em uma cadeia
+de confiança.
+
+A base de código do kernel é subdividida logicamente em subsistemas: rede,
+suporte a arquiteturas específicas, gerenciamento de memória, dispositivos de
+vídeo, entre outros. A maioria possui um mantenedor designado — um desenvolvedor
+com responsabilidade integral pelo código daquela área. Esses mantenedores
+atuam, em linhas gerais, como os guardiões de seus respectivos domínios, sendo
+os responsáveis por validar e aceitar patches para inclusão no kernel mainline.
+
+Cada mantenedor de subsistema gerencia sua própria versão da árvore de códigos
+do kernel, geralmente (mas nem sempre) utilizando a ferramenta de controle de
+versão git. Ferramentas como o git (e correlatas, como quilt ou mercurial)
+permitem que os mantenedores rastreiem uma lista de patches, incluindo
+informações de autoria e outros metadados. A qualquer momento, o mantenedor
+consegue identificar quais patches em seu repositório não constam na mainline.
+
+Quando a janela de merge é aberta, os mantenedores de alto nível solicitam que
+Linus realize o "pull" dos patches selecionados em seus respectivos repositórios
+para integração. Caso Linus concorde, o fluxo de patches sobe para o seu
+repositório, tornando-se parte do kernel mainline. O nível de atenção que Linus
+dedica a patches específicos recebidos em uma operação de pull varia; é evidente
+que, por vezes, ele os analisa minuciosamente. No entanto, como regra geral,
+Linus confia que os mantenedores de subsistemas não enviarão patches
+problemáticos para o topo da cadeia ("upstream").
+
+Os mantenedores de subsistemas, por sua vez, podem realizar o pull de patches de
+outros mantenedores. Por exemplo, a árvore de rede é construída a partir de
+patches que se acumularam primeiramente em árvores dedicadas a drivers de
+dispositivos de rede, redes sem fio, entre outras. Essa sequência de
+repositórios pode ser arbitrariamente longa, embora raramente exceda dois ou
+três elos. Cada mantenedor na cadeia confia naqueles que gerenciam as árvores de
+nível inferior; esse processo é conhecido como "cadeia de confiança".
+
+Claramente, em um sistema como este, a inclusão de patches no kernel depende de
+encontrar o mantenedor correto. Enviar patches diretamente para Linus não
+costuma ser o procedimento adequado.
+
+Árvores next ("Next trees")
+---------------------------
+
+A cadeia de árvores de subsistemas orienta o fluxo de patches para o kernel, mas
+também levanta uma questão interessante: e se alguém quiser analisar todos os
+patches que estão sendo preparados para a próxima janela de merge?
+Desenvolvedores estarão interessados em quais outras mudanças estão pendentes
+para verificar se há conflitos preocupantes; um patch que altere o protótipo de
+uma função essencial do kernel, por exemplo, entrará em conflito com quaisquer
+outros patches que utilizem a forma antiga dessa função. Revisores e testadores
+desejam acessar as mudanças em sua forma integrada antes que todas elas cheguem
+ao kernel mainline. Seria possível realizar o pull de alterações de todas as
+árvores de subsistemas relevantes, mas isso seria uma tarefa onerosa e propensa
+a erros.
+
+A resposta vem na forma das árvores -next, onde as árvores de subsistemas são
+reunidas para testes e revisão. A mais antiga dessas árvores, mantida por Andrew
+Morton, é chamada de "-mm" (sigla para "memory management", ou gerenciamento de
+memória, que deu origem ao nome). A árvore -mm integra patches de uma extensa
+lista de árvores de subsistemas e também contém alguns patches voltados para
+auxiliar na depuração ("debugging").
+
+Além disso, a -mm contém uma coleção significativa de patches selecionados
+diretamente por Andrew. Esses patches podem ter sido publicados em uma lista de
+discussão ("mailing list") ou podem se aplicar a uma parte do kernel para a qual
+não exista uma árvore de subsistema designada. Como resultado, a -mm opera como
+uma espécie de árvore de subsistema de última instância; se não houver outro
+caminho óbvio para um patch chegar à mainline, é provável que ele termine na
+-mm. Patches diversos que se acumulam na -mm serão, eventualmente, encaminhados
+para uma árvore de subsistema apropriada ou enviados diretamente para Linus. Em
+um ciclo de desenvolvimento típico, aproximadamente 5% a 10% dos patches que
+entram na mainline chegam lá via -mm.
+
+O patch -mm atual está disponível no diretório "mmotm" (-mm of the moment) em:
+
+	https://www.ozlabs.org/~akpm/mmotm/
+
+O uso da árvore MMOTM, entretanto, tende a ser uma experiência frustrante; há
+uma chance real de que o código sequer compile.
+
+A árvore principal para a integração de patches do próximo ciclo é a linux-next,
+mantida por Mark Brown. A linux-next é, por concepção, uma captura ("snapshot")
+do que se espera que a mainline venha a ser após o fechamento da próxima janela
+de merge. As árvores linux-next são anunciadas nas listas de discussão
+linux-kernel e linux-next assim que são consolidadas; elas podem ser baixadas
+em:
+
+	https://www.kernel.org/pub/linux/kernel/next/
+
+A linux-next tornou-se parte integrante do processo de desenvolvimento do
+kernel; idealmente, todos os patches incorporados durante uma determinada janela
+de merge devem ter sido integrados à linux-next algum tempo antes da abertura
+dessa janela.
+
+Árvores de Staging ("Staging trees")
+------------------------------------
+
+A árvore de código-fonte do kernel contém o diretório drivers/staging/, que
+abriga diversos subdiretórios de drivers ou sistemas de arquivos em processo de
+inclusão na árvore do kernel. Eles permanecem em drivers/staging/ enquanto
+demandam aprimoramentos; uma vez concluídos, podem ser movidos para o kernel
+propriamente dito. Esta é uma forma de rastrear drivers que ainda não atingiram
+os padrões de codificação ou qualidade do kernel Linux, mas que a comunidade
+pode desejar utilizar e acompanhar o desenvolvimento.
+
+Atualmente, Greg Kroah-Hartman mantém a árvore de staging. Drivers que ainda
+necessitam de ajustes são enviados a ele, cada um ocupando seu próprio
+subdiretório em drivers/staging/. Juntamente com os arquivos-fonte do driver,
+deve constar um arquivo TODO no diretório. O arquivo TODO lista as tarefas
+pendentes para a aceitação no kernel propriamente dito, além de uma lista de
+pessoas que devem ser copiadas ("Cc'd") em quaisquer patches relacionados ao
+driver. As regras atuais exigem que os drivers submetidos ao staging devam, no
+mínimo, compilar corretamente.
+
+O staging pode ser um caminho relativamente simples para inserir novos drivers
+na mainline onde, com sorte, atrairão a atenção de outros desenvolvedores e
+evoluirão rapidamente. Entretanto, a entrada no staging não encerra o processo;
+códigos que não apresentem progresso regular acabarão removidos. Além disso, os
+distribuidores tendem a ser relutantes em habilitar drivers de staging.
+Portanto, o staging é, na melhor das hipóteses, uma etapa temporária no percurso
+para se tornar um driver adequado para a mainline.
+
+Ferramentas
+-----------
+
+Conforme observado no texto anterior, o processo de desenvolvimento do kernel
+depende fortemente da capacidade de orquestrar coleções de patches em diversas
+direções. O sistema como um todo não funcionaria com a eficiência atual sem o
+auxílio de ferramentas adequadamente robustas. Tutoriais sobre o uso dessas
+ferramentas estão além do escopo deste documento, mas cabe aqui apresentar
+algumas orientações básicas.
+
+O sistema de gerenciamento de código-fonte predominante na comunidade do kernel
+é, de longe, o git. O git é um dos diversos sistemas de controle de versão
+distribuídos desenvolvidos pela comunidade de software livre. Ele é altamente
+otimizado para o desenvolvimento do kernel, apresentando excelente desempenho ao
+lidar com grandes repositórios e volumes massivos de patches.  Também possui a
+reputação de ser complexo para aprender e operar, embora tenha evoluído
+significativamente com o tempo. Algum nível de domínio da ferramenta é
+praticamente um requisito para desenvolvedores de kernel; mesmo que não a
+utilizem em seu próprio fluxo de trabalho, precisarão do git para acompanhar as
+atividades de outros desenvolvedores (e da mainline).
+
+O git já está disponível nos repositórios de quase todas as distribuições Linux.
+A página oficial do projeto encontra-se em:
+
+	https://git-scm.com/
+
+Essa página contém links para documentações e tutoriais.
+
+Entre os desenvolvedores de kernel que não utilizam o git, a escolha mais
+popular é, quase certamente, o Mercurial:
+
+	https://www.selenic.com/mercurial/
+
+O Mercurial compartilha muitos recursos com o git, mas oferece uma interface que
+muitos consideram mais fácil de usar.
+
+A outra ferramenta que vale a pena conhecer é o Quilt:
+
+	https://savannah.nongnu.org/projects/quilt/
+
+O quilt é um sistema de gerenciamento de patches, em vez de um sistema de
+gerenciamento de código-fonte. Ele não rastreia o histórico ao longo do tempo;
+em vez disso, é orientado ao rastreamento de um conjunto específico de
+alterações em relação a uma base de código em evolução. Alguns mantenedores de
+subsistemas importantes usam o quilt para gerenciar patches destinados ao
+upstream. Para o gerenciamento de certos tipos de árvores (como a -mm, por
+exemplo), o quilt é a melhor ferramenta para o trabalho.
+
+Listas de discussão ("Mailing lists")
+-------------------------------------
+
+Grande parte do trabalho de desenvolvimento do kernel Linux é realizada por meio
+de listas de discussão ("mailing lists"). É difícil participar plenamente da
+comunidade sem ingressar em, pelo menos, uma lista em algum lugar. No entanto,
+as listas de discussão do Linux também representam um risco potencial para os
+desenvolvedores, que podem acabar soterrados por uma carga de mensagens
+eletrônicas, infringir as convenções utilizadas nas listas do Linux, ou ambos.
+
+A maioria das listas de discussão do kernel está hospedada em kernel.org; a
+lista principal pode ser encontrada em:
+
+	https://subspace.kernel.org
+
+Existem listas hospedadas em outros locais; por favor, verifique o arquivo
+MAINTAINERS para encontrar a lista relevante de qualquer subsistema específico.
+
+A principal lista de discussão para o desenvolvimento do kernel é, naturalmente,
+a linux-kernel. Esta lista é um lugar intimidador; o volume pode chegar a 500
+mensagens por dia, o nível de ruído é alto, as conversas podem ser extremamente
+técnicas e os participantes nem sempre estão preocupados em demonstrar um alto
+grau de polidez. No entanto, não há outro lugar onde a comunidade de
+desenvolvimento do kernel se reúna como um todo; desenvolvedores que evitam esta
+lista perderão informações importantes.
+
+Existem algumas dicas que podem ajudar na sobrevivência à linux-kernel:
+
+ -  Direcione as mensagens da lista para uma pasta separada, em vez de
+    sua caixa de entrada principal. É preciso ser capaz de ignorar o fluxo
+    de mensagens por períodos prolongados.
+
+ - Não tente acompanhar todas as conversas — ninguém consegue. É importante
+   filtrar tanto pelo tópico de interesse (embora conversas longas possam se
+   desviar do assunto original sem alterar o campo de assunto do e-mail)
+   quanto pelas pessoas que estão participando.
+
+ - Não alimente os trolls. Se alguém estiver tentando provocar uma reação
+   irritada, ignore-o.
+
+ - Ao responder a um e-mail da linux-kernel (ou de outras listas), preserve
+   o cabeçalho Cc: para todos os envolvidos. Na ausência de um motivo forte
+   (como uma solicitação explícita), você nunca deve remover destinatários.
+   Certifique-se sempre de que a pessoa a quem você está respondendo esteja
+   na lista de Cc:. Essa convenção também torna desnecessário pedir
+   explicitamente para ser copiado nas respostas às suas postagens.
+
+ - Pesquise nos arquivos da lista (e na rede como um todo) antes de fazer
+   perguntas. Alguns desenvolvedores podem ficar impacientes com pessoas
+   que claramente não fizeram o "dever de casa".
+
+ - Use respostas intercaladas ("inline"), o que torna sua resposta mais
+   fácil de ler. (Ou seja, evite o "top-posting" — a prática de colocar
+   sua resposta acima do texto citado ao qual você está respondendo).
+   Para mais detalhes, veja:
+   :ref:`Documentation/process/submitting-patches.rst <interleaved_replies>`.
+
+ - Pergunte na lista de discussão correta. A linux-kernel pode ser o ponto
+   de encontro geral, mas não é o melhor lugar para encontrar desenvolvedores
+   de todos os subsistemas.
+
+O último ponto — encontrar a lista de discussão correta — é onde desenvolvedores
+iniciantes costumam errar. Alguém que faça uma pergunta relacionada a redes na
+linux-kernel quase certamente receberá uma sugestão educada para perguntar na
+lista netdev, pois essa é a lista frequentada pela maioria dos desenvolvedores
+de rede. Existem outras listas para os subsistemas SCSI, video4linux, IDE,
+sistemas de arquivos ("filesystems"), etc. O melhor lugar para procurar por
+listas de discussão é no arquivo MAINTAINERS que acompanha o código-fonte do
+kernel.
+
+Iniciando no desenvolvimento do Kernel
+--------------------------------------
+
+Dúvidas sobre como iniciar no processo de desenvolvimento do kernel são comuns —
+tanto por parte de indivíduos quanto de empresas. Igualmente comuns são os
+tropeços que tornam o início desse relacionamento mais difícil do que precisa
+ser.
+
+As empresas costumam buscar a contratação de desenvolvedores conhecidos para dar
+o pontapé inicial em um grupo de desenvolvimento. Esta pode ser, de fato, uma
+técnica eficaz. No entanto, ela também tende a ser cara e não contribui muito
+para expandir o grupo de desenvolvedores experientes de kernel. É possível
+capacitar desenvolvedores internos no desenvolvimento do kernel Linux, desde que
+se invista um pouco de tempo. Dedicar esse tempo pode dotar um empregador de um
+grupo de desenvolvedores que compreendem tanto o kernel quanto a empresa, e que
+também podem ajudar a treinar outros. A médio prazo, esta é frequentemente a
+abordagem mais proveitosa.
+
+Desenvolvedores individuais muitas vezes sentem-se, compreensivelmente, perdidos
+sobre por onde começar. Iniciar com um projeto grande pode ser intimidador;
+geralmente deseja-se "testar o terreno" com algo menor primeiro. Este é o ponto
+onde alguns desenvolvedores se lançam na criação de patches que corrigem erros
+ortográficos ou problemas menores de estilo de codificação (coding style).
+Infelizmente, tais patches criam um nível de ruído que distrai a comunidade de
+desenvolvimento como um todo; por isso, cada vez mais, eles são vistos com
+desdém. Novos desenvolvedores que desejam se apresentar à comunidade não
+receberão o tipo de recepção que esperam por meio desses métodos.
+
+Andrew Morton oferece este conselho para aspirantes a desenvolvedores de kernel
+
+::
+
+	O projeto nº 1 para todos os iniciantes no kernel certamente deve
+	ser "certificar-se de que o kernel funcione perfeitamente o tempo
+	todo em todas as máquinas em que você puder colocar as mãos".
+	Geralmente, a maneira de fazer isso é trabalhar com outros para
+	que as coisas sejam corrigidas (isso pode exigir persistência!),
+	mas tudo bem — isso faz parte do desenvolvimento do kernel.
+
+(https://lwn.net/Articles/283982/).
+
+Na ausência de problemas óbvios para corrigir, os desenvolvedores são
+aconselhados a olhar para as listas atuais de regressões e bugs abertos em
+geral. Nunca há escassez de problemas que precisem de correção; ao abordar essas
+questões, os desenvolvedores ganharão experiência com o processo enquanto, ao
+mesmo tempo, constroem respeito junto ao restante da comunidade de
+desenvolvimento.
-- 
2.53.0

