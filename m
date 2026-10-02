Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com [74.125.227.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343CA5013AD
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 17:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961126; cv=none; b=n1FS9QspWynViyzgcZwyr+YEWXar4Lzu9OzKVjnpS/cOKY7gN5bg0YCmY0vX000yXxrd6L9FWZL1mereS2VwegyBhe6Py2dPFTrSrlLWkAiJ/Opp6NOMDBOSTmL9uRDNMuOXvgIZAX351QDPK/8LGaUlk4B1OgIgZrFy4tV/qG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961126; c=relaxed/simple;
	bh=XOFaTVSwW/9YBFC6mfw/z7wVwnNezmfJy/wesJmf7IQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NzAMGrCCw3exFqqxI1LpAwYPMXsDow+LN+yKTkASy35zfxOpPnKzyJrTbcTZJas6AZRsrGwADod62MA3Qc7EYyVIv9FlHO4cF811mYxLEJCYUTcRuC6QLbzt/i14pxl4PZhDaqGy9YHApUmsVkwshXqOUNohggMOVcnUxD6mvRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWVw0lhZ; arc=none smtp.client-ip=74.125.227.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWVw0lhZ"
Received: by mail-vs2-f36.google.com with SMTP id 71dfb90a1353d-5d7274a41d8so2120907e0c.3
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 10:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961111; x=1791565911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+kuxUp68NfE1BX6EejbUySHt6ovgmEbDuypLUDZaOH4=;
        b=UWVw0lhZ5pC152dAg1pj3Q+12fS0nD9kZWtbJ98k6vlIVxNMIqs2YnEQ/iClr4X7vV
         TDn4TpygyLsqqAo6YIhCt66BzwfrDxXHH8hDJM/ethYhqz3RoViXohF48I2XDhnNHGwx
         54bowQZ/AC+jjbk0i0dUMzYHwpO9POKg3xpzp9iYVCBhJj1WMwWC6LziID1p8xHBNSiV
         2Sq2MFKwVNO7UuFZ80cgJwDSK/TpLdXnvb+Ys2xGjTo8E2kfuTWJs6kT3nWSN7S6w7P9
         zPsJlUIexfDo2dF4qB6ud7OiNfOBIzFKOPilX6sdGb80V1W+sxbzot9iJVRVfCfjYp1c
         qeew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961111; x=1791565911;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kuxUp68NfE1BX6EejbUySHt6ovgmEbDuypLUDZaOH4=;
        b=DxGKFCYTq5NCY1GKydRSFvlcWe71tT90kBUtHPKCiPxgIBuAJAG39stQgDtRCb5V34
         hISW1u6DzTLjD8DDpbJv10IW0NJRGZSjtepfB9lrt5MgaknLeCkx6Mig2j1LCyK80aeP
         NLhZYw6xpfe7RRYq9CEGFHVRVw0gntYX9pkt1uXGmmFdn3yJtV2XTMyHAW2tKc3xgmff
         O2WoP/UZcwCjMOo973LiG/npDW+bur3ghrfyLrUiF5nj6n4l7WUti6zcQIDQWnn1dWCw
         SrIXioG7S5V4/50PVCbdVHrS/Sz5hPLoFXWIe+1Kls6U9vzCOCJgmBGUdJaMvuDEn9FO
         duRQ==
X-Gm-Message-State: AFq9FYJz4Uy9wcXNCZGNdQksYiNiv3nCYxyYsfbNc4vHE9SxSuSk9FVK
	s00cfFwh0j1226djBepYjAwZ866q6mq48hTK/AcRAQG04rUrpgKdOSU7pW4EjOE9
X-Gm-Gg: AYBFou1iRhia2/mrHATqgxckhRc1IFlolq5XPGTYyCrjm2ccfjP+giiIZFv33JVmX+5
	6vby37GSvBShb3o6KbF9qUgjcSmPIWjhSs8Fuqda/8tDikgEdeTXjO141IsXbEUEfIvjO2k3baz
	VJxdPg7DoD4jtP0YGLdJpc/JVxGP8dbkB4/BRk9hkQYVCgIjdmY+wA6aKN/Msepj3+ERYylGVKA
	hs2Alx94/6vX12emk4bB9wv4Xt8q7WLHzisd8UMSzQMzNY23AyProWBxYnxZW08n2fj2e6LmilE
	qOZP0a6hpzrQ4TSJbsrC1am+FwHJpChW+WmxyCaeOv9jmBa7PsDDqm/iv6pKIP2XuiTrZ/SDfsv
	CLON1CnQ1AFUfisjdODx8BPRacygp395f8hJ2ujf3bYV5sqDuYSRHVyPoAYQfUUsbbZ3QMQS0Qs
	xXbDPN6YKDNu3EJc/9n+6+0+q5l3nsYca61G982bcA1+yYsMPCk6SSK25mbH3mDp8wcsFid2/qp
	hJGMmRKMxav0LsRvTidITXLkZKA9aDBC7YRR5UlOikkmHrvpQIp8SprEK4KWDyyP/59c/epA6g+
	BzDojXB0A5yvuBjhy/N+3qrA
X-Received: by 2002:a05:6122:4312:b0:5cf:2d4a:42c3 with SMTP id 71dfb90a1353d-5dab28cb7a0mr1115901e0c.19.1790961111278;
        Fri, 02 Oct 2026 10:11:51 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da635c7209sm3947605e0c.15.2026.10.02.10.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:11:51 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net
Subject: [PATCH 04/10] docs/translations/pt_BR: admin-guide: add cputopology.rst
Date: Fri,  2 Oct 2026 14:11:27 -0300
Message-ID: <20261002171133.50969-5-danielmaraboo@gmail.com>
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

Add translation of cputopology.rst to Portuguese and update
admin-guide/index.rst.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/admin-guide/cputopology.rst         | 105 ++++++++++++++++++
 .../translations/pt_BR/admin-guide/index.rst  |   2 +-
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/cputopology.rst

diff --git a/Documentation/translations/pt_BR/admin-guide/cputopology.rst b/Documentation/translations/pt_BR/admin-guide/cputopology.rst
new file mode 100644
index 000000000..f7321e275
--- /dev/null
+++ b/Documentation/translations/pt_BR/admin-guide/cputopology.rst
@@ -0,0 +1,105 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+================================================================
+Como as informações de topologia de CPU são exportadas via sysfs
+================================================================
+
+As informações de topologia de CPU são exportadas via sysfs. Os itens
+(atributos) são semelhantes à saída de /proc/cpuinfo em algumas arquiteturas.
+Eles residem em /sys/devices/system/cpu/cpuX/topology/. Por favor, consulte o
+arquivo de ABI: Documentation/ABI/stable/sysfs-devices-system-cpu.
+
+O arquivo independente de arquitetura, drivers/base/topology.c, exporta esses
+atributos. No entanto, os arquivos do sysfs relacionados à hierarquia de die,
+cluster, book e drawer só serão criados se uma arquitetura fornecer as macros
+relacionadas, conforme descrito abaixo.
+
+Para que uma arquitetura ofereça suporte a esse recurso, ela deve definir
+algumas dessas macros em include/asm-XXX/topology.h::
+
+	#define topology_physical_package_id(cpu)
+	#define topology_die_id(cpu)
+	#define topology_cluster_id(cpu)
+	#define topology_core_id(cpu)
+	#define topology_book_id(cpu)
+	#define topology_drawer_id(cpu)
+	#define topology_sibling_cpumask(cpu)
+	#define topology_core_cpumask(cpu)
+	#define topology_cluster_cpumask(cpu)
+	#define topology_die_cpumask(cpu)
+	#define topology_book_cpumask(cpu)
+	#define topology_drawer_cpumask(cpu)
+
+O tipo das ``macros **_id`` é int.
+O tipo das ``macros **_cpumask`` é ``(const) struct cpumask *``. Estas últimas
+correspondem aos atributos apropriados ``**_siblings`` do sysfs (exceto por
+topology_sibling_cpumask(), que corresponde a thread_siblings).
+
+Para manter a consistência em todas as arquiteturas, include/linux/topology.h
+fornece definições padrão para qualquer uma das macros acima que não estejam
+definidas em include/asm-XXX/topology.h:
+
+1) topology_physical_package_id: -1
+2) topology_die_id: -1
+3) topology_cluster_id: -1
+4) topology_core_id: 0
+5) topology_book_id: -1
+6) topology_drawer_id: -1
+7) topology_sibling_cpumask: apenas a CPU fornecida
+8) topology_core_cpumask: apenas a CPU fornecida
+9) topology_cluster_cpumask: apenas a CPU fornecida
+10) topology_die_cpumask: apenas a CPU fornecida
+11) topology_book_cpumask: apenas a CPU fornecida
+12) topology_drawer_cpumask: apenas a CPU fornecida
+
+Além disso, as informações de topologia de CPU são fornecidas sob
+/sys/devices/system/cpu e incluem estes arquivos. A fonte interna para a saída
+está entre colchetes ("[]").
+
+    =========== ==========================================================
+    kernel_max: o índice máximo de CPU permitido pela configuração do kernel.
+		[NR_CPUS-1]
+
+    offline:	CPUs que não estão online porque foram desligadas via
+		HOTPLUG ou excedem o limite de CPUs permitido pela
+		configuração do kernel (kernel_max acima).
+		[~cpu_online_mask + cpus >= NR_CPUS]
+
+    online:	CPUs que estão online e sendo escalonadas [cpu_online_mask]
+
+    possible:	CPUs para as quais foram alocados recursos e que podem ser
+		colocadas online se estiverem presentes. [cpu_possible_mask]
+
+    present:	CPUs que foram identificadas como presentes no
+		sistema. [cpu_present_mask]
+    =========== ==========================================================
+
+O formato para a saída acima é compatível com cpulist_parse()
+[veja <linux/cpumask.h>]. Alguns exemplos a seguir.
+
+Neste exemplo, existem 64 CPUs no sistema, mas as cpus 32-63 excedem
+o máximo do kernel, que está limitado a 0..31 devido à opção de
+configuração NR_CPUS ser 32. Observe também que as CPUs 2 e 4-31 não estão
+online, mas poderiam ser colocadas online, pois estão tanto presentes
+quanto possíveis::
+
+     kernel_max: 31
+        offline: 2,4-31,32-63
+         online: 0-1,3
+       possible: 0-31
+        present: 0-31
+
+Neste exemplo, a opção de configuração NR_CPUS é 128, mas o kernel foi
+iniciado com possible_cpus=144. Existem 4 CPUs no sistema e a cpu2
+foi colocada offline manualmente (e é a única CPU que pode ser colocada
+online.)::
+
+     kernel_max: 127
+        offline: 2,4-127,128-143
+         online: 0-1,3
+       possible: 0-127
+        present: 0-3
+
+Consulte Documentation/core-api/cpu_hotplug.rst para o parâmetro de inicialização
+do kernel possible_cpus=NUM, bem como para obter mais informações sobre as
+várias cpumasks.
diff --git a/Documentation/translations/pt_BR/admin-guide/index.rst b/Documentation/translations/pt_BR/admin-guide/index.rst
index 878a88d71..c574515c2 100644
--- a/Documentation/translations/pt_BR/admin-guide/index.rst
+++ b/Documentation/translations/pt_BR/admin-guide/index.rst
@@ -37,10 +37,10 @@ com eles.
 
    sysfs-rules
    sysctl/index
+   cputopology
 
 Todolist:
 
-*   cputopology
 *   abi
 
 Documentação relacionada à segurança:
-- 
2.47.3

