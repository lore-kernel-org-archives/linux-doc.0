Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD352EE262
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 02:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784167863; cv=none; b=qvvxl81+vu0tMivG13d3oUhmu5nqJt67/A44vgS2p5oE3BOfO9BviLNbo37r9wKTknS3d4y/u2aaqe2+SLaqwxwmovx5CDvOgNwTsWndK1yJdkPA4U3kILYF1o/AgoZOH8BxCtZmkbB8mZjDImVed1r6FFslMWx/xcoTLM8oha4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784167863; c=relaxed/simple;
	bh=AjtVXxh1M99EOtHz3MM/BTbv0ulmmiPZiKlATlU8J+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qqQQWcQXUJS8E/ZLLtOcd9nnFD63KB0ZDR+nfk54ga3YaPbABRUG9dbxFDhdiSypna04QFqg0YGewJ/iiyzy7pARkDEdxww9WF3uM1hIW+LtQWcDeSiG33SBbvnWdyGur0udXKVGFT8iqwEgAj/0gICuNnEOocfPcyRXKOLY45o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y25xZDJN; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y25xZDJN"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c96c92c0980so1764403a12.3
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 19:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784167861; x=1784772661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PYFdPuI0jVcdAS+eU7F0cOfCRZmeFnLq/1LPxobDpQQ=;
        b=Y25xZDJN/ri4sygNibcE8IP9SORF+kNb9O8sFaeQoRXtX9q8Qk7Rl7fWr5o+w4d0tX
         ifhjx1Ue0kLxDJ2r/YAP82BE4OpCgQ2l/zLEuJhqV7hFz6H77Rxa5lqLOJaHblSK0rUJ
         XEShlebdRn2/Sbs89VIDOpJGpLnxYzZiRpFUhwFQEI8RjAdp4DJ1dgVoS5WZlAZYx8R7
         sSxCJc1ToN13bFB3Zv9OU8PvwUK6Fy2jlPK0j8EnmleXwwwVQ/zgd7PXhAAZ2MKtItCM
         oQG2v16RAtQShAOuDh+pDcdwMhas3i0W8veiLKerhRMCUTDDsiyEnrc4eylUGCGfk6ZH
         lARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784167861; x=1784772661;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PYFdPuI0jVcdAS+eU7F0cOfCRZmeFnLq/1LPxobDpQQ=;
        b=a5t0PbvqtHR3PV+FK8ooxh4hscGStkb04QxFU7bRpv0y/E42iC2H8QlsvjvdNTplGJ
         PLoImZZXm/pLOzxlGLIyxRljAcShAbsSlm+oklOQqlo1lOjgd0oFV4TRlMoHH9v0yj8c
         GfIivdmy5JheVkJOAr9ohKWAlHvGmuIYJvTJZAHBKumUWmwqJUsH40S6yjToE4zy2ZVJ
         zzhDwpf0OJ+sIlt1502v4JpyPOb/tgk6uWrNG3snUYRIct2t/Llet4ieilZLXovgVpFW
         2ziGXABLRCS1iBAlpcImM5Gj5/dOhhQwa0fa+vibKK/0T8kLK/GsschXde/Jfzx32LHV
         L50A==
X-Gm-Message-State: AOJu0YylB5SO2dl2ipi0xIWWf0sJW2FBzHt5ATdJ57rpqpFaHPOlWulx
	/CH+dL2ZmiMbrBfWY9teeDnqotAIDSi9+5KW0UHJDlGob9ImBdP5S2AIB/odo3Rc
X-Gm-Gg: AfdE7cm2gofrmKcNne+iwbSWsY1hVHrMLeegZSsgYoXa3t/WuY06cmQ9IhBuPHum7Se
	kxn4CRU96WboXufm1J4fZGuln9zf6py9iCSBsXx7ZM+axufTZ/MSeJuquzKSct+Gk1NCMln7WhE
	+U5PEB1VJK84CkKAcLORunE9HTJzrJKakbgpCsv0lgM9ZBJgs2gXdyEUhPUd3owOVKSSdlnkxlu
	bpXF4nGJpfDNEzS1HO4wtjLrKNbqWmoJWyCDIl+LTZAupOG4SLilpZzGHVH1XW8Xm2iY9t28twP
	UXlrZcNi+iRlnir5NxH5ZtGa+pEtp4EPtqJa8cr4YpFTm3x3XvNtCxXqBc25RgEyD7iLvgWenmz
	jInfPjsbf4RARWmNzYMM5tuPiECEweD7xvNYHF0uizcWRTubXb0DXfgLTlmpswdWPWvY7k0j/nF
	Ah8t37z2bg1mPRBkRS45EZWWHLGMDosYkVLskbXRppE00ZodCReiNIz0c3LEPxziakNOxcwASrX
	wyQPemqOL7UxWTMJHs4r2vCwi2XUKF928q1Ij0u
X-Received: by 2002:a05:6a21:32a2:b0:3bf:6237:4d4a with SMTP id adf61e73a8af0-3c1108c0ad0mr22821012637.24.1784167861002;
        Wed, 15 Jul 2026 19:11:01 -0700 (PDT)
Received: from parrot.bbrouter ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd429cee1sm6979209c88.6.2026.07.15.19.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 19:11:00 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 2/4] docs: pt_BR: Translate code-of-conduct-interpretation to Portuguese
Date: Wed, 15 Jul 2026 23:10:10 -0300
Message-ID: <20260716021013.48025-3-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260716021013.48025-1-danielmaraboo@gmail.com>
References: <20260716021013.48025-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Translate the code-of-conduct-interpretation.rst document from
Documentation/process/ to Portuguese (pt_BR) to make the kernel
guidelines on community standards and enforcement more accessible
to Portuguese-speaking developers.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 Documentation/translations/pt_BR/index.rst    |   1 +
 .../code-of-conduct-interpretation.rst        | 257 ++++++++++++++++++
 2 files changed, 258 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/code-of-conduct-interpretation.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 841b49657..d9276a8dc 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -84,3 +84,4 @@ kernel e sobre como ver seu trabalho integrado.
    Processo do subsistema KVM x86 <process/maintainer-kvm-x86>
    Adicionando uma nova chamada de Sistema <process/adding-syscalls>
    Lista de verificação para submissão de patches do kernel Linux <process/submit-checklist>
+   Interpretação do Código de Conduta do Kernel Linux <process/code-of-conduct-interpretation>
diff --git a/Documentation/translations/pt_BR/process/code-of-conduct-interpretation.rst b/Documentation/translations/pt_BR/process/code-of-conduct-interpretation.rst
new file mode 100644
index 000000000..866c9f7e7
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/code-of-conduct-interpretation.rst
@@ -0,0 +1,257 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Interpretação do Código de Conduta do Kernel Linux
+==================================================
+
+O :ref:`pt_BR_code_of_conduct` é um documento geral que tem como objetivo
+fornecer um conjunto de regras para quase todas as comunidades de código
+aberto. Toda comunidade de código aberto é única e o kernel Linux não é
+exceção. Por causa disso, este documento descreve como nós, na comunidade
+do kernel Linux, o interpretaremos. Nós também não esperamos que esta
+interpretação seja estática ao longo do tempo, e a ajustaremos conforme
+necessário.
+
+O esforço de desenvolvimento do kernel Linux é um processo muito pessoal
+em comparação com as formas "tradicionais" de desenvolvimento de software.
+Suas contribuições e as ideias por trás delas serão cuidadosamente
+revisadas, frequentemente resultando em críticas e apontamentos. A
+revisão quase sempre exigirá melhorias antes que o material possa ser
+incluído no kernel. Saiba que isso acontece porque todos os envolvidos
+querem ver a melhor solução possível para o sucesso geral do Linux. Este
+processo de desenvolvimento provou criar o kernel de sistema operacional
+mais robusto de todos os tempos, e nós não queremos fazer nada que cause
+a diminuição da qualidade do envio e do resultado final.
+
+Mantenedores
+------------
+
+O Código de Conduta usa o termo "mantenedores" várias vezes. Na
+comunidade do kernel, um "mantenedor" é qualquer pessoa responsável por
+um subsistema, driver ou arquivo, e que esteja listada no arquivo
+MAINTAINERS na árvore de código-fonte do kernel.
+
+Responsabilidades
+-----------------
+
+O Código de Conduta menciona direitos e responsabilidades para os
+mantenedores, e isso precisa de alguns esclarecimentos adicionais.
+
+Em primeiro lugar e acima de tudo, é uma expectativa razoável que os
+mantenedores liderem pelo exemplo.
+
+Dito isto, nossa comunidade é vasta e ampla, e não há um novo requisito
+para que os mantenedores lidem unilateralmente com o comportamento de
+outras pessoas nas partes da comunidade onde atuam. Essa responsabilidade
+é de todos nós e, em última análise, o Código de Conduta documenta os
+caminhos finais de escalonamento em caso de preocupações não resolvidas
+em relação a questões de conduta.
+
+Os mantenedores devem estar dispostos a ajudar quando ocorrerem problemas
+e trabalhar com outras pessoas na comunidade quando necessário. Não tenha
+medo de entrar em contato com o Conselho Consultivo Técnico (TAB) ou
+outros mantenedores se não tiver certeza de como lidar com as situações
+que surgirem. Isso não será considerado um relato de violação, a menos
+que você queira que seja. Se não tiver certeza sobre como abordar o TAB
+ou quaisquer outros mantenedores, entre em contato com nossa mediadora
+de conflitos, Joanna Lee <jlee@linuxfoundation.org>.
+
+No final, "sejam gentis uns com os outros" é realmente o objetivo final
+para todos. Sabemos que todos são humanos e que todos falhamos às vezes,
+mas o objetivo principal para todos nós deve ser trabalhar em direção a
+resoluções amigáveis dos problemas. A aplicação do código de conduta será
+apenas uma opção de último recurso.
+
+Nosso objetivo de criar um sistema operacional robusto e tecnicamente
+avançado e a complexidade técnica envolvida exigem naturalmente
+conhecimento técnico e tomada de decisões.
+
+O conhecimento técnico exigido varia dependendo da área de contribuição.
+Ele é determinado principalmente pelo contexto e pela complexidade técnica
+e apenas secundariamente pelas expectativas de contribuidores e
+mantenedores.
+
+Tanto as expectativas de conhecimento técnico quanto a tomada de decisões
+estão sujeitas a discussão, mas no final das contas há uma necessidade
+básica de sermos capazes de tomar decisões para progredir. Esta
+prerrogativa está nas mãos dos mantenedores e da liderança do projeto e
+espera-se que seja usada de boa fé.
+
+Como consequência, definir expectativas de conhecimento técnico, tomar
+decisões e rejeitar contribuições inadequadas não são vistos como uma
+violação do Código de Conduta.
+
+Embora os mantenedores sejam em geral receptivos aos novatos, sua
+capacidade de ajudar os contribuidores a superar os obstáculos de entrada
+é limitada, portanto, eles devem definir prioridades. Isso, também, não
+deve ser visto como uma violação do Código de Conduta. A comunidade do
+kernel está ciente disso e fornece programas de nível de entrada de
+várias formas, como o kernelnewbies.org.
+
+Escopo
+------
+
+A comunidade do kernel Linux interage primariamente em um conjunto de listas
+de e-mail públicas distribuídas por vários servidores diferentes controlados
+por várias empresas ou indivíduos diferentes. Todas essas listas estão
+definidas no arquivo MAINTAINERS na árvore de código-fonte do kernel.
+Quaisquer e-mails enviados para essas listas de e-mail são considerados
+cobertos pelo Código de Conduta.
+
+Desenvolvedores que usam o bugzilla do kernel.org e outras ferramentas de
+rastreamento de bugs ou bugzilla de subsistemas devem seguir as diretrizes
+do Código de Conduta. A comunidade do kernel Linux não possui um endereço
+de e-mail de projeto "oficial" ou endereço "oficial" de mídia social.
+Qualquer atividade realizada usando uma conta de e-mail do kernel.org deve
+seguir o Código de Conduta conforme publicado para o kernel.org, assim como
+qualquer indivíduo usando uma conta de e-mail corporativa deve seguir as
+regras específicas daquela corporação.
+
+O Código de Conduta não proíbe que se continue a incluir nomes, endereços de
+e-mail e comentários associados em mensagens de listas de discussão,
+mensagens de log de alterações (changelog) do kernel ou comentários no
+código.
+
+A interação em outros fóruns é coberta pelas regras que se aplicam a tais
+fóruns e, em geral, não é coberta pelo Código de Conduta. Exceções podem
+ser consideradas para circunstâncias extremas.
+
+As contribuições enviadas para o kernel devem usar linguagem apropriada.
+O conteúdo já existente que precede o Código de Conduta não será tratado
+agora como uma violação. No entanto, a linguagem inapropriada pode ser vista
+como um bug; tais bugs serão corrigidos mais rapidamente se quaisquer partes
+interessadas enviarem patches com esse propósito. Expressões que atualmente
+fazem parte da API de usuário/kernel, ou que refletem a terminologia usada
+em padrões ou especificações publicadas, não são consideradas bugs.
+
+Aplicação
+---------
+
+O endereço listado no Código de Conduta vai para o Comitê do Código de
+Conduta. Os membros exatos que recebem esses e-mails a qualquer momento
+estão listados em https://kernel.org/code-of-conduct.html. Os membros não
+podem acessar relatos feitos antes de se juntarem ou após terem deixado o
+comitê.
+
+O Comitê do Código de Conduta consiste em membros voluntários da comunidade
+nomeados pelo TAB, bem como um mediador profissional agindo como um terceiro
+neutro. Os processos que o comitê do Código de Conduta usará para lidar com
+os relatos variam e dependerão das circunstâncias individuais; no entanto,
+este arquivo serve como documentação para o processo geral utilizado.
+
+Qualquer membro do comitê, incluindo o mediador, pode ser contatado
+diretamente se o relator não desejar incluir todo o comitê em uma
+reclamação ou preocupação.
+
+O Comitê do Código de Conduta revisa os casos de acordo com os processos
+(veja acima) e consulta o TAB conforme a necessidade e a conveniência,
+por exemplo, para solicitar e receber informações sobre a comunidade do
+kernel.
+
+Quaisquer decisões a respeito de recomendações de aplicação (enforcement)
+serão levadas ao TAB para implementação junto aos mantenedores relevantes,
+se necessário. Uma vez que o TAB aprove uma ou mais das medidas descritas
+no escopo do banimento pelo voto de dois terços dos membros, o Comitê do
+Código de Conduta aplicará as medidas aprovadas pelo TAB. Quaisquer membros
+do Comitê do Código de Conduta que sirvam no TAB não votarão nas medidas.
+
+Em intervalos trimestrais, o Comitê do Código de Conduta e o TAB fornecerão
+um relatório resumindo os relatos anonimizados que o comitê do Código de
+Conduta recebeu e o status deles, bem como os detalhes de quaisquer
+decisões aprovadas pelo TAB, incluindo dados completos e identificáveis da
+votação.
+
+Como a maneira pela qual interpretamos e aplicamos o Código de Conduta
+evoluirá com o tempo, este documento será atualizado quando necessário para
+refletir quaisquer mudanças.
+
+Aplicação para Violações de Comportamento Inaceitável do Código de Conduta
+----------------------------------------------------------------------------
+
+O comitê do Código de Conduta trabalha para garantir que nossa comunidade
+continue a ser inclusiva e promova discussões e pontos de vista diversos, e
+trabalha para melhorar essas características ao longo do tempo. A maioria
+dos relatos que o Comitê do Código de Conduta recebe decorre da
+compreensão incorreta sobre o processo de desenvolvimento e os papéis,
+responsabilidades e o direito dos mantenedores de tomar decisões sobre a
+aceitação de código. Estes são resolvidos através do esclarecimento do
+processo de desenvolvimento e do escopo do Código de Conduta.
+
+Comportamentos inaceitáveis podem interromper a colaboração respeitosa por um
+curto período de tempo e impactar negativamente a saúde da comunidade a longo
+prazo. Comportamentos inaceitáveis frequentemente são resolvidos quando os
+indivíduos reconhecem seu comportamento e se retratam por ele no ambiente em
+que a violação ocorreu.
+
+O Comitê do Código de Conduta recebe relatos sobre comportamentos
+inaceitáveis quando eles não são resolvidos através de discussões na
+comunidade. O comitê do Código de Conduta toma medidas para restaurar a
+colaboração produtiva e respeitosa quando um comportamento inaceitável
+impactou negativamente esse relacionamento.
+
+O Comitê do Código de Conduta tem a obrigação de manter os relatos e as
+informações dos relatores em sigilo. Os relatos podem vir de partes lesadas
+e membros da comunidade que são observadores de comportamentos
+inaceitáveis. O Comitê do Código de Conduta tem a responsabilidade de
+investigar e resolver esses relatos, trabalhando com todas as partes
+envolvidas.
+
+O Comitê do Código de Conduta trabalha com o indivíduo para promover uma
+mudança em sua compreensão sobre a importância de reparar os danos causados
+por seu comportamento à parte lesada e o impacto negativo a longo prazo na
+comunidade.
+
+O objetivo é alcançar uma resolução que seja aceitável para todas as partes.
+Se trabalhar com o indivíduo não trouxer o resultado desejado, o Comitê do
+Código de Conduta avaliará outras medidas, como buscar um pedido de
+desculpas público para reparar o dano.
+
+Buscar retratação pública pela violação
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+O Comitê do Código de Conduta chama a atenção publicamente para o comportamento
+no ambiente em que a violação ocorreu, buscando uma retratação pública
+pela violação.
+
+Uma retratação pública pela violação é o primeiro passo para reconstruir a
+confiança. A confiança é essencial para o sucesso contínuo e a saúde da
+comunidade, que opera com base na confiança e no respeito.
+
+Medidas corretivas se não houver uma retratação pública pela violação
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+O Comitê do Código de Conduta determina o próximo curso de ação para restaurar
+a colaboração saudável, recomendando medida(s) corretiva(s) ao TAB para
+aprovação.
+
+- Banir o infrator de participar do processo de desenvolvimento do kernel por
+  um período de até um ciclo completo de desenvolvimento do kernel. O Comitê
+  do Código de Conduta pode exigir uma retratação pública como condição
+  para suspender o banimento.
+
+O escopo do banimento por um período de tempo pode incluir:
+
+    a. negar contribuições de patch e pull requests
+    b. pausar a colaboração com o infrator ignorando suas contribuições e/ou
+       bloqueando sua(s) conta(s) de e-mail
+    c. restringir sua capacidade de se comunicar pelas plataformas kernel.org,
+       como listas de discussão e sites de mídia social
+
+Uma vez que o TAB aprove uma ou mais das medidas descritas no escopo do
+banimento por dois terços dos membros votando a favor das medidas, o Comitê do
+Código de Conduta aplicará a(s) medida(s) aprovada(s) pelo TAB em colaboração
+com a comunidade, mantenedores, submantenedores e administradores do
+kernel.org. Quaisquer membros do Comitê do Código de Conduta atuando no TAB
+não votarão nas medidas.
+
+O Comitê do Código de Conduta está ciente do impacto negativo que buscar uma
+retratação pública e instituir um banimento pode ter sobre os indivíduos.
+Também está ciente dos danos a longo prazo para a comunidade que podem resultar
+da falta de ação quando tais violações públicas graves ocorrem.
+
+A eficácia da(s) medida(s) corretiva(s) aprovada(s) pelo TAB depende da
+confiança e cooperação da comunidade, mantenedores, submantenedores e
+administradores do kernel.org na sua aplicação.
+
+O Comitê do Código de Conduta espera sinceramente que comportamentos
+inaceitáveis que exijam a busca de retratações públicas continuem a ser
+ocorrências extremamente raras no futuro.
\ No newline at end of file
-- 
2.47.3

