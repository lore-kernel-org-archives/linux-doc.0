Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036004;
	b=jyvoVvs39NpmFx/1bTkjTlZnIAdxMPvtAA9wRToD21ja29ZRuFdxKZBfiMBnEWHlG8eD
	 sbmGNRyJsxuxLuZGdaw5Qnsj21J/pk9oDfLVdoysiQzUza4iMb3EXvhOzQUregLnf/04z
	 5bjJXSOxVEm7n0UFC8VVP7CZJkw2UQazx20zJvS+P0NHhJ24m0tAL4kPr37wlLKEU6+DK
	 ckT4ik9prnknaSKzWS5braRVm/2KewPQq4ug/iqrFbAawfjaLjLqAgriJk2d7Tl+C+tWR
	 RiD0FxyqcdLwuid2jjkuUGGnW/B65crDgWH9UiTsr17ga0IsvVnetr9y6kFDpYgRc0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=C/P/6NTZzj0ogVm1av5nEuzupBt4WbIXi0d1Gkd2S7o=;
	b=ErMOplOut/xsftzuy1gP5HpVpKpStn4Cui/Ymjo6bDh2k0QOgK1mk60M43O/k7pG7rm8
	 FvSxvOpGSxxn9XrYGryota997tnjd/wPSw4dreF/+1nWqq1EgXfMZYkyHTHG6eqUmZv8t
	 rG1TG7nfbcpvxli/ZkiYA4yh3tjOqelb9/dVtLYGSeQr8/wShCEHk09hxf1+JDy1SfrpT
	 Y+DkHLhKfYGt0ieXYWkr/WUv6kPmWv0otbjhV25YlfSPK/u2IaTNXWluXLqZK8sgMcsLi
	 NzFShAOyKXsYlVZ3rYfVW4zhR9nqHWwq//l4LZPhQvkSbv6XpUB/gsCUrq08kupDUhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vTEbUvow;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8579E606A320
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 21:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8579E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vTEbUvow
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9906034086cso451220241.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 13:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795036002; x=1795640802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/P/6NTZzj0ogVm1av5nEuzupBt4WbIXi0d1Gkd2S7o=;
        b=vTEbUvowUW3WOnc4tD2HU+1+GQ2cTBDfcp5Np9sAy1oTlLy40QVtaLY2Ya/9gnVWLR
         /+YAWfDH4pDjS/54HxbVN8XYovQm4U2Ldlb8jmV1Uf+3GFfgBhIqye87mVbH/b8EuzpI
         d4ujQxU+WoZSDw43oo2Yfw1Hr4iAjIIRKBvznsNYTJu5O93HPLkJkKlKeeNwtQ3oNc2o
         FJNPpjFuijSQfJAuKNegu0/fcmBw4tWAL/ZJUJYBKLwyPcepMqEtx8PVpsh9NrCvHI19
         s75/u6Y4sbblHLeqWk0cVmQa/m9QYYeJFanKJy2bO0/Pp5a+8t9CQ5/jrwT6POiUIH8F
         zx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036002; x=1795640802;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/P/6NTZzj0ogVm1av5nEuzupBt4WbIXi0d1Gkd2S7o=;
        b=DF1Rw3zZr+Ow5VIsFaOEg49XSYXMd0FwZP70wBwg292/Qyl6GXqgKCe/Z8CxS38tlj
         gUiXacJo0DlM8fBT1fTGKEGYQzaaq9icY1bq3IZkVHVoYiUTVcTJFZGoT36uEThSsvQ/
         lICMEwiuLC64z1X4EFUnVDJAOLmc986Z8sbd7vDwdXrBJQRZ63cwKiCOeNCZjfqItbOf
         6ck/0w2koUOyJC4+HTSe24LDfgwyu+NYjLxILPvhGDMVIqxT90YsTRV1/M3zb+zv5uh5
         lp4CxL/QaS7Fg/8UR7fvd3DXnoOUmcKaqJrwjl/LM/h4Dpq9YSTZkQ9xFxfcU5XP6am8
         an9A==
X-Forwarded-Encrypted: i=1; AL+hErGgHsjcWzUkEoXRuVhxkp1YdmP6C2AAyAA60k4/O8Ds9+LK7R0DoUd3WOKHhyXwwm0c6XVRqhvnl7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/typPVyQqIfecAVr/VvUiquh0ibpHk9A33QE/cK8D4oP6NIri6
	nH0vfDrgVKepxHEfPuUqOXUWMX18umapaIV4OAYuBdOvT4nRUYN0IHJd
X-Gm-Gg: AYBFou0gG0XHj9PckX/LOc0K2oSAggDCFVx1GcO4e+sU2IQ3J+P4ksGBE3IiqE6PTKz
	+0Bc7Gw+op6T8mnwRI5sqUMpadAh09ae0tzAVdhK7mNH/kml8b4ldTsuUoBZvmUknkwiJDrBYtt
	QBCv/nyqukwBZZ/C8pM4G1UGRufJShhNMjM0a1endqS/DpO3NLsnoC+vEXefQ84TeNHhLJ5z30Y
	hIo8USGVaeQwwM9RaBd6bRpdf9fke3hAQ7Vq0zlHIMAZU8GbG4IAtEAPximegS2Kd+SLnLvqM18
	+rY/ns11OaqTA3NJttXFPmtUFtXeR6tJHhEAknkSCKDxanOFcN34uw3wxwy0bwvMTpQ56EOvQDO
	eYhAbMA7syCrfvUQMu4nKVCofTlvjPO/Jwv0TofCsvWPPRzpV8cs1LTbOrJqzfr51YbXjlTdJ5h
	imOMAxMlanc8tOX1i3ZPwSOzEa0Qclh6UTjnNOO7xK7i+EzUc7d8OP4Ml0CKzaFfOXkukT71I9N
	XcpKji5XLF5Wp89fkYp235H4RBAAqDLlMjKYL+xLn5wnfjdKo2T8H6e0dQSnF+n8kZPinGRmFF4
	bE0eFwag1h6F+WbwGw0l5Iq0TTUiMZQkGFdj91hWJjCl3dJctFWiGWgyUN4tiQ3mQY2kspyvXxj
	qBBveF9ERftqp89IOwKqIqNvNcXOAXI413UTshmooxVAcUDxsnLlUVqlypncQ0rbvdHBc9B2WoX
	BrXFBvAxuXuqyJdgc=
X-Received: by 2002:a05:6102:91b:b0:7cc:1ace:fd06 with SMTP id ada2fe7eead31-7d6ba3b35c2mr1570833137.20.1795036002268;
        Wed, 18 Nov 2026 13:06:42 -0800 (PST)
Received: from nixos ([2804:14c:a8:965f:176b:a846:d400:c7cc])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a1c34cesm2985855241.4.2026.11.18.13.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:06:42 -0800 (PST)
From: Igor Giamoniano <igorgphotoarte@gmail.com>
To: danielmaraboo@gmail.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Igor Giamoniano <igorgphotoarte@gmail.com>
Subject: [PATCH v2 1/2] docs: pt_BR: process: translate driver development debugging guide
Date: Wed, 18 Nov 2026 18:06:22 -0300
Message-ID: <20261118210623.111428-2-igorgphotoarte@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118210623.111428-1-igorgphotoarte@gmail.com>
References: <20261118210623.111428-1-igorgphotoarte@gmail.com>
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

