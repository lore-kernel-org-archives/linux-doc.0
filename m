Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954967;
	b=HbfNjyI+RuawJ90U3pNMygfCiJjeQ2nyz1tpT6DpJ6UTqiTLLyUf41f/mQDGJy8YT/25
	 V+1qlnneYUgnYZFlLwAi9KKmUoM/tS/+1XOvrQcEjpxeXitTp7Vmzbq2+937U6m1oK9Xh
	 UrQyvo4dCMcGR1GQLTotgThbBtNNpioCsDClVlvVN7a8Kk2JZOTrxynMy9bxxyjuGrihY
	 6l1gjpyGlTgyv5ZLmj52ZjMTHJEliAEiFFyLEObN5zeiaqoQmWCvv8fHfOA1L6Z35cIlV
	 x+JB/awRTdO/OgZGlbSoRc9u84hzSmpQlUnBE7Qf3Zao0oWBY7PJrWBSZXteKIwyW2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=I0gDxebM4YbrUTfhYqGB9B570pL2S50ScgRNppIsG2Q=;
	b=3KYyWBpZpN+VGlnlvK3caSbXIxLormMOnyF7hLbTfK/e4x56+dPNhh6jb/bNLoRhyPf9
	 AYevwlLb8qU92LCY25V4RXWKHujnfeOM6hIyB8pqw66zwr2IvLkDGJl8BLFZV15embzHC
	 92TE/urLM6PtG8BTEEal4DC+RKzDjfU7VRtBTDvJPZUSFhbRFGPfJcE+koB+bM+eHw0Q6
	 1adQ7vcA4ZmmEbn/5LFaHuLre1gZNhqJeqXnf0n5aJKRHsLOg6aWkEGjcyjsZiCutddr2
	 8nWHFo0WJEFb6OztCwdSaKfq62s5VY93AQuHZuFo5gy3y512GznmNHPghGmgMfuhGRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kSPCRysm;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5590C606A31C
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 22:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5590C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kSPCRysm
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b0dba37a7fso3023117b3.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794954966; x=1795559766; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I0gDxebM4YbrUTfhYqGB9B570pL2S50ScgRNppIsG2Q=;
        b=kSPCRysm7NlA8ktMY19eGPa71cJjCv34+h2iTVx/+/EPRkPKEsc+IY8AINf/4kNUbg
         SDtDpsSE5h+hdovK0ylJaapXH372nJ/lhfsxC6GqbatnmgHi/ju+0UNdqno3TxisXLOX
         /hdI079E4bMtRDTtt3xo3onMcGhMpyjhLPmxela7JrInr1txBRcQuRA10KiByH6pHodw
         7teWyqAmLbUYGhIkWdVrOw8JnkpAA3WJ2Y2X/2XA+dyn1qRKgwxVXfSKrKLhSCtlCu5K
         X/CpLc5XhImzjKpNzERaVhl6MDMggn4ZuSifDOOAUNao1tjDFwjkaCkgd/xEi08kRw80
         6Cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954966; x=1795559766;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I0gDxebM4YbrUTfhYqGB9B570pL2S50ScgRNppIsG2Q=;
        b=WPMK1SJp9OkA6WO2A45T2tN1a5+/BD0z9i/rPmGLKyrQxtS4lz5tj1GXoKnQloesmZ
         B1mh2zIj/1tHwpg5TTQ/ag/rZthdsTuF1PLR5lwXfklrBTXHMIzzm2amyrNq51f5HEXf
         gfSYB8/5SGexLE+KZ+yVPBQyEFomALMh6ERQpNl9zUqoWcI/WtdVC1wUGyVEUFxS9cJt
         FR7JUGPOgP49gsW4Wqk1RCLbdhKiZy8SiBdRrY1QKdyQPrhhvOLknA3aobJ0p2uVybbC
         srV/M5ZVNksH28lnO046W7KwXnFCF5hlSFKBRJEVmZETUO6goBvwu0sIUA3/xOsj3dpF
         QGLQ==
X-Forwarded-Encrypted: i=1; AL+hErFAHP5X4m3cY+zwGvHeM9x6s1cGH0poO0Hknwc6V00nyLq2rmTf9W0l1EaKgqElIZIqTfKqhuEM/n8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8paUaMXeIl8VaJG9ZKeaX7TmEO3jLp+usXna7lGxzZOYBBqnE0
	90r41//ONVxavV44u2dOmhqQFECjEJnDZi21QacMskaYGphbDdfX4j5wyjm4UiTImDA=
X-Gm-Gg: AZFdTZeFDNWSuqKdDR3M3eGfqyvO2ZlCn7OGEDK88WVCXnHdkRkFuUQ4oX6fvEg7dmw
	B23qfsAEAzdVOT6JHf+UTrqPW/yiuCLfm4YJNf+XDwcPqXuxFi/YSgaODkVbrZkwjzEWCqOUkUn
	XiLJfUCTr/bY2rtwuBY+2IkEzmtIHeQTrWz2N2HpwPbmEj2MuByucYu6gbRLVTpXLzWhGFNf3gm
	RfEU9BFS7yW2tUyA/0saegVUYjM9+VomOFofghGJQQp3QbzlQochuZvz606ZZ8DCgfvyhdJkezb
	5OECpuc9D0p/8tQbuPk/hlSPy/3afHzL4ncIBs8VKu8YtYB6TLsIYPU6AJ/h+XcGQ5vtmoYCD9Q
	+JAMW6dKhJlZQNeHjcS9Ux3leNKP94cf30RD477RG4BTDLbUMs1sZhnYkTfVv2WyrVgmND3cs3F
	QYJRJit2DkOv42/4eF/bOKZLIM+93VsdfkqNmw9jU0yCF++Z1/Uub0h+Q5ch9abNRRhNgUaEJ7X
	kvpWkrw6+w5Hn7uuml1+gUxcgOjqPLlnwpbqiWg2sLPghkOcjzj7rNNSu+8BTauRfv9yJ2wY6oH
	3DA+eaX4AkQ2KJF/XGo00QVQRD8knQq61HZpmIrDXjc19VAwZome/FncaqAp0Bmvj8kE4O7m8tP
	ppgJUY9xm/6AgLFxcWY6dTI5Xv+U5x1UT9sq5rLRPy1gxUBCVyLXlZf3IoYWQb/aGEDyqkA==
X-Received: by 2002:a05:690e:169c:b0:679:abf5:1478 with SMTP id 956f58d0204a3-67dd3f84220mr407434d50.50.1794954966117;
        Tue, 17 Nov 2026 14:36:06 -0800 (PST)
Received: from nixos ([2804:14c:a8:965f:9b81:8c7f:a117:6ada])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd5865e39sm493253d50.10.2026.11.17.14.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:36:05 -0800 (PST)
From: Igor Giamoniano <igorgphotoarte@gmail.com>
To: danielmaraboo@gmail.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Igor Giamoniano <igorgphotoarte@gmail.com>
Subject: [PATCH v1 1/2] docs: pt_BR: process: translate driver development debugging guide
Date: Tue, 17 Nov 2026 19:33:34 -0300
Message-ID: <20261117223335.111220-1-igorgphotoarte@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Translate the driver development debugging guide
(Documentation/process/debugging/driver_development_debugging_guide.rst)
into Brazilian Portuguese and add it to the pt_BR debugging index,
removing it from the Todolist.

References to documents that already have a pt_BR translation point to
the translated versions; the remaining ones still point to the English
originals.

Signed-off-by: Igor Giamoniano <igorgphotoarte@gmail.com>
---
The kernel-doc directives at the end of the original were replaced by a
pointer to the English document, since including them in the translation
causes duplicate C declaration warnings and the generated API text would
remain in English anyway.

 .../driver_development_debugging_guide.rst    | 250 ++++++++++++++++++
 .../pt_BR/process/debugging/index.rst         |   2 +-
 2 files changed, 251 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/process/debugging/driver_development_debugging_guide.rst

diff --git a/Documentation/translations/pt_BR/process/debugging/driver_development_debugging_guide.rst b/Documentation/translations/pt_BR/process/debugging/driver_development_debugging_guide.rst
new file mode 100644
index 00000000000..16929489962
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/debugging/driver_development_debugging_guide.rst
@@ -0,0 +1,250 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================================================
+Conselhos de depuração para desenvolvimento de drivers
+======================================================
+
+Este documento serve como ponto de partida geral e material de consulta
+para a depuração de drivers de dispositivo.
+Embora este guia se concentre na depuração que exige recompilar o
+módulo/kernel, o :doc:`guia de depuração a partir do espaço de usuário
+<userspace_debugging_guide>` apresenta ferramentas como dynamic debug,
+ftrace e outras ferramentas úteis para depurar problemas e comportamentos.
+Para conselhos gerais de depuração, veja o :doc:`documento de conselhos
+gerais <index>`.
+
+.. contents::
+    :depth: 3
+
+As seções a seguir apresentam as ferramentas disponíveis.
+
+printk() e similares
+--------------------
+
+São derivados de printf() com destinos variados e com ou sem suporte a
+serem ligados ou desligados dinamicamente.
+
+printk() simples
+~~~~~~~~~~~~~~~~
+
+O clássico. Pode ser usado com ótimos resultados no desenvolvimento rápido
+e improvisado de novos módulos ou para extrair dados arbitrários
+necessários à solução de problemas.
+
+Pré-requisito: ``CONFIG_PRINTK`` (geralmente habilitado por padrão)
+
+**Prós**:
+
+- Não é preciso aprender nada, é simples de usar
+- Fácil de ajustar exatamente às suas necessidades (formatação dos dados
+  (veja: :doc:`/core-api/printk-formats`), visibilidade no log)
+- Pode causar atrasos na execução do código (útil para confirmar se a
+  temporização é um fator)
+
+**Contras**:
+
+- Exige recompilar o kernel/módulo
+- Pode causar atrasos na execução do código (o que pode tornar os
+  problemas não reproduzíveis)
+
+Para a documentação completa, veja :doc:`/core-api/printk-basics`
+
+Trace_printk
+~~~~~~~~~~~~
+
+Pré-requisito: ``CONFIG_DYNAMIC_FTRACE`` & ``#include <linux/ftrace.h>``
+
+É um pouco menos confortável de usar do que printk(), porque você
+precisará ler as mensagens no arquivo de rastreamento (veja:
+:ref:`pt_BR_read_ftrace_log`) em vez de no log do kernel, mas é muito
+útil quando printk() adiciona atrasos indesejados à execução do código,
+tornando os problemas intermitentes ou ocultos.
+
+Se o processamento disso ainda causar problemas de temporização, você
+pode tentar trace_puts().
+
+Para a documentação completa, veja trace_printk()
+
+dev_dbg
+~~~~~~~
+
+Instrução de print que pode ser controlada pelo
+:ref:`translations/pt_BR/process/debugging/userspace_debugging_guide:dynamic debug`
+e que contém informações adicionais sobre o dispositivo usado no
+contexto.
+
+**Quando é apropriado deixar um print de depuração no código?**
+
+Instruções de depuração permanentes precisam ser úteis para que um
+desenvolvedor diagnostique o mau comportamento do driver. Julgar isso é
+um pouco mais arte do que ciência, mas há algumas orientações nas
+:ref:`diretrizes de estilo de código
+<translations/pt_BR/process/coding-style:13) imprimindo mensagens do kernel>`.
+Em quase todos os casos, as instruções de depuração não devem ser enviadas
+ao upstream, já que se espera que um driver funcionando seja silencioso.
+
+printk customizado
+~~~~~~~~~~~~~~~~~~
+
+Exemplo::
+
+  #define core_dbg(fmt, arg...) do { \
+	  if (core_debug) \
+		  printk(KERN_DEBUG pr_fmt("core: " fmt), ## arg); \
+	  } while (0)
+
+**Quando você deveria fazer isso?**
+
+É melhor usar simplesmente um pr_debug(), que pode depois ser ligado ou
+desligado com o dynamic debug. Além disso, muitos drivers ativam esses
+prints por meio de uma variável como ``core_debug``, definida por um
+parâmetro de módulo. No entanto, parâmetros de módulo `não são mais
+recomendados
+<https://lore.kernel.org/all/2024032757-surcharge-grime-d3dd@gregkh>`_.
+
+Ftrace
+------
+
+Criando um tracepoint customizado do Ftrace
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Um tracepoint adiciona ao seu código um gancho que será chamado e
+registrado quando o tracepoint estiver habilitado. Isso pode ser usado,
+por exemplo, para rastrear a passagem por um desvio condicional ou para
+despejar o estado interno em pontos específicos do fluxo do código durante
+uma sessão de depuração.
+
+Aqui está uma descrição básica de :ref:`como implementar novos tracepoints
+<trace/tracepoints:usage>`.
+
+Para a documentação completa do rastreamento de eventos, veja
+:doc:`/trace/events`
+
+Para a documentação completa do Ftrace, veja :doc:`/trace/ftrace`
+
+DebugFS
+-------
+
+Pré-requisito: ``CONFIG_DEBUG_FS`` & ``#include <linux/debugfs.h>``
+
+O DebugFS difere das outras abordagens de depuração, pois não escreve
+mensagens no log do kernel nem adiciona rastros ao código. Em vez disso,
+ele permite que o desenvolvedor manipule um conjunto de arquivos.
+Com esses arquivos, você pode armazenar valores de variáveis, fazer dumps
+de registradores/memória ou tornar esses arquivos graváveis e modificar
+valores/configurações no driver.
+
+Possíveis casos de uso, entre outros:
+
+- Armazenar valores de registradores
+- Acompanhar variáveis
+- Armazenar erros
+- Armazenar configurações
+- Alternar uma configuração, como ligar/desligar a depuração
+- Injeção de erros
+
+Isso é especialmente útil quando o tamanho de um dump de dados seria
+difícil de digerir como parte do log geral do kernel (por exemplo, ao
+despejar dados brutos de um bitstream) ou quando você não está interessado
+em todos os valores o tempo todo, mas quer ter a possibilidade de
+inspecioná-los.
+
+A ideia geral é:
+
+- Criar um diretório durante o probe (``struct dentry *parent =
+  debugfs_create_dir("my_driver", NULL);``)
+- Criar um arquivo (``debugfs_create_u32("my_value", 444, parent,
+  &my_variable);``)
+
+  - Neste exemplo, o arquivo fica em
+    ``/sys/kernel/debug/my_driver/my_value`` (com permissão de leitura
+    para usuário/grupo/todos)
+  - qualquer leitura do arquivo retornará o conteúdo atual da variável
+    ``my_variable``
+
+- Limpar o diretório ao remover o dispositivo
+  (``debugfs_remove(parent);``)
+
+Para a documentação completa, veja :doc:`/filesystems/debugfs`.
+
+KASAN, UBSAN, lockdep e outros verificadores de erros
+-----------------------------------------------------
+
+KASAN (Kernel Address Sanitizer)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Pré-requisito: ``CONFIG_KASAN``
+
+O KASAN é um detector dinâmico de erros de memória que ajuda a encontrar
+bugs de use-after-free e de acesso fora dos limites (out-of-bounds). Ele
+usa instrumentação em tempo de compilação para verificar cada acesso à
+memória.
+
+Para a documentação completa, veja :doc:`/dev-tools/kasan`.
+
+UBSAN (Undefined Behavior Sanitizer)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Pré-requisito: ``CONFIG_UBSAN``
+
+O UBSAN depende de instrumentação do compilador e de verificações em
+tempo de execução para detectar comportamento indefinido. Ele foi
+projetado para encontrar uma variedade de problemas, incluindo overflow de
+inteiros com sinal, índice de array fora dos limites e outros.
+
+Para a documentação completa, veja :doc:`/dev-tools/ubsan`
+
+lockdep (Lock Dependency Validator)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Pré-requisito: ``CONFIG_DEBUG_LOCKDEP``
+
+O lockdep é um validador de dependências de locks em tempo de execução
+que detecta potenciais deadlocks e outros problemas relacionados a locks
+no kernel.
+Ele acompanha a aquisição e a liberação de locks, construindo um grafo de
+dependências que é analisado em busca de potenciais deadlocks.
+O lockdep é especialmente útil para validar se a ordem de aquisição dos
+locks no kernel está correta.
+
+PSI (Pressure stall information tracking)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Pré-requisito: ``CONFIG_PSI``
+
+O PSI é uma ferramenta de medição para identificar overcommit
+excessivo de recursos de hardware, o que pode causar quedas de
+desempenho ou até mesmo OOM kills.
+
+device coredump
+---------------
+
+Pré-requisito: ``CONFIG_DEV_COREDUMP`` & ``#include <linux/devcoredump.h>``
+
+Fornece a infraestrutura para que um driver entregue dados arbitrários ao
+espaço de usuário. É usado com mais frequência em conjunto com o udev ou
+com uma aplicação semelhante no espaço de usuário que escute os uevents do
+kernel, os quais indicam que o dump está pronto. O udev tem regras para
+copiar esse arquivo para algum lugar, para armazenamento e análise de
+longo prazo, já que, por padrão, os dados do dump são removidos
+automaticamente após 5 minutos. Esses dados são analisados com
+ferramentas específicas do driver ou com o GDB.
+
+Um device coredump pode ser criado com uma área de vmalloc, com métodos
+de leitura/liberação, ou como uma lista scatter/gather.
+
+Você pode encontrar um exemplo de implementação em:
+`drivers/media/platform/qcom/venus/core.c
+<https://elixir.bootlin.com/linux/v6.11.6/source/drivers/media/platform/qcom/venus/core.c#L30>`__,
+na camada HCI do Bluetooth, em vários drivers de rede sem fio e em vários
+drivers DRM.
+
+Interfaces do devcoredump
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A documentação da API do devcoredump é gerada a partir do código-fonte e
+está disponível apenas em inglês, na seção "devcoredump interfaces" do
+:doc:`documento original
+</process/debugging/driver_development_debugging_guide>`.
+
+**Copyright** ©2024 : Collabora
diff --git a/Documentation/translations/pt_BR/process/debugging/index.rst b/Documentation/translations/pt_BR/process/debugging/index.rst
index ab739a6a34c..db083a501d1 100644
--- a/Documentation/translations/pt_BR/process/debugging/index.rst
+++ b/Documentation/translations/pt_BR/process/debugging/index.rst
@@ -11,10 +11,10 @@ Guias gerais
    :maxdepth: 1
 
    userspace_debugging_guide
+   driver_development_debugging_guide
 
 Todolist:
 
-*   driver_development_debugging_guide
 *   gdb-kernel-debugging
 *   kgdb
 
-- 
2.54.0

