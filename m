Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232873FFD
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 02:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784167860; cv=none; b=I1YUQgU1dAUuwUGwb9vYSIu1j6lhEYZrQW9imO6eYfLpturR3BCae47Pbx9Hu0eRqnZ4WEliB962l51jBvRfFmlj6gH1dZoztHZsosLXaCU5sRbggG7CbW5PUeyMrMMxJMBQIn20SyMHWwpgqpZjcubAI617FvnoedU80ViEFKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784167860; c=relaxed/simple;
	bh=KTmHtLdTF5Er/qtt0TdIusj8YTpVTILVnxyg2mOiw9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VizvPgyo3JgqvvJKLP7VldGb181Xs51aogX7v+wIPklq2h4UV0Ar/NyuYOevwD8fTjqzNWuTIQGwITg/iV9fJJJvcNVhBay5iv0OocSUWEGTBJJYJXyMGi84vzmzURVCMaXBvSMz03JtOTiW/PtV/MM/eGMT7EBo83BhV+Zxb7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a04bv1P5; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a04bv1P5"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso3927445a12.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 19:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784167858; x=1784772658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=opwq0HQJ06j4bR98toK/R4Gtqfeqpug30iEE7785aDg=;
        b=a04bv1P5Wy40mjuspkl9VgbBppEGeyGrKFd3QsWTudfYJ1De/grxE4ZgpKLoxRyzFt
         6erZDHEXlkVMj5jF5dO1fIOtBIZSnw/SP5A0ONndriYYEhGFLObpniaG9vlL6FD7S3xa
         2xTDHtXf5YqlUKAEshGR82YgLmOnUrMTCTdVoCmCVnPuxwtoDDRpWQu5EXeR8wjQGVMs
         qrpxtKeBYYXOvN0wGVFOtKRiYrtKlTXKufgpy/AdZWIE2fHFwzK0ObH0t3MYRn6C5Jy/
         8IA98LrQ3j7me2ZpJ7CmSglCTlcXli6uhwQLNcrm2AXqxf0ENexOMlOpf4+6PnB3VtA5
         EhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784167858; x=1784772658;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opwq0HQJ06j4bR98toK/R4Gtqfeqpug30iEE7785aDg=;
        b=R/Fd9aJxHTUD/uXwdF+Bi64vhf+R52rxAoi0GGteXHKOlsRK38vscrxRA9qiNvZun7
         jiXcHc4wDhLsvi9BA348WjKB9QRC2DLLOLSeM9qtRNHR2c8CbP5RnKnjVDtPl8bAqIU9
         kwXeKOzjF10AmKhA5AGv5eSHsT3Kq8yCqrXzhm0nTTEgYM4g7NPb5yGlzD0jrTVO6F6s
         dAaJZ7Ikb4kA6lGHr93UxU1bhqWoehUwP630dx4EVA6ugGlhmK9jnZx+Dlj9UND2etGS
         l7K1G3WVA69yObxcjT+bjPfHCBHptmmIZrt6Yd4iwZvJMQkfaNj42Hyez2Y58cLyCrwy
         zqZg==
X-Gm-Message-State: AOJu0YxB1xKDLuSv0h5vPu1vG+TkbaajQA5BElgTAu24Qbwm6R5X0WTI
	Dv8AVg4ZG9eRg0NHdZM1z10WeSGH2VQuOgCTchH2U7nRwmlRNfzdYZGU
X-Gm-Gg: AfdE7ckgGLMRLhDJt0i377x2I9V0bLQoGYCxEUMVtiVN+A0BQ62fTIiIeYjDffT86U/
	qxUHAZqEYFortT1tnItjrzGstjkagHz2Kxujx1UKgacFzy+n41AjsZrTDTsbaOz3UYBIxMUPNLf
	0Wz1Xj2/7nOz2J0jpMiTMPHzpsnmuozaGSxeYw6k2pTaQtOMsDDiUWTh37h4uvLs8qjt6Mhpc0c
	geCQje50sKpZ2V9LE0s9XlayKnu5NJ3gvx56l6XSPop5S3rZa9eepxc0oAkYae63Lf7mNU5f0fm
	Alda1R5oajyF2IOx7P4WYH76pMBpu3KY6g4j4MUpz1vHX2Ke4dXI0mquOW37E9vK5p7TrZLhJ2S
	y4yr+B8NW/zsDpr2E/mzYWz4wUUoD0YgqlHivLv4gdynuoj6zghx4WoPXPTSmUJkhyL9HQImVVB
	+sNikRSrZmDHZTjM97tKN75fOTAE2Vqye28v0rFT2xIKM61uYpEg3TNhPQQ79Fo6En3f6xNkmWF
	faZGaS8JMmo/RRgs2v5EU1oxlNMTg==
X-Received: by 2002:a05:6a21:3297:b0:3bf:bfd0:2a11 with SMTP id adf61e73a8af0-3c34d719d16mr11655556637.43.1784167858023;
        Wed, 15 Jul 2026 19:10:58 -0700 (PDT)
Received: from parrot.bbrouter ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd429cee1sm6979209c88.6.2026.07.15.19.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 19:10:57 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 1/4] docs: pt_BR: Translate submit-checklist to Portuguese
Date: Wed, 15 Jul 2026 23:10:09 -0300
Message-ID: <20260716021013.48025-2-danielmaraboo@gmail.com>
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

Translate the submit-checklist document from Documentation/process/
to Portuguese (pt_BR) to make the kernel contribution guidelines
more accessible to Portuguese-speaking developers.

Also, add the newly translated file to the main index in the pt_BR
translation directory to ensure it compiles and links correctly
within the Sphinx build.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 Documentation/translations/pt_BR/index.rst    |   1 +
 .../pt_BR/process/submit-checklist.rst        | 145 ++++++++++++++++++
 2 files changed, 146 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/submit-checklist.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 2ab14c5d6..841b49657 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -83,3 +83,4 @@ kernel e sobre como ver seu trabalho integrado.
    Conformidade de DTS para SoC <process/maintainer-soc-clean-dts>
    Processo do subsistema KVM x86 <process/maintainer-kvm-x86>
    Adicionando uma nova chamada de Sistema <process/adding-syscalls>
+   Lista de verificação para submissão de patches do kernel Linux <process/submit-checklist>
diff --git a/Documentation/translations/pt_BR/process/submit-checklist.rst b/Documentation/translations/pt_BR/process/submit-checklist.rst
new file mode 100644
index 000000000..003fc9568
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/submit-checklist.rst
@@ -0,0 +1,145 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================================================
+Lista de verificação para submissão de patches do kernel Linux
+==============================================================
+
+Aqui estão algumas coisas básicas que os desenvolvedores devem fazer se
+quiserem ver suas submissões de patches de kernel aceitas mais rapidamente.
+
+Estas diretrizes vão além da documentação fornecida em
+:ref:`Documentation/process/submitting-patches.rst <submittingpatches>`
+e em outros locais sobre o envio de patches para o kernel Linux.
+
+Revise seu código
+=================
+
+1) Se você usar um recurso, faça o #include do arquivo que define/declara
+   esse recurso. Não dependa de outros arquivos de cabeçalho que incluam
+   os que você usa de forma indireta.
+
+2) Verifique o estilo geral do seu patch conforme detalhado em
+   :ref:`Documentation//process/coding-style.rst <codingstyle>`.
+
+3) Todas as barreiras de memória {por exemplo, ``barrier()``, ``rmb()``,
+   ``wmb()``} precisam de um comentário no código-fonte que explique a
+   lógica do que estão fazendo e o porquê.
+
+Revise as alterações do Kconfig
+===============================
+
+1) Quaisquer novas ou modificadas opções de ``CONFIG`` não bagunçam o
+   menu de configuração e têm 'desativado' (off) como padrão, a menos que
+   atendam aos critérios de exceção documentados em
+   ``Documentation/kbuild/kconfig-language.rst``, atributos de menu: valor
+   padrão.
+
+2) Todas as novas opções de ``Kconfig`` possuem texto de ajuda.
+
+3) Foram cuidadosamente revisadas com relação às combinações relevantes de
+   ``Kconfig``. Isso é muito difícil de acertar apenas com testes --- exige
+   capacidade de raciocínio.
+   pays off here.
+
+Forneça documentação
+====================
+
+1) Inclua :ref:`kernel-doc <kernel_doc>` para documentar as APIs globais
+   do kernel. (Não é obrigatório para funções estáticas, mas também é
+   aceitável nelas.)
+
+2) Todas as novas entradas em ``/proc`` devem ser documentadas sob
+   ``Documentation/``.
+
+3) Todos os novos parâmetros de inicialização (boot) do kernel devem ser
+   documentados em ``Documentation/admin-guide/kernel-parameters.rst``.
+
+4) Todos os novos parâmetros de módulo devem ser documentados com
+   ``MODULE_PARM_DESC()``.
+
+5) Todas as novas interfaces com o espaço de usuário (userspace) devem ser
+   documentadas em ``Documentation/ABI/``. Consulte
+   ``Documentation/admin-guide/abi.rst`` (ou ``Documentation/ABI/README``)
+   para obter mais informações. Patches que alteram interfaces de espaço
+   de usuário devem incluir em cópia (CC) linux-api@vger.kernel.org.
+
+6) Se quaisquer ioctls forem adicionados pelo patch, atualize também
+   ``Documentation/userspace-api/ioctl/ioctl-number.rst``.
+
+Verifique seu código com ferramentas
+====================================
+
+1) Verifique se há violações triviais com o verificador de estilo de patch
+   antes do envio (``scripts/checkpatch.pl``). Você deve ser capaz de
+   justificar todas as violações que permanecerem no seu patch.
+
+2) Faça uma verificação limpa com o sparse.
+
+3) Use ``make checkstack`` e corrija quaisquer problemas encontrados por ele.
+   Observe que o ``checkstack`` não aponta problemas explicitamente, mas
+   qualquer função individual que utilize mais de 512 bytes na pilha é uma
+   candidata a alteração.
+
+Compile seu código
+==================
+
+1) Compila de forma limpa:
+
+  a) com as opções de ``CONFIG`` aplicáveis ou modificadas definidas como
+     ``=y``, ``=m`` e ``=n``. Sem avisos/erros do ``gcc``, sem avisos/erros do
+     vinculador (linker).
+
+  b) Passa em ``allnoconfig``, ``allmodconfig``
+
+  c) Compila com sucesso ao usar ``O=builddir``
+
+  d) Quaisquer alterações em Documentation/ compilam com sucesso sem novos
+     avisos/erros. Use ``make htmldocs`` ou ``make pdfdocs`` para verificar
+     a compilação e corrigir quaisquer problemas.
+
+2) Compila em múltiplas arquiteturas de CPU usando ferramentas locais de
+   compilação cruzada (cross-compile) ou alguma outra fazenda de compilação
+   (build farm).
+   Observe que testar em arquiteturas de diferentes tamanhos de palavra
+   (32 e 64 bits) e diferentes endianness (big- e little-endian) é eficaz
+   para capturar vários problemas de portabilidade decorrentes de falsas
+   suposições sobre o intervalo de quantidade representável, alinhamento
+   de dados ou endianness, entre outros.
+
+3) O novo código adicionado foi compilado com ``gcc -W`` (use
+   ``make KCFLAGS=-W``). Isso gerará muito ruído, mas é bom para encontrar
+   bugs como "warning: comparison between signed and unsigned".
+
+4) Se o seu código-fonte modificado depender ou usar quaisquer APIs ou
+   recursos do kernel relacionados aos seguintes símbolos do ``Kconfig``,
+   teste múltiplas compilações com os símbolos relacionados do ``Kconfig``
+   desativados e/ou definidos como ``=m`` (se essa opção estiver disponível)
+   [não todos ao mesmo tempo, apenas combinações variadas/aleatórias deles]:
+
+   ``CONFIG_SMP``, ``CONFIG_SYSFS``, ``CONFIG_PROC_FS``, ``CONFIG_INPUT``,
+   ``CONFIG_PCI``, ``CONFIG_BLOCK``, ``CONFIG_PM``, ``CONFIG_MAGIC_SYSRQ``,
+   ``CONFIG_NET``, ``CONFIG_INET=n`` (mas este último com ``CONFIG_NET=y``).
+
+Teste seu código
+================
+
+1) Foi testado com ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
+   ``CONFIG_SLUB_DEBUG``, ``CONFIG_DEBUG_PAGEALLOC``,
+   ``CONFIG_DEBUG_MUTEXES``, ``CONFIG_DEBUG_SPINLOCK``,
+   ``CONFIG_DEBUG_ATOMIC_SLEEP``, ``CONFIG_PROVE_RCU`` e
+   ``CONFIG_DEBUG_OBJECTS_RCU_HEAD`` todos habilitados simultaneamente.
+
+2) Foi testado em tempo de compilação e de execução com e sem ``CONFIG_SMP``
+   e ``CONFIG_PREEMPT``.
+
+3) Todos os caminhos de código foram executados com todos os recursos de
+   lockdep ativados.
+
+4) Foi verificado com a injeção de falhas de pelo menos slab e alocação de
+   páginas. Consulte ``Documentation/fault-injection/``.
+   Se o novo código for substancial, a adição de injeção de falhas específica
+   do subsistema pode ser apropriada.
+
+5) Testado com a tag mais recente do linux-next para garantir que ele ainda
+   funcione com todos os outros patches enfileirados e com várias alterações
+   na VM, VFS e outros subsistemas.
-- 
2.47.3

