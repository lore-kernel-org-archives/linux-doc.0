Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC2B4AA56B
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 11:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064079; cv=none; b=nCyVBjWq2hm8cVRbLfP/oLSbXE/PzjvDbtzfiFLU6Zwzdm96R80R0B5Gh3o2RKqZLTk6CV3OYh+vifXb0msODvsxfmBrrue1gNbvFk/fNbdJu/zjWrCviNd+vIr+ccl1JULFdigKscm67QALMQcA0iCCQEjyirw0o2uNA+8yDxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064079; c=relaxed/simple;
	bh=32TjjRMMJ7+KKnLyboqWQUrK9OCoGxunEEm//YiqimY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VJbTnQfQQxJJsAFhXLOGcg+GUHmEGOiqoMdovgiUzZyhKl/rb0b+/FarRC+Ba0wR0sKZssq0+8sI1zP0HtktBjNwJXnrT/e2s4Z0PodB/VGuauDdMORrqXjlkip49Z+sM3gdrGD09V05BnHM5VesgA4iW1nl7io9q0fZkCAmwJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eW2+m7HW; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eW2+m7HW"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3862330eec.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 04:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792064071; x=1792668871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ogfvfPGqo9zzMz+pM15R7UNKVXaOckp2kbIMPMixs0U=;
        b=eW2+m7HWRtaFvnT2J4I0JnfM9e54URnOfWqril2Dn4M7UIqBRHguFDhCou4hMqzQIk
         FG1u27VQ0YH69RDc15seACEApl1vDUhCWgeovnESEP/hrHRNSBU0VU2pMW1e+lmvUhZa
         S8GI3ccAuOUk9ZSPqFMTcNybJK5kS4wUFeFxj75psaoVy2YBllcFvOr6CwrPe4zBeKoe
         ZEeMqF/i/MU5ptfqGXW3mtygoYdEXp2j+P/90SjFmND+0fl6kZc4Fg1M2WpuVkmXdstG
         h66wvLH+DIgivd5mbVuRXULOJM+M3FjLYNLQocWMXfVEeNeXiXUz/cS40NbY2P09byXc
         lcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064071; x=1792668871;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ogfvfPGqo9zzMz+pM15R7UNKVXaOckp2kbIMPMixs0U=;
        b=YNZbr8BE/Eaew8VF3O9liXqjh6YIfFKIutaLtsgE4Tg8km6nPCrTa7H952ZYlewEJO
         VdHJra1gM7WbEO3KbLJugZqTIi63RYCwMwau2Jx7br5ddIBAygdE63UCreEVMEtmKq0Q
         FHJmDtSF+btjugtfyuD6xkC2Dv5/Ibpkw+USguTwcFFvCv/hjAz31k31NGJ9noFPJS79
         mUnN9zG7s0CER1uf8nmAZCg1xp2J3YWuIDRKuYOSv0QV6YWPU/az7PzQ0iYCa0ldP9nL
         qdRIaJe46QijTunVSFBXWj6Vt3o7qnQE5xG2zdqdrlvLdTuewu9fE3+2a+yVojOqcdEX
         5i4w==
X-Gm-Message-State: AFq9FYL4nZ6jmW3Y2k9rUXkKDoEFqqFgRYa2o5eKaMdBuMuGNaTYPQED
	xMm5No7ljKsNIrmh7m/wJcPhKG4XfRBXi6VmsIsvPsNuImkuHBGmEQKOgZI1STr1
X-Gm-Gg: AYBFou12tRmq+cCDKyhumVJKfREDq+KNjzAdZQWdlVhBNqRYq7uRlFCUdUbTinDROab
	qBz/QWPnW9F/V376xzddNM9dC1f4p04NIgWLaK3zvsYqHM06zRxsZG6jsmCB5QUxKurHp8KJ+XA
	Q6f+2h2tKnj6VdvOptaIe34o4UpdqZNueSw6M0kQjYNIEjFtQdAxAVOx0K1nesil/SOPLiZqITu
	raMnh2dQ/wEWKwm/ZXz8fnUvzd5ExI3VtmxZlkmlJ+4bgPnV2F5JtnVDKWyOZtG3l9r50bKr7F5
	wDHYipGeSxee/zt6d7yyhhTXDc5YEOdZsumWqeUkHTHIwtYs19XT4Cwe7+ug7eT96qIsWnhGBxC
	iAbxqWPX1c7uFos2vLkoQXGnUBDT/iRY3nxIeKS838rJ9fd94OIffoOnrtjZ36YOEPwKRPwLKjd
	stK7M3yZhygklMKBaNWAF+QdY6Ce3Hm2NpC0YboMThKrdVmhQMXcUWv8AEiv1W2KpsHVXDFeM7C
	BVrn3EuFcUaeku+fSwv1GMDfKL7rxdRXBwW/b2VGOJUGvUApWwKPWPkxpdDtXgBcsT/X4WK8LNZ
	G4lG1yUF5fdw85Po1I/fMcce
X-Received: by 2002:a05:693c:895a:20b0:351:f762:a10c with SMTP id 5a478bee46e88-3537dc3ca81mr25473838eec.0.1792064070196;
        Thu, 15 Oct 2026 04:34:30 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm69156913eec.3.2026.10.15.04.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:34:29 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH v2 07/10] docs/translations/pt_BR: admin-guide: add perf-security.rst
Date: Thu, 15 Oct 2026 08:31:15 -0300
Message-ID: <20261015113121.4550-8-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015113121.4550-1-danielmaraboo@gmail.com>
References: <20261015113121.4550-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add translation of perf-security.rst to Portuguese and update
admin-guide/index.rst.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/admin-guide/index.rst  |   5 +-
 .../pt_BR/admin-guide/perf-security.rst       | 328 ++++++++++++++++++
 2 files changed, 329 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/perf-security.rst

diff --git a/Documentation/translations/pt_BR/admin-guide/index.rst b/Documentation/translations/pt_BR/admin-guide/index.rst
index 19678a358..264b3c1c8 100644
--- a/Documentation/translations/pt_BR/admin-guide/index.rst
+++ b/Documentation/translations/pt_BR/admin-guide/index.rst
@@ -50,10 +50,7 @@ Documentação relacionada à segurança:
 
    hw-vuln/index
    LSM/index
-
-Todolist:
-
-*   perf-security
+   perf-security
 
 Inicializando o kernel
 ----------------------
diff --git a/Documentation/translations/pt_BR/admin-guide/perf-security.rst b/Documentation/translations/pt_BR/admin-guide/perf-security.rst
new file mode 100644
index 000000000..7af45868a
--- /dev/null
+++ b/Documentation/translations/pt_BR/admin-guide/perf-security.rst
@@ -0,0 +1,328 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Segurança das ferramentas e eventos Perf
+========================================
+
+Visão geral
+-----------
+
+O uso dos Contadores de Desempenho para Linux (perf_events) [1]_ , [2]_ , [3]_
+pode impor um risco considerável de vazamento de dados confidenciais acessados
+por processos monitorados. O vazamento de dados é possível tanto em cenários de
+uso direto da API de chamadas de sistema perf_events [2]_ quanto por meio de
+arquivos de dados gerados pelo utilitário em modo de usuário da ferramenta
+Perf (Perf) [3]_ , [4]_ . O risco depende da natureza dos dados que as unidades
+de monitoramento de desempenho (PMU - Performance Monitoring Units) do
+perf_events [2]_ e o Perf coletam e expõem para análise de desempenho.
+Os dados de sistema e de desempenho coletados podem ser divididos em várias
+categorias:
+
+1. Dados de configuração de hardware e software do sistema, por exemplo: um
+   modelo de CPU e sua configuração de cache, a quantidade de memória disponível
+   e sua topologia, versões do kernel e do Perf utilizadas, configuração de
+   monitoramento de desempenho incluindo tempo de experimento, configuração de
+   eventos, parâmetros de linha de comando do Perf, etc.
+
+2. Caminhos de módulos de usuário e de kernel e seus endereços de carregamento com
+   tamanhos, nomes de processos e threads com seus PIDs e TIDs, registros de data
+   e hora (timestamps) para eventos capturados de hardware e software.
+
+3. Conteúdo de contadores de software do kernel (por exemplo, para trocas de contexto,
+   falhas de página, migrações de CPU), contadores arquiteturais de desempenho de
+   hardware (PMC) [8]_ e registradores específicos de modelo (MSR) [9]_ que fornecem
+   métricas de execução para várias partes monitoradas do sistema (por exemplo,
+   controlador de memória (IMC), interconexão (QPI/UPI) ou contadores uncore
+   periféricos (PCIe)) sem atribuição direta a qualquer estado de contexto de execução.
+
+4. Conteúdo de registradores de contexto de execução arquiteturais (por exemplo,
+   RIP, RSP, RBP em x86_64), endereços de memória e dados de espaço de usuário
+   e de kernel de processos, conteúdo de vários MSRs arquiteturais que capturam
+   dados desta categoria.
+
+Dados que pertencem à quarta categoria podem conter potencialmente dados confidenciais
+do processo. Se as PMUs em alguns modos de monitoramento capturam valores de registradores
+de contexto de execução ou dados da memória do processo, o acesso a esses modos de
+monitoramento precisa ser ordenado e protegido adequadamente. Portanto, as operações de
+monitoramento de desempenho e observabilidade do perf_events são objeto de gerenciamento
+de controle de acesso de segurança [5]_ .
+
+Controle de acesso do perf_events
+---------------------------------
+
+Para realizar verificações de segurança, a implementação do Linux divide os
+processos em duas categorias [6]_ : a) processos privilegiados (cujo ID de
+usuário efetivo é 0, chamados de superusuário ou root) e b) processos não
+privilegiados (cujo UID efetivo é diferente de zero). Processos privilegiados
+ignoram todas as verificações de permissão de segurança do kernel, de modo que
+o monitoramento de desempenho do perf_events está totalmente disponível para
+processos privilegiados sem restrições de acesso, escopo e recursos.
+
+Processos não privilegiados estão sujeitos a uma verificação completa de permissão
+de segurança com base nas credenciais do processo [5]_ (geralmente: UID efetivo,
+GID efetivo e lista de grupos suplementares).
+
+O Linux divide os privilégios tradicionalmente associados ao superusuário em
+unidades distintas, conhecidas como capacidades (capabilities) [6]_ , que podem
+ser habilitadas e desabilitadas independentemente por thread para processos e
+arquivos de usuários não privilegiados.
+
+Processos não privilegiados com a capacidade CAP_PERFMON habilitada são tratados
+como processos privilegiados em relação às operações de monitoramento de
+desempenho e observabilidade do perf_events, contornando, assim, as verificações
+de permissões de *escopo* no kernel. A CAP_PERFMON implementa o princípio do menor
+privilégio [13]_ (POSIX 1003.1e: 2.2.2.39) para operações de monitoramento de
+desempenho e observabilidade no kernel e fornece uma abordagem segura para o
+monitoramento de desempenho e observabilidade no sistema.
+
+Por motivos de compatibilidade retroativa, o acesso às operações de monitoramento
+e observabilidade do perf_events também é aberto para processos privilegiados com
+CAP_SYS_ADMIN, mas o uso de CAP_SYS_ADMIN para casos de uso de monitoramento e
+observabilidade seguros é desencorajado em relação à capacidade CAP_PERFMON.
+Se os registros de auditoria do sistema [14]_ para um processo usando a API de
+chamada de sistema perf_events contiverem registros de negação para a obtenção de
+ambas as capacidades CAP_PERFMON e CAP_SYS_ADMIN, fornecer ao processo apenas a
+capacidade CAP_PERFMON é recomendado como a abordagem segura preferida para resolver
+o log duplo de negação de acesso relacionado ao uso de monitoramento de desempenho
+e observabilidade.
+
+Antes do Linux v5.9, processos não privilegiados que usavam a chamada de sistema
+perf_events também estavam sujeitos à verificação do modo de acesso ptrace
+PTRACE_MODE_READ_REALCREDS [7]_ , cujo resultado determina se o monitoramento é
+permitido. Portanto, processos não privilegiados com a capacidade CAP_SYS_PTRACE
+recebiam permissão efetiva para passar na verificação. A partir do Linux v5.9, a
+capacidade CAP_SYS_PTRACE não é necessária e a CAP_PERFMON é suficiente para que
+processos executem operações de monitoramento de desempenho e observabilidade.
+
+Outras capacidades concedidas a processos não privilegiados podem efetivamente
+permitir a captura de dados adicionais necessários para análises posteriores de
+desempenho de processos monitorados ou do sistema. Por exemplo, a capacidade
+CAP_SYSLOG permite a leitura de endereços de memória do espaço de kernel a partir
+do arquivo /proc/kallsyms.
+
+Grupos de usuários privilegiados do Perf
+----------------------------------------
+
+Mecanismos de capacidades, arquivos privilegiados desprovidos de capacidade
+(capability-dumb) [6]_, ACLs de sistema de arquivos [10]_ e o utilitário
+sudo [15]_ podem ser usados para criar grupos dedicados de usuários privilegiados
+do Perf com permissão para executar monitoramento de desempenho e observabilidade
+sem limites. As etapas a seguir podem ser seguidas para criar esses grupos de
+usuários privilegiados do Perf.
+
+1. Crie o grupo perf_users de usuários privilegiados do Perf, atribua o grupo
+   perf_users ao executável da ferramenta Perf e restrinja o acesso ao executável
+   para outros usuários no sistema que não estejam no grupo perf_users:
+
+::
+
+   # groupadd perf_users
+   # ls -alhF
+   -rwxr-xr-x  2 root root  11M Oct 19 15:12 perf
+   # chgrp perf_users perf
+   # ls -alhF
+   -rwxr-xr-x  2 root perf_users  11M Oct 19 15:12 perf
+   # chmod o-rwx perf
+   # ls -alhF
+   -rwxr-x---  2 root perf_users  11M Oct 19 15:12 perf
+
+2. Atribua as capacidades necessárias ao arquivo executável da ferramenta Perf e
+   habilite os membros do grupo perf_users com privilégios de monitoramento e
+   observabilidade [6]_ :
+
+::
+
+   # setcap "cap_perfmon,cap_sys_ptrace,cap_syslog=ep" perf
+   # setcap -v "cap_perfmon,cap_sys_ptrace,cap_syslog=ep" perf
+   perf: OK
+   # getcap perf
+   perf = cap_sys_ptrace,cap_syslog,cap_perfmon+ep
+
+Se a libcap [16]_ instalada ainda não oferecer suporte a "cap_perfmon", use "38",
+ou seja:
+
+::
+
+   # setcap "38,cap_ipc_lock,cap_sys_ptrace,cap_syslog=ep" perf
+
+Observe que você pode precisar incluir 'cap_ipc_lock' na combinação para
+ferramentas como 'perf top'; alternativamente, use 'perf top -m N' para reduzir a
+memória que ele usa para o buffer de anel (ring buffer) do perf; consulte a seção
+de alocação de memória abaixo.
+
+O uso de uma libcap sem suporte a CAP_PERFMON fará com que cap_get_flag(caps, 38,
+CAP_EFFECTIVE, &val) falhe, o que fará com que o evento padrão seja 'cycles:u',
+portanto, como solução alternativa, solicite explicitamente o evento 'cycles', ou seja:
+
+::
+
+  # perf top -e cycles
+
+Para obter amostras do kernel e do usuário com um binário do perf com apenas CAP_PERFMON.
+
+Como resultado, os membros do grupo perf_users são capazes de conduzir
+monitoramento de desempenho e observabilidade utilizando a funcionalidade do
+executável da ferramenta Perf configurado que, ao ser executado, passa nas
+verificações de escopo do subsistema perf_events.
+
+Caso não seja possível atribuir as capacidades necessárias ao executável da
+ferramenta Perf (por exemplo, o sistema de arquivos está montado com a opção
+nosuid ou atributos estendidos não são suportados pelo sistema de arquivos), a
+criação de um ambiente privilegiado por capacidades, naturalmente um shell, é
+possível. O shell fornece aos processos herdados a CAP_PERFMON e outras
+capacidades necessárias para que operações de monitoramento de desempenho e
+observabilidade estejam disponíveis no ambiente sem limites. O acesso ao ambiente
+pode ser aberto via utilitário sudo apenas para membros do grupo perf_users. Para
+criar tal ambiente:
+
+1. Crie um script shell que utilize o utilitário capsh [16]_ para atribuir a
+   CAP_PERFMON e outras capacidades necessárias no conjunto de capacidades
+   ambiente (ambient capability set) do processo do shell, travar os bits de
+   segurança do processo após habilitar os bits SECBIT_NO_SETUID_FIXUP,
+   SECBIT_NOROOT e SECBIT_NO_CAP_AMBIENT_RAISE e, em seguida, alterar a
+   identidade do processo para o chamador do script via sudo, que deve ser
+   essencialmente um membro do grupo perf_users:
+
+::
+
+   # ls -alh /usr/local/bin/perf.shell
+   -rwxr-xr-x. 1 root root 83 Oct 13 23:57 /usr/local/bin/perf.shell
+   # cat /usr/local/bin/perf.shell
+   exec /usr/sbin/capsh --iab=^cap_perfmon --secbits=239 --user=$SUDO_USER -- -l
+
+2. Estenda a política do sudo no arquivo /etc/sudoers com uma regra para o grupo
+   perf_users:
+
+::
+
+   # grep perf_users /etc/sudoers
+   %perf_users    ALL=/usr/local/bin/perf.shell
+
+3. Verifique se os membros do grupo perf_users têm acesso ao shell privilegiado
+   e têm a CAP_PERFMON e outras capacidades necessárias habilitadas nos conjuntos
+   de capacidades permitidas (permitted), efetivas (effective) e ambiente (ambient)
+   de um processo herdado:
+
+::
+
+  $ id
+  uid=1003(capsh_test) gid=1004(capsh_test) groups=1004(capsh_test),1000(perf_users) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
+  $ sudo perf.shell
+  [sudo] password for capsh_test:
+  $ grep Cap /proc/self/status
+  CapInh:        0000004000000000
+  CapPrm:        0000004000000000
+  CapEff:        0000004000000000
+  CapBnd:        000000ffffffffff
+  CapAmb:        0000004000000000
+  $ capsh --decode=0000004000000000
+  0x0000004000000000=cap_perfmon
+
+Como resultado, os membros do grupo perf_users têm acesso ao ambiente
+privilegiado onde podem usar ferramentas que empregam APIs de monitoramento
+de desempenho governadas pela capacidade Linux CAP_PERFMON.
+
+Este gerenciamento específico de controle de acesso está disponível apenas para
+processos em execução pelo superusuário ou root com as capacidades CAP_SETPCAP,
+CAP_SETFCAP [6]_ .
+
+Usuários não privilegiados
+--------------------------
+
+O controle de *escopo* e *acesso* do perf_events para processos não
+privilegiados é governado pela configuração perf_event_paranoid [2]_ :
+
+-1:
+     Não impõe restrições de *escopo* e *acesso* ao uso do monitoramento de
+     desempenho do perf_events. O limite de travamento perf_event_mlock_kb [2]_
+     por usuário e por CPU é ignorado ao alocar buffers de memória para armazenar
+     dados de desempenho. Este é o modo menos seguro, pois o *escopo* monitorado
+     permitido é maximizado e nenhum limite específico do perf_events é imposto
+     aos *recursos* alocados para o monitoramento de desempenho.
+
+>=0:
+     O *escopo* inclui o monitoramento de desempenho por processo e em todo o
+     sistema, mas exclui o monitoramento de tracepoints brutos e tracepoints de
+     funções do ftrace. Eventos de CPU e do sistema ocorridos durante a execução
+     no espaço de usuário ou no espaço de kernel podem ser monitorados e capturados
+     para análise posterior. O limite de travamento perf_event_mlock_kb por usuário
+     e por CPU é imposto, mas ignorado para processos não privilegiados com a
+     capacidade CAP_IPC_LOCK [6]_ .
+
+>=1:
+     O *escopo* inclui apenas o monitoramento de desempenho por processo e exclui
+     o monitoramento de desempenho em todo o sistema. Eventos de CPU e do sistema
+     ocorridos durante a execução no espaço de usuário ou no espaço de kernel podem
+     ser monitorados e capturados para análise posterior. O limite de travamento
+     perf_event_mlock_kb por usuário e por CPU é imposto, mas ignorado para
+     processos não privilegiados com a capacidade CAP_IPC_LOCK.
+
+>=2:
+     O *escopo* inclui apenas o monitoramento de desempenho por processo. Eventos
+     de CPU e do sistema ocorridos durante a execução apenas no espaço de usuário
+     podem ser monitorados e capturados para análise posterior. O limite de
+     travamento perf_event_mlock_kb por usuário e por CPU é imposto, mas ignorado
+     para processos não privilegiados com a capacidade CAP_IPC_LOCK.
+
+Controle de recursos
+--------------------
+
+Descritores de arquivo abertos
+++++++++++++++++++++++++++++++
+
+A API de chamada de sistema perf_events [2]_ aloca descritores de arquivo para cada
+evento de PMU configurado. Descritores de arquivos abertos são um recurso contabilizado
+por processo e governado pelo limite RLIMIT_NOFILE [11]_ (ulimit -n), que geralmente é
+derivado do processo do shell de login. Ao configurar a coleta do Perf para uma longa
+lista de eventos em um sistema de servidor grande, esse limite pode ser facilmente
+atingido, impedindo a configuração de monitoramento necessária. O limite RLIMIT_NOFILE
+pode ser aumentado por usuário modificando o conteúdo do arquivo limits.conf [12]_ .
+Normalmente, uma sessão de amostragem do Perf (perf record) requer uma quantidade de
+descritores de arquivos perf_event abertos que não seja inferior ao número de eventos
+monitorados multiplicado pelo número de CPUs monitoradas.
+
+Alocação de memória
++++++++++++++++++++
+
+A quantidade de memória disponível para processos de usuário para captura de dados
+de monitoramento de desempenho é governada pela configuração perf_event_mlock_kb [2]_ .
+Esta configuração de recurso específica do perf_event define os limites gerais de
+memória por CPU permitidos para mapeamento pelos processos de usuário para executar
+o monitoramento de desempenho. A configuração essencialmente estende o limite
+RLIMIT_MEMLOCK [11]_ , mas apenas para regiões de memória mapeadas especificamente
+para a captura de eventos de desempenho monitorados e dados relacionados.
+
+Por exemplo, se uma máquina tiver oito núcleos e o limite perf_event_mlock_kb estiver
+definido como 516 KiB, então um processo de usuário receberá 516 KiB * 8 = 4128 KiB
+de memória acima do limite RLIMIT_MEMLOCK (ulimit -l) para buffers mmap do perf_event.
+Em particular, isso significa que, se o usuário desejar iniciar dois ou mais processos
+de monitoramento de desempenho, ele deverá distribuir manualmente os 4128 KiB disponíveis
+entre os processos de monitoramento, por exemplo, usando a opção do modo de gravação
+--mmap-pages do Perf. Caso contrário, o primeiro processo de monitoramento de desempenho
+iniciado alocará todos os 4128 KiB disponíveis e os outros processos falharão em prosseguir
+devido à falta de memória.
+
+As restrições de recursos RLIMIT_MEMLOCK e perf_event_mlock_kb são ignoradas para
+processos com a capacidade CAP_IPC_LOCK. Assim, usuários privilegiados de
+perf_events/Perf podem receber memória acima das restrições para fins de monitoramento
+de desempenho de perf_events/Perf fornecendo a capacidade CAP_IPC_LOCK ao executável
+do Perf.
+
+Bibliografia
+------------
+
+.. [1] `<https://lwn.net/Articles/337493/>`_
+.. [2] `<http://man7.org/linux/man-pages/man2/perf_event_open.2.html>`_
+.. [3] `<http://web.eece.maine.edu/~vweaver/projects/perf_events/>`_
+.. [4] `<https://perf.wiki.kernel.org/index.php/Main_Page>`_
+.. [5] `<https://www.kernel.org/doc/html/latest/security/credentials.html>`_
+.. [6] `<http://man7.org/linux/man-pages/man7/capabilities.7.html>`_
+.. [7] `<http://man7.org/linux/man-pages/man2/ptrace.2.html>`_
+.. [8] `<https://en.wikipedia.org/wiki/Hardware_performance_counter>`_
+.. [9] `<https://en.wikipedia.org/wiki/Model-specific_register>`_
+.. [10] `<http://man7.org/linux/man-pages/man5/acl.5.html>`_
+.. [11] `<http://man7.org/linux/man-pages/man2/getrlimit.2.html>`_
+.. [12] `<http://man7.org/linux/man-pages/man5/limits.conf.5.html>`_
+.. [13] `<https://sites.google.com/site/fullycapable>`_
+.. [14] `<http://man7.org/linux/man-pages/man8/auditd.8.html>`_
+.. [15] `<https://man7.org/linux/man-pages/man8/sudo.8.html>`_
+.. [16] `<https://git.kernel.org/pub/scm/libs/libcap/libcap.git/>`_
-- 
2.47.3

