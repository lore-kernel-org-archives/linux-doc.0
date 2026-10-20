Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792469644;
	b=FCRu/BWj1cGB5eSkOifE2+M6Au8V8CBaS2Zox00lX+0xE/0Ltqa7OM7VgkB1spf4Ctaw
	 DSSrgjLueRDbcbOk3/Z3kdFOm9Mt5FvIrGXTuinoygFaHfemvNHVD3JVVBx+mLmYxpPiJ
	 kPy4xhk8ZeqrkTnf+08ZyFvosQPMXOuY7a93MmEnmPio+faCk4V6CffFXpj3PaMB+8lM5
	 KTa5kthg4vghmNzAa8oYzrFU9R44eF+r+rw/HZE0phP3g1FiRPvcVe9PFA66hNQ3xmu7H
	 4dyYAHe8gZCHw2yZo7snPvYkiqfohlF0Kr2KKNGon0hkvCfp5brYgGSSVOueTgYFjCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792469644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wXX+uPq9HITlMwHhULn9EWWK1u7QjwC2b6+s0z1E0CU=;
	b=bmw11vsTD/I+vRuFaO7BJZQ5cSsihD+6f0xNTfHCsg3/YXbSuvCHiVNZKb+cOQN5QEbJ
	 hL2g+hLpJrdPlG36pWgANsTRSYYYsj4P8rCVnAHJ91lAdWLxFYZAYLTJe2VPpdnjMBEiT
	 aSOrSHWpB/VjrSwxsy95/GRosr3Ri1jI8EVsTEnY12LUFD/qMMJRis3+Y6tq1SoBjLwYJ
	 0ytP5SdombQvaTvl1CdeUqXEe7zypRvYPJ3Gr+bbwiZ23osbXkA5Oqw/6Guph5L8z18Ks
	 NZHo2SvNhGm9hjR1d6xFafFOusXydjZ7nSB6pUDFL/mV5CFJng2T2AWq9NpCCuMJNHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KMuNCihW;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5EB606A31A
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 04:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA5EB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KMuNCihW
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535a54bed9so3910190eec.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 21:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792469643; x=1793074443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wXX+uPq9HITlMwHhULn9EWWK1u7QjwC2b6+s0z1E0CU=;
        b=KMuNCihW60M1S/oEjEWxNfUnUWkP4iIoQCqf6OOmwJhYoITtX60NwEasT+9outiSWS
         qOXRLfazeHn6lsGOItx/E+wRnTQoioN6MgUUUKN/pKu/ysVBxquSqY2eZdCLQutf0Tlg
         NwH3nGYn+cxm7/00ErGSwkw3qYP1LY+vGFDFfS6z+GRWs2iN7mT/j+B7n4BHM2P3wvET
         UaLqyErauVBM1+dnetjQQ2RKAo7Uja1sdndM6avDGGnVd7jjU3+uekOP856zZE4CiUlp
         ZuNM3waJeXslgSH0BzBPARX5bIB0XrJgjNhyNheCDfNhl50hfOmkJT1YIuLEtdAtARjD
         gWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792469643; x=1793074443;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXX+uPq9HITlMwHhULn9EWWK1u7QjwC2b6+s0z1E0CU=;
        b=0mT4Wr/2OL2Ht4tOrPTJmCCulUSS1jLdSXf9KM4F5YGTvme2kjVnnoQk3+EF05SCVD
         6zLLjxWJFtTQ+0AjUKVx2Xi3SlhimxrIZBuQFoTwoR8Z/ja+huL+bazWo9GOsYwo+kdb
         5J1bAYSBDz/VciatD0pIVCeOsqqR32u7E7dzHlWWBa5MBDomYThctA6btk3YrTAvPHId
         QWNlO7VupC1P3MufXi8p0BmDA7lfyWhiUixjUxNQ40dy395l35H6vwa7xUkVjMTYdbcw
         sAGBSLpNLqPx+em/CWfCQP6E7q07+l3BbCb4zGsmlkYQr08iXEhvoojz0wd1uz05/0Bj
         IsOg==
X-Forwarded-Encrypted: i=1; AKwUvBwGmQ0ZQK8eiqaU4mrh/qzDgCadHBmcZNQJ5kHEwqfVrZFFfhbxj4SbUX+eGMMXHrmpZ8/yEqygBmc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAeoNCD2HN2lwngRanLlN6tNbdJupFtdmg04QmDGJ6WIu/RYF7
	cFlG0rlmswx1Gh6AuWAN8o1JJp4s/9I7211LrjlwfusGahvU35FkZBGj
X-Gm-Gg: AYBFou1Ckjd+Sz5HqhW70tsZDlChjpYZNWilyYvU1lqhnfpfYovGJOxqHIxCT9LF8J6
	O2bLdrcVnIvCJHifWzpTQYK3NRqjeFYP/gH77MjhPNQjjYAgAgIhCm/4Ij+JyxdLEtBtRDGrdUR
	Yzzvw//uqw05BtY4yAQnTPUUoL6/8usL0ak+FYbvlQ5rDN2T2cDU5BqpcL/L92dQhevRXTeFuJZ
	s1QCnqVPWeyKkHzytQrv5zyhYmhuejzTX1J7w3slUUn/WzUoHFN0QHS/empbMGHf8MDZtNNMm1B
	EofzTlfOcG2FH6PmqP96EFb3sjvq+/utRYmEn94621UkYTb6oGgbVhLQb6DW7hnPQJ/HTqoDorg
	Jxu4gHflkrUK9TxcAullGh3EhsF9Ha9ysomCYS61YESoqTE52/82hKk2+b4loZmJ/9KMBCd4bAu
	29HV6OCXhjOsk8UBiXlQ+wmsxd+FR8fyy+OXY1ytyECg3Uf5ebb+UeHocTv70Hee7X9iw0IOcUg
	1c=
X-Received: by 2002:a05:7300:a98f:b0:35a:3c46:80d5 with SMTP id 5a478bee46e88-3619b7ff05fmr18338049eec.0.1792469642506;
        Mon, 19 Oct 2026 21:14:02 -0700 (PDT)
Received: from fedora ([2804:29b8:508d:af45:a398:9dc5:b37c:dfa8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360826875b3sm38861428eec.21.2026.10.19.21.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 21:14:02 -0700 (PDT)
From: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
To: danielmaraboo@gmail.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Subject: [PATCH v2 1/3] docs: translations: pt_BR: process: add driver_development_debugging_guide
Date: Tue, 20 Oct 2026 01:13:36 -0300
Message-ID: <20261020041340.447727-2-lucasadramalho@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020041340.447727-1-lucasadramalho@gmail.com>
References: <cover.1791933697.git.lucasadramalho@gmail.com>
 <20261020041340.447727-1-lucasadramalho@gmail.com>
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

Translate the driver debugging guide and update debugging/index.rst.

Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
---
 .../driver_development_debugging_guide.rst    | 244 ++++++++++++++++++
 .../pt_BR/process/debugging/index.rst         |   6 +-
 2 files changed, 249 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/process/debugging/driver_development_debugging_guide.rst

diff --git a/Documentation/translations/pt_BR/process/debugging/driver_development_debugging_guide.rst b/Documentation/translations/pt_BR/process/debugging/driver_development_debugging_guide.rst
new file mode 100644
index 000000000..a5c318821
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/debugging/driver_development_debugging_guide.rst
@@ -0,0 +1,244 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========================================================
+Orientações de depuração para o desenvolvimento de drivers
+==========================================================
+
+Este documento serve como ponto de partida e referência geral para a
+depuração de drivers de dispositivos.
+Enquanto este guia se concentra na depuração que exige recompilar o
+módulo ou o kernel, o :doc:`guia de depuração em espaço de usuário
+</process/debugging/userspace_debugging_guide>` orienta sobre ferramentas
+como depuração dinâmica, Ftrace e outras ferramentas úteis para investigar
+problemas e analisar comportamentos.
+Para orientações gerais sobre depuração, consulte o
+:doc:`guia geral de depuração </process/debugging/index>`.
+
+.. contents::
+    :depth: 3
+
+As seções a seguir mostram as ferramentas disponíveis.
+
+printk() e amigos
+-----------------
+
+Esses derivados de printf() podem enviar mensagens a destinos diferentes e
+podem ser ativados ou desativados dinamicamente, quando há suporte para isso.
+
+Simples printk()
+~~~~~~~~~~~~~~~~
+
+O método clássico é simples e pode ser muito útil para desenvolver módulos
+rapidamente ou extrair dados necessários para investigar problemas.
+
+Pré-requisito: ``CONFIG_PRINTK`` (geralmente habilitado por padrão)
+
+**Prós**:
+
+- Não há necessidade de aprender nada, simples de usar
+- Fácil de adaptar às suas necessidades, incluindo a formatação dos dados
+  (consulte :doc:`/core-api/printk-formats`) e a visibilidade no log
+- Pode causar atrasos na execução do código (benéfico para confirmar se o
+  tempo é um fator)
+
+**Contras**:
+
+- Requer reconstrução do kernel/módulo
+- Pode causar atrasos na execução do código (o que pode fazer com que os
+  problemas não sejam reproduzíveis)
+
+Para a documentação completa, consulte :doc:`/core-api/printk-basics`.
+
+trace_printk()
+~~~~~~~~~~~~~~
+
+Pré-requisito: ``CONFIG_DYNAMIC_FTRACE`` & ``#include <linux/ftrace.h>``
+
+É um pouco menos confortável de usar que printk(), porque as mensagens devem
+ser lidas no arquivo de rastreamento (consulte :ref:`read_ftrace_log`),
+em vez de no log do kernel. Ainda assim, é muito útil quando printk() causa
+atrasos indesejados na execução do código, tornando os problemas intermitentes
+ou difíceis de reproduzir.
+
+Se isso ainda causar problemas de temporização, tente trace_puts().
+
+Para a documentação completa, consulte trace_printk().
+
+dev_dbg
+~~~~~~~
+
+Chamada de depuração que pode ser controlada por
+:ref:`process/debugging/userspace_debugging_guide:dynamic debug` e inclui
+informações adicionais sobre o dispositivo associado.
+
+**Quando é apropriado manter uma mensagem de depuração no código?**
+
+
+As mensagens de depuração permanentes devem ajudar o desenvolvedor a investigar
+problemas no funcionamento do driver. Avaliar quais mensagens são úteis é mais
+uma arte do que uma ciência, mas algumas diretrizes estão nas
+:ref:`Diretrizes de estilo de codificação
+<translations/pt_BR/process/coding-style:13) Imprimindo mensagens do kernel>`.
+Em quase todos os casos, as mensagens de depuração não devem ser enviadas
+ao upstream, pois um driver funcional deve ser silencioso.
+
+printk personalizado
+~~~~~~~~~~~~~~~~~~~~
+
+Exemplo::
+
+  #define core_dbg(fmt, arg...) do { \
+	  if (core_debug) \
+		  printk(KERN_DEBUG pr_fmt("core: " fmt), ## arg); \
+	  } while (0)
+
+**Quando você deve fazer isso?**
+
+É melhor usar pr_debug(), que pode ser ativado ou desativado posteriormente
+com a depuração dinâmica. Além disso, muitos drivers ativam essas mensagens
+por meio de uma variável como ``core_debug``, definida por um parâmetro do
+módulo. No entanto, os parâmetros de módulo `não são mais recomendados
+<https://lore.kernel.org/all/2024032757-surcharge-grime-d3dd@gregkh>`_.
+
+Ftrace
+------
+
+Criando um ponto de rastreamento Ftrace personalizado
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Um ponto de rastreamento adiciona um gancho ao seu código que será chamado e
+registrado quando o ponto de rastreamento estiver ativado. Isso pode ser usado,
+por exemplo, para rastrear a execução de um ramo condicional ou para gerar um
+dump do estado interno em pontos específicos do fluxo do código durante uma
+sessão de depuração.
+
+Aqui está uma descrição básica de
+:ref:`como implementar novos pontos de rastreamento
+<trace/tracepoints:usage>`.
+
+Para a documentação completa sobre rastreamento de eventos, consulte
+:doc:`/trace/events`.
+
+Para a documentação completa do Ftrace, consulte :doc:`/trace/ftrace`.
+
+DebugFS
+-------
+
+Pré-requisito: ``CONFIG_DEBUG_FS`` e ``#include <linux/debugfs.h>``
+
+O DebugFS difere das outras abordagens de depuração, pois não grava mensagens
+no log do kernel nem adiciona rastros ao código. Em vez disso, permite que o
+desenvolvedor gerencie um conjunto de arquivos.
+Com esses arquivos, é possível armazenar valores de variáveis ou gerar
+dumps de registradores/memória, ou ainda tornar esses arquivos graváveis e modificar
+valores/configurações no driver.
+
+Possíveis casos de uso, entre outros:
+
+- Armazenar valores de registradores
+- Acompanhar variáveis
+- Armazenar erros
+- Armazenar configurações
+- Ativar ou desativar uma configuração, como o modo de depuração
+- Injeção de erros
+
+Isso é especialmente útil quando o tamanho de um dump de dados dificultaria
+sua análise como parte do log geral do kernel (por exemplo, ao despejar dados
+brutos de um fluxo de bits) ou quando você não precisa acompanhar todos os
+valores continuamente, mas quer poder inspecioná-los quando necessário.
+
+A ideia geral é:
+
+- Criar um diretório durante a execução do ``probe`` (``struct dentry *parent =
+  debugfs_create_dir("my_driver", NULL);``)
+- Criar um arquivo:
+
+  ``debugfs_create_u32("my_value", 444, parent, &my_variable);``
+
+  - Neste exemplo, o arquivo está localizado em
+    ``/sys/kernel/debug/my_driver/my_value`` (com permissões de leitura para
+    usuário/grupo/outros)
+  - Qualquer leitura do arquivo retornará o conteúdo atual da variável
+    ``my_variable``
+
+- Limpe o diretório ao remover o dispositivo
+  (``debugfs_remove(parent);``)
+
+Para a documentação completa, consulte :doc:`/filesystems/debugfs`.
+
+KASAN, UBSAN, lockdep e outros verificadores de erros
+-----------------------------------------------------
+
+KASAN (Kernel Address Sanitizer)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Pré-requisito: ``CONFIG_KASAN``
+
+O KASAN é um detector dinâmico de erros de memória que ajuda a identificar
+bugs de uso após liberação (*use-after-free*) e acessos fora dos limites
+(*out-of-bounds*). Ele utiliza instrumentação em tempo de compilação para
+verificar cada acesso à memória.
+
+Para a documentação completa veja :doc:`/dev-tools/kasan`.
+
+UBSAN (Undefined Behavior Sanitizer)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Pré-requisito: ``CONFIG_UBSAN``
+
+O UBSAN usa instrumentação do compilador e verificações em tempo de execução
+para detectar comportamentos indefinidos. Ele identifica vários problemas,
+incluindo estouro de inteiro com sinal e índice de array fora dos limites.
+
+Para a documentação completa, consulte :doc:`/dev-tools/ubsan`.
+
+lockdep (Lock Dependency Validator)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Pré-requisito: ``CONFIG_DEBUG_LOCKDEP``
+
+O lockdep é um validador de dependências de bloqueio em tempo de execução que
+detecta possíveis deadlocks e outros problemas relacionados a bloqueios no
+kernel. Ele rastreia a aquisição e a liberação de bloqueios, constrói um
+gráfico de dependências e o analisa em busca de possíveis deadlocks. O lockdep
+é especialmente útil para validar a ordem correta dos bloqueios no kernel.
+
+PSI (Pressure stall information tracking)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Pré-requisito: ``CONFIG_PSI``
+
+O PSI é uma ferramenta de medição que identifica a sobrecarga excessiva dos
+recursos de hardware, capaz de causar perda de desempenho ou até encerramentos
+de processos por falta de memória (OOM).
+
+coredump do dispositivo
+-----------------------
+
+Pré-requisito: ``CONFIG_DEV_COREDUMP`` e ``#include <linux/devcoredump.h>``
+
+Essa infraestrutura permite que um driver envie dados arbitrários ao espaço do
+usuário. Ela é usada com frequência em conjunto com o udev ou outro aplicativo
+de espaço de usuário que monitore os uevents do kernel indicando que o dump
+está pronto. O udev pode ter regras para copiar o arquivo para armazenamento e
+análise de longo prazo, pois, por padrão, os dados do dump são removidos após
+cinco minutos. Esses dados são analisados com ferramentas específicas do driver
+ou com o GDB.
+
+Um coredump do dispositivo pode ser criado a partir de uma área vmalloc, com
+métodos de leitura e liberação ou como uma lista scatter/gather.
+
+Você pode encontrar um exemplo de implementação em:
+`drivers/media/platform/qcom/venus/core.c
+<https://elixir.bootlin.com/linux/v6.11.6/source/drivers/media/platform/qcom/venus/core.c#L30>`__,
+na camada HCI do Bluetooth, em vários drivers sem fio e em vários
+drivers DRM.
+
+Interfaces do devcoredump
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. kernel-doc:: include/linux/devcoredump.h
+
+.. kernel-doc:: drivers/base/devcoredump.c
+
+**Copyright** ©2024 : Collabora
diff --git a/Documentation/translations/pt_BR/process/debugging/index.rst b/Documentation/translations/pt_BR/process/debugging/index.rst
index b223fae34..5c2c73493 100644
--- a/Documentation/translations/pt_BR/process/debugging/index.rst
+++ b/Documentation/translations/pt_BR/process/debugging/index.rst
@@ -7,9 +7,13 @@ Dicas de depuração para desenvolvedores do Kernel Linux
 Guias gerais
 ------------
 
+.. toctree::
+   :maxdepth: 1
+
+   Orientações de depuração para o desenvolvimento de drivers <driver_development_debugging_guide>
+
 Todolist:
 
-*   driver_development_debugging_guide
 *   gdb-kernel-debugging
 *   kgdb
 *   userspace_debugging_guide
-- 
2.55.0

