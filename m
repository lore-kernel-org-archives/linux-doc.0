Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BC94D2EC4
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064085; cv=none; b=OlYg8exZwvBvZPadB4Y4W8LWC45oaj1uULyssFLEOJkijn8ro66PwflhE1spDbHPxUjDSdZjQIi5w5rAs+c+xS+ain7sU6codO2FTU9d0/AYg4NEc9uB3t1XFmrlNgR5hKeNa0K6uXzVPHmXn5hQHLuIZsxxXqH7hoHCCLkXhko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064085; c=relaxed/simple;
	bh=X4o8nkXMr3FVdys8vj9D1nn226fSc+WBPQ1hJBea158=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SVEh6q2FQ2UzC5a3M3JgVDHLl45QH07m9CFMsR/gK6JOjFmrJzgsdwuSbzTZOUklibv/huiZOxFYLYZwMoVXFM4yfakd33EyuHvXK1jXHNIxMgGcXuHJJq80MZYNMeuoa+b9g+7i/EgRGr1ILMd9JCelJSvf95Q1b3RhkQWlYBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bP7AptJT; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bP7AptJT"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so5254381eec.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 04:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792064076; x=1792668876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfb0wXGFE+tgscc174wTSrbVM3lFITz6X2ycizwv16w=;
        b=bP7AptJTDkffPYHpMfwJ0FMNod3gEIR9IuFBnWQQRQ762TOcwy+nED2Tf0VV7Psv+e
         exUPb1UAyLUwXsukvpZ7us0FLFOPNIW3xh/0SCIeVViBAf3BZ31AlyEJuXsmm+2UfE4o
         c71cqmgBguOmssIqR64CyAUZfiexO57jNe8o0EHs7Dm6lNlhu48C9FE7oFmb1/dF8NUZ
         esWyzz2wkHxQFUTCf5kp0O1C8jAqaexULTO2JWaST/uIoa5iJ8d8oQxBwMvpm+pac1A7
         za55V3brwXubGyfoT/+8c6wfZDmIGHOvD7iAIOcLEj0ctgGqjIqiUIBssS+lpeUzRCPJ
         6E7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064076; x=1792668876;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfb0wXGFE+tgscc174wTSrbVM3lFITz6X2ycizwv16w=;
        b=aZYVUH8YaGp6FiMkgSzNAzXMK1FRr/LYXzO0Bpc5hU5ltZXJPz/lX5XImihEUcTSEG
         fgPSIYqm+DGFkTpZDf9ptBcsWLesAwZHkdeHvLC/SdB1T1u4VSk14NLYysZg3yGvFoyW
         4XlW5z1vUkfRfzZsogGLlfOq1dlMogGKn0xbLoQz/V7A2FRudRpdVUquD3lAVr5w4jhK
         srQ+/qqie8LtJAlNlRaG/NHUp4af0nzgoA3dyuo/PWkWf4wnsR+wPv6/bviIUWB/iVy/
         TiOjnoEEPEcZFA1Z+a+n9gHacNoPp7uSUK/z1HvCIOsPjmeyfFUSPYL9iVk9si7R6JXq
         X86w==
X-Gm-Message-State: AFq9FYJMsyowocgIoNH3pzA1O+6VTAKQtPWEQpWEgxm7VJ1A3tvi6oNz
	cRRk6zQF2rdNYtOaIc6oH4ihf0hnKpIXapjUZ6ZH2q2XqB9bIsF/73jfyTo3gWYr
X-Gm-Gg: AYBFou2ErgVG3Se1GZXC74SiGjTIySj3o4TR0YkXqxLo2sGtL/EG0WfjzHiAU1QUUVE
	4fTytsHMsNk+5eTTo4BlZdSiCoHQ8SYBs4/QDmgi1PfOb6BPhjK3lkAAinK67fMUaQiivxy2moF
	0Bybi6pYNJ421IoR5g2OTlj0Yq07zzyZydVPb2LiwN1Ps6MSdULZbVHatyfGbhM+cEApXqt/UdN
	QNNPh6BDbs0j0328JAZ+M0MoUXTs4v50HtemrV2nCFeUy2YN/vh8kLZHu7glo0DFDNkMYs/lkEP
	7G/uquTlqooM3n7XZM8YEpuiZG83q/uD+UcjTaYGvdI8sZjsCgE+QuPmXoIs4lDKjqhuBQ3XsFy
	aQ0XbfhnkN54S4pIwqR/4FgKjlWTDgd5CIR7GwmzkPNlI36okBOILA8qJMicrLXmj2lXghxksIV
	4WuL0nyNtq9LGAAMgf8b8jwN2rb1mn+CXCOO+vTy5PH4pnu+n7swCn/KSzJI0W+vNSVTDWHLsVN
	xH7JqZkNoReg0KW60c4OGPYd9Qj8XRmS4Yz6DOVted1fXKiHjAAEddwPXyuM0rQuU0GVycR66sq
	OQ0eq5p6a9pcyDQwOfDHs6c=
X-Received: by 2002:a05:7300:de46:b0:353:5a1e:a7e0 with SMTP id 5a478bee46e88-3537e0aba8bmr22721302eec.32.1792064075696;
        Thu, 15 Oct 2026 04:34:35 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm69156913eec.3.2026.10.15.04.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:34:35 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH v2 09/10] docs/translations/pt_BR: admin-guide: add kernel-parameters.rst
Date: Thu, 15 Oct 2026 08:31:17 -0300
Message-ID: <20261015113121.4550-10-danielmaraboo@gmail.com>
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

