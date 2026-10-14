Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4645304BC
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 17:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999507; cv=none; b=om0B3QR71dWGTWbkvAd1uRGfimlNfFAmom1HqCZHRWS63Z6SZu3dgTHqVm9fulea9ijPWp6awesdyg3h0XaEktJ2sAhnhZvISiL9Tset9al9nxd+1yFnAdL4n9mRrnyxf/ddZRGkJDD68KZ0En08RFWlr+FP8nEseB5D4cT8mwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999507; c=relaxed/simple;
	bh=pt1NF6o7q90HhdLfIGhzbo3+6Goc321bo82iB8AHcRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mvhy9wSjLjgNiNW6Ilkyi9qZvSFIqArUUMXqxeHV+bzxkOjnKirsr26FSgEbp8ad7FrTMfV2FYz+CH8IugDm/8xWEnX+FzbxDwF+i0iJA2I+IeOLpKmNcmlPzcNVEG84FwydbVJaOSIa9M/yj+dqVm5bLxI0C33ffNv+1KTIa9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=omq+HfKi; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="omq+HfKi"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9905e692905so151108241.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 10:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999502; x=1792604302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KykqsFp4XoICGMhqL6MAImWxs26G3z8XCZelE10GDfc=;
        b=omq+HfKizG08CZ9nRsR9Ow0iCE2i4LlaAZXzWsaq9M757A1gNX4bsFvKO56+FTg4uj
         ro/mkXWkkW70AhbtZCqVdTB97KdeaN4rjR+lsyRO1AFKXNR71JZ1hFVJ/BVplqyosmpS
         KXaSdHTsPrg9prnR5mISbI7ioAS+nUT8k9XxuEezhxiwYzc9doYX2k209aF0w+uiBvqU
         OeQ3eoBWLHg5Ux9h7MXGwaq1p3u4zbfbu+Ib0EcF8V+p6PoPzOdUnqNLUhYM5KKHtxWa
         DjXkrwdRANwKqmWufFU+2nqk0eEq7tSFmd18nX/54ohv7KpGldfSifgtSKhh1NaVvLtI
         N2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999502; x=1792604302;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KykqsFp4XoICGMhqL6MAImWxs26G3z8XCZelE10GDfc=;
        b=Zm+tCy2H2TJaGmdWDg5K8oxJujeDLCi2SrDIqcL+iPe+FTFHMrMR143Rsy+oH0JhSz
         Gu9T4R7lDZQ0wSXSY0estpnMt+BMkh+m2quQExELFtNltVs8vZBEdkBvQ0GXCQW2Crhh
         gtlkmvxKLip82VuMhDWr1sWJKOX3x+TynZGj6oBzn2HKF6n2ATyMb7PO9bXQ5OswldT7
         Tyf3kKifeHEj4cp1LsgLni0IY+Bo0GyGqw4Cy4gGLjAB4IjkoL58nn9wy7x95h+Y5A5F
         UOnFersYwRugpyFo8LMHCZzUzE1NYNm/1Yw9TLyAVbbdd3vYDR3XMAoKDvmKdhau0XWf
         +SOw==
X-Forwarded-Encrypted: i=1; AKwUvBzgxEH/DcnRly4MaiEkomydtsiuLYor/013mdyJDdAJrGxgVjgGEhyP7UpHX5ZIcdiXm1m7yYnVSQM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKGGGMEVZxEwOpWG/xvgOMy4fS4el9qIpEx4C4spom7bBi+9Sz
	QFhlzoyFhJvHSzQnXPj0MpHGbq4a+gtiaXakzOUbSfGaM5NupQyPfJSu
X-Gm-Gg: AYBFou0NAYe4P0o2Qj2c+ENx6u851vcT2dU2aLoiRCCYil6odwc4HhqWRVRRmk7AiSf
	7vcIRX1igwvG1LMmJjY3NOQjFHXQKJLulTZNfT7dFq5FulVF7ZP8MuxXxx8bIfFjMhUqlQLc78/
	n+iMI70IaaF8Cmo10yhkMDVnBp7LiXmZ3dDUXLPKb8Bh2SWqwy8+Mc2P7PSHvoCmcbOItyJESDn
	MfSRNLjjHs6S0Vk39z5lF2jc7ZZtQwnOFSXlPBdsIAHYl7qn883ESat0mSCJsjgyJFgZbW1Cz/R
	IpmG2XKv8I4znVM+4PnA7LMgrIh05YnAWnNCrvFRsG4kmAlO6b+ZOk9g5INNg2C1oVdUBB5sQQZ
	ws+mseiuokIpOseAaVgx01UbtMW+vQueVqFTilDbzlyrbQv5SpQDoVIJUDyphIErjhCSySDH+L8
	iN5H+z3hsFpsD8dg2PufSxQ2Qw/jA+22gA1x8EqEgqmhw/Cm0YfNvEKZLYJ0uCFzwvYnTCB0T23
	pbATwJ69OZxMLJw0eMIQR/AvzG925nYoHYvmpZMLUMYLA+0PQv2sgJ1yHQnFqJ7WDvugXWmeDQT
	qfkv50QV67/D319LY7iwlg==
X-Received: by 2002:a05:6102:54a6:b0:7c1:b55d:373c with SMTP id ada2fe7eead31-7cb3a18c1b6mr3618030137.31.1791999501789;
        Wed, 14 Oct 2026 10:38:21 -0700 (PDT)
Received: from fedora ([2804:14c:a8:965f::1f2c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb39d6396asm11347987137.1.2026.10.14.10.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:38:21 -0700 (PDT)
From: Igor Giamoniano <igorgphotoarte@gmail.com>
To: danielmaraboo@gmail.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Igor Giamoniano <igorgphotoarte@gmail.com>
Subject: [PATCH v4] docs: pt_BR: process: translate userspace debugging guide
Date: Wed, 14 Oct 2026 14:38:12 -0300
Message-ID: <20261014173814.103903-1-igorgphotoarte@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate the userspace debugging guide into Brazilian Portuguese, so
that pt_BR readers have access to the overview of the tools available
for debugging the kernel from userspace: dynamic debug, ftrace, the
perf family and the kernel panic analysis tools.

Add the new document to the toctree of the pt_BR debugging index and
make the index point to the translated file. Cross-references to
documents that have no pt_BR translation yet still point to their
English originals, so that no dangling references are created.

Signed-off-by: Igor Giamoniano <igorgphotoarte@gmail.com>
---
Changes in v4:
- Add an actual commit message body (Jonathan Corbet)

Changes in v3:
- Point the "conselhos gerais" :doc: reference to the translated index
  (relative <index>) instead of the English /process/debugging/index
  (Daniel Pereira)

Changes in v2:
- Fix the title: "espaço usuário" -> "espaço de usuário" (Daniel Pereira)
- Reword the ftrace bullet to read more naturally in Brazilian Portuguese
- Keep "crash dump" untranslated as a technical term (2 occurrences)
- Reword the Perfetto description

The v2 rewording changes come from a review by Lucas Ramalho.

 .../pt_BR/process/debugging/index.rst         |  10 +-
 .../debugging/userspace_debugging_guide.rst   | 297 ++++++++++++++++++
 2 files changed, 304 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/translations/pt_BR/process/debugging/userspace_debugging_guide.rst

diff --git a/Documentation/translations/pt_BR/process/debugging/index.rst b/Documentation/translations/pt_BR/process/debugging/index.rst
index b223fae34..ab739a6a3 100644
--- a/Documentation/translations/pt_BR/process/debugging/index.rst
+++ b/Documentation/translations/pt_BR/process/debugging/index.rst
@@ -7,12 +7,16 @@ Dicas de depuração para desenvolvedores do Kernel Linux
 Guias gerais
 ------------
 
+.. toctree::
+   :maxdepth: 1
+
+   userspace_debugging_guide
+
 Todolist:
 
 *   driver_development_debugging_guide
 *   gdb-kernel-debugging
 *   kgdb
-*   userspace_debugging_guide
 
 Guias específicos de subsistemas
 --------------------------------
@@ -40,8 +44,8 @@ andamento?
 
 Nesse caso, sua capacidade de depuração depende do suporte de depuração
 embutido no kernel fornecido pela distribuição.
-O :doc:`/process/debugging/userspace_debugging_guide` fornece uma breve visão
-geral sobre uma variedade de ferramentas de depuração possíveis nessa situação.
+O :doc:`userspace_debugging_guide` fornece uma breve visão geral sobre uma
+variedade de ferramentas de depuração possíveis nessa situação.
 Você pode verificar a capacidade do seu kernel, na maioria dos casos, olhando o
 arquivo de configuração dentro do diretório /boot.
 
diff --git a/Documentation/translations/pt_BR/process/debugging/userspace_debugging_guide.rst b/Documentation/translations/pt_BR/process/debugging/userspace_debugging_guide.rst
new file mode 100644
index 000000000..8c1619213
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/debugging/userspace_debugging_guide.rst
@@ -0,0 +1,297 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================================================
+Conselhos de depuração a partir do espaço de usuário
+====================================================
+
+Este documento fornece uma breve visão geral das ferramentas mais comuns
+para depurar o kernel Linux a partir do espaço de usuário.
+Para conselhos de depuração voltados a desenvolvedores de drivers, veja
+:doc:`aqui </process/debugging/driver_development_debugging_guide>`.
+Para conselhos gerais de depuração, veja o :doc:`documento de conselhos
+gerais <index>`.
+
+.. contents::
+    :depth: 3
+
+As seções a seguir apresentam as ferramentas disponíveis.
+
+Dynamic debug
+-------------
+
+Mecanismo para filtrar o que chega ao log do kernel, desabilitando ou
+habilitando mensagens de log.
+
+Pré-requisito: ``CONFIG_DYNAMIC_DEBUG``
+
+O dynamic debug só consegue atuar sobre:
+
+- pr_debug()
+- dev_dbg()
+- print_hex_dump_debug()
+- print_hex_dump_bytes()
+
+Por isso a utilidade dessa ferramenta é, até o momento, bastante limitada,
+já que não há uma regra uniforme para adicionar prints de depuração ao
+código-fonte, o que resulta em uma variedade de formas de implementar
+esses prints.
+
+Note também que a maioria das instruções de depuração é implementada como
+uma variação de dprintk(), que precisa ser ativada por um parâmetro no
+módulo correspondente; o dynamic debug não é capaz de fazer essa etapa por
+você.
+
+Eis um exemplo que habilita todos os pr_debug() disponíveis no arquivo::
+
+  $ alias ddcmd='echo $* > /proc/dynamic_debug/control'
+  $ ddcmd '-p; file v4l2-h264.c +p'
+  $ grep =p /proc/dynamic_debug/control
+   drivers/media/v4l2-core/v4l2-h264.c:372 [v4l2_h264]print_ref_list_b =p
+   "ref_pic_list_b%u (cur_poc %u%c) %s"
+   drivers/media/v4l2-core/v4l2-h264.c:333 [v4l2_h264]print_ref_list_p =p
+   "ref_pic_list_p (cur_poc %u%c) %s\n"
+
+**Quando usar isto em vez do Ftrace?**
+
+- Quando o código contém uma das instruções de print válidas (veja acima)
+  ou quando você adicionou várias instruções pr_debug() durante o
+  desenvolvimento
+- Quando o tempo não é um problema, ou seja, se várias instruções
+  pr_debug() no código não causarem atrasos
+- Quando você se importa mais em receber mensagens de log específicas do
+  que em rastrear o padrão de chamadas de uma função
+
+Para a documentação completa, veja
+:doc:`/admin-guide/dynamic-debug-howto`
+
+Ftrace
+------
+
+Pré-requisito: ``CONFIG_DYNAMIC_FTRACE``
+
+Esta ferramenta usa o sistema de arquivos tracefs para os arquivos de
+controle e de saída. Esse sistema de arquivos é montado como um diretório
+``tracing``, que pode ser encontrado em ``/sys/kernel/`` ou em
+``/sys/debug/kernel/``.
+
+Algumas das operações mais importantes para depuração são:
+
+- Você pode fazer um rastreamento de função adicionando o nome da função
+  ao arquivo ``set_ftrace_filter`` (que aceita qualquer nome de função
+  encontrado no arquivo ``available_filter_functions``) ou pode
+  desabilitar funções específicas adicionando seus nomes ao arquivo
+  ``set_ftrace_notrace`` (mais informações em:
+  :ref:`trace/ftrace:dynamic ftrace`).
+- Para descobrir de onde partem as chamadas, você pode ativar a opção
+  ``func_stack_trace`` em ``options/func_stack_trace``.
+- Rastrear as funções filhas de uma chamada e exibir os valores de retorno
+  é possível adicionando a função desejada ao arquivo
+  ``set_graph_function`` (requer a configuração ``FUNCTION_GRAPH_RETVAL``);
+  mais informações em
+  :ref:`trace/ftrace:dynamic ftrace with the function graph tracer`.
+
+Para a documentação completa do Ftrace, veja :doc:`/trace/ftrace`
+
+Você também pode rastrear eventos específicos :ref:`usando o rastreamento
+de eventos <trace/events:2. using event tracing>`, que pode ser definido
+conforme descrito aqui: :ref:`Criando um tracepoint customizado do Ftrace
+<process/debugging/driver_development_debugging_guide:ftrace>`.
+
+Para a documentação completa do rastreamento de eventos do Ftrace, veja
+:doc:`/trace/events`
+
+.. _pt_BR_read_ftrace_log:
+
+Lendo o log do ftrace
+~~~~~~~~~~~~~~~~~~~~~
+
+O arquivo ``trace`` pode ser lido como qualquer outro arquivo (``cat``,
+``tail``, ``head``, ``vim``, etc.); o tamanho do arquivo é limitado pelo
+``buffer_size_kb`` (``echo 1000 > buffer_size_kb``). O
+:ref:`trace/ftrace:trace_pipe` se comporta de forma semelhante ao arquivo
+``trace``, mas sempre que você lê o arquivo o conteúdo é consumido.
+
+Kernelshark
+~~~~~~~~~~~
+
+Uma interface gráfica para visualizar os rastreamentos em forma de gráfico
+e de lista, a partir da saída da aplicação `trace-cmd
+<https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/>`__.
+
+Para a documentação completa, veja
+`<https://kernelshark.org/Documentation.html>`__
+
+Perf e alternativas
+-------------------
+
+As ferramentas mencionadas acima oferecem maneiras de inspecionar o código
+do kernel, resultados, valores de variáveis, etc. Às vezes você precisa
+primeiro descobrir onde olhar e, para esses casos, um conjunto de
+ferramentas de acompanhamento de desempenho pode ajudar a delimitar o
+problema.
+
+Por que fazer uma análise de desempenho?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Uma análise de desempenho é um bom primeiro passo quando, entre outros
+motivos:
+
+- você não consegue definir o problema
+- você não sabe onde ele ocorre
+- o sistema em execução não deve ser interrompido, ou é um sistema remoto
+  no qual você não pode instalar um novo módulo/kernel
+
+Como fazer uma análise simples com ferramentas do Linux?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Para iniciar uma análise de desempenho, você pode começar com as
+ferramentas usuais, como:
+
+- ``top`` / ``htop`` / ``atop`` (*obtenha uma visão geral da carga do
+  sistema, veja picos em processos específicos*)
+- ``mpstat -P ALL`` (*observe a distribuição de carga entre as CPUs*)
+- ``iostat -x`` (*observe a utilização e o desempenho dos dispositivos de
+  entrada e saída*)
+- ``vmstat`` (*visão geral do uso de memória no sistema*)
+- ``pidstat`` (*semelhante ao* ``vmstat`` *, mas por processo, para
+  restringir ao alvo*)
+- ``strace -tp $PID`` (*uma vez que você conhece o processo, pode descobrir
+  como ele se comunica com o kernel*)
+
+Isso deve ajudar a reduzir suficientemente as áreas a serem investigadas.
+
+Indo mais fundo com o perf
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A ferramenta **perf** fornece uma série de métricas e eventos para
+aprofundar a investigação dos problemas.
+
+Pré-requisito: compilar ou instalar o perf no seu sistema
+
+Coletar dados estatísticos ao procurar todos os arquivos que começam com
+``gcc`` em ``/usr``::
+
+  # perf stat -d find /usr -name 'gcc*' | wc -l
+
+   Performance counter stats for 'find /usr -name gcc*':
+
+     1277.81 msec    task-clock             #    0.997 CPUs utilized
+     9               context-switches       #    7.043 /sec
+     1               cpu-migrations         #    0.783 /sec
+     704             page-faults            #  550.943 /sec
+     766548897       cycles                 #    0.600 GHz                         (97.15%)
+     798285467       instructions           #    1.04  insn per cycle              (97.15%)
+     57582731        branches               #   45.064 M/sec                       (2.85%)
+     3842573         branch-misses          #    6.67% of all branches             (97.15%)
+     281616097       L1-dcache-loads        #  220.390 M/sec                       (97.15%)
+     4220975         L1-dcache-load-misses  #    1.50% of all L1-dcache accesses   (97.15%)
+     <not supported> LLC-loads
+     <not supported> LLC-load-misses
+
+   1.281746009 seconds time elapsed
+
+   0.508796000 seconds user
+   0.773209000 seconds sys
+
+
+  52
+
+A disponibilidade de eventos e métricas depende do sistema em que você está
+executando.
+
+Para a documentação completa, veja
+`<https://perf.wiki.kernel.org/index.php/Main_Page>`__
+
+Perfetto
+~~~~~~~~
+
+Um conjunto de ferramentas para medir e analisar o desempenho de
+aplicações e sistemas. Você pode usá-lo para:
+
+* identificar gargalos
+* otimizar código
+* fazer o software rodar mais rápido e de forma mais eficiente.
+
+**Qual é a diferença entre o perfetto e o perf?**
+
+* o perf é uma ferramenta que faz parte do kernel Linux e é especializada
+  nele, com interface de linha de comando.
+* o Perfetto é um conjunto multiplataforma de ferramentas para análise de
+  desempenho, estende suas funcionalidades ao espaço de usuário e oferece
+  uma interface web.
+
+Para a documentação completa, veja `<https://perfetto.dev/docs/>`__
+
+Ferramentas de análise de kernel panic
+--------------------------------------
+
+  Para capturar o crash dump, use ``Kdump`` e ``Kexec``. Abaixo você
+  encontra alguns conselhos para analisar os dados.
+
+  Para a documentação completa, veja :doc:`/admin-guide/kdump/kdump`
+
+  Para encontrar a linha correspondente no código, você pode usar o
+  `faddr2line
+  <https://elixir.bootlin.com/linux/v6.11.6/source/scripts/faddr2line>`__;
+  note que é preciso habilitar ``CONFIG_DEBUG_INFO`` para que isso
+  funcione.
+
+  Uma alternativa ao ``faddr2line`` é o uso do ``objdump`` (e de suas
+  variantes para as diferentes plataformas, como
+  ``aarch64-linux-gnu-objdump``). Tome esta linha como exemplo:
+
+  ``[  +0.000240]  rkvdec_device_run+0x50/0x138 [rockchip_vdec]``.
+
+  Podemos encontrar a linha de código correspondente executando::
+
+    aarch64-linux-gnu-objdump -dS drivers/staging/media/rkvdec/rockchip-vdec.ko | grep rkvdec_device_run\>: -A 40
+    0000000000000ac8 <rkvdec_device_run>:
+     ac8:	d503201f 	nop
+     acc:	d503201f 	nop
+    {
+     ad0:	d503233f 	paciasp
+     ad4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
+     ad8:	910003fd 	mov	x29, sp
+     adc:	a90153f3 	stp	x19, x20, [sp, #16]
+     ae0:	a9025bf5 	stp	x21, x22, [sp, #32]
+        const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+     ae4:	f9411814 	ldr	x20, [x0, #560]
+        struct rkvdec_dev *rkvdec = ctx->dev;
+     ae8:	f9418015 	ldr	x21, [x0, #768]
+        if (WARN_ON(!desc))
+     aec:	b4000654 	cbz	x20, bb4 <rkvdec_device_run+0xec>
+        ret = pm_runtime_resume_and_get(rkvdec->dev);
+     af0:	f943d2b6 	ldr	x22, [x21, #1952]
+        ret = __pm_runtime_resume(dev, RPM_GET_PUT);
+     af4:	aa0003f3 	mov	x19, x0
+     af8:	52800081 	mov	w1, #0x4                   	// #4
+     afc:	aa1603e0 	mov	x0, x22
+     b00:	94000000 	bl	0 <__pm_runtime_resume>
+        if (ret < 0) {
+     b04:	37f80340 	tbnz	w0, #31, b6c <rkvdec_device_run+0xa4>
+        dev_warn(rkvdec->dev, "Not good\n");
+     b08:	f943d2a0 	ldr	x0, [x21, #1952]
+     b0c:	90000001 	adrp	x1, 0 <rkvdec_try_ctrl-0x8>
+     b10:	91000021 	add	x1, x1, #0x0
+     b14:	94000000 	bl	0 <_dev_warn>
+        *bad = 1;
+     b18:	d2800001 	mov	x1, #0x0                   	// #0
+     ...
+
+  Ou seja, nesta linha do crash dump::
+
+    [  +0.000240]  rkvdec_device_run+0x50/0x138 [rockchip_vdec]
+
+  Posso tomar ``0x50`` como deslocamento, que devo somar ao endereço base
+  da função correspondente, que encontro nesta linha::
+
+    0000000000000ac8 <rkvdec_device_run>:
+
+  O resultado de ``0xac8 + 0x50 = 0xb18``
+  E quando procuro por esse endereço dentro da função, obtenho a seguinte
+  linha::
+
+    *bad = 1;
+    b18:      d2800001        mov     x1, #0x0
+
+**Copyright** ©2024 : Collabora
-- 
2.55.0

