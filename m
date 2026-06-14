Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE8637E31E
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 23:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781481071; cv=none; b=NAFYYUuSI6fPtwuEdJDvTWvFVRfsIqNwQyk9gvyH/tZ3AT3SDW9L6IOFKuDTcatEzNlq/ARn09pgZtSTNxUzCr8BjtKw+EbhENOYNbl4Fv4ns5RGJsfF+CGFwQdhma692uXQSQ+WDkT8NVaRV9QuMknQrZsUcdI4KjTVyC4Dcx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781481071; c=relaxed/simple;
	bh=jtBRlhbM3Fvb5Tknqo6dbb0OT92amhqxAQgTpy5Vrl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eweBD4SVIpRyBC1xb4aH/akGu2lFYsHMijOIdoo9ZSyHxAZ72+Gz87eM/5SebqHOJQfLzCDNauLeKKPbssB9nUGPAVpny+toJGcqVxJe+JOCE4d1iJu1XzRY4H6cwuHW/EZAkjAVtxrQTqsGA9k2/F0BCkxzp4aIYEbOJj6gem4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUs26rMB; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUs26rMB"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-59c1bacf871so1245294e0c.1
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 16:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781481068; x=1782085868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GnrRjSsQQmW9GGbk8vDaJCzd/nZdQC5bEnmNtOmo0M=;
        b=gUs26rMBNcSAUSk//3TB15PgNadT8GFVEC/xZjk43hTKFvxK2cmN+zHQ1oMGOI/1h9
         6uD3nTYF+F8AtDx+aI/zQEzRqQAuVnTR7k51gRSDfBuDmj61s3hhQ1mQKWia7FzOa632
         AJ+q0ifgV9RUcQzHZNh4u2H1mqaRXkadr+RJjN+Id4l/yLufP5DS2O0XBUuam/Waog2F
         ktenqfnCJ9jGXyE1LxCsU+5SGkAaOEMCic0YApviqnkdMt+P1BSVwybYtJwmxEqnddnz
         JEZjA3ZGP6bwu8LxA0wjIIKZrMdqKUMF+V5EZ0OWzE7fL+DFfBHDSLXOZHbDhshYoaZ3
         FFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781481068; x=1782085868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6GnrRjSsQQmW9GGbk8vDaJCzd/nZdQC5bEnmNtOmo0M=;
        b=NjhgkVawm58M1OpqbN82yi7xmIVdS07UgW2MTNkSXofJMMrhmB0Br166XWZDQwzJIi
         gkldnwK2pdJ1IiAOxPcQn1LJurkjASgTHE6DZCi4k7T2aqM3UIySyajuVV5lA+Wlg8pn
         2lU8yKWY16eDItTMvKSJG5Xey3dmWUCQGt4d8h4SO/PWZFTQvFqASrDopGfe3q7mxsnb
         IAUWS3rfoRE+h3tiqbRsOCvxAlJWF6i9iagqYXJEVFsYEPYxkAx+anCgJ8dti8HLWgT6
         PwPhecfZjWH9CJ84pGHsyzv2Kk0OffRzT+PCSFEgqQEfVXmWMUKg7kaHCrh7RaJ7bFsz
         eDJg==
X-Gm-Message-State: AOJu0YzdugT9801NxvfPj3TxjdlrXmL5RwxbJSFD7j4292Y0P67UdYxk
	bCIPKaJW7NukF+c0ombrRJVm6zb8tzY72TXgzbZhLAw5/7FgRwnc+dDw
X-Gm-Gg: Acq92OFvCszuXWvJ+b3+mZNRQEYMIMm/XVq/BsHQpDC7qSxqi0EkrY2/si5buriC+GM
	VYkSrBhiv9ieHPpbe9xyACMeg82br0B6b8fucM3VeSyzGcEujc49eTOp4UQwZfYq+So/OsV6ua1
	Ka3S9pltdeY9SPKHfYVvGCX6S1+QVZt62QOn1ylLOmm4oj37MiF5fdQm2ABHac5TOopZnxZKmPM
	CqYDXIMBhdLDivhkoNaSmZgMh3t2De5ViqrPG0ffgE00Rps5AUTJ4Eq2FIYOFOOOjowYsNS9fJf
	EUznhu96pAsmXIn4T3dz2OwzwLoCkLR5PLiEAc7WkY+6qokL1rlHrADFvj8qtBmNXJ4XWeLSRAo
	6Xv2leYFrwJ1k/cEZoqAn288b0VPGPe+KTW5tfyqrF8pH4yiNS+9NzjjoHf49W3H2Vz4d37Vtq4
	/C8XosdsSF6gYk+kbpqKKfWGMopaFiPRvC5CYV+obqNQaB6HnKaKQa/y+rrCy09sHNZGVO9fk=
X-Received: by 2002:a05:6102:5989:b0:634:92c:bdce with SMTP id ada2fe7eead31-71f5ec0940emr3908320137.12.1781481067449;
        Sun, 14 Jun 2026 16:51:07 -0700 (PDT)
Received: from localhost.localdomain ([177.75.70.24])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7208788587esm1630195137.10.2026.06.14.16.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 16:51:07 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 1/2] docs: pt_BR: Translate 4.coding.rst into Portuguese
Date: Sun, 14 Jun 2026 20:50:40 -0300
Message-ID: <20260614235044.42810-2-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260614235044.42810-1-danielmaraboo@gmail.com>
References: <20260614235044.42810-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Translate the chapter regarding coding standards and patch formatting
rules ("4.Coding.rst") into Brazilian Portuguese.

This translation helps Portuguese-speaking developers better understand
the core guidelines required for kernel code contributions.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/process/4.Coding.rst   | 440 ++++++++++++++++++
 .../pt_BR/process/development-process.rst     |   2 +
 2 files changed, 442 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/4.Coding.rst

diff --git a/Documentation/translations/pt_BR/process/4.Coding.rst b/Documentation/translations/pt_BR/process/4.Coding.rst
new file mode 100644
index 000000000..ca4c74774
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/4.Coding.rst
@@ -0,0 +1,440 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Escrever o código corretamente
+==============================
+
+Embora haja muito o que se dizer sobre um processo de design sólido e orientado
+à comunidade, a prova de qualquer projeto de desenvolvimento de kernel está no
+código resultante. É o código que será examinado por outros desenvolvedores e
+mesclado (ou não) na árvore principal (*mainline*). Portanto, é a qualidade
+deste código que determinará o sucesso final do projeto.
+
+Esta seção examinará o processo de codificação. Começaremos analisando uma série
+de maneiras pelas quais os desenvolvedores de kernel podem errar. Em seguida, o
+foco mudará para como fazer as coisas do jeito certo e as ferramentas que podem
+ajudar nessa busca.
+
+
+Armadilhas
+----------
+
+Estilo de Codificação
+*********************
+
+O kernel há muito possui um estilo de codificação padrão, descrito em
+:ref:`Documentation/process/coding-style.rst <codingstyle>`. Por grande parte
+desse tempo, as políticas descritas naquele arquivo eram consideradas, no
+máximo, como recomendações. Como resultado, há uma quantidade substancial
+de código no kernel que não cumpre as diretrizes de estilo de codificação.
+A presença desse código leva a dois riscos independentes para os
+desenvolvedores do kernel.
+
+O primeiro deles é acreditar que os padrões de codificação do kernel não importam
+e não são exigidos. A verdade é que adicionar novo código ao kernel é muito
+difícil se esse código não estiver escrito de acordo com o padrão; muitos
+desenvolvedores solicitarão que o código seja reformatado antes mesmo de
+revisá-lo. Uma base de código tão grande quanto a do kernel exige certa
+uniformidade para tornar possível que os desenvolvedores entendam rapidamente
+qualquer parte dela. Portanto, não há mais espaço para códigos com formatações
+estranhas.
+
+Ocasionalmente, o estilo de codificação do kernel entrará em conflito com o
+estilo exigido por um empregador. Nesses casos, o estilo do kernel terá que
+vencer para que o código possa ser mesclado. Colocar código no kernel significa
+abrir mão de um certo grau de controle de várias maneiras — incluindo o controle
+sobre como o código é formatado.
+
+A outra armadilha é presumir que o código já presente no kernel necessita
+urgentemente de correções de estilo de codificação. Os desenvolvedores podem
+começar a gerar patches de reformatação como uma forma de ganhar familiaridade
+com o processo, ou como um meio de incluir seus nomes nos logs de alterações
+(*changelogs*) do kernel  ou ambos. No entanto, patches puramente de estilo de
+codificação são vistos como ruído pela comunidade de desenvolvimento; eles tendem
+a receber uma recepção fria. Portanto, é melhor evitar esse tipo de patch. É
+natural corrigir o estilo de um trecho de código ao trabalhar nele por outros
+motivos, mas mudanças de estilo de codificação não devem ser feitas apenas por
+fazer.
+
+O documento de estilo de codificação também não deve ser lido como uma lei
+absoluta que nunca pode ser transgredida. Se houver um bom motivo para ir contra
+o estilo (uma linha que se torna muito menos legível se for dividida para caber
+no limite de 80 colunas, por exemplo), simplesmente faça isso.
+
+Note que você também pode usar a ferramenta ``clang-format`` para ajudá-lo com
+essas regras, para reformatar rapidamente partes do seu código de forma automática
+e para revisar arquivos completos a fim de identificar erros de estilo de
+codificação, erros de digitação e possíveis melhorias. Ela também é útil para
+ordenar ``#includes``, alinhar variáveis/macros, reajustar o fluxo de textos e
+outras tarefas semelhantes. Veja o arquivo
+:ref:`Documentation/dev-tools/clang-format.rst <clangformat>` para mais detalhes.
+
+Algumas configurações básicas do editor, como indentação e fins de linha,
+serão definidas automaticamente se você estiver usando um editor compatível
+com o EditorConfig. Consulte o site oficial do EditorConfig para obter mais
+informações: https://editorconfig.org/
+
+Camadas de Abstração
+********************
+
+Os professores de Ciência da Computação ensinam os alunos a fazerem uso
+extensivo de camadas de abstração em nome da flexibilidade e da ocultação de
+informações. Certamente o kernel faz uso extensivo de abstração; nenhum
+projeto que envolva vários milhões de linhas de código poderia fazer o
+contrário e sobreviver. No entanto, a experiência tem mostrado que a
+abstração excessiva ou prematura pode ser tão prejudicial quanto a otimização
+prematura. A abstração deve ser usada até o nível necessário e não além.
+
+Em um nível simples, considere uma função que possui um argumento que é
+sempre passado como zero por todos os chamadores. Alguém poderia manter esse
+argumento caso alguém eventualmente precise usar a flexibilidade extra que ele
+oferece. A essa altura, no entanto, as chances são grandes de que o código que
+implementa esse argumento extra tenha sido quebrado de alguma forma sutil que
+nunca foi percebida — porque ele nunca foi usado. Ou, quando surge a
+necessidade de flexibilidade extra, ela não ocorre de uma forma que corresponda
+à expectativa inicial do programador. Os desenvolvedores do kernel enviam
+patches rotineiramente para remover argumentos não utilizados; eles não devem,
+em geral, ser adicionados em primeiro lugar.
+
+Camadas de abstração que ocultam o acesso ao hardware — frequentemente para
+permitir que a maior parte de um driver seja usada com múltiplos sistemas
+operacionais — são especialmente malvistas. Essas camadas obscurecem o código
+e podem impor uma penalidade de desempenho; elas não pertencem ao kernel
+Linux.
+
+Por outro lado, se você se pegar copiando quantidades significativas de código
+de outro subsistema do kernel, é hora de perguntar se faria sentido, de fato,
+extrair parte desse código em uma biblioteca separada ou implementar essa
+funcionalidade em um nível superior. Não há valor em duplicar o mesmo código
+por todo o kernel.
+
+
+Uso de #ifdef e do pré-processador em geral
+*******************************************
+
+O pré-processador C parece apresentar uma forte tentação para alguns
+programadores C, que o veem como uma forma de codificar eficientemente uma grande
+quantidade de flexibilidade em um arquivo-fonte. No entanto, o pré-processador
+não é C, e o uso pesado dele resulta em um código muito mais difícil de ser lido
+por outros e mais difícil para o compilador verificar a correção. O uso pesado
+do pré-processador é quase sempre um sinal de código que precisa de algum
+trabalho de limpeza.
+
+A compilação condicional com #ifdef é, de fato, um recurso poderoso, e é
+utilizada dentro do kernel. Mas há pouco desejo de ver um código que seja
+salpicado liberalmente com blocos #ifdef. Como regra geral, o uso de #ifdef
+deve ser confinado a arquivos de cabeçalho (headers) sempre que possível. O
+código compilado condicionalmente pode ser confinado a funções que, se o código
+não estiver presente, simplesmente se tornam vazias. O compilador irá então,
+silenciosamente, otimizar e remover a chamada para a função vazia. O resultado
+é um código muito mais limpo e fácil de acompanhar.
+
+As macros do pré-processador C apresentam uma série de riscos, incluindo a
+possível avaliação múltipla de expressões com efeitos colaterais e a falta de
+segurança de tipos. Se você se sentir tentado a definir uma macro, considere a
+criação de uma função inline em seu lugar. O código resultante será o mesmo,
+mas as funções inline são mais fáceis de ler, não avaliam seus argumentos
+múltiplas vezes e permitem que o compilador realize a checagem de tipos nos
+argumentos e no valor de retorno.
+
+
+Funções Inline
+**************
+
+No entanto, as funções inline apresentam um perigo próprio. Os programadores
+podem ficar encantados com a eficiência percebida inerente a evitar uma chamada
+de função e encher um arquivo de código-fonte com funções inline. Essas
+funções, contudo, podem na verdade reduzir o desempenho. Como seu código é
+replicado em cada local de chamada, elas acabam inflando o tamanho do kernel
+compilado. Isso, por sua vez, cria pressão nos caches de memória do
+processador, o que pode desacelerar a execução drasticamente. As funções
+inline, como regra, devem ser bastante pequenas e relativamente raras. O custo
+de uma chamada de função, afinal de contas, não é tão alto; a criação de um
+grande número de funções inline é um exemplo clássico de otimização prematura.
+
+Em geral, os programadores de kernel ignoram os efeitos de cache por sua própria
+conta e risco. O clássico compromisso entre tempo e espaço (tradeoff) ensinado
+nas aulas introdutórias de estruturas de dados frequentemente não se aplica ao
+hardware contemporâneo. Espaço *é* tempo, no sentido de que um programa maior
+será executado mais lentamente do que um que seja mais compacto.
+
+Compiladores mais recentes desempenham um papel cada vez mais ativo em decidir
+se uma determinada função deve ou não ser realmente inline. Portanto, a inserção
+liberal da palavra-chave "inline" pode não apenas ser excessiva; ela também pode
+ser irrelevante.
+
+
+Mecanismo de Trava
+******************
+
+Em maio de 2006, a pilha de rede "Devicescape" foi, com grande alarde, lançada
+sob a GPL e disponibilizada para inclusão no kernel mainline. Essa doação foi uma
+notícia bem-vinda; o suporte para redes sem fio no Linux era considerado abaixo do
+padrão, na melhor das hipóteses, e a pilha da Devicescape oferecia a promessa de
+corrigir essa situação. No entanto, esse código só entrou de fato no mainline em
+junho de 2007 (2.6.22). O que aconteceu?
+
+Esse código mostrava vários sinais de ter sido desenvolvido a portas fechadas em
+ambiente corporativo. Mas um grande problema em particular era que ele não havia
+sido projetado para funcionar em sistemas multiprocessados. Antes que essa pilha
+de rede (agora chamada de mac80211) pudesse ser integrada, um esquema de locking
+(bloqueio) precisou ser adaptado a ela.
+
+Era uma vez uma época em que o código do kernel Linux podia ser desenvolvido sem
+pensar nos problemas de concorrência apresentados por sistemas multiprocessados.
+Hoje, no entanto, este documento está sendo escrito em um laptop dual-core.
+Mesmo em sistemas com um único processador, o trabalho feito para melhorar a
+capacidade de resposta aumentará o nível de concorrência dentro do kernel. Os
+dias em que o código do kernel podia ser escrito sem pensar em locking ficaram
+há muito tempo no passado.
+
+Qualquer recurso (estruturas de dados, registradores de hardware, etc.) que
+possa ser acessado concorrentemente por mais de uma linha de execução deve ser
+protegido por uma trava (lock). O novo código deve ser escrito com esse
+requisito em mente; adaptar o locking após o fato é uma tarefa consideravelmente
+mais difícil. Os desenvolvedores do kernel devem dedicar um tempo para
+compreender as primitivas de locking disponíveis bem o suficiente para escolher
+a ferramenta certa para o trabalho. Códigos que mostrem falta de atenção à
+concorrência terão um caminho difícil para entrar no mainline.
+
+
+Regressions
+***********
+
+Um perigo final que vale a pena mencionar é este: pode ser tentador fazer uma
+alteração (que pode trazer grandes melhorias) que faça algo quebrar para os
+usuários existentes. Esse tipo de alteração é chamado de "regressão", e as
+regressões tornaram-se totalmente indesejadas no kernel mainline. Com poucas
+exceções, as alterações que causarem regressões serão revertidas se a regressão
+não puder ser corrigida em tempo hábil. É muito melhor evitar a regressão em
+primeiro lugar.
+
+Muitas vezes argumenta-se que uma regressão pode ser justificada se ela fizer as
+coisas funcionarem para mais pessoas do que os problemas que ela cria. Por que
+não fazer uma alteração se ela trouxer uma nova funcionalidade para dez sistemas
+para cada um que ela quebrar? A melhor resposta para essa pergunta foi expressa
+por Linus em julho de 2007:
+
+::
+
+  Portanto, nós não corrigimos bugs introduzindo novos problemas. Esse caminho
+  leva à loucura, e ninguém nunca sabe se você está realmente fazendo algum
+  progresso real. São dois passos para frente, um passo para trás, ou um passo
+  para frente e dois passos para trás?
+
+(https://lwn.net/Articles/243460/).
+
+Um tipo de regressão especialmente indesejado é qualquer tipo de alteração na
+ABI do espaço do usuário (user-space ABI). Uma vez que uma interface tenha sido
+exportada para o espaço do usuário, ela deve receber suporte indefinidamente.
+Esse fato torna a criação de interfaces de espaço do usuário particularmente
+desafiadora: já que elas não podem ser alteradas de maneiras incompatíveis, elas
+devem ser feitas corretamente na primeira vez. Por essa razão, exige-se sempre
+muita reflexão, documentação clara e uma ampla revisão para as interfaces do
+espaço do usuário.
+
+
+Ferramentas de verificação de código
+------------------------------------
+
+Por enquanto, pelo menos, a escrita de código livre de erros continua sendo um
+ideal que poucos de nós conseguem alcançar. O que podemos esperar fazer, no
+entanto, é capturar e corrigir o máximo possível desses erros antes que nosso
+código entre no kernel mainline. Para esse fim, os desenvolvedores do kernel
+reuniram um conjunto impressionante de ferramentas que podem capturar uma ampla
+variedade de problemas obscuros de forma automatizada. Qualquer problema
+capturado pelo computador é um problema que não afligirá um usuário mais tarde,
+portanto, é lógico que as ferramentas automatizadas devem ser usadas sempre que
+possível.
+
+O primeiro passo é simplesmente prestar atenção aos avisos (warnings) produzidos
+com o compilador. As versões contemporâneas do gcc podem detectar (e alertar
+sobre) um grande número de erros potenciais. Com bastante frequência, esses
+avisos apontam para problemas reais. O código enviado para revisão deve, como
+regra, não produzir nenhum aviso do compilador. Ao silenciar os avisos, tome o
+cuidado de entender a real causa e tente evitar "correções" que façam o aviso
+desaparecer sem resolver a sua origem.
+
+Note que nem todos os avisos do compilador ficam ativados por padrão. Compile o
+kernel com "make KCFLAGS=-W" para obter o conjunto completo.
+
+O kernel fornece várias opções de configuração que ativam recursos de
+depuração; a maioria delas é encontrada no submanu "kernel hacking". Várias
+dessas opções devem ser ativadas para qualquer kernel usado para fins de
+desenvolvimento ou teste. Em particular, você deve ativar:
+
+ - FRAME_WARN para obter avisos sobre quadros de pilha (stack frames) maiores
+   que um determinado valor. A saída gerada pode ser volumosa, mas não é
+   necessário se preocupar com os avisos de outras partes do kernel.
+
+ - DEBUG_OBJECTS adicionará código para rastrear o tempo de vida de vários
+   objetos criados pelo kernel e alertará quando as ações forem feitas fora de
+   ordem. Se você estiver adicionando um subsistema que cria (e exporta) seus
+   próprios objetos complexos, considere adicionar suporte à infraestrutura de
+   depuração de objetos.
+
+ - DEBUG_SLAB pode encontrar uma variedade de erros de alocação e uso de
+   memória; ele deve ser usado na maioria dos kernels de desenvolvimento.
+
+ - DEBUG_SPINLOCK, DEBUG_ATOMIC_SLEEP e DEBUG_MUTEXES encontrarão uma série de
+   erros comuns de locking (bloqueio).
+
+Existem várias outras opções de depuração, algumas das quais serão discutidas
+abaixo. Algumas delas têm um impacto significativo no desempenho e não devem ser
+usadas o tempo todo. Mas um tempo gasto aprendendo as opções disponíveis
+provavelmente se pagará muitas vezes em pouco tempo.
+
+Uma das ferramentas de depuração mais pesadas é o verificador de locking, ou
+"lockdep". Esta ferramenta rastreará a aquisição e a liberação de cada trava
+(spinlock ou mutex) no sistema, a ordem em que as travas são adquiridas umas em
+relação às outras, o ambiente de interrupção atual e muito mais. Ela pode,
+então, garantir que as travas sejam sempre adquiridas na mesma ordem, que as
+mesmas suposições de interrupção se apliquem em todas as situações e assim por
+diante. Em outras palavras, o lockdep pode encontrar uma série de cenários nos
+quais o sistema poderia, em raras ocasiões, entrar em deadlock. Esse tipo de
+problema pode ser doloroso (tanto para desenvolvedores quanto para usuários) em
+um sistema implantado; o lockdep permite que eles sejam encontrados de maneira
+automatizada e antecipada. Códigos com qualquer tipo de locking não trivial
+devem ser executados com o lockdep ativado antes de serem enviados para inclusão.
+
+Como um programador de kernel diligente, você irá, sem dúvida, verificar o
+status de retorno de qualquer operação (como uma alocação de memória) que possa
+falhar. O fato, porém, é que os caminhos de recuperação de falha resultantes
+estão, provavelmente, completamente não testados. Código não testado tende a ser
+código quebrado; você poderia estar muito mais confiante em seu código se todos
+esses caminhos de tratamento de erros tivessem sido exercitados algumas vezes.
+
+O kernel fornece um framework de injeção de falhas (fault injection) que pode
+fazer exatamente isso, especialmente onde alocações de memória estão
+envolvidas. Com a injeção de falhas ativada, uma porcentagem configurável das
+alocações de memória será forçada a falhar; essas falhas podem ser restritas a
+um intervalo específico de código. Executar o código com a injeção de falhas
+ativada permite ao programador ver como o código responde quando as coisas vão
+mal. Veja Documentation/fault-injection/fault-injection.rst para mais
+informações sobre como usar esse recurso.
+
+Outros tipos de erros podem ser encontrados com a ferramenta de análise estática
+"sparse". Com o sparse, o programador pode ser alertado sobre confusões entre
+endereços do espaço do usuário e do espaço do kernel, mistura de quantidades
+big-endian e small-endian, a passagem de valores inteiros onde um conjunto de
+sinalizadores de bits (bit flags) é esperado, e assim por diante. O sparse deve
+ser instalado separadamente (ele pode ser encontrado em
+https://sparse.wiki.kernel.org/index.php/Main_Page se a sua distribuição não o
+incluir como pacote); ele pode então ser executado no código adicionando "C=1"
+ao seu comando make.
+
+A ferramenta "Coccinelle" (http://coccinelle.lip6.fr/) é capaz de encontrar uma
+ampla variedade de potenciais problemas de codificação; ela também pode propor
+correções para esses problemas. Uma quantidade considerável de "patches
+semânticos" para o kernel foi empacotada sob o diretório scripts/coccinelle;
+executar "make coccicheck" passará por esses patches semânticos e relatará
+quaisquer problemas encontrados. Veja
+:ref:`Documentation/dev-tools/coccinelle.rst <devtools_coccinelle>`
+para mais informações.
+
+Outros tipos de erros de portabilidade são encontrados mais facilmente ao
+compilar seu código para outras arquiteturas. Se você por acaso não tiver um
+sistema S/390 ou uma placa de desenvolvimento Blackfin à mão, ainda assim poderá
+realizar a etapa de compilação. Um grande conjunto de compiladores cruzados
+(cross-compilers) para sistemas x86 pode ser encontrado em:
+
+  https://www.kernel.org/pub/tools/crosstool/
+
+Um tempo gasto instalando e usando esses compiladores ajudará a evitar
+constrangimentos mais tarde.
+
+
+Documentação
+-------------
+
+A documentação frequentemente tem sido mais a exceção do que a regra no
+desenvolvimento do kernel. Mesmo assim, uma documentação adequada ajudará a
+facilitar a integração de novos códigos ao kernel, tornará a vida mais fácil para
+outros desenvolvedores e será útil para os seus usuários. Em muitos casos, a
+adição de documentação tornou-se essencialmente obrigatória.
+
+A primeira parte da documentação de qualquer patch é o seu log de alterações
+(changelog) associado. As entradas do log devem descrever o problema que está
+sendo resolvido, a forma da solução, as pessoas que trabalharam no patch,
+quaisquer efeitos relevantes no desempenho e qualquer outra coisa que possa ser
+necessária para entender o patch. Certifique-se de que o changelog diga o
+*porquê* de o patch valer a pena ser aplicado; um número surpreendente de
+desenvolvedores falha em fornecer essa informação.
+
+Qualquer código que adicione uma nova interface de espaço do usuário — incluindo
+novos arquivos sysfs ou /proc — deve incluir a documentação dessa interface, de
+modo a permitir que os desenvolvedores do espaço do usuário saibam com o que
+estão trabalhando. Veja Documentation/ABI/README para uma descrição de como essa
+documentação deve ser formatada e quais informações precisam ser fornecidas.
+
+O arquivo :ref:`Documentation/admin-guide/kernel-parameters.rst
+<kernelparameters>` descreve todos os parâmetros de boot do kernel. Qualquer
+patch que adicione novos parâmetros deve adicionar as entradas apropriadas a
+este arquivo.
+
+Quaisquer novas opções de configuração devem ser acompanhadas por um texto de
+ajuda que explique claramente as opções e quando o usuário pode querer
+selecioná-las.
+
+As informações de API interna de muitos subsistemas são documentadas por meio de
+comentários com formatação especial; esses comentários podem ser extraídos e
+formatados de várias maneiras pelo script "kernel-doc". Se você estiver
+trabalhando em um subsistema que possui comentários kerneldoc, você deve
+mantê-los e adicioná-los, conforme apropriado, para funções disponíveis
+externamente. Mesmo em áreas que não tenham sido documentadas dessa forma, não há
+mal nenhum em adicionar comentários kerneldoc para o futuro; de fato, esta pode
+ser uma atividade útil para desenvolvedores iniciantes de kernel. O formato
+desses comentários, junto com algumas informações sobre como criar modelos de
+kerneldoc, pode ser encontrado em :ref:`Documentation/doc-guide/ <doc_guide>`.
+
+Qualquer pessoa que leia uma quantidade significativa de código existente do
+kernel notará que, frequentemente, os comentários chamam a atenção por sua
+ausência. Mais uma vez, as expectativas para códigos novos são mais altas do que
+eram no passado; integrar código sem comentários será mais difícil. Dito isso,
+há pouco interesse em códigos comentados de forma prolixa. O código deve, por si
+só, ser legível, com os comentários explicando os aspectos mais sutis.
+
+Certas coisas devem sempre ser comentadas. O uso de barreiras de memória
+(memory barriers) deve ser acompanhado por uma linha explicando por que a
+barreira é necessária. As regras de locking (bloqueio) para estruturas de dados
+geralmente precisam ser explicadas em algum lugar. Grandes estruturas de dados
+precisam de uma documentação abrangente em geral. Dependências não óbvias entre
+trechos distintos de código devem ser apontadas. Qualquer coisa que possa tentar
+um "faxineiro de código" (code janitor) a fazer uma "limpeza" incorreta precisa
+de um comentário dizendo por que foi feita daquela maneira. E assim por diante.
+
+
+Alterações de API interna
+-------------------------
+
+A interface binária fornecida pelo kernel para o espaço do usuário não pode ser
+quebrada, exceto sob as circunstâncias mais graves. Por outro lado, as
+interfaces de programação internas do kernel são altamente fluidas e podem ser
+alteradas quando surgir a necessidade. Se você se encontrar tendo que criar uma
+gambiarra para contornar uma API do kernel, ou simplesmente deixando de usar uma
+funcionalidade específica porque ela não atende às suas necessidades, isso pode
+ser um sinal de que a API precisa mudar. Como desenvolvedor de kernel, você tem
+o poder de fazer tais alterações.
+
+Existem, é claro, algumas pegadinhas. Alterações de API podem ser feitas, mas
+precisam ser bem justificadas. Portanto, qualquer patch que faça uma alteração de
+API interna deve ser acompanhado por uma descrição do que é a mudança e do porquê
+ela é necessária. Esse tipo de alteração também deve ser separado em um patch
+independente, em vez de ser enterrado dentro de um patch maior.
+
+A outra pegadinha é que o desenvolvedor que altera uma API interna é geralmente
+encarregado da tarefa de corrigir qualquer código dentro da árvore do kernel que
+tenha sido quebrado pela mudança. Para uma função amplamente utilizada, esse
+dever pode levar a literalmente centenas ou milhares de alterações — muitas das
+quais provavelmente entrarão em conflito com o trabalho que está sendo feito por
+outros desenvolvedores. Desnecessário dizer que isso pode ser um grande
+trabalho, então é melhor ter certeza de que a justificativa é sólida. Note que
+a ferramenta Coccinelle pode ajudar com alterações de API de amplo alcance.
+
+Ao fazer uma alteração incompatível de API, deve-se, sempre que possível,
+garantir que o código que não foi atualizado seja capturado pelo compilador.
+Isso ajudará você a ter certeza de que encontrou todos os usos dessa interface
+dentro da árvore (in-tree). Isso também alertará os desenvolvedores de códigos
+fora da árvore (out-of-tree) de que há uma mudança à qual eles precisam
+responder. Dar suporte a código fora da árvore não é algo com que os
+desenvolvedores do kernel precisem se preocupar, mas também não temos que
+tornar a vida dos desenvolvedores fora da árvore mais difícil do que precisa ser.
diff --git a/Documentation/translations/pt_BR/process/development-process.rst b/Documentation/translations/pt_BR/process/development-process.rst
index 599c34c85..71f151f36 100644
--- a/Documentation/translations/pt_BR/process/development-process.rst
+++ b/Documentation/translations/pt_BR/process/development-process.rst
@@ -20,3 +20,5 @@ conhecimento profundo de programação de kernel para ser compreendida.
    1.Intro
    2.Process
    3.Early-stage
+   4.Coding
+   
-- 
2.47.3

