Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07C235677D
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 02:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525625; cv=none; b=VWcqx6Y8Z9bcjZauRK7+ZYcVDnjFbrLay7n6UkE0EgKMBO9Y8Q9ulpwYmfk1uqc3lfM9DA/+73BIiAyaxLCrTgT0wxGQnjkdhv3/O8O4G2dooCdNQLswCMy4yhCs+xiDVM0HL2Ti+zJylX6MwGCjWWH8CoqsOILYXFIlAXLVND8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525625; c=relaxed/simple;
	bh=WmU6t97B5ITOB65HlwzKXQFozT5jlEKBY8rQ1fZA+nk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=aQIJdMb951nmF4GR4iCUkIpt2VgoZQ2qVRad2eW1BbS1XtAF5xPaZ1S1FNDDAa9ZwelOBKcmkA5SmBHGn6G+DdiUlZArz1RsPW5nqJSXpFqtWkh6XIgkBqi91T4OJB/vrEEMJX5qcxzUEVqUHEFpoxzFXi5qu3ww3IEHgU6KqUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXEYJPOx; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXEYJPOx"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c62dde3so117346241.3
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 19:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789525618; x=1790130418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uflniaNosajkVPKFWIsz1ahCTRp2Lde5t/2T7QTakhA=;
        b=MXEYJPOxOGXGrQKC0uPQSbWucHUH98xXvfi70abd7eiZnC9k8w83Y8i67uUENnn3lp
         raB8Z0kDyZByrPS+VfhTe7sI40TRdFWtYwBNhJ/10iiV/xosPXWEN4Vghmra3oyZiAZ4
         kdKQV9K4xIcTt1lv8YeWbPT7BXzUOxU1DYVbHgAekg5bmvxqh08kPZPn1rv9Co0tHJLp
         gIFXPSedHz9mezdN6HQoW7Po+Rc/8hpYOjPu4waK5XIWNO2QLnvLoVxb/EcnPhIZQOaK
         W3vGC0Y9zfYkIEV731GC/GUMZ8cS519Voi6YQAm5Wcg2wXdl5RQy/u15iCPRnOEsfqrS
         TIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789525618; x=1790130418;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uflniaNosajkVPKFWIsz1ahCTRp2Lde5t/2T7QTakhA=;
        b=Lek3ltIVuKgAGbS1LiK6qipfT94ZV+3GIqvIiHSH6hIOVwIxNvzeVtdNedQqqwXvw4
         xvGgxxsT8vuTQpFdOydKQ1oSCxupWNuGSh6IZifTuMcaa/kmjLZXordsRfp7ZLCqvWI+
         WVHnKE78pmZOylmszScOewYXdjzTdyEW9jEIpBarGamrkwbGqQWcl7Ph0SjpydPokcha
         lY0fNkF8HesgCDg7DbnvnoJ2t06kVv3O80WYBfBXcjkNdkQzLKViFQdH/Yt4kVQ4qYKA
         Z/hEtML50qbxSzu8nvq30B14pMncUk8mpEYXe8C8+W9z7axCycTh5Ub/AvV7MZ0Feh0H
         xlJg==
X-Forwarded-Encrypted: i=1; AKwUvBzPRIjm2S4DOCAF6fuPE4idMCiskas0XhANZhBhnSwFYwU2HvQa5C2SSkwlUR7GBDgXG5/SrnzL4Qo=@vger.kernel.org
X-Gm-Message-State: AFuF++kRs9Hw1htBED1PoWN9hdYD5RsNFl76VdPhZH0SbLvNzgtNQJlZ
	Bpr8DBVzkbOGPRA/SxH2DhRL7D3l1PiJcVnXmB/LMzegrAQUo90IZvKs
X-Gm-Gg: AYBFou2sT+7byMsG3JQq9M94N6OU++pqsIGRSal4pWHzr8Otynqm4elP784GO9BZ/E4
	s+ttGLXgLK/DR+QslwzFmjoIl+x4ysGvrBLyTf5Mkf2In6v0jDQj3Az/JFHm6GynB2rQD3nGWeJ
	iCu7k7nna+Bf3iZsIi3RnQJl6FrafxpAb6MdrxLWIwrlGZegsGkJc1CmgDLiNiND5zgj3kZFD4s
	z79ejVa52IUGcEAsiXDp6l+kLZWhArlHSP+u8NKvIw3IBGg/8i0JF/kWExksRIVuPJ2YDNbRBA5
	BJQ8QS1lOzLW15IV+Je20+8n0O7m1HQ4rOij74nprC7z6vlqp+0vp/yiI+hD44YdGkg3OVWaCEw
	6fYK0wqZHr4Ix9032bsdqcrpJN4jezIa7kDvxz9yJQUTlzJsKg1vQqHIJZx3Zxc9VBvX+8wKLWZ
	xqaUOcgBwDZ4Hd3q9BasoUhkZ2HoM9BnTZjFufT1aiZO4qX3lF8IS8W73JGAF1Art3GssHf8WOl
	nA=
X-Received: by 2002:a05:6102:5493:b0:789:5f54:2367 with SMTP id ada2fe7eead31-7a026088a71mr1044647137.4.1789525618151;
        Tue, 15 Sep 2026 19:26:58 -0700 (PDT)
Received: from pop-os.. ([2804:7f0:9f80:5986:11d7:e75c:8293:22c6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-983151dd79asm1347143241.5.2026.09.15.19.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 19:26:57 -0700 (PDT)
From: vinihsr <vinicius.m1821@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vinihsr <vinicius.m1821@gmail.com>
Subject: [PATCH] docs: translations: pt_BR: threat_model.rst
Date: Tue, 15 Sep 2026 23:26:19 -0300
Message-Id: <20260916022619.53555-1-vinicius.m1821@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate genetated-content.rst into Brazilian Portuguese,
maintaining consistency with original formatting rules.
And add it to the pt_BR process documentation index.

Assisted-by: Gemini:Gemini 3.1 Pro

Signed-off-by: vinihsr <vinicius.m1821@gmail.com>
---
 .../translations/pt_BR/process/index.rst      |   1 +
 .../pt_BR/process/threat-model.rst            | 252 ++++++++++++++++++
 2 files changed, 253 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/threat-model.rst

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index eda2a3fc5166f..5b441fcb271c3 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -72,6 +72,7 @@ gerenciamento de bugs e vulnerabilidades.
    :maxdepth: 1
 
    Falhas de segurança <security-bugs>
+   O modelo de ameaças do kernel do Linux <threat-model>
    CVEs <cve>
 
 Informações para mantenedores
diff --git a/Documentation/translations/pt_BR/process/threat-model.rst b/Documentation/translations/pt_BR/process/threat-model.rst
new file mode 100644
index 0000000000000..a5715ef2c57d1
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/threat-model.rst
@@ -0,0 +1,252 @@
+O modelo de ameaças do kernel do Linux
+======================================
+
+Existem muitas suposições sobre o que o kernel protege e o que não protege.
+Essas suposições tendem a causar confusão nos relatórios de bugs
+(:doc:`relacionados à segurança <security-bugs>` vs :doc:`não relacionados à
+segurança <../admin-guide/reporting-issues>`), e podem complicar a aplicação
+das medidas de segurança quando as responsabilidades por certos limites não
+estão claras entre o kernel, as distribuições, os administradores e os usuários.
+
+Este documento tenta esclarecer as responsabilidades do kernel neste domínio.
+
+As responsabilidades do kernel
+------------------------------
+
+O kernel abstrai o acesso aos recursos de hardware locais e a sistemas remotos
+de forma a permitir que múltiplos usuários locais obtenham uma parcela justa dos
+recursos disponíveis concedidos a eles e, quando o hardware subjacente permitir,
+atribuir um nível de confidencialidade às suas comunicações e aos dados que
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
+    trocados por meio de soquetes de domínio UNIX ou outros mecanismos de IPC).
+  * comunicações de rede dentro do mesmo sistema ou com outros sistemas
+
+* **Proteção baseada em capacidades**:
+
+  * usuários que não possuam capacidades elevadas (incluindo, mas não se
+    limitando a CAP_SYS_ADMIN) não podem alterar a configuração, a memória nem o
+    estado do kernel, modificar a visão de outros usuários sobre o layout do
+    sistema de arquivos, conceder a qualquer usuário capacidades que ele não
+    possua, nem afetar a disponibilidade do sistema (desligamento,
+    reinicialização, pânico, travamento ou tornar o sistema irresponsivo por
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
+O que não constitui um bug de segurança
+---------------------------------------
+
+No modelo de ameaças do kernel do Linux, as seguintes classes de problemas
+**NÃO** são consideradas bugs de segurança do kernel do Linux. No entanto,
+quando se acredita que o kernel poderia ser melhor, eles devem ser relatados,
+para que possam ser analisados e corrigidos sempre que razoavelmente possível,
+mas serão tratados como qualquer bug comum:
+
+* **Configuração**:
+
+  * kernels desatualizados e, particularmente, ramos em fim de vida útil estão
+    fora do escopo do modelo de ameaças do kernel: os administradores são
+    responsáveis por manter seus sistemas atualizados. Para que um bug seja
+    qualificado como um bug de segurança, deve ser demonstrado que ele afeta
+    versões mantidas ativamente.
+
+  * nível de compilação: alterações na configuração do kernel que estejam
+    explicitamente documentadas como redutoras do nível de segurança (por
+    exemplo, ``CONFIG_NOMMU``) ou destinadas apenas a desenvolvedores.
+
+  * nível do sistema operacional: alterações nos parâmetros da linha de comando,
+    sysctls, permissões do sistema de arquivos, capacidades do usuário e
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
+  * carregamento de módulos explicitamente inseguros/quebrados/em fase de teste
+    e, de modo geral, qualquer uso de subsistema marcado como experimental ou
+    não destinado ao uso em produção.
+
+  * execução de módulos fora da árvore ou bifurcações não oficiais do kernel;
+    esses casos devem ser relatados ao fornecedor relevante.
+
+* **Excesso de privilégios iniciais**:
+
+  * ações realizadas por um usuário que já possui os privilégios necessários
+    para executar essa ação ou modificar esse estado (por exemplo,
+    ``CAP_SYS_ADMIN``, ``CAP_NET_ADMIN``, ``CAP_SYS_RAWIO``, ``CAP_SYS_MODULE``,
+    sem que nenhum outro limite seja ultrapassado).
+
+  * ações realizadas no namespace do usuário que não contornam as restrições
+    impostas ao usuário inicial (por exemplo, uso de ptrace, envio de sinais,
+    uso de recursos, acesso a FS/dispositivo/sysctl/memória, vínculo de rede,
+    configuração do sistema/rede, etc.).
+
+  * qualquer ação realizada pelo usuário root no namespace inicial (por exemplo,
+    erro fatal do kernel - oops - ao gravar em um dispositivo privilegiado).
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
+    força bruta), cujo impacto no sistema torna improvável ou impossível
+    permanecerem indetectáveis antes de serem bem-sucedidos (por exemplo,
+    consumir toda a memória antes de ter sucesso).
+
+  * problemas observados apenas em simuladores de desenvolvimento, emuladores ou
+    combinações que não existem em sistemas reais no momento do relato
+    (problemas envolvendo dezenas de milhões de threads, dezenas de milhares de
+    CPUs, frequências de CPU, tamanhos de RAM ou capacidades de disco
+    irrealistas, velocidades de rede).
+
+  * problemas cuja reprodução requer modificação de hardware ou emulação,
+    incluindo dispositivos USB falsos que se passam por outros.
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
+  * vazamentos de endereços/ponteiros de memória do kernel não constituem um
+    vetor imediatamente explorável e não são bugs de segurança, embora devam ser
+    relatados e corrigidos.
+
+* **Imagens de sistema de arquivos criadas propositalmente**:
+
+  * bugs desencadeados pela montagem de uma imagem de sistema de arquivos
+    corrompida ou criada de forma maliciosa geralmente não são bugs de
+    segurança, pois o kernel presume que a mídia de armazenamento subjacente
+    está sob o controle do administrador, a menos que o driver do sistema de
+    arquivos esteja especificamente documentado como sendo protegido contra
+    mídias não confiáveis.
+
+  * problemas que são resolvidos, mitigados ou detectados pela execução de uma
+    verificação de consistência do sistema de arquivos (fsck) na imagem antes da
+    montagem.
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
+  limites adequados não se qualifica como um bug de segurança.
-- 
2.34.1

