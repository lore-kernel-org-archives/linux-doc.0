Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BFC25DB12
	for <linux-doc@vger.kernel.org>; Wed, 26 Aug 2026 02:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787710978; cv=none; b=ZIx+KeSzqn4C+wJf7YxRK7h3XLB/TCI4/OxrJVShJ9YOkhgZm+L+Py672Q3aZirOd4uShlLp3HSoOuLGJ0jCb2Nb0YFo1wX/43M+xlp4P5iy5QT9SQ/B/yw7DAh6Rn7xKusBS9oJb3Gv5g8OirhaOVmorLiVjgB3jOhc4+gW1CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787710978; c=relaxed/simple;
	bh=2puIgYQFj1COmM43RDv3y6RDVWKK4GSQGL8w1zdoXVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VQtDaXX/sAQMu6l+vNjq+qqh35D3GULKbYoorCG1s40MddCo3EjpNFx1kQPu5qU+M+7zeVYf2QKf/1b+w3jtVmA2zhw+w4RsFWZwioYfjQjh96/0pfXujrO7zjCBrnO4Yno7vrKjAoWoFxN4YtrdXAlbNOWNl+a/zWd78/59BJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6FcJ4Q/; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6FcJ4Q/"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9aea40d799so278997a12.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 19:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787710976; x=1788315776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8OYvCaN8aqgzfs1G/caDDka0D0k/r86hGKLOQkbKPc=;
        b=E6FcJ4Q/wO+LvZLK0ABmuMBCAaRp4mYtOx2p98pOXKXW2NbyL4ayV2P8r7dTihE6mP
         7exy8JO33zS58iUpFlTeHe+VxD3Nou1960jDwOiedibZ0ekVbEKWHV2eNGZWYxStglcN
         wWlQwM2OZ2haiEw58w8SEElgwqrj7QKd7pSbM3xUfhdvNl2q+1RPdpFwngxVKnuELtx7
         wtCC032scaEsy7TnIeZzDDyUCtKccNSlGpDKA6oBfRQpjuQLcdfU2gkU/7HfI70eC81R
         beYEzVLFBDva8uhQRWfK0YEC36SMsgayPa/UGbHKYW6BDRksddKuIuiLYcuK2t6um4wm
         Sq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787710976; x=1788315776;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I8OYvCaN8aqgzfs1G/caDDka0D0k/r86hGKLOQkbKPc=;
        b=YVwF9tytYKop90FAhNpiqIc7vKbDOC+OJ5/Hfi0+IbPxBUPWyTvi+hWRRMtXCgmI7c
         R0UgLPp9UvXByckojAzz8CP3KvQ+cG0xTqc/STg7zkSDdq8QYkuUads3m76QcrIyRS3c
         uATDFfgoxSBvw91nUxD0SpRtnikGRN6PU0Bpxf+aqYugZtCcjRsL3HaGasiwyngvTOJY
         HFdd2XdrLCo1Yw63wb1CAHTxTi52jPMgzc3wlv+GMzUO2v/WhkGu+ZJodYdr+HwSSZIT
         BbF9cEnpR+BuT5F0vcDfdlCLGGSvqjDS/IAaRqoPJxZudEPguB9SVLcIoJJEAMZqJGB1
         9uRA==
X-Forwarded-Encrypted: i=1; AHgh+RrPFsoLU5anhoey/0Tmbt0zRH8u5Vg8ayJ4oVDdM4jgh1aedNvK8jMk7Kj4cGecApllpgLtzkLzv20=@vger.kernel.org
X-Gm-Message-State: AFuF++kAT/HBWq2cAOotnlZ9kqOhwtUQyqWAiAYfaKpFQ3sgxNfvIXy1
	VGPgEl+/u15s6QLGAVMq7ZxddjGqGAQ8ceNk/w0/7VFz3qNMdicbx5S8KAHc4A==
X-Gm-Gg: AR+sD10mWusGvpFJF5jNIq/s3J6FPgeaxJthgOc4uVeYp4m4feEilM1eLze95ZeE5QO
	9Iqx00xsivN6x5Qya66oIDUCw96cHRgCxi7f8mXyqvsIrr64YsB+j1FPpFPqTdUHzGsfBmIw8qh
	mYPAnmRD3VeCQseoSe10c3kU0FvU0PQYJ8Xzo+Q2n8cLuULY/+Jsi4bgkaD1Is8aR2ywY6t4GYi
	VX54wJkGzSCHZ3popliCcXuPORb0/gpJzLkRx4qU9yNWyiLSk4vC95eGKCH3rCw/OxP+1bCuSr6
	E96Lqhkrwyzxk1U/vbxTIV52LZioZYR/Dt3NsbBWGbgjz2YAS7jv3LRBDEkLt5v1dWxXrZxqpoT
	EPjDjMlgOx4ZUHDslqCWHKv6Kx7xyhaPFjkcrrahfBZzXvn7tLL35pyw9FsyfPUbqjMMJAVFzHz
	CIK1PPyjH2SMb8DLYkay5aHv+0T0Ky8OjHfeEevw9rHqZ2zGU29AkB0XsBqkEqtXuW1BI=
X-Received: by 2002:a05:6a21:1bc1:b0:3cb:d156:d362 with SMTP id adf61e73a8af0-3cf7576caa0mr5723108637.3.1787710975852;
        Tue, 25 Aug 2026 19:22:55 -0700 (PDT)
Received: from x-wing ([177.181.5.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283da048d3sm3244349eec.28.2026.08.25.19.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:22:55 -0700 (PDT)
From: Fabio Pereira da Silva <silvapfabio@gmail.com>
To: danielmaraboo@gmail.com
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: pt_BR: process: Translate development process and programming language
Date: Tue, 25 Aug 2026 23:22:49 -0300
Message-ID: <20260826022249.15109-1-silvapfabio@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

---
 Documentation/translations/pt_BR/index.rst    |  2 +
 .../pt_BR/process/development-process.rst     | 29 +++++++++
 .../pt_BR/process/programming-language.rst    | 62 +++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/development-process.rst
 create mode 100644 Documentation/translations/pt_BR/process/programming-language.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 71eb024fbec8..ce2ed7a0387a 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -73,6 +73,8 @@ kernel e sobre como ver seu trabalho integrado.
    Requisitos mínimos <process/changes>
    CVEs <process/cve>
    Lista de verificação para patches <process/submit-checklist>
+   Processo de desenvolvimento <process/development-process>
+   Linguagem de programação <process/programming-language>
    Interface de drivers do kernel Linux <process/stable-api-nonsense>
    Conclave (Continuidade do projeto) <process/conclave>
    Manuais dos mantenedores <process/maintainer-handbooks>
diff --git a/Documentation/translations/pt_BR/process/development-process.rst b/Documentation/translations/pt_BR/process/development-process.rst
new file mode 100644
index 000000000000..dda7fc1850b4
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/development-process.rst
@@ -0,0 +1,29 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _development_process_main:
+
+Um guia do processo de desenvolvimento do kernel
+================================================
+
+O objetivo deste documento é ajudar os desenvolvedores (e seus gerentes) a
+trabalhar com a comunidade de desenvolvimento com o mínimo de frustração. É
+uma tentativa de documentar como essa comunidade funciona de uma maneira
+acessível para quem não está intimamente familiarizado com o desenvolvimento
+do kernel Linux (ou, de fato, com o desenvolvimento de software livre em
+geral). Embora haja algum material técnico aqui, esta é uma discussão muito
+orientada ao processo e não exige conhecimento profundo de programação do
+kernel para ser compreendida.
+
+.. toctree::
+   :caption: Conteúdo
+   :numbered:
+   :maxdepth: 2
+
+   1.Intro
+   2.Process
+   3.Early-stage
+   4.Coding
+   5.Posting
+   6.Followthrough
+   7.AdvancedTopics
+   8.Conclusion
diff --git a/Documentation/translations/pt_BR/process/programming-language.rst b/Documentation/translations/pt_BR/process/programming-language.rst
new file mode 100644
index 000000000000..5fdda01742d0
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/programming-language.rst
@@ -0,0 +1,62 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _programming_language:
+
+Linguagem de programação
+=========================
+
+O kernel Linux é escrito na linguagem de programação C [c-language]_. Mais
+precisamente, ele normalmente é compilado com ``gcc`` [gcc]_ usando
+``-std=gnu11`` [gcc-c-dialect-options]_: o dialeto GNU da ISO C11. ``clang``
+[clang]_ também é compatível; consulte a documentação sobre :ref:`Compilar o
+Linux com Clang/LLVM <kbuild_llvm>`.
+
+Esse dialeto contém muitas extensões da linguagem [gnu-extensions]_, e muitas
+delas são usadas normalmente dentro do kernel.
+
+Atributos
+---------
+
+Uma das extensões comuns usadas em todo o kernel são os atributos
+[gcc-attribute-syntax]_. Os atributos permitem introduzir semântica definida
+pela implementação em entidades da linguagem (como variáveis, funções ou
+tipos) sem precisar fazer alterações sintáticas significativas na linguagem
+(por exemplo, adicionar uma nova palavra-chave) [n2049]_.
+
+Em alguns casos, os atributos são opcionais (isto é, um compilador que não os
+suporte ainda deve produzir código correto, mesmo que ele seja mais lento ou
+não faça tantas verificações/diagnósticos em tempo de compilação).
+
+O kernel define pseudo-palavras-chave (por exemplo, ``__pure``) em vez de usar
+diretamente a sintaxe de atributos do GNU (por exemplo,
+``__attribute__((__pure__))``), a fim de detectar quais podem ser usados e/ou
+encurtar o código.
+
+Consulte ``include/linux/compiler_attributes.h`` para obter mais informações.
+
+Rust
+----
+
+O kernel oferece suporte à linguagem de programação Rust [rust-language]_ com
+``CONFIG_RUST``. Ela é compilada com ``rustc`` [rustc]_ usando
+``--edition=2021`` [rust-editions]_. As edições são uma forma de introduzir
+pequenas alterações na linguagem que não são compatíveis com versões
+anteriores.
+
+Além disso, alguns recursos instáveis [rust-unstable-features]_ são usados no
+kernel. Recursos instáveis podem mudar no futuro; portanto, alcançar um ponto
+em que apenas recursos estáveis sejam usados é um objetivo importante.
+
+Consulte Documentation/rust/index.rst para obter mais informações.
+
+.. [c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
+.. [gcc] https://gcc.gnu.org
+.. [clang] https://clang.llvm.org
+.. [gcc-c-dialect-options] https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html
+.. [gnu-extensions] https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.html
+.. [gcc-attribute-syntax] https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html
+.. [n2049] http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf
+.. [rust-language] https://www.rust-lang.org
+.. [rustc] https://doc.rust-lang.org/rustc/
+.. [rust-editions] https://doc.rust-lang.org/edition-guide/editions/
+.. [rust-unstable-features] https://github.com/Rust-for-Linux/linux/issues/2
-- 
2.55.0.windows.2

