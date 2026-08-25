Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62F237B010
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 19:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787684638; cv=none; b=kSAs0oMfRPlhUb1TfEdaj9KcveBlieEQs/fPJQPJ69IVbXWZJ5dM7xOAw55n2HEjgo1cN1tgdWruDu1U9MsMBzYd2n55TDLAyRniqUsDKNpmmC4VZXeJU3NzzieHJZKUg7+oc+W53lZq4xBsZkPUS5v0Bu2RJfh/Pd2N0KphjRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787684638; c=relaxed/simple;
	bh=m/Bv7QEKHJ3y2uQBbl6uJDG2L4nmxNGll7e0UhCNzVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ii7q9iDW8w7BUUh0r9ZqcoGAYXHlqXNY8khaMjy/h0eeoVwrA8ZMdXsduwKIZBfvhgr6BFiVU80mHqgOJ3V96MoXIiFF28POX6RmDRdYJs/S05FgNKfOSZ/y/l+JpeJogDljkZfBQvD5v1rNw1Lwaif52/CDkAxGgfIX+dXEWrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=losY9X30; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="losY9X30"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bf9506704fso70326e0c.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 12:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787684635; x=1788289435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSkqPsRHCUDzCBx06jyXwxu5c0/VmObI7O1kAM54thw=;
        b=losY9X30LM8PKyk2Dz65cOMCLSO0MP8w0bX3pLRpLpX3tQTM8I+k7CW10ERocmNXdB
         ao78fhfrTeOhucfQ0DXuqJgPM5Jh92+FilbHftXOOA59x4myYI3h5wxbQEiRQ3ZWD34k
         QwZfyypYmfi+OP6SxCKNV58c79jB5S2ovvFIGV5MP5LzvRRhz4XGTdMrdUOG6RXr033v
         RO6Qhjrhs0PUiB/xeb7onlv4jxDVTFti4tHgtzpCWPqe6fbdxituANyBCjAXx/w2PtUD
         PCUl6u09m7JEHwTEjwMvKCw68XaohzN35h65AK7HLEtJVzSS/487IGDgeqJoCDYCvilh
         GI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787684635; x=1788289435;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rSkqPsRHCUDzCBx06jyXwxu5c0/VmObI7O1kAM54thw=;
        b=HQaKnnxFS37PsHH7ZKipj+OvJghWx5pmTe/kxzqkJPhaBEVA4950FwHJqPvnjOATHj
         ZWrPXI4x5D0j0vcqfETRsOgG0rYlcX5Vc6DdC8P7uUIOFYN8qU111+C+UN/0HP3V4G1O
         kbFVbvmSIB0OwW1J3YEWOh8afokFhQsW9KAnZrVSxpOYN7Yu/fszoGGJ6xIeMqwLzVTX
         A11mfprY93ky0lT0xbpSeZWVBhxrfzsLcuWK6YixmO2qyHlqwJpjuoNVBNPB3wMPGuOu
         8Pi/9R7Yh2RRMCjrM9kMSi9lUlQihRHCrcyJXKqYi8P8dCO9wWyCtMLE0V/VFqD03XLm
         l5qQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMhyjymiKFft6CYxE6rlmVnILIUenzcLweS2jUgm4Meog4d1Mk1kEtANAVXcmE3P8l91Fe2LpqBr8=@vger.kernel.org
X-Gm-Message-State: AFuF++ntJthM87VNeyVsNM8vkKwJlYkgx2sIcNvzbxBwD5seMf+XdlGM
	4mx4peAd24JlU1suwcOMoAzhAsj3V8Rb7mJJgeTzN6RjFBQbSKEdJ95s
X-Gm-Gg: AR+sD11ThcRQFenJm9MLmkq7wad66gE0VoFP32PypIieVgzRl+9UVS4fG5ZictEqoNl
	/MmSZ9eHDyKInn3QmrX8uqrIy+SyMc5iy9nbp1kaPlK8WCdYPMH4gylb58LKs4RMg5lXitliOAe
	KK0uChQ/osOcduhDpkhDyeHPSxwwOcZIyv1wTdxoFBFUz/WGQtZLyGDWD47XTLKi7weV1kgwx93
	6sPj2YuIK5Y+faMnvBM+GEyeibo3z96b30H90xS84PEjMEqOSqLYP9SB9cZthUem/wBFJFgcHx6
	L4vv83U6vjGivbqPGg/Dqd/8Gpt3LnO/bV/USyYmclzJX9rTkUw9S+C7QcsTFLi3TKAbfKpMSF8
	cE+2oULxWUy2SVrp2iLgO6Rk6nJxxLtmmXja6hoNa0kdPkHK5xDKz5ad2+n5JDgMfWUGVaCG8eP
	sUn3S7BPsV49WIhJPaoqCb/Nohzj9/ya6m3b1MBBaXmcEPYb7inugJ/4+8sUZwql1BJ9U=
X-Received: by 2002:a05:6122:4b01:b0:5bf:a179:b2be with SMTP id 71dfb90a1353d-5c65c3c545dmr167444e0c.7.1787684635519;
        Tue, 25 Aug 2026 12:03:55 -0700 (PDT)
Received: from x-wing ([177.181.5.26])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c65aa0d845sm424770e0c.1.2026.08.25.12.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 12:03:54 -0700 (PDT)
From: Fabio Pereira da Silva <silvapfabio@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: pt_BR: process: Translate patch submission checklist
Date: Tue, 25 Aug 2026 16:03:48 -0300
Message-ID: <20260825190348.12701-1-silvapfabio@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/process/submit-checklist.rst into Brazilian Portuguese and link it from the pt_BR documentation index.

Signed-off-by: Fabio Pereira da Silva <silvapfabio@gmail.com>
---
 Documentation/translations/pt_BR/index.rst    |   1 +
 .../pt_BR/process/submit-checklist.rst        | 141 ++++++++++++++++++
 2 files changed, 142 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/submit-checklist.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index dcc238a5ecfe..c09afbe8e22c 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -72,6 +72,7 @@ kernel e sobre como ver seu trabalho integrado.
    Como começar <process/howto>
    Requisitos mínimos <process/changes>
    CVEs <process/cve>
+   Lista de verificação para patches <process/submit-checklist>
    Conclave (Continuidade do projeto) <process/conclave>
    Manuais dos mantenedores <process/maintainer-handbooks>
    Processo do subsistema de rede (netdev) <process/maintainer-netdev>
diff --git a/Documentation/translations/pt_BR/process/submit-checklist.rst b/Documentation/translations/pt_BR/process/submit-checklist.rst
new file mode 100644
index 000000000000..f53b76268641
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/submit-checklist.rst
@@ -0,0 +1,141 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _pt_submitchecklist:
+
+=================================================================
+Lista de verificação para submissão de patches do kernel Linux
+=================================================================
+
+Aqui estão algumas coisas básicas que os desenvolvedores devem fazer se
+quiserem ver suas submissões de patches para o kernel aceitas mais rapidamente.
+
+Tudo isso vai além da documentação fornecida em
+:ref:`Documentation/process/submitting-patches.rst <submittingpatches>`
+e em outros lugares sobre a submissão de patches para o kernel Linux.
+
+Revise seu código
+=================
+
+1) Se você usa uma funcionalidade, então inclua com #include o arquivo que
+   define/declara essa funcionalidade. Não dependa de outros arquivos de
+   cabeçalho para incluírem aqueles que você usa.
+
+2) Verifique o estilo geral do seu patch, conforme detalhado em
+   :ref:`Documentation/process/coding-style.rst <codingstyle>`.
+
+3) Todas as barreiras de memória {por exemplo, ``barrier()``, ``rmb()``,
+   ``wmb()``} precisam de um comentário no código-fonte que explique a lógica
+   do que elas estão fazendo e por quê.
+
+Revise alterações de Kconfig
+============================
+
+1) Quaisquer opções ``CONFIG`` novas ou modificadas não devem desorganizar o menu
+   de configuração e devem vir desativadas por padrão, a menos que atendam aos
+   critérios de exceção documentados em ``Documentation/kbuild/kconfig-language.rst``
+   Atributos de menu: valor padrão.
+
+2) Todas as novas opções ``Kconfig`` devem ter texto de ajuda.
+
+3) Deve ter sido revisado cuidadosamente em relação às combinações relevantes
+   de ``Kconfig``. É muito difícil acertar isso com testes; raciocínio
+   cuidadoso compensa aqui.
+
+Forneça documentação
+====================
+
+1) Inclua :ref:`kernel-doc <kernel_doc>` para documentar APIs globais do kernel.
+   (Não é obrigatório para funções estáticas, mas também é aceitável nelas.)
+
+2) Todas as novas entradas em ``/proc`` devem ser documentadas em
+   ``Documentation/``.
+
+3) Todos os novos parâmetros de inicialização do kernel devem ser documentados
+   em ``Documentation/admin-guide/kernel-parameters.rst``.
+
+4) Todos os novos parâmetros de módulo devem ser documentados com
+   ``MODULE_PARM_DESC()``.
+
+5) Todas as novas interfaces de espaço de usuário devem ser documentadas em
+   ``Documentation/ABI/``. Veja Documentation/admin-guide/abi.rst (ou
+   ``Documentation/ABI/README``) para mais informações.
+   Patches que alteram interfaces de espaço de usuário devem colocar
+   linux-api@vger.kernel.org em cópia (CC).
+
+6) Se algum ioctl for adicionado pelo patch, atualize também
+   ``Documentation/userspace-api/ioctl/ioctl-number.rst``.
+
+Verifique seu código com ferramentas
+====================================
+
+1) Verifique violações triviais com o verificador de estilo de patches antes
+   da submissão (``scripts/checkpatch.pl``). Você deve ser capaz de justificar
+   todas as violações que permanecerem no seu patch.
+
+2) Verifique limpo com sparse.
+
+3) Use ``make checkstack`` e corrija quaisquer problemas encontrados.
+   Observe que ``checkstack`` não aponta problemas explicitamente, mas qualquer
+   função que use mais de 512 bytes na pilha é candidata a alteração.
+
+Compile seu código
+==================
+
+1) Compila sem problemas:
+
+  a) com as opções ``CONFIG`` aplicáveis ou modificadas como ``=y``, ``=m`` e
+     ``=n``. Sem avisos/erros do ``gcc`` e sem avisos/erros do linker.
+
+  b) Passa em ``allnoconfig`` e ``allmodconfig``.
+
+  c) Compila com sucesso ao usar ``O=builddir``.
+
+  d) Quaisquer alterações em Documentation/ compilam com sucesso sem novos
+     avisos/erros. Use ``make htmldocs`` ou ``make pdfdocs`` para verificar a
+     compilação e corrigir quaisquer problemas.
+
+2) Compila em múltiplas arquiteturas de CPU usando ferramentas locais de
+   compilação cruzada ou alguma outra infraestrutura de build.
+   Observe que testar em arquiteturas com tamanhos de palavra diferentes
+   (32 e 64 bits) e endianidade diferente (big-endian e little-endian) é eficaz para
+   detectar vários problemas de portabilidade causados por falsas suposições
+   sobre intervalo de quantidades representáveis, alinhamento de dados ou
+   endianidade, entre outros.
+
+3) Código recém-adicionado foi compilado com ``gcc -W`` (use
+   ``make KCFLAGS=-W``). Isso gerará muito ruído, mas é bom para encontrar
+   bugs como "warning: comparison between signed and unsigned".
+
+4) Se o código-fonte modificado depende de ou usa qualquer API ou recurso do
+   kernel relacionado aos seguintes símbolos ``Kconfig``, então teste múltiplas
+   compilações com os símbolos ``Kconfig`` relacionados desativados e/ou como
+   ``=m`` (se essa opção estiver disponível) [não todos ao mesmo tempo, apenas
+   várias combinações aleatórias deles]:
+
+   ``CONFIG_SMP``, ``CONFIG_SYSFS``, ``CONFIG_PROC_FS``, ``CONFIG_INPUT``,
+   ``CONFIG_PCI``, ``CONFIG_BLOCK``, ``CONFIG_PM``, ``CONFIG_MAGIC_SYSRQ``,
+   ``CONFIG_NET``, ``CONFIG_INET=n`` (mas este último com ``CONFIG_NET=y``).
+
+Teste seu código
+================
+
+1) Foi testado com ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
+   ``CONFIG_SLUB_DEBUG``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
+   ``CONFIG_DEBUG_SPINLOCK``, ``CONFIG_DEBUG_ATOMIC_SLEEP``,
+   ``CONFIG_PROVE_RCU`` e ``CONFIG_DEBUG_OBJECTS_RCU_HEAD`` todos ativados
+   simultaneamente.
+
+2) Foi testado em compilação e em tempo de execução com e sem ``CONFIG_SMP`` e
+   ``CONFIG_PREEMPT``.
+
+3) Todos os caminhos de código foram exercitados com todos os recursos do lockdep
+   ativados.
+
+4) Foi verificado com injeção de falhas pelo menos de slab e de alocação de
+   páginas. Veja ``Documentation/fault-injection/``. Se o novo código for
+   substancial, a adição de injeção de falhas específica do subsistema pode ser
+   apropriada.
+
+5) Testado com a tag mais recente da linux-next para garantir que ainda funciona
+   com todos os outros patches enfileirados e várias alterações na VM, VFS e em
+   outros subsistemas.
\ No newline at end of file
-- 
2.55.0.windows.2

