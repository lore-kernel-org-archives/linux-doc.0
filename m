Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8112F3659FD
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 23:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790638248; cv=none; b=O29zt8NR95QdpKeceaHOh1YGpaNSNvutUBaSQp9w05Vw8AJng/ka1R49AcQsVUid4matyrEP7xQzOePA1uWr+EoPoLv75ReEFXE9M28jIFvlOlEZxgqdmSlpV9fkzL6IIXAG9AGwqctsP+NcT1qw9+jOkXY7iNQVb/v0OOhHmA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790638248; c=relaxed/simple;
	bh=OzDAY2I7LufivK4UxUrTWFZ/MsKdm0gWbG6+5wrqv88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YT9OPQPKKRzTyW+7Qg1sv/f1K5XSdwTaurC0fIzmXWfCOl8d3Wa+f8Y3SbjcD0z4GHNY9xYyE33Sf/M6Ml8pSdIVktPQKvpzYsgs1LRv3M1YvV+xaPvUVhH6AtU26r07AYBqdV9IAlQfwegsqXc0r7pp+M/Uo4JK6jOSqZ/FqY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKbWtQO8; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKbWtQO8"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c8c8602so1978042241.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 16:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790638245; x=1791243045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=flXZGecpJiibBYUKIj1d1h8cAemQfACNBX/8mNTzX8g=;
        b=eKbWtQO8E6VIbWsfKtuWsPmDHhIh+9ur9YLB0Pde9yEnT8i3sKJMBqt4lPwkL81OnU
         5/NtoWViRhBPOq6p58G27/dthXWq0tI0WwGjb7x2dpXKNqQjpUq91KSzyZGjBWTtOvXz
         ltho1mgbXdXAYlK05cIefddf4nyBsRxT3cBvNFYXkvWMUd3Ay0QXV/O4pouheuwNlTgU
         ED+h1Qy08wbhnwXsFJA4PLzsZcCNP5Q1/V8xvhGZLvnnSTRLDIdeN2CvCsti8mvrXnep
         Z7tIXRxX5u6mcI7tRoNjCoWgO8xEXnsrhYhYQ8OH+YqDNNsj01Q7QET7fkgZO/1fPCt5
         9rUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790638245; x=1791243045;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=flXZGecpJiibBYUKIj1d1h8cAemQfACNBX/8mNTzX8g=;
        b=DEhoyL6sBJSiIqa/C+F3SmVSCfYi02Z75UJzC2QctP/QcBzHtLsr2r9WrVycdtjGev
         fd8D6wUOL6AarPRlOH8yoQ/LOCCmMZ+6o493Hi3m+GxCkmZXjM5aZJZk1vfeUrWyELm2
         2aDtfUk11sac8/kdCNG4+vHwvB+V8EgazExeks8bDXJLyygKGzzaOo2Qwv2J4OfsycNu
         OHHnBp3lnk87DCY9Dn/L5kwYs/RWD+U8ZgHnN0DHH6LB3k8Ih6xswi3NUG4r+9Na/qCX
         pLgqxXThubBGC31AaMd7ivFeKHnMFMekfHJ95OzqwZXwmpXAk8KxVWFCat6RT/s7W82p
         1UTw==
X-Forwarded-Encrypted: i=1; AKwUvBwHFK+IAIzgs9SEEbBZjaDTdV3uLvi22pYsIuQgJ0Pyeg/Jx5M7ZJ2hzJyE7ZIH8Osz5aP9+gxu/HU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9l4mzh3MwTNQWaKe7GjvkRWmLoM4Wf/oAEec4BGuf7v4kyTAQ
	L19o5EbSCI2X8vy9ddpbRWGLW+TjS8YzgavYS7Z63W3kqETIY3iOByWmNSVRU2P1vyJYjg==
X-Gm-Gg: AYBFou1Ymg/gKWUdyPXpLiBf4S1Isf8gKo2vOuakwCXXdSMHYrSwF5CBTm8UrOH36Fr
	2FJEeULrBFfJMui8us6Hx0E2YpQ/27kOrXXwDv2Pw2iJyVrEsY+cxFaQC7Ij828Q2uqgtVk25n7
	OOlFEoz0ys4nO4FGB1S+nhDdv6Kpp07ES4E5A5UbBw9U/q50xlsOzoZB76WlQHs1t2BYv/aoliu
	Lu2VOAJhxz7o18cBa0oow6q52bSK/LtPFgcjFu7yLjzBhZ79dEmnLdh2VHZR2Joab+7vyxVMdS8
	U0MmqSnbGgGr6pubJPVebMe81H0Z7+TunCS6k7s9B/5U2Th/Fz/RvR2Lu1gRs0bg7uFRvs19RNG
	i53qXsiQ8V71csjCpgnkAamxeQxu94eOwYmo3cpJ4Fs/yVQ/kF4YO1Ru8S7mq1DPgyGz7IAKEvE
	sEqqqLUaAN0vdIG3ObXRcNiFnamimwdlUYZ+eLi8KawjG5/38eThIte+e1gL3ylaFmV3CV01HTz
	Ze4lxRQ4KAc934wjT4=
X-Received: by 2002:a05:6102:2c8d:b0:7a8:2a34:433a with SMTP id ada2fe7eead31-7af1cc9e2b6mr5911559137.9.1790638244898;
        Mon, 28 Sep 2026 16:30:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f0:9f80:d603:1b50:208b:30cc:3568])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde5679b3csm10618956e0c.7.2026.09.28.16.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:30:44 -0700 (PDT)
From: vinihsr <vinicius.m1821@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinicius Henrique <vinicius.m1821@gmail.com>
Subject: [PATCH v4] docs: translations: pt_BR: translate threat-model.rst
Date: Mon, 28 Sep 2026 20:25:40 -0300
Message-Id: <20260928232540.51083-1-vinicius.m1821@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923025148.35637-1-vinicius.m1821@gmail.com>
References: <20260923025148.35637-1-vinicius.m1821@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate threat-model.rst into Brazilian Portuguese,
maintaining consistency with original formatting rules.
And add it to the pt_BR process documentation index.

Assisted-by: LLM
Signed-off-by: Vinicius Henrique <vinicius.m1821@gmail.com>
---
Changes in v4:  
- Removing the '=' commited by accident.  
- Standardized terminology ("namespace de usuário", "não responsivo").  
- v3: https://lore.kernel.org/r/20260923025148.35637-1-vinicius.m1821@gmail.com 

 .../translations/pt_BR/process/index.rst      |   1 +
 .../pt_BR/process/threat-model.rst            | 259 ++++++++++++++++++
 2 files changed, 260 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/threat-model.rst

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index 2c63d82bf..de716743e 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -78,6 +78,7 @@ gerenciamento de bugs e vulnerabilidades.
    :maxdepth: 1
 
    Falhas de segurança <security-bugs>
+   Modelo de ameaças do kernel do Linux <threat-model>
    Problemas de hardware sob embargo <embargoed-hardware-issues>
    CVEs <cve>
 
diff --git a/Documentation/translations/pt_BR/process/threat-model.rst b/Documentation/translations/pt_BR/process/threat-model.rst
new file mode 100644
index 000000000..079c72973
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/threat-model.rst
@@ -0,0 +1,259 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+O modelo de ameaças do kernel do Linux
+======================================
+
+Existem muitas suposições sobre o que o kernel protege e o que não protege.
+Essas suposições tendem a causar confusão nos relatórios de bugs
+(:doc:`relacionados à segurança <security-bugs>` vs :doc:`não relacionados à
+segurança <../../../admin-guide/reporting-issues>`), e podem complicar a
+aplicação das medidas de segurança quando as responsabilidades por certos
+limites não estão claras entre o kernel, as distribuições, os administradores e
+os usuários.
+
+Este documento tenta esclarecer as responsabilidades do kernel neste domínio.
+
+As responsabilidades do kernel
+------------------------------
+
+O kernel abstrai o acesso aos recursos de hardware locais e a sistemas remotos
+de forma a permitir que múltiplos usuários locais obtenham uma parcela justa dos
+recursos disponíveis concedidos a eles e, quando o hardware subjacente permitir,
+atribuam um nível de confidencialidade às suas comunicações e aos dados que
+estão processando ou armazenando.
+
+O kernel presume que o hardware subjacente se comporta de acordo com suas
+especificações. Isso inclui a integridade do conjunto de instruções da CPU, a
+transparência da unidade de previsão de desvios e das unidades de cache, a
+consistência da Unidade de Gerenciamento de Memória (MMU), o isolamento de
+periféricos com capacidade de DMA (por exemplo, via IOMMU), transições de estado
+nos controladores, intervalos de valores lidos dos registradores, o respeito às
+limitações de hardware documentadas, etc.
+
+Quando o hardware não consegue manter o isolamento especificado (por exemplo,
+falhas na CPU, canais laterais, resposta do hardware a entradas inesperadas), o
+kernel geralmente tenta implementar medidas de mitigação razoáveis. Trata-se de
+medidas de melhor esforço destinadas a reduzir a superfície de ataque ou elevar
+o custo de um ataque dentro dos limites dos recursos do hardware; elas não
+constituem uma garantia de segurança fornecida pelo kernel.
+
+Os usuários sempre realizam suas atividades sob a autoridade de um administrador
+capaz de conceder ou negar vários tipos de permissões que podem afetar a forma
+como os usuários se beneficiam dos recursos disponíveis ou o nível de
+confidencialidade de suas atividades. Os administradores também podem delegar
+todas ou parte de suas próprias permissões a alguns usuários, particularmente
+por meio de capacidades (capabilities), mas não apenas. Tudo isso é realizado
+por meio de configuração (sysctl, permissões do sistema de arquivos, etc.).
+
+O kernel do Linux aplica um determinado conjunto de configurações padrão que
+correspondem ao seu modelo de ameaças. As distribuições têm seu próprio modelo
+de ameaças e vêm com suas próprias predefinições de configuração, as quais o
+administrador pode ter que ajustar para melhor atender às suas expectativas
+(flexibilizar ou restringir).
+
+Por padrão, o kernel do Linux garante as seguintes proteções ao ser executado em
+processadores comuns que possuem níveis de privilégio e unidades de
+gerenciamento de memória:
+
+* **Isolamento baseado no usuário**: um usuário sem privilégios pode restringir
+  o acesso aos seus próprios dados por parte de outros usuários sem privilégios
+  que estejam executando no mesmo sistema. Isso inclui:
+
+  * dados armazenados, por meio de permissões do sistema de arquivos
+  * dados na memória (as páginas não são acessíveis, por padrão, a outros
+    usuários)
+  * atividade do processo (o ptrace não é permitido a outros usuários)
+  * comunicação entre processos (outros usuários não podem observar os dados
+    trocados por meio de UNIX domain sockets ou outros mecanismos de IPC).
+  * comunicações de rede dentro do mesmo sistema ou com outros sistemas
+
+* **Proteção baseada em capacidades**:
+
+  * usuários que não possuam capacidades elevadas (incluindo, mas não se
+    limitando a CAP_SYS_ADMIN) não podem alterar a configuração, a memória nem o
+    estado do kernel, modificar a visão de outros usuários sobre o layout do
+    sistema de arquivos, conceder a qualquer usuário capacidades que ele não
+    possua, nem afetar a disponibilidade do sistema (desligamento,
+    reinicialização, pânico, travamento ou tornar o sistema não responsivo por
+    esgotamento ilimitado de recursos).
+  * usuários que não possuam a capacidade ``CAP_NET_ADMIN`` não podem alterar a
+    configuração de rede, interceptar nem falsificar comunicações de rede de
+    outros usuários ou sistemas.
+  * usuários que não possuam ``CAP_SYS_PTRACE`` não podem observar as atividades
+    dos processos de outros usuários.
+
+Quando ``CONFIG_USER_NS`` está definido, o kernel também permite que usuários
+sem privilégios criem seu próprio namespace de usuário, no qual possuem todas as
+capacidades, mas com algumas restrições (eles não podem realizar ações que
+tenham impacto no namespace de usuário inicial, como alterar a hora, carregar
+módulos ou montar dispositivos de bloco). Consulte ``user_namespaces(7)`` para
+obter mais detalhes; as possibilidades dos namespaces de usuário não são
+abordadas neste documento.
+
+O kernel também oferece diversos recursos de solução de problemas e depuração,
+os quais podem constituir vetores de ataque quando caem em mãos erradas. Embora
+alguns deles tenham sido projetados para serem acessíveis a usuários locais
+comuns com baixo risco (por exemplo, logs do kernel via ``/dev/kmsg``), alguns
+exporiam informações suficientes para representar um risco na maioria dos casos,
+e a decisão de expô-los é de responsabilidade do administrador (eventos perf,
+rastreamentos), e outros não foram projetados para serem acessados por usuários
+sem privilégios (por exemplo, debugfs). O acesso a esses recursos por um usuário
+que tenha recebido permissão explícita de um administrador não constitui uma
+violação de segurança.
+
+Bugs que permitem violar os princípios acima constituem brechas de segurança.
+No entanto, bugs que permitem uma violação somente após outra já ter sido
+alcançada são apenas pontos fracos. O kernel aplica uma série de medidas de
+autoproteção cujo objetivo é evitar que um limite de segurança seja ultrapassado
+quando certas classes de bugs são encontradas, mas uma falha nessas proteções
+adicionais não constitui, por si só, uma vulnerabilidade.
+
+Quais classes de problemas não são consideradas vulnerabilidades
+----------------------------------------------------------------
+
+No modelo de ameaças do kernel do Linux, as seguintes classes de problemas
+**NÃO** são consideradas vulnerabilidades do kernel do Linux. No entanto,
+quando se acredita que o kernel poderia ser melhor, eles devem ser relatados,
+para que possam ser analisados e corrigidos sempre que razoavelmente possível,
+mas serão tratados como qualquer bug comum:
+
+* **Configuração**:
+
+  * kernels desatualizados e, particularmente, ramos em fim de vida útil estão
+    fora do escopo do modelo de ameaças do kernel: os administradores são
+    responsáveis por manter seus sistemas atualizados. Para que um bug seja
+    qualificado como uma vulnerabilidade, deve ser demonstrado que ele afeta
+    versões mantidas ativamente.
+
+  * nível de compilação: alterações na configuração do kernel que estejam
+    explicitamente documentadas como redutoras do nível de segurança (por
+    exemplo, ``CONFIG_NOMMU``), ou destinadas apenas a desenvolvedores.
+
+  * nível do sistema operacional: alterações nos parâmetros da linha de comando,
+    sysctls, permissões do sistema de arquivos, capacidades do usuário, e
+    exposição de interfaces privilegiadas que aumentem explicitamente a
+    exposição, seja oferecendo acesso não padrão a usuários sem privilégios,
+    seja reduzindo a capacidade do kernel de aplicar algumas proteções ou
+    medidas de mitigação. Exemplo: acesso de gravação ao procfs ou ao debugfs.
+
+  * problemas acionados apenas ao usar recursos destinados ao desenvolvimento ou
+    depuração (por exemplo, LOCKDEP, KASAN, FAULT_INJECTION): sabe-se que esses
+    recursos introduzem sobrecarga e instabilidade potencial e não se destinam
+    ao uso em produção.
+
+  * problemas que afetam drivers expostos sob CONFIG_STAGING, bem como recursos
+    marcados como EXPERIMENTAL na configuração.
+
+  * carregamento de módulos explicitamente inseguros/quebrados/staging
+    e, de modo geral, qualquer uso de subsistema marcado como experimental ou
+    não destinado ao uso em produção.
+
+  * execução de módulos fora da árvore ou forks não oficiais do kernel;
+    esses casos devem ser relatados ao fornecedor relevante.
+
+* **Excesso de privilégios iniciais**:
+
+  * ações realizadas por um usuário que já possui os privilégios necessários
+    para executar essa ação ou modificar esse estado (por exemplo,
+    ``CAP_SYS_ADMIN``, ``CAP_NET_ADMIN``, ``CAP_SYS_RAWIO``, ``CAP_SYS_MODULE``,
+    sem que nenhum outro limite seja ultrapassado).
+
+  * ações realizadas em um namespace de usuário que não contornam as restrições
+    impostas ao usuário inicial (por exemplo, uso de ptrace, envio de sinais,
+    uso de recursos, acesso a FS/dispositivo/sysctl/memória, vínculo de rede,
+    configuração do sistema/rede, etc.).
+
+  * qualquer ação realizada pelo usuário root no namespace inicial (por exemplo,
+    um oops do kernel ao gravar em um dispositivo privilegiado).
+
+* **Fora do uso em produção**:
+
+  Isso abrange ataques teóricos/probabilísticos que dependem de condições de
+  laboratório com ruído zero no sistema, ou aqueles que exigem um número
+  irrealista de tentativas (por exemplo, bilhões de tentativas) que seriam
+  detectadas pelo monitoramento padrão do sistema muito antes do sucesso,
+  tais como:
+
+  * previsão de números aleatórios que só funciona em um ambiente totalmente
+    silencioso (como ID de IP, portas TCP ou números de sequência que só podem
+    ser adivinhados em laboratório).
+
+  * observação de atividades e vazamentos de informações com base em abordagens
+    probabilísticas que são suscetíveis a ruído de medição e não são
+    realisticamente reproduzíveis em um sistema de produção.
+
+  * problemas que só podem ser desencadeados por ataques intensos (por exemplo,
+    força bruta) cujo impacto no sistema torna improvável ou impossível
+    permanecerem indetectáveis antes de serem bem-sucedidos (por exemplo,
+    consumir toda a memória antes de ter sucesso).
+
+  * problemas observados apenas em simuladores de desenvolvimento, emuladores ou
+    combinações que não existem em sistemas reais no momento do relato
+    (problemas envolvendo dezenas de milhões de threads, dezenas de milhares de
+    CPUs, frequências de CPU irrealistas, tamanhos de RAM ou capacidades de
+    disco, velocidades de rede).
+
+  * bem como problemas que podem ser acionados a um custo que é ordens de
+    magnitude superior aos benefícios esperados (por exemplo, um emulador de
+    teclado totalmente funcional apenas para recuperar 7 bytes não inicializados
+    em uma estrutura, ou um método de força bruta envolvendo milhões de
+    tentativas de conexão para adivinhar um número de porta).
+
+* **Falhas de fortificação (hardening)**:
+
+  * capacidade de contornar algumas das medidas de fortificação do kernel sem um
+    caminho de exploração demonstrável (por exemplo, contorno de ASLR,
+    sincronização de eventos ou sondagem sem consequências demonstráveis).
+    Trata-se apenas de pontos fracos, não de vulnerabilidades.
+
+  * falta de verificações de argumentos e falha ao relatar certos erros sem
+    consequências imediatas.
+
+* **Vazamentos aleatórios de informações**:
+
+  Isso diz respeito a vazamentos de pequenas partes de dados que simplesmente
+  estão presentes e que não podem ser escolhidas pelo invasor, ou que enfrentam
+  restrições de acesso:
+
+  * preenchimento (padding) de estruturas relatado por chamadas de sistema ou
+    outras interfaces.
+
+  * identificadores, dados parciais, strings não terminadas relatadas em
+    mensagens de erro.
+
+  * Vazamentos de endereços/ponteiros de memória do kernel não constituem um
+    vetor imediatamente explorável e não são vulnerabilidades, embora devam ser
+    relatados e corrigidos.
+
+* **Dispositivos e mídias em não conformidade**:
+
+  Os drivers são implementados com base em uma especificação. Quando um
+  dispositivo ou mídia de armazenamento viola a especificação para a qual o seu
+  driver foi escrito, o mau comportamento resultante é um bug comum a ser
+  corrigido, não uma vulnerabilidade, a menos que o driver esteja
+  especificamente documentado como sendo fortificado contra entradas hostis. Os
+  seguintes casos, portanto, não são considerados vulnerabilidades:
+
+  * bugs desencadeados pela montagem de uma imagem de sistema de arquivos
+    corrompida ou criada de forma maliciosa: a montagem de um dispositivo de
+    bloco é uma operação privilegiada (veja acima), e o administrador é
+    responsável pela mídia que ele monta. Isso inclui problemas que são
+    resolvidos, mitigados ou detectados pela execução de uma verificação de
+    consistência do sistema de arquivos (fsck) na imagem antes da montagem.
+
+  * bugs cuja reprodução requer modificação de hardware ou emulação,
+    incluindo dispositivos USB falsos que se passam por outros, ou
+    dispositivos que relatam valores fora dos seus limites documentados.
+
+* **Acesso físico**:
+
+  Problemas que exigem acesso físico à máquina, modificação de hardware ou o uso
+  de hardware especializado (por exemplo, analisadores lógicos, ferramentas de
+  ataque DMA via PCI-E/Thunderbolt) estão fora do escopo, a menos que o sistema
+  esteja explicitamente configurado com tecnologias destinadas a defender contra
+  tais ataques (por exemplo, IOMMU).
+
+* **Regressões funcionais e de desempenho**:
+
+  Qualquer problema que possa ser mitigado pela definição de permissões e
+  limites adequados não se qualifica como uma vulnerabilidade.
-- 
2.34.1
