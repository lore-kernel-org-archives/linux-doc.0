Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049AC1EF36E
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 19:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780341835; cv=none; b=Y3dOoOhWrnr9vYyprNajJXh4vVJxLE8kcw62uzhwhb5UGcPImo0yAbYdHhk5yuwiGCQ4Xlnzkd3hGEDF6eq6r1ur4BLUZiypjz7DHw0iTdM/p+E+UDZhEzJY7Vk3Xac5KTX+kqWLAM7V8NIGAxbjkVGDelvgUuewnVxKkY7qjag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780341835; c=relaxed/simple;
	bh=Zz/l4+BAjDLtwWp8TT17JZMC8cCStPUC/c22dirWXUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lIalDc+pnax1BrCy+FwKP23gV4Sq9e186M7B1oFnXEk7EEETKHNC3IeTxdNq+/8c/o0WbCwwId97uJnQyQlGhYZwZLGcQNUpQQEVCzFwGgdi0v4g1eI5L8k0wDAmyq4Ot/XDCuy95+WTOP31TM9SjgjjdUoBcbo76TxGnu6cPR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPw68rp0; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPw68rp0"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7e0743942f8so24995747b3.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 12:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780341833; x=1780946633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FXhhpbzc/RpUvBN7DIdqeuko3m53S9LZ32sEzVICNs4=;
        b=FPw68rp0S/lc125FFmuOsRy0qJvbYuCdXEzIGqfcRqBIoj1YOYqb6dVe0vFm2WTS0b
         UcUOAf5QreITQu3pCGc6zNuLJX89R34dq1zCthMPCGNuTcDAgzBMXwB8Y9LDtmtnPyxd
         LcmYGgtLSc4tBYed7IqMtAO8W8v9p4PF3jwcCa5E3Ufjwexaqnd0qB0ajNJHcSG0zH+J
         Nq70VABSWaBK8OAIyRAyDAJvwn6g21S3HvlGZ07d8l3gYSceBH66J4eNRe52Y+fA0Auy
         uSy+TtlLcpoAW4CzDK6QTu4j9Dxaw8JPWIzbac5q3vXWRcvzjBq6lYNCTcPNDA9Ke23B
         XnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780341833; x=1780946633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXhhpbzc/RpUvBN7DIdqeuko3m53S9LZ32sEzVICNs4=;
        b=mT51O/3kVdCONtoL6GwNe8MNLoCJo1P15dTceXZcJPL9ed/CpYf2VX71QUatxmqz++
         8YF+QkF6wuxRq5Wo9GkqcK01w7YlDEdAgTXdh4sqM8ttS1nz7hLxofCU3l4qj0ccOymm
         uIW+3fx2tMPfgOgaZKrZPNbMGc+YkdlpAkP9OhMACl9WUpYL2yj1lvJpqVe/L24VPlPW
         xm5SMmLG8gBrHifrUe0OyU+WFaSmBAWNjsxtM8s2EUTthRbUOeI1BL4fYLvJtcgjoAN4
         kf8GIGhtZuGr/XkApL3Gnt88c70yNZYCYKxaVcSr5NXRh6pSHU6eCRZmtznXq7Qz+cRm
         Cd3g==
X-Gm-Message-State: AOJu0Yw43cRJGnmLLF382wLflS3U5MA10CY7t7K1OIeBCdDMEtE9g8a0
	NexWWUyR0+5BSh2bfBKohIplh1ayBrIzV8elxz4NFuYriVJzhun3EVa9
X-Gm-Gg: Acq92OGb4L2uRbKQIQsn7w867ejJnJwdJ1fbuE67oHAKsR9F1YZ1BVUN26N9ASJnODI
	SlIuwvvzJU+MZRTPVB9wh8Y0rhMKFTtpWum0f0suCNjCbJ5Q2irwqeM7HYVZche6V95fiPUVVB1
	f22qGgdJ4m3kg9D1a2+XTvAt+5t5Ho9Tq7UV3yVBNiKz+ki4Sdfr7qMvrrHKdSs5LiVFamIMQCN
	qdETnCvpZyr76zrPOUjunDGgyEov5r8tg4pCNGiw0fkojYi97EeqQ1WGz6EuS5RjksNwDYuqNAy
	XCU45EhtVdi3rCn0rZxbJ0WkOf0zAsqGj+aL8j+0H8L9255uC/xsSsgDDcxFJJj147/FVkx0+Dc
	dJeNAP+1P1SOknrUO13hXmXVEtQdy1mmD7uH6GeyO3aWW6cVFjJnDlKyfWG5/gAHPNwnWNTFu/e
	wjHqAUG9sQg8b6qGKcHHLV80WThqAqk72sgF3tnSy6g0owbLvZtwrohN9warnjvSCqXkdBhzkf/
	gL8yDDUWJHVnamCi3OoTGRyowh+fHttgynZctNL
X-Received: by 2002:a05:690c:6011:b0:7bd:577f:56bf with SMTP id 00721157ae682-7e05d3f99d5mr114083857b3.33.1780341832520;
        Mon, 01 Jun 2026 12:23:52 -0700 (PDT)
Received: from localhost.localdomain (smtp.hostdime.com.br. [187.45.177.18])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7e17c9ac78asm45963737b3.43.2026.06.01.12.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 12:23:52 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH] docs: pt_BR: Translate 3.Early-stage.rst into Portuguese
Date: Mon,  1 Jun 2026 16:23:44 -0300
Message-ID: <20260601192346.192752-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Translate the documentation file '3.Early-stage.rst' into Portuguese.

This section addresses corporate kernel development constraints,
the balance between company secrecy and the open-loop approach,
and the use of NDAs or Linux Foundation programs to avoid
integration issues.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/process/3.Early-stage.rst           | 233 ++++++++++++++++++
 .../pt_BR/process/development-process.rst     |   1 +
 2 files changed, 234 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/3.Early-stage.rst

diff --git a/Documentation/translations/pt_BR/process/3.Early-stage.rst b/Documentation/translations/pt_BR/process/3.Early-stage.rst
new file mode 100644
index 000000000..74e741766
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/3.Early-stage.rst
@@ -0,0 +1,233 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Planejamento em estágio inicial
+===============================
+
+Ao contemplar um projeto de desenvolvimento do kernel Linux, pode ser tentador
+dar um salto direto e começar a codificar. No entanto, como ocorre com qualquer
+projeto significativo, grande parte da base para o sucesso é melhor estabelecida
+antes que a primeira linha de código seja escrita. Um tempo gasto no planejamento
+e na comunicação iniciais pode economizar muito mais tempo mais adiante.
+
+
+Especificando o problema
+------------------------
+
+Como qualquer projeto de engenharia, um aprimoramento bem-sucedido do kernel
+começa com uma descrição clara do problema a ser resolvido. Em alguns casos,
+esta etapa é fácil: quando um driver é necessário para um componente de
+hardware específico, por exemplo. Em outros, no entanto, é tentador confundir o
+problema real com a solução proposta, e isso pode levar a dificuldades.
+
+Considere um exemplo: alguns anos atrás, desenvolvedores que trabalhavam com o
+áudio do Linux buscavam uma maneira de executar aplicativos sem interrupções
+(*dropouts*) ou outros artefatos causados por latência excessiva no sistema. A
+solução a que chegaram foi um módulo do kernel destinado a se conectar à
+estrutura do Linux Security Module (LSM); esse módulo poderia ser configurado
+para dar a aplicativos específicos acesso ao escalonador de tempo real. Esse
+módulo foi implementado e enviado para a lista de discussão linux-kernel, onde
+imediatamente encontrou problemas.
+
+Para os desenvolvedores de áudio, esse módulo de segurança era suficiente para
+resolver o problema imediato deles. Para a comunidade mais ampla do kernel, no
+entanto, ele foi visto como um uso indevido da estrutura LSM (que não tem a
+intenção de conceder privilégios a processos que eles de outra forma não
+teriam) e um risco para a estabilidade do sistema. As soluções preferidas da
+comunidade envolviam o acesso ao escalonamento de tempo real via mecanismo
+rlimit a curto prazo, e o trabalho contínuo de redução de latência a longo prazo.
+
+A comunidade de áudio, no entanto, não conseguia enxergar além da solução
+específica que havia implementado; eles não estavam dispostos a aceitar
+alternativas. O desacordo resultante deixou esses desenvolvedores sentindo-se
+desiludidos com todo o processo de desenvolvimento do kernel; um deles voltou
+para uma lista de áudio e postou isto:
+
+  "Existe um bom número de desenvolvedores muito bons no kernel Linux, mas eles
+  tendem a ser abafados por uma grande multidão de tolos arrogantes. Tentar
+  comunicar os requisitos dos usuários a essas pessoas é uma perda de tempo.
+  Eles são 'inteligentes' demais para ouvir os meros mortais."
+
+(https://lwn.net/Articles/131776/).
+
+A realidade da situação era diferente; os desenvolvedores do kernel estavam muito
+mais preocupados com a estabilidade do sistema, com a manutenção a longo prazo e
+em encontrar a solução correta para o problema do que com um módulo específico.
+A moral da história é focar no problema — e não em uma solução específica — e
+discuti-lo com a comunidade de desenvolvimento antes de investir na criação de
+um conjunto de códigos.
+
+Portanto, ao contemplar um projeto de desenvolvimento do kernel, deve-se
+obter respostas para um pequeno conjunto de perguntas:
+
+ - Qual é, exatamente, o problema que precisa ser resolvido?
+
+ - Quem são os usuários afetados por esse problema? Quais casos de uso a
+   solução deve abranger?
+
+ - De que forma o kernel deixa a desejar em resolver esse problema atualmente?
+
+Só então faz sentido começar a considerar possíveis soluções.
+
+
+Discussão inicial
+-----------------
+
+Ao planejar um projeto de desenvolvimento do kernel, faz todo o sentido realizar
+discussões com a comunidade antes de iniciar a implementação. A comunicação
+inicial pode economizar tempo e problemas de várias maneiras:number of ways:
+
+ - Pode muito bem ser que o problema já seja tratado pelo kernel de maneiras
+   que você não compreendeu. O kernel Linux é grande e possui uma série de
+   recursos e capacidades que não são imediatamente óbvios. Nem todas as
+   capacidades do kernel são documentadas tão bem quanto se gostaria, e é fácil
+   deixar passar algumas coisas. Este autor já viu a postagem de um driver
+   completo que duplicava um driver existente do qual o novo autor não tinha
+   conhecimento. Códigos que reinventam as rodas existentes não são apenas um
+   desperdício; eles também não serão aceitos no kernel principal (*mainline*).
+
+ - Pode haver elementos na solução proposta que não serão aceitáveis para a
+   integração no kernel principal . É melhor descobrir problemas
+   como este antes de escrever o código.
+
+ - É inteiramente possível que outros desenvolvedores já tenham pensado sobre
+   o problema; eles podem ter ideias para uma solução melhor e podem estar
+   dispostos a ajudar na criação dessa solução.
+
+Anos de experiência com a comunidade de desenvolvimento do kernel ensinaram uma
+lição clara: códigos do kernel que são projetados e desenvolvidos a portas
+fechadas invariavelmente apresentam problemas que só são revelados quando o
+código é lançado na comunidade. Às vezes, esses problemas são graves, exigindo
+meses ou anos de esforço antes que o código possa ser adequado aos padrões da
+comunidade do kernel. Alguns exemplos incluem:
+
+ - A pilha de rede Devicescape foi projetada e implementada para sistemas
+   monoprocessados. Ela não pôde ser integrada ao kernel principal (*mainline*)
+   até que fosse adaptada para sistemas multiprocessados. Ajustar retroativamente
+   mecanismos de travamento (*locking*) e afins em um código é uma tarefa difícil;
+   como resultado, a integração desse código (hoje chamado mac80211) foi atrasada
+   por mais de um ano.
+
+ - O sistema de arquivos Reiser4 incluía uma série de capacidades que, na
+   opinião dos desenvolvedores principais do kernel, deveriam ter sido
+   implementadas na camada de sistema de arquivos virtual (*Virtual Filesystem*
+   ou VFS). Ele também incluía recursos que não podiam ser facilmente
+   implementados sem expor o sistema a travamentos mútuos (*deadlocks*) causados
+   pelo usuário. A revelação tardia desses problemas — e a recusa em corrigir
+   alguns deles — fez com que o Reiser4 permanecesse fora do kernel principal
+   (*mainline*).
+
+ - O módulo de segurança AppArmor fazia uso de estruturas de dados internas
+   do sistema de arquivos virtual de maneiras que eram
+   consideradas inseguras e não confiáveis. Essa preocupação (entre outras)
+   manteve o AppArmor fora do kernel principal (*mainline*) por anos.
+
+In each of these cases, a great deal of pain and extra work could have been
+avoided with some early discussion with the kernel developers.
+
+
+Como encontrar os mantenedores?
+-------------------------------
+
+Quando os desenvolvedores decidem tornar seus planos públicos, a próxima
+pergunta será: por onde começamos? A resposta é encontrar a(s) lista(s) de
+discussão correta(s) e o mantenedor adequado. Para listas de discussão, a
+melhor abordagem é procurar no arquivo MAINTAINERS por um local relevante para
+postar. Se houver uma lista de subsistema adequada, postar nela costuma ser
+preferível a postar na linux-kernel; é mais provável que você alcance
+desenvolvedores com experiência no subsistema relevante e o ambiente pode ser
+mais acolhedor.
+
+Encontrar os mantenedores pode ser um pouco mais difícil. Novamente, o arquivo
+MAINTAINERS é o lugar para começar. No entanto, esse arquivo tende a não estar
+sempre atualizado, e nem todos os subsistemas estão representados ali. A
+pessoa listada no arquivo MAINTAINERS pode, na verdade, não ser quem está
+atuando nessa função atualmente. Portanto, quando houver dúvidas sobre quem
+contactar, um truque útil é usar o git (e o "git log" em particular) para ver
+quem está ativo no momento dentro do subsistema de interesse. Observe quem
+está escrevendo os patches e quem, se houver alguém, está anexando linhas
+"Signed-off-by" a esses patches. Essas são as pessoas que estarão em melhor
+posição para ajudar com um novo projeto de desenvolvimento.
+
+A tarefa de encontrar o mantenedor correto às vezes é desafiadora o suficiente
+para que os desenvolvedores do kernel tenham adicionado um script para facilitar
+o processo:
+
+::
+
+	.../scripts/get_maintainer.pl
+
+Este script retornará o(s) mantenedor(es) atual(is) para um determinado arquivo
+ou diretório quando fornecida a opção "-f". Se receber um patch na linha de
+comando, ele listará os mantenedores que provavelmente devem receber cópias do
+patch. Esta é a maneira preferencial (ao contrário da opção "-f") de obter a
+lista de pessoas para incluir em cópia (Cc) nos seus patches. Há uma série de
+opções que regulam o quão profundamente o get_maintainer.pl buscará por
+mantenedores; por favor, tenha cuidado ao usar as opções mais agressivas, pois
+você pode acabar incluindo desenvolvedores que não têm interesse real no código
+que você está modificando.
+
+Se tudo mais falhar, falar com Andrew Morton pode ser uma maneira eficaz de
+rastrear um mantenedor para um trecho específico de código.
+
+
+Quando postar?
+--------------
+
+Se possível, postar seus planos durante os estágios iniciais só pode
+ser útil. Descreva o problema que está sendo resolvido e quaisquer
+planos que tenham sido feitos sobre como a implementação será feita.
+Qualquer informação que você possa fornecer pode ajudar a comunidade de
+desenvolvimento a dar contribuições úteis sobre o projeto.
+
+Uma coisa desanimadora que pode acontecer neste estágio não é uma
+reação hostil, mas, em vez disso, pouca ou nenhuma reação. A triste
+verdade sobre o assunto é que (1) os desenvolvedores do kernel tendem a
+estar ocupados, (2) não há escassez de pessoas com planos grandiosos e
+pouco código (ou mesmo perspectiva de código) para apoiá-los, e (3)
+ninguém é obrigado a revisar ou comentar sobre ideias postadas por
+outros. Além disso, designs de alto nível frequentemente escondem
+problemas que só são revelados quando alguém realmente tenta
+implementar esses designs; por essa razão, os desenvolvedores do kernel
+preferem ver o código.
+
+Se uma postagem de pedido de comentários (RFC) render poucos
+comentários, não presuma que isso significa que não há interesse no
+projeto. Infelizmente, você também não pode presumir que não há
+problemas com sua ideia. A melhor coisa a fazer nesta situação é
+prosseguir, mantendo a comunidade informada à medida que avança.
+
+
+Obter a aprovação oficial
+-------------------------
+
+Se o seu trabalho estiver sendo realizado em um ambiente corporativo  como é o
+caso da maior parte do trabalho no kernel do Linux —, você deve, obviamente, ter
+a permissão de gerentes devidamente autorizados antes de poder publicar os
+planos ou o código da sua empresa em uma lista de discussão pública.
+A publicação de código que não tenha sido liberado para lançamento sob uma
+licença compatível com a GPL pode ser especialmente problemática; quanto mais
+cedo a gerência e a equipe jurídica de uma empresa puderem entrar em acordo
+sobre a publicação de um projeto de desenvolvimento do kernel, melhor será para
+todos os envolvidos.
+
+Alguns leitores podem estar pensando, neste ponto, que o seu trabalho no kernel
+se destina a dar suporte a um produto que ainda não tem uma existência oficialmente
+reconhecida. Revelar os planos de seu empregador em uma lista de discussão pública
+pode não ser uma opção viável. Em casos como esse, vale a pena considerar se o
+segredo é realmente necessário; muitas vezes não há uma real necessidade de manter
+os planos de desenvolvimento a portas fechadas.
+
+Dito isso, também existem casos em que uma empresa legitimamente não pode
+revelar seus planos logo no início do processo de desenvolvimento. Empresas com
+desenvolvedores de kernel experientes podem optar por prosseguir de maneira isolada
+(em "malha aberta"), partindo do pressuposto de que serão capazes de evitar problemas
+graves de integração mais tarde. Para empresas que não possuem esse tipo de expertise
+interna, a melhor opção costuma ser a contratação de um desenvolvedor externo para
+revisar os planos sob um acordo de confidencialidade (NDA). A Linux Foundation opera
+um programa de NDA projetado para ajudar nesse tipo de situação; mais informações
+podem ser encontradas em:
+
+    https://www.linuxfoundation.org/nda/
+
+Esse tipo de revisão costuma ser suficiente para evitar problemas graves mais
+tarde, sem a necessidade de uma divulgação pública do projeto.
diff --git a/Documentation/translations/pt_BR/process/development-process.rst b/Documentation/translations/pt_BR/process/development-process.rst
index 737fdcdff..599c34c85 100644
--- a/Documentation/translations/pt_BR/process/development-process.rst
+++ b/Documentation/translations/pt_BR/process/development-process.rst
@@ -19,3 +19,4 @@ conhecimento profundo de programação de kernel para ser compreendida.
 
    1.Intro
    2.Process
+   3.Early-stage
-- 
2.47.3

