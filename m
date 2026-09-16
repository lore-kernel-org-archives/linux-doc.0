Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECF74DAF9A
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 17:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580523; cv=none; b=sZQ5x4xORU1/kyC2E/5eugvvvA6O/THFV9k0R/djpuovcnhlGuViosLRIlICJDr0NKGMAe3iz9aRY8Jb3k2LQvGTEWbjNCnzgy98BcxWevyss1XdcNEN2X2Oyh7oT3J9BQ6aenOisjN6v0AalwSVNs5qmYOMSznQmaWZFJhROMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580523; c=relaxed/simple;
	bh=t44pa7YT6+459QFdpy22Hh95c2foqkOJAny/7a3Tezw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jlPcJ7PzYFwpKH4L0Pgu/qS321PBmHmt2W5e2yL2Ayz7np/7hVnM8Tvmr0AEs6B67xw9dcScnuKZWO+9Uuu2NuoGSZgngeZZgfjq+4t0BrwjRSqNVmBpIrNDQ+1YAaUqsj2OcYZQM8twccRV5uFUiHcoaWtpWCH7UvhxZdYt4Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1e9Xi7J; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1e9Xi7J"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c206dc8adcso738050b6e.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 10:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580506; x=1790185306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sluuk5GbEkG1USiWQL0WrUhMPKJv0u8FGND0exR0jPk=;
        b=k1e9Xi7JCdx7po48jWdrDSipcMJmQcftLPE16rhL18rImO6vwtzZaObC5slEYp/wKI
         gMF5UXcSX6gqQp+Lmbg0ZqderOEmrggiAgU8Z0quUIMeNGkBp1hpd5nb/kZkYdtt0X1W
         cEPPBb0FxwpzVPo+cN6VZTj4m6F1GvuGNeGukaFLxkMnsB3L4xjXbQqz4SosFb9eTkDp
         tDkfJk9AXffHm+y5K4siJ9D6gUh5WEAi43DQ7OZTmp9/4Uf3W26rxq8oGeIW3Wd1LSnI
         Z2acx/k5iIC+2tgufZBU2771C2dZZuJkt2K+W0stFhACG9H9uWEoXOJOvZIK3S25/eeW
         /PvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580506; x=1790185306;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sluuk5GbEkG1USiWQL0WrUhMPKJv0u8FGND0exR0jPk=;
        b=TPkN7fuHY6L6Dj5+H7TPGpddlnZZuAZUl2A635nEs4Asu+3oLex25H4EctEcIWnP2a
         fyGtM1U80nEFtKK02ANsV+Mf4JZ5ty+0o/E7M//NKHarEKMo/ns6jms260bXRfPLJjE7
         2RXdyIhEA88J0mRrxk5KV4lyIqIGQSUWvrzrzd9yKyrBUr8ixBXVYxKSBk03ed5iSxtj
         Gdl0//utg3jCdVGK+6mq0yHIgM+TT8XgnS1mXb/jw6uY+KG3YT/QodSZYXoPNCSK0vAJ
         Ba2IYuGpX5CjdMTtmto3sJiATCHi1YbiY0WEqLLDofw0pI9AeXYIH5dzp/jjaHT7gmbX
         UlrA==
X-Gm-Message-State: AFuF++lAXQ9HIxC+DTamDZ5QGVBlI3fLb+DAyFV/RJGVDNDVX36UtAsB
	CuwapO3rO0awwQ6GgJSSQPf3pfjhWwXpDbH9MgEBjiXbWpRyy3rGbuZdgIH+NzFKTrs=
X-Gm-Gg: AYBFou2FYCfDQqu9uL9nTAoApD+CkJouvoYgZ3MtehPbK/8lKAy9TKZY7HcuQvuHm7B
	DVEX/adv01VXdcuXHrbCOmN0SB+C5JWvwAZYKo0t456LoJBuxRRvM78OQw0mQ0gvDbociyBj8HF
	XE+a2S2e4n7Lx8vq8VP+msowJsQnDrJaMo9IsJSFYDQw8lmCA9j3Y+yh+g+5BJtI8Rv23P9FHo6
	gZcfc1X2cMGkODDk29OmEZyZiry/li/X1CNabOt8eCCe1Z2qExovAF+TB1TRMw5QGABAKqhRP+0
	ab7pAZcpsqfeaF8euYAolV0Bud45Jdlwih+nhXXVUitdkjCOk75yINL6BSiD2AXyVmZ1UTq1YZG
	kVMe9R1QHDWqW0IwMFWQ9ab3nbxPnqqhhi/vbTsicitQkiDnO7+Hf/T4ZHld+GzkVnOoSpX9PqJ
	TVW/I4qaYYQiKGe8E8Lu0KJPFmNzp8v9U70adhQs6+u3D3NP30SiCQVJc2izgvFWP/BSBGIm408
	s44AQz5oFJuTGzfAU73i1sxz9K/mCbbwqDA3w3hz6mK2nBZEQRfsY2moIfDb9zcfQSjOO9p4hje
	F4h4BQPr8KfcCc+Vewu9dtWffjmkacSpOgp7HcjpGuo5+r8oOUeBp8He6A==
X-Received: by 2002:a05:6808:c3f3:b0:4b3:98f4:f057 with SMTP id 5614622812f47-4ca497affecmr4054266b6e.3.1789580506472;
        Wed, 16 Sep 2026 10:41:46 -0700 (PDT)
Received: from localhost.localdomain (smtp.hostdime.com.br. [187.45.177.18])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6d9999e8sm360668b6e.17.2026.09.16.10.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:41:46 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH 2/5] docs: translations: pt_BR: add admin-guide index
Date: Wed, 16 Sep 2026 14:41:32 -0300
Message-ID: <20260916174136.48011-3-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916174136.48011-1-danielmaraboo@gmail.com>
References: <20260916174136.48011-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a Brazilian Portuguese index for admin-guide, mirroring the section
layout of the original.  No document has been translated yet, so every
entry is listed under a Todolist marker instead of a toctree, the same
way the zh_CN translation tracks its pending files; entries move into a
toctree as they get translated.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/admin-guide/index.rst  | 186 ++++++++++++++++++
 Documentation/translations/pt_BR/index.rst    |  10 +
 2 files changed, 196 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/index.rst

diff --git a/Documentation/translations/pt_BR/admin-guide/index.rst b/Documentation/translations/pt_BR/admin-guide/index.rst
new file mode 100644
index 000000000..a5ad5baa3
--- /dev/null
+++ b/Documentation/translations/pt_BR/admin-guide/index.rst
@@ -0,0 +1,186 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. raw:: latex
+
+	\renewcommand\thesection*
+	\renewcommand\thesubsection*
+
+==================================================
+Guia do usuário e do administrador do kernel Linux
+==================================================
+
+A seguir está uma coleção de documentos voltados ao usuário que foram
+adicionados ao kernel ao longo do tempo. Ainda há pouca ordem ou organização
+geral aqui --- este material não foi escrito para ser um documento único e
+coerente! Com sorte, as coisas melhorarão rapidamente com o tempo.
+
+Guias gerais para a administração do kernel
+-------------------------------------------
+
+Esta seção inicial contém informações gerais, incluindo o arquivo README que
+descreve o kernel como um todo, documentação sobre os parâmetros do kernel,
+etc.
+
+Todolist:
+
+*   README
+*   devices
+*   features
+
+Uma grande parte da interface administrativa do kernel são os sistemas de
+arquivos virtuais /proc e sysfs; estes documentos descrevem como interagir
+com eles.
+
+Todolist:
+
+*   sysfs-rules
+*   sysctl/index
+*   cputopology
+*   abi
+
+Documentação relacionada à segurança:
+
+Todolist:
+
+*   hw-vuln/index
+*   LSM/index
+*   perf-security
+
+Inicializando o kernel
+----------------------
+
+Todolist:
+
+*   bootconfig
+*   kernel-parameters
+*   efi-stub
+*   initrd
+
+Rastreando e identificando problemas
+------------------------------------
+
+Aqui está um conjunto de documentos voltados a usuários que estão tentando
+rastrear problemas e bugs em particular.
+
+Todolist:
+
+*   reporting-issues
+*   reporting-regressions
+*   quickly-build-trimmed-linux
+*   verify-bugs-and-bisect-regressions
+*   bug-hunting
+*   bug-bisect
+*   tainted-kernels
+*   ramoops
+*   dynamic-debug-howto
+*   init
+*   kdump/index
+*   perf/index
+*   pstore-blk
+*   clearing-warn-once
+*   kernel-per-CPU-kthreads
+*   lockup-watchdogs
+*   RAS/index
+*   sysrq
+
+Subsistemas centrais do kernel
+------------------------------
+
+Estes documentos descrevem interfaces de administração dos subsistemas
+centrais do kernel, que provavelmente são de interesse em quase qualquer
+sistema.
+
+Todolist:
+
+*   cgroup-v2
+*   cgroup-v1/index
+*   cpu-isolation
+*   cpu-load
+*   mm/index
+*   module-signing
+*   namespaces/index
+*   numastat
+*   pm/index
+*   syscall-user-dispatch
+
+Suporte a formatos binários não nativos. Observe que alguns destes
+documentos são ... antigos ...
+
+Todolist:
+
+*   binfmt-misc
+*   java
+*   mono
+
+Administração da camada de blocos e de sistemas de arquivos
+-----------------------------------------------------------
+
+Todolist:
+
+*   bcache
+*   binderfs
+*   blockdev/index
+*   cifs/index
+*   device-mapper/index
+*   ext4
+*   filesystem-monitoring
+*   nfs/index
+*   iostats
+*   jfs
+*   md
+*   ufs
+*   xfs
+
+Guias específicos de dispositivos
+---------------------------------
+
+Como configurar o seu hardware dentro do sistema Linux.
+
+Todolist:
+
+*   acpi/index
+*   aoe/index
+*   auxdisplay/index
+*   braille-console
+*   btmrvl
+*   dell_rbu
+*   edid
+*   gpio/index
+*   hw_random
+*   laptops/index
+*   lcd-panel-cgram
+*   media/index
+*   nvme-multipath
+*   parport
+*   pnp
+*   rapidio
+*   rtc
+*   serial-console
+*   svga
+*   thermal/index
+*   thunderbolt
+*   vga-softcursor
+*   video-output
+
+Análise de carga de trabalho
+----------------------------
+
+Este é o início de uma seção com informações de interesse para
+desenvolvedores de aplicações e integradores de sistemas que fazem análise
+do kernel Linux para aplicações críticas de segurança. Documentos que dão
+suporte à análise das interações do kernel com as aplicações, e às
+expectativas dos principais subsistemas do kernel, serão encontrados aqui.
+
+Todolist:
+
+*   workload-tracing
+
+Todo o resto
+------------
+
+Alguns documentos difíceis de categorizar e geralmente obsoletos.
+
+Todolist:
+
+*   ldm
+*   unicode
diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 462267e92..5557c5e4e 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -67,3 +67,13 @@ kernel e sobre como ver seu trabalho integrado.
    :maxdepth: 1
 
    process/index
+
+Guias do usuário e do administrador
+===================================
+
+Os guias para usuários e administradores do kernel Linux.
+
+.. toctree::
+   :maxdepth: 1
+
+   admin-guide/index
-- 
2.47.3

