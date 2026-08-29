Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4C03905F0
	for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 16:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020695; cv=none; b=LfbcTzxULhbeGY5sVWJmyoey75eOgJn7/CMfWS0MjZ3S+KiIPtyxwv8ebXJecepBGz0fTPG9X4YHatP7EdnR6Ge1rgwZDjyEhbIj+p+u2if4cxiWfFJUbb5TDzgbN67gzfk1CNwEMglnw+Fyyt4pO3GGJMOMP4HGsyNA0AtW1iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020695; c=relaxed/simple;
	bh=R4ZAwQ6UEjuoteN3Q6R+IQ1Gw5AfBGe7wHLbZZNRxo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hZjyt/v4oo17NQE0pj6IFw/t6eO7Ua4MWmnuLR08kWQeM1k8r4/0HDZAi2Bd7py7iHcNBg53uYvI31n8bI8eNeQXgoqh4FDCNp1v4D+YDBxVaxI+Cs1noxXny+L2XhmD1U0BnwBTi5xLOhEv/lQYeOUi55StYlfPy7r8piM02o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9mI7I13; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9mI7I13"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3964e76d0f4so2063974a91.3
        for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 09:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788020692; x=1788625492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Be5yJbWDaEPTG4thbC7oT6SXdvY4vyZD7DstkKRmB24=;
        b=f9mI7I13dK5pPa74mypdvkoQZzEdLkdFwslp/GXnKjvGeT2uB5L8uVeQNs7xySWDD5
         ZP7jtrxX+CIImWEnSCCwjXKPE6I+50djxLXBpF6jcPL07F7mBUkzHcsUkzGtScCSeAX7
         lTcg7GYnayGV8CQ4BztoGxCgsNk1ZfroT6MFFfXP855zsiYFj26G0HcCNJeapTyaMTE9
         IhHR1HTXx0eBGKlScBaRtBXJsmHQTn+nujGAoH1FE/mlE/LbojxuOx9L5acnUPFif2xB
         EJ9OkmuQiR1i4byzsPGqa7gc4y+536upgBQk5icftygttiEzxhRDKImxwdkPdoQZ/qlu
         5HnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788020692; x=1788625492;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Be5yJbWDaEPTG4thbC7oT6SXdvY4vyZD7DstkKRmB24=;
        b=deF9Y3V4H33M8AygVl6nby7FJgTGpOsn29EPHqttDzdWPHdj7pB/BWDyYs/dWC2dPF
         vwinAY062nkcStPghJWs4NGdx0Xa4dq7L1atTbtZh7vmBnQygdQFMEFSmuRSnsML0CLg
         g4rqEKqE3sqjCnvyh78GbUw3kAXg2SnkgANFZwxjvLN67vKQxnoi9E31PbLz4N+ucslk
         vtRWB0q1PKkICvNK0tIjq5w7QISB+NPCk8X4oVtc5/ek2Nzd9lDYW0Oue+KpabQLo3AH
         8XZRKZD/1JJJdTsALaWmboWtSRspo/9aw/MWtOuQqhozaLMOyLNcNLz8lhcuOTZ9BbaJ
         tt1g==
X-Gm-Message-State: AFuF++l9fMx0jBwi+BwxwWiN6UxTlMdidkNoiFWXC7W1wGpV1Sey4QEh
	+NnLy5AM1z61EBILfgbHiGkuSXyd/SuXGJy8MtLqBFCg58Tf+8f3tbNhepWHTg==
X-Gm-Gg: AYBFou2oalG+llLzfnz8zNpEOXOjlnrdZpCc+Ns9LCJfdW/Cm8g8eeygBlz4mCn3Ep7
	z8PJMYk8feJLwG9xZzBUs5gL95hxvUnLSMA4xuJCnGz5vUg/QvY5l9tHj8PTmpfrqnmiwMCx1Tf
	YHnI8kCgSaEWgdV7RaNMvtEYK5Nxz6Nu05CVUAuM2APhfab3SZKMrA9VqsiZfxOCfkOcWgG2a84
	O8787mbb1I2JKQvSubtzVg9L6CoQjIxMXe8QQlsc0rB6KXjHdBL9yK3XuYf7HeBwXrSwi4mPtMH
	ub/P0zY0rC70dF7ovxiEBQJQcfNPQrtSdAl0o3rumPbaJrCUaHlWCWbf7EQ1nqg8YBAfWXFm8/U
	JozaB3Zd45oKVffJQSOdtYTSmAVsv2ecUW5hTALSk4xcn43sbNlVYwJDVhSMwArizlJ/IWKJ1Le
	2nMUHpeEek8k1hh/FU1ZrVxtbZbwr+01Un7YACxFNIUBoVxqqxlTDH5D4DN2mlaRkKJSBeaiUaI
	CUJhDVs6vCMRo8+qb10FmlADu4gxeyOpTCBs9du2tjQ3R6HwDmL1E4JFW29zd2BtykKAOKMcMag
	8BKi5I9fqAD/Ig==
X-Received: by 2002:a17:90b:224c:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-3989c003c31mr8640794a91.20.1788020692158;
        Sat, 29 Aug 2026 09:24:52 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm25183814c88.0.2026.08.29.09.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:24:51 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 3/3] docs: translations: pt_BR: fix missing text and formatting in process docs
Date: Sat, 29 Aug 2026 13:24:35 -0300
Message-ID: <20260829162438.13039-4-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260829162438.13039-1-danielmaraboo@gmail.com>
References: <20260829162438.13039-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Add a missing paragraph about code review in 6.Followthrough.rst and
fix a grammatical error. Fix formatting and translate an English snippet
in 8.Conclusion.rst. Fix several instances of omitted 'xyzzy'
placeholders in code examples, restore truncated sentences, and fix
missing links in adding-syscalls.rst. Fix typos in applying-patches.rst.
Fix a typo and fix a broken markdown link to reStructuredText format
in backporting.rst.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/process/6.Followthrough.rst         | 14 ++++-
 .../pt_BR/process/8.Conclusion.rst            |  3 +-
 .../pt_BR/process/adding-syscalls.rst         | 54 ++++++++++---------
 .../pt_BR/process/applying-patches.rst        |  4 +-
 .../pt_BR/process/backporting.rst             |  4 +-
 5 files changed, 47 insertions(+), 32 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/6.Followthrough.rst b/Documentation/translations/pt_BR/process/6.Followthrough.rst
index d6bdaa2cb..dbdf479bb 100644
--- a/Documentation/translations/pt_BR/process/6.Followthrough.rst
+++ b/Documentation/translations/pt_BR/process/6.Followthrough.rst
@@ -58,7 +58,17 @@ fácil se você mantiver algumas coisas em mente:
   de codificação e pedidos para refatorar parte do seu código em seções
   compartilhadas do kernel. Uma das funções dos mantenedores é manter as coisas
   com a mesma aparência. Às vezes, isso significa que aquele truque inteligente
-  (*clever hack*) em seu driver para contornar um problema
+  (*clever hack*) em seu driver para contornar um problema na verdade precisa
+  se tornar um recurso generalizado do kernel, pronto para a próxima vez.
+
+O que tudo isso significa é que, quando os revisores lhe enviam comentários,
+você precisa prestar atenção às observações técnicas que eles estão fazendo.
+Não deixe que a forma como eles se expressam, ou o seu próprio orgulho, impeçam
+que isso aconteça. Quando você receber comentários de revisão em um patch,
+reserve um tempo para entender o que o revisor está tentando dizer. Se
+possível, corrija as coisas que o revisor está pedindo para você corrigir. E
+responda ao revisor: agradeça-o e descreva como você responderá às suas
+perguntas.
 
 Note que você não precisa concordar com todas as mudanças sugeridas pelos
 revisores. Se você acredita que o revisor entendeu mal o seu código, explique
@@ -67,7 +77,7 @@ sugerida, descreva-a e justifique a sua solução para o problema. Se as suas
 explicações fizerem sentido, o revisor as aceitará. Contudo, caso a sua
 explicação não seja persuasiva — especialmente se outros começarem a concordar
 com o revisor —, reserve um tempo para repensar as coisas. Pode ser fácil ficar
-ceguificado por sua própria solução para um problema, a ponto de não perceber
+cego por sua própria solução para um problema, a ponto de não perceber
 que algo está fundamentalmente errado ou que, talvez, você não esteja sequer
 resolvendo o problema certo.
 
diff --git a/Documentation/translations/pt_BR/process/8.Conclusion.rst b/Documentation/translations/pt_BR/process/8.Conclusion.rst
index d5af31e7c..2696ea167 100644
--- a/Documentation/translations/pt_BR/process/8.Conclusion.rst
+++ b/Documentation/translations/pt_BR/process/8.Conclusion.rst
@@ -21,6 +21,7 @@ encontradas através do índice do kernel do LWN em:
 	https://lwn.net/Kernel/Index/
 
 Além disso, um recurso valioso para os desenvolvedores do kernel é:
+
 	https://kernelnewbies.org/
 
 E, claro, não se deve esquecer o https://kernel.org/, o local definitivo
@@ -29,7 +30,7 @@ para informações sobre os lançamentos do kernel.
 Há uma série de livros sobre o desenvolvimento do kernel:
 
 	Linux Device Drivers, 3rd Edition (Jonathan Corbet, Alessandro
-	Rubini, and Greg Kroah-Hartman).  Online at
+	Rubini, e Greg Kroah-Hartman). Disponível online em
 	https://lwn.net/Kernel/LDD3/.
 
 	Linux Kernel Development (Robert Love).
diff --git a/Documentation/translations/pt_BR/process/adding-syscalls.rst b/Documentation/translations/pt_BR/process/adding-syscalls.rst
index cdf8b5033..37b0dd0e2 100644
--- a/Documentation/translations/pt_BR/process/adding-syscalls.rst
+++ b/Documentation/translations/pt_BR/process/adding-syscalls.rst
@@ -122,10 +122,10 @@ como o handle (identificador) para esse objeto -- não invente um novo tipo de
 handle de objeto para o espaço do usuário quando o kernel já possui mecanismos
 e semânticas bem definidas para o uso de descritores de arquivo.
 
-Se a sua nova chamada de sistema (2) de fato retornar un novo descritor de
+Se a sua nova chamada de sistema xyzzy(2) de fato retornar um novo descritor de
 arquivo, então o argumento de flags deve incluir um valor que seja equivalente
 a definir ``O_CLOEXEC`` no novo FD. Isso torna possível para o espaço do usuário
-fechar a janela de tempo entre a chamada ``()`` e a execução de
+fechar a janela de tempo entre a chamada ``xyzzy()`` e a execução de
 ``fcntl(fd, F_SETFD, FD_CLOEXEC)``, onde um ``fork()`` e ``execve()`` inesperados
 em outra thread poderiam vazar um descritor para o programa executado. (Contudo,
 resista à tentação de reutilizar o valor real da constante ``O_CLOEXEC``, pois
@@ -138,7 +138,7 @@ deve considerar o que significa usar a família de chamadas de sistema
 pronto para leitura ou escrita é a maneira normal de o kernel indicar ao espaço
 do usuário que um evento ocorreu no objeto correspondente do kernel.
 
-Se a sua nova chamada de sistema (2) envolver um argumento de nome de arquivo
+Se a sua nova chamada de sistema xyzzy(2) envolver um argumento de nome de arquivo
 (filename)::
 
     int sys_xyzzy(const char __user *path, ..., unsigned int flags);
@@ -152,18 +152,18 @@ o arquivo em questão; em particular, permite que o espaço do usuário solicite
 funcionalidade para um descritor de arquivo já aberto usando a flag
 ``AT_EMPTY_PATH``, fornecendo efetivamente uma operação fxyzzy(3) de graça::
 
- - xyzzyat(AT_FDCWD, path, ..., 0) é equivalente a (path,...)
+ - xyzzyat(AT_FDCWD, path, ..., 0) é equivalente a xyzzy(path,...)
  - xyzzyat(fd, "", ..., AT_EMPTY_PATH) é equivalente a fxyzzy(fd, ...)
 
 (Para mais detalhes sobre a justificativa das chamadas \*at(), veja a página de
 manual :manpage:`openat(2)`; para um exemplo de AT_EMPTY_PATH, veja a página de
 manual :manpage:`fstatat(2)`.)
 
-Se a sua nova chamada de sistema (2) envolver um parâmetro que descreve um
+Se a sua nova chamada de sistema xyzzy(2) envolver um parâmetro que descreve um
 deslocamento (offset) dentro de um arquivo, mude o seu tipo para ``loff_t`` para
 que offsets de 64 bits possam ser suportados mesmo em arquiteturas de 32 bits.
 
-Se a sua nova chamada de sistema (2) envolver funcionalidades privilegiadas,
+Se a sua nova chamada de sistema xyzzy(2) envolver funcionalidades privilegiadas,
 ela precisa ser governada pelo bit de capacidade (capability) do Linux apropriado
 (verificado com uma chamada a ``capable()``), conforme descrito na página de
 manual :manpage:`capabilities(7)`. Escolha um bit de capacidade existente que governe
@@ -172,7 +172,7 @@ apenas uma vaga relação sob o mesmo bit, pois isso vai contra o propósito das
 capabilities de dividir o poder do root. Em particular, evite adicionar novos
 usos para a capacidade ``CAP_SYS_ADMIN``, que já é excessivamente generalista.
 
-Se a sua nova chamada de sistema (2) manipular um processo diferente do
+Se a sua nova chamada de sistema xyzzy(2) manipular um processo diferente do
 processo que a chamou, ela deve ser restrita (usando uma chamada a
 ``ptrace_may_access()``) para que apenas um processo chamador com as mesmas
 permissões do processo alvo, ou com as capacidades necessárias, possa manipular
@@ -211,7 +211,7 @@ kernel, devem sempre ser enviadas com cópia (cc'ed) para linux-api@vger.kernel.
 Implementação Genérica de Chamadas de Sistema
 ---------------------------------------------
 
-O ponto de entrada principal para a sua nova chamada de sistema (2) será chamado
+O ponto de entrada principal para a sua nova chamada de sistema xyzzy(2) será chamado
 de ``sys_xyzzy()``, mas você deve adicionar esse ponto de entrada com a macro
 ``SYSCALL_DEFINEn()`` apropriada, em vez de fazer isso explicitamente. O 'n'
 indica o número de argumentos da chamada de sistema, e a macro recebe o nome da
@@ -242,7 +242,7 @@ O arquivo ``kernel/sys_ni.c`` fornece uma implementação de stub de fallback pa
 cada chamada de sistema, retornando ``-ENOSYS``. Adicione a sua nova chamada de
 sistema aqui também::
 
-    COND_SYSCALL(sys_xyzzy);
+    COND_SYSCALL(xyzzy);
 
 A sua nova funcionalidade de kernel, e a chamada de sistema que a controla, deve
 normalmente ser opcional, portanto adicione uma opção ``CONFIG`` (tipicamente em
@@ -259,7 +259,7 @@ normalmente ser opcional, portanto adicione uma opção ``CONFIG`` (tipicamente
 Para resumir, você precisa de um commit que inclua:
 
  - Opção ``CONFIG`` para a nova função, normalmente em ``init/Kconfig``
- - ``SYSCALL_DEFINEn(, ...)`` para o ponto de entrada
+ - ``SYSCALL_DEFINEn(xyzzy, ...)`` para o ponto de entrada
  - Protótipo correspondente em ``include/linux/syscalls.h``
  - Entrada na tabela genérica em ``include/uapi/asm-generic/unistd.h``
  - Stub de fallback em ``kernel/sys_ni.c``
@@ -289,7 +289,7 @@ ajustar ``arch/*/kernel/Makefile.syscalls``.
 Como o ``scripts/syscall.tbl`` serve como uma tabela de syscall comum para
 múltiplas arquiteturas, uma nova entrada é necessária nesta tabela::
 
-    468   common        sys_xyzzy
+    468   common   xyzzy     sys_xyzzy
 
 Note que adicionar uma entrada ao ``scripts/syscall.tbl`` com a ABI "common"
 também afeta todas as arquiteturas que compartilham essa tabela. Para alterações
@@ -304,7 +304,7 @@ correspondentes também devem ser feitas em ``arch/*/kernel/Makefile.syscalls``:
 Para resumir, você precisa de um commit que inclua:
 
  - Opção ``CONFIG`` para a nova função, normalmente em ``init/Kconfig``
- - ``SYSCALL_DEFINEn(, ...)`` para o ponto de entrada
+ - ``SYSCALL_DEFINEn(xyzzy, ...)`` para o ponto de entrada
  - Protótipo correspondente em ``include/linux/syscalls.h``
  - Nova entrada em ``scripts/syscall.tbl``
  - (Se necessário) Atualizações de Makefile em ``arch/*/kernel/Makefile.syscalls``
@@ -320,11 +320,11 @@ de sistema não seja especial de alguma forma (veja abaixo), isso envolve uma
 entrada "common" (para x86_64 e x32) em
 ``arch/x86/entry/syscalls/syscall_64.tbl``::
 
-    333   common        sys_xyzzy
+    333   common   xyzzy     sys_xyzzy
 
 e uma entrada "i386" em ``arch/x86/entry/syscalls/syscall_32.tbl``::
 
-    380   i386          sys_xyzzy
+    380   i386     xyzzy     sys_xyzzy
 
 Novamente, esses números estão sujeitos a alterações caso ocorram conflitos na
 janela de mesclagem (merge window) relevante.
@@ -414,7 +414,7 @@ a versão compat; a entrada em ``include/uapi/asm-generic/unistd.h`` deve usar
 
 Para resumir, você precisa de:
 
- - uma macro ``COMPAT_SYSCALL_DEFINEn(, ...)`` para o ponto de entrada compat
+ - uma macro ``COMPAT_SYSCALL_DEFINEn(xyzzy, ...)`` para o ponto de entrada compat
  - protótipo correspondente em ``include/linux/compat.h``
  - (se necessário) struct de mapeamento de 32 bits em ``include/linux/compat.h``
  - instância de ``__SC_COMP``, e não de ``__SYSCALL``, em
@@ -433,11 +433,11 @@ Você precisa estender a entrada em ``scripts/syscall.tbl`` com uma coluna extra
 para indicar que um programa de espaço do usuário de 32 bits rodando em um
 kernel de 64 bits deve atingir o ponto de entrada compat::
 
-    468   common          sys_xyzzy    compat_sys_xyzzy
+    468   common     xyzzy     sys_xyzzy    compat_sys_xyzzy
 
 Para resumir, você precisa de:
 
- - ``COMPAT_SYSCALL_DEFINEn(, ...)`` para o ponto de entrada compat
+ - ``COMPAT_SYSCALL_DEFINEn(xyzzy, ...)`` para o ponto de entrada compat
  - Protótipo correspondente em ``include/linux/compat.h``
  - Modificação da entrada em ``scripts/syscall.tbl`` para incluir uma coluna
    "compat" extra
@@ -454,7 +454,7 @@ compatibilidade voltadas para o espaço do usuário de 32 bits (AArch32):
 ``arch/arm64/tools/syscall_32.tbl``. Você precisa adicionar uma linha adicional
 a esta tabela especificando o ponto de entrada compat::
 
-    468   common          sys_xyzzy    compat_sys_xyzzy
+    468   common     xyzzy     sys_xyzzy    compat_sys_xyzzy
 
 
 Chamadas de Sistema de Compatibilidade (x86)
@@ -467,7 +467,7 @@ Primeiro, a entrada em ``arch/x86/entry/syscalls/syscall_32.tbl`` ganha uma
 coluna extra para indicar que um programa de espaço do usuário de 32 bits rodando
 em um kernel de 64 bits deve atingir o ponto de entrada compat::
 
-    380   i386          sys_xyzzy    __ia32_compat_sys_xyzzy
+    380   i386     xyzzy     sys_xyzzy    __ia32_compat_sys_xyzzy
 
 Segundo, você precisa definir o que deve acontecer para a versão da ABI x32 da
 nova chamada de sistema. Há uma escolha aqui: o layout dos argumentos deve
@@ -479,9 +479,9 @@ corresponder à versão de 32 bits, e a entrada em
 ``arch/x86/entry/syscalls/syscall_64.tbl`` é dividida para que os programas x32
 atinjam o wrapper de compatibilidade::
 
-    333   64            sys_xyzzy
+    333   64       xyzzy     sys_xyzzy
     ...
-    555   x32           __x32_compat_sys_xyzzy
+    555   x32      xyzzy     __x32_compat_sys_xyzzy
 
 Se não houver ponteiros envolvidos, então é preferível reutilizar a chamada de
 sistema de 64 bits para a ABI x32 (e, consequentemente, a entrada em
@@ -518,14 +518,14 @@ Para x86_64, isso é implementado como um ponto de entrada ``stub_xyzzy`` em
 ``arch/x86/entry/entry_64.S``, e a entrada correspondente na tabela de syscalls
 (``arch/x86/entry/syscalls/syscall_64.tbl``) é ajustada para refletir::
 
-    333   common        stub_xyzzy
+    333   common   xyzzy     stub_xyzzy
 
 O equivalente para programas de 32 bits executados em um kernel de 64 bits é
 normalmente chamado de ``stub32_xyzzy`` e implementado em
 ``arch/x86/entry/entry_64_compat.S``, com o respectivo ajuste na tabela de
 syscalls em ``arch/x86/entry/syscalls/syscall_32.tbl``::
 
-    380   i386          sys_xyzzy    stub32_xyzzy
+    380   i386     xyzzy     sys_xyzzy    stub32_xyzzy
 
 Se a chamada de sistema precisar de uma camada de compatibilidade (como na
 seção anterior), a versão ``stub32_`` precisará chamar a versão
@@ -579,12 +579,16 @@ espaço do usuário, o cabeçalho correspondente precisará ser instalado para
 compilar o teste.
 
 Certifique-se de que o autoteste seja executado com sucesso em todas as
-arquiteturas suportadas. Por exemplo, verifique se ele funciona quando compitado
+arquiteturas suportadas. Por exemplo, verifique se ele funciona quando compilado
 como um programa ABI x86_64 (-m64), x86_32 (-m32) e x32 (-mx32).
 
 Para testes mais extensos e minuciosos de novas funcionalidades, você também
 deve considerar a adição de testes ao Linux Test Project ou ao projeto
-xfstests para alterações relacionadas
+xfstests para alterações relacionadas a sistemas de arquivos.
+
+ - https://linux-test-project.github.io/
+ - git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
+
 
 Página de Manual (Man Page)
 ---------------------------
diff --git a/Documentation/translations/pt_BR/process/applying-patches.rst b/Documentation/translations/pt_BR/process/applying-patches.rst
index 313401bc2..37a8d804d 100644
--- a/Documentation/translations/pt_BR/process/applying-patches.rst
+++ b/Documentation/translations/pt_BR/process/applying-patches.rst
@@ -12,7 +12,7 @@ Autor Original:
    manualmente, você quase certamente desejará considerar o uso do Git.
 
 Uma pergunta feita com frequência na Linux Kernel Mailing List é como aplicar
-an patch ao kernel ou, mais especificamente, a qual kernel base um patch para
+um patch ao kernel ou, mais especificamente, a qual kernel base um patch para
 uma das muitas árvores/branches deve ser aplicado. Esperamos que este documento
 explique isso a você.
 
@@ -171,7 +171,7 @@ fazer a alteração para fazê-la caber).
 O arquivo resultante pode ou não estar correto, dependendo do motivo pelo qual o
 arquivo estava diferente do esperado.
 
-Isso geralmente acontece se você tentar aplicar un patch que foi gerado contra uma
+Isso geralmente acontece se você tentar aplicar um patch que foi gerado contra uma
 versão de kernel diferente daquela que você está tentando modificar.
 
 Se você receber uma mensagem como ``Hunk #3 FAILED at 2387.``, significa que o
diff --git a/Documentation/translations/pt_BR/process/backporting.rst b/Documentation/translations/pt_BR/process/backporting.rst
index ce3f9fb4f..afcff7085 100644
--- a/Documentation/translations/pt_BR/process/backporting.rst
+++ b/Documentation/translations/pt_BR/process/backporting.rst
@@ -357,7 +357,7 @@ Processo de resolução
 ~~~~~~~~~~~~~~~~~~~~~
 
 Às vezes, a coisa mais fácil a fazer é apenas remover tudo, exceto a primeira
-parteda do conflito, deixando o arquivo essencialmente inalterado, e aplicar
+parte do conflito, deixando o arquivo essencialmente inalterado, e aplicar
 as alterações manualmente. Talvez o patch esteja alterando um argumento de
 chamada de função de ``0`` para ``1``, enquanto uma alteração conflitante
 adicionou um parâmetro totalmente novo (e insignificante) ao final da lista de
@@ -403,7 +403,7 @@ de volta (``git mv`` e commitando novamente) e, finalmente, esmagar (squash) o
 resultado usando ``git rebase -i`` (veja o `tutorial de rebase`_) para que ele
 apareça como um único commit quando você terminar.
 
-.. _tutorial de rebase: [https://medium.com/@slamflipstrom/a-beginners-guide-to-squashing-commits-with-git-rebase-8185cf6e62ec](https://medium.com/@slamflipstrom/a-beginners-guide-to-squashing-commits-with-git-rebase-8185cf6e62ec)
+.. _tutorial de rebase: https://medium.com/@slamflipstrom/a-beginners-guide-to-squashing-commits-with-git-rebase-8185cf6e62ec
 
 Pegadinhas
 ----------
-- 
2.47.3

