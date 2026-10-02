Received: from mail-vs2-f33.google.com (mail-vs2-f33.google.com [74.125.227.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7C64D37A0
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 17:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961140; cv=none; b=RThEpd/YIVI7Oewn6krOJl2SA29vpkJ1pRoLPIsMlqAOAPhfnLzirq8llBAz12WCi6GCTUPATSSgJKrDfjYpgXdV7BEFhVMd6of3GlYMuPUENiXQ/JDU8M9tDhF3sCamQJOWFArgb4RBA+aaaT75T6o9NXyw18qjJ6DeJGNsJVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961140; c=relaxed/simple;
	bh=X4o8nkXMr3FVdys8vj9D1nn226fSc+WBPQ1hJBea158=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FYw3I4Y547NTCTo0b3F0RxNsaKYJvu3NpD4kFoNltbJKtrXV6DXpV2IrrwxILjiFwOWWPen33nWqx2o4gvU5De6vlhdn4lB05LJHFi7PQCAk7j+NTROWioyPQIAMQ5X/3bf3Ol442W16YrRtgRwL9RHDVjhaJQ2zwzO+bhYWrgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndsHwP4S; arc=none smtp.client-ip=74.125.227.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndsHwP4S"
Received: by mail-vs2-f33.google.com with SMTP id 71dfb90a1353d-5caec6d2983so6556993e0c.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 10:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961121; x=1791565921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfb0wXGFE+tgscc174wTSrbVM3lFITz6X2ycizwv16w=;
        b=ndsHwP4SlyP3Tii51fG219m2jv9yRz40qmMm3TZdteKZlt5680Jjo3DKsNBBzMKeI6
         Vhto83Y2v4P9pMbQ2HxUMFV4/TH0N0jHHGyDLPGoRMl85u+BE+XcTpQ7V8GtblKEFzcm
         AT1CPdHTojQyT8RBjcKqwG8yK0pyXJ7l5gJppAe7IE+HZ3WJFfK09M5CqnvQYtyWDNFM
         f2hg5A+z1aAYAjyH1MrLeJRcuHPdC0Yl/15wSZAiK7SCi8mbSQ9OtyOfp+z7xSWqpZ65
         v5yUPrXSWarXcykFEk0gFoqn0Cpfy/8iviOspTRrOi1XNXPVE4gKwNEQlOAzgJt7saBI
         N+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961121; x=1791565921;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfb0wXGFE+tgscc174wTSrbVM3lFITz6X2ycizwv16w=;
        b=Byz/0bRonThSnAD2mBaWTgOWXw5xhGOfPP/hrt2y0oNyH347cqJ3bFgF/ntK3MqbUb
         OrZ4V0T2ghoUNDqKD9PHmGJOYgepNsDOOB5O0pQtY6FyH+atFMS3ioJCCbYg2xzbJfaZ
         h/t4sjcQaa3Sutzl2rnaBQuHYTqm3mQtV2UDV9/9j+l495HK37QVTR22GKdbDNQr1pbm
         SHE4GjX73KkNLdpIcMvEWc6u3rLF7Dp9ZUUDvW+varMnxVLZ61cnG0KOchTSH/BC4f10
         uiCfTaOsv3GDsMNr9C9t+AbsIzZIZLMIQ5jiKvxjgDG/S+OCGcDWUfUtwJed3JwDk/4C
         pBIQ==
X-Gm-Message-State: AFq9FYJ13RaRr7c/BECYEGptsnefVTuzg1k4c+MiOsaOY+eEkcIgF7tG
	HSvAZRYzXLMTfeEWWxLiKZdOeVlks5765cWNubNQOcrA0gmg0HT+dsKWWbfQMzPI
X-Gm-Gg: AYBFou0zdaL3eYNDRLyeq8+GLujV2SPK+873LRKNWewIUlczz0W9FjuyXtzMuqZVh8b
	l1MGXeSI/ToBaWEOAMAl7fKn/wBqDetjOkmZYg0xfunnKAc64L7WxQEEzDkDAU6jrAgwYtSUpaT
	fpA2IPlpgbX22JYpy+bWzvfmL1R57IBmCx9WH9ye4F3t7nauK0dZxdhYAI4i/ipp7MaPtgvNrtS
	Vku/xVP21oMFWfrGBwAsptQMQl01hj0lyomymdR9bgbMv9+JxXtEtLuXbX66FQtiehmZ0DaA7vu
	ipb30vH9wVElAL6a5EqijVNMPeJZYS85ZrKillYkqQIV+3Np4KtZRly78u0e6YN6T2n3Jy6WR3r
	qDlUkQwrIIhcOi6TixzI82IwpNoJ8Kvnf/ZY5RhDafahiuBnIn9mvHn+V7kg11gDSWTshQTHWGd
	M52MieGmMGZQGFdI9ZzJzLYD0C5dG1W8/RBMr9eUEJjV8yVCKB9dDphkrFh1e4U+0fLW4uNen6o
	evyr03zcf3IzpoKkStyF2BCLtHofw5/tIcqqTS/IeBpSS5LBWAB5ZAPgd4p2bkBq8VFkXhimdHO
	8PNViGbbX2mCiwZlDXxsAaY=
X-Received: by 2002:a05:6122:2393:b0:5c9:c60e:5cf5 with SMTP id 71dfb90a1353d-5dab335861dmr1155536e0c.19.1790961120664;
        Fri, 02 Oct 2026 10:12:00 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da635c7209sm3947605e0c.15.2026.10.02.10.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:12:00 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net
Subject: [PATCH 09/10] docs/translations/pt_BR: admin-guide: add kernel-parameters.rst
Date: Fri,  2 Oct 2026 14:11:32 -0300
Message-ID: <20261002171133.50969-10-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002171133.50969-1-danielmaraboo@gmail.com>
References: <20261002171133.50969-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add translation of kernel-parameters.rst to Portuguese and update
admin-guide/index.rst.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/admin-guide/index.rst  |   2 +-
 .../pt_BR/admin-guide/kernel-parameters.rst   | 134 ++++++++++++++++++
 2 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/kernel-parameters.rst

diff --git a/Documentation/translations/pt_BR/admin-guide/index.rst b/Documentation/translations/pt_BR/admin-guide/index.rst
index 96a54595f..40397ef77 100644
--- a/Documentation/translations/pt_BR/admin-guide/index.rst
+++ b/Documentation/translations/pt_BR/admin-guide/index.rst
@@ -59,10 +59,10 @@ Inicializando o kernel
    :maxdepth: 1
 
    bootconfig
+   kernel-parameters
 
 Todolist:
 
-*   kernel-parameters
 *   efi-stub
 *   initrd
 
diff --git a/Documentation/translations/pt_BR/admin-guide/kernel-parameters.rst b/Documentation/translations/pt_BR/admin-guide/kernel-parameters.rst
new file mode 100644
index 000000000..42a646632
--- /dev/null
+++ b/Documentation/translations/pt_BR/admin-guide/kernel-parameters.rst
@@ -0,0 +1,134 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Os parâmetros de linha de comando do kernel
+===========================================
+
+A seguir está uma lista consolidada dos parâmetros do kernel conforme
+implementados pelas macros __setup(), early_param(), core_param() e
+module_param(), ordenados na ordem do dicionário inglês (definida como ignorar
+toda a pontuação e ordenar dígitos antes de letras sem distinção entre
+maiúsculas e minúsculas), e com descrições onde conhecidas.
+
+O kernel analisa os parâmetros da linha de comando do kernel até "``--``";
+se ele não reconhecer um parâmetro e este não contiver um '.', o parâmetro
+será passado para o init: parâmetros com '=' vão para o ambiente do init,
+outros são passados como argumentos de linha de comando para o init.
+Tudo após "``--``" é passado como argumento para o init.
+
+Os parâmetros de módulo podem ser especificados de duas maneiras: através da
+linha de comando do kernel com um prefixo de nome de módulo, ou via modprobe,
+por exemplo::
+
+	(linha de comando do kernel) usbcore.blinkenlights=1
+	(linha de comando do modprobe) modprobe usbcore blinkenlights=1
+
+Os parâmetros para módulos compilados embutidos no kernel precisam ser
+especificados na linha de comando do kernel. O modprobe examina a linha de
+comando do kernel (/proc/cmdline) e coleta parâmetros de módulo ao carregar um
+módulo, de modo que a linha de comando do kernel também pode ser usada para
+módulos carregáveis.
+
+Este documento pode não estar totalmente atualizado e abrangente. O comando
+"modinfo -p ${nomedomodulo}" exibe uma lista atual de todos os parâmetros de um
+módulo carregável. Módulos carregáveis, após serem carregados no kernel em
+execução, também revelam seus parâmetros em /sys/module/${nomedomodulo}/parameters/.
+Alguns desses parâmetros podem ser alterados em tempo de execução pelo comando
+``echo -n ${valor} > /sys/module/${nomedomodulo}/parameters/${param}``.
+
+Tratamento especial
+-------------------
+
+Hífens (traços) e sublinhados são equivalentes em nomes de parâmetros, portanto::
+
+	log_buf_len=1M print-fatal-signals=1
+
+também pode ser inserido como::
+
+	log-buf-len=1M print_fatal_signals=1
+
+Aspas duplas podem ser usadas para proteger espaços nos valores, por exemplo::
+
+	param="spaces in here"
+
+Listas de CPUs
+~~~~~~~~~~~~~~
+
+Alguns parâmetros do kernel recebem uma lista de CPUs como valor, por exemplo:
+isolcpus, nohz_full, irqaffinity, rcu_nocbs. O formato desta lista é:
+
+	<número da cpu>,...,<número da cpu>
+
+ou
+
+	<número da cpu>-<número da cpu>
+	(deve ser um intervalo positivo em ordem crescente)
+
+ou uma mistura
+
+	<número da cpu>,...,<número da cpu>-<número da cpu>
+
+Observe que, para o caso especial de um intervalo, é possível dividir o intervalo em
+grupos de tamanhos iguais e, para cada grupo, usar uma determinada quantidade a
+partir do início desse grupo:
+
+	<número da cpu>-<número da cpu>:<tamanho usado>/<tamanho do grupo>
+
+Por exemplo, pode-se adicionar à linha de comando o seguinte parâmetro:
+
+	isolcpus=1,2,10-20,100-2000:2/25
+
+onde o item final representa as CPUs 100,101,125,126,150,151,...
+
+O valor "N" pode ser usado para representar a última CPU numericamente no sistema,
+ou seja, "foo_cpus=16-N" seria equivalente a "16-31" em um sistema de 32 núcleos.
+
+Tenha em mente que "N" é dinâmico; portanto, se alterações no sistema fizerem com
+que a largura do bitmap mude, como menos núcleos na lista de CPUs, N e quaisquer
+intervalos que usem N também mudarão. Use o mesmo em um sistema pequeno de 4 núcleos,
+e "16-N" se tornará "16-3", e agora a mesma entrada de boot será sinalizada como
+inválida (início > fim).
+
+O nome de grupo especial tolerante a maiúsculas/minúsculas "all" tem o significado
+de selecionar todas as CPUs, de modo que "nohz_full=all" seja o equivalente a
+"nohz_full=0-N".
+
+A semântica de "N" e "all" é suportada em nível de bitmaps e é válida para todos
+os usuários de bitmap_parselist().
+
+Sufixos métricos
+~~~~~~~~~~~~~~~~
+
+O sufixo [KMG] é comumente descrito após vários valores de parâmetros do kernel.
+Os sufixos 'K', 'M', 'G', 'T', 'P' e 'E' são permitidos. Essas letras representam
+os multiplicadores _binários_ 'Quilo', 'Mega', 'Giga', 'Tera', 'Peta' e 'Exa',
+equivalendo a 2^10, 2^20, 2^30, 2^40, 2^50 e 2^60 bytes, respectivamente. Esses
+sufixos de letras também podem ser totalmente omitidos.
+
+Opções de compilação do kernel
+------------------------------
+
+Os parâmetros listados abaixo só são válidos se certas opções de compilação do
+kernel foram ativadas e se o respectivo hardware estiver presente. Esta lista deve
+ser mantida em ordem alfabética. O texto entre colchetes no início de cada descrição
+informa as restrições sob as quais um parâmetro é aplicável.
+
+Os parâmetros indicados com BOOT são, na verdade, interpretados pelo carregador
+de inicialização e não têm significado diretamente para o kernel.
+Não modifique a sintaxe dos parâmetros do carregador de inicialização sem extrema
+necessidade ou coordenação com <Documentation/arch/x86/boot.rst>.
+
+Existem também parâmetros do kernel específicos de arquitetura não documentados aqui.
+
+Observe que TODOS os parâmetros do kernel listados abaixo DISTINGUEM MAIÚSCULAS DE
+MINÚSCULAS, e que um = final no nome de qualquer parâmetro indica que o parâmetro
+será inserido como uma variável de ambiente, enquanto sua ausência indica que ele
+aparecerá como um argumento do kernel legível via /proc/cmdline por programas em
+execução assim que o sistema estiver ativo.
+
+O número de parâmetros do kernel não é limitado, mas o comprimento da linha de
+comando completa (parâmetros incluindo espaços, etc.) é limitado a um número fixo
+de caracteres. Este limite depende da arquitetura e varia entre 256 e 4096 caracteres.
+Ele é definido no arquivo ./include/uapi/asm-generic/setup.h como COMMAND_LINE_SIZE.
+
+.. include:: ../../../admin-guide/kernel-parameters.txt
+   :literal:
-- 
2.47.3

