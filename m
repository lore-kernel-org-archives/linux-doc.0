Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0EF414435
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 19:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789069876; cv=none; b=qyy5CLm2iv0tq5nfm4H4B3w5UQH4iFLB4s6oPwgtvsjPYQpsyCp8uqccbvUPtW6rHZO8Zg1EY4Zmfo2E7CeK3J6vvaWO+coF4P/TkBErB8L1MYKGLYrjlUOK1WS0rS0KhTzZXvYMXwSf443H95zNE3cg3s0d/JrJxZj6Z1H9Fvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789069876; c=relaxed/simple;
	bh=Gb/NW7lzqhq+KuBLm1o7kRc00Nh29yMgnZbOMOCj7iQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AMpNxxf9SNkMI+54AiRYkHI/ZVepTxIh5WJRfeuYyU3S52LWRAROF0ZOV6nhgvR0ln2a80Wiy2I59ZoMBTuNAmbeW+jqG68B4P2H6I/pBgLYtz0ajHSeD7fJQXBV0B+Kve/PEqc9a7O3IHM7AZAwMNnzNYYHPwiYcSkQ4/CH1/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lk0cNn2V; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lk0cNn2V"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c7e8a176c1so133992e0c.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 12:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789069867; x=1789674667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVx3QsrOE8nFnIqQ3Xau8tUu6Fb+Ymh244TqNfkRpGA=;
        b=lk0cNn2VBVwwhx5C0Gu+9FmdfopzQyn2LBG3rhUwQ03z+JURFiBcYtAcMyndujDJR4
         PpSs+Gzxom3qytGzIcSg/X2W1wX9+2ncVwTZqIdawHbnh8YNCLMbc8493K3xVjxCgTu0
         zzUfiX+lqz3m0b4WaTpyD2TXcRuEPwMynLp++aqDBUGdpHzjxuJFji+uI/gnaqlVpMi/
         vKJy+V5Tq+Bg3XcGDCqZJmhY7mlrMqXRvEuGNZt1b2s0ZIBMSKdVsrW8N2FwmnmxxF+R
         n8xIOlyVHFUDlOZWu8nR2zaiPBs1tKYGjvQHbSdSsyd1dEfqe5Gp4WQALHyrr6LcSter
         NB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789069867; x=1789674667;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVx3QsrOE8nFnIqQ3Xau8tUu6Fb+Ymh244TqNfkRpGA=;
        b=jI++smaC0gFBHxrdEcfMw/BCeElVjzm6y37JCXRdG0GkPosyhOLh6GVSKw6PPeNmMA
         SajgTGPWdUfFq9S+OPSr2TJGnhB6tEJhx6COY8rt62qEzgG3Pbqp6dcybyAjJtsjbGo8
         1kqnV87egRWYqaB1pFg2fFSzEB5rvNuwiz1FIWlIkKWZ8gMBZdMLomRZKw0aI2uR/Wdj
         rQVeKY8Zmv5mDysNO0+XPiUU5o2TFEnmCfjGoPRlCSeYyGhoLS7keEOi0qb0KyoRQEGM
         OaH2xEa4bZEVqNE121uHLZbFsLCCkp85j/87tYrG3qlEQ9s5rmhbREfjEzHMw8ihyzF/
         NwOQ==
X-Gm-Message-State: AFuF++mqZhRRb+1DbhnoSswSZUpdqzf5oCbZB91DOJM4GRgcxfPghLoD
	pCzDmD4XvzC42DAJROyuwC9V2YFDemmUAQPFJypKB0i1bfmZXC8brah4naK93w==
X-Gm-Gg: AYBFou2jYf/BKc77fN4xXBYD5x3Qpc1aa1jLxMDO0D1LysPWpfT0NGV4zO3JhdVhMTD
	LGa6XgpEhx8d+28mrTG5TgNygv7RmJHOIRf18B8jbWPSSATeZbikSkzofl052SCDuMkvp0q34Rj
	B7msqe7xPIyEYglmsuwbZ77vWT+wH7svsI+J/lx1SjFUPDrP7Uqs404TkwUsn0WZBm4VF3mCqxA
	lTz1puVag32n6C2zibSXy04JSfFw0YABJe08J32LLMWhlhb37PWnnujuLMEqsOo8/hUDmj3ZvNV
	PMNcSogfUZ8DbEBnOpAg2RVaEgfh4RaEfh+WzO3a52fpaVTWkSp/9/7rd1UiQPNquClTNZb6K2c
	xPNsQRtIKW6rK/zWCr8NqCqSSZBEpBTZqFBpXi6UuqyySNNbiu+iTTEJd5s9uAzScgXCsjsX7Xr
	igKdYhwdNtJ+Xr0cCZoYoLA0GVxE7E1EX7hEutJSAnk5k/XB3iTauAHAbHeIJhID0dek/4qvlRE
	g==
X-Received: by 2002:a05:6122:4b10:b0:5c3:61c2:9ec6 with SMTP id 71dfb90a1353d-5c8462f44ccmr2364850e0c.7.1789069866869;
        Thu, 10 Sep 2026 12:51:06 -0700 (PDT)
Received: from x-wing ([2804:14d:78b6:4583:ad1c:1455:3098:a6a8])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470d661bsm414016e0c.8.2026.09.10.12.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:51:06 -0700 (PDT)
From: Fabio Pereira da Silva <silvapfabio@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Fabio Pereira da Silva <silvapfabio@gmail.com>
Subject: [PATCH v3] docs: translations: pt_BR: translate programming-language.rst
Date: Thu, 10 Sep 2026 16:50:59 -0300
Message-ID: <20260910195100.1701-1-silvapfabio@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate programming-language.rst into Brazilian Portuguese and add it
to the pt_BR process documentation index.

Signed-off-by: Fabio Pereira da Silva <silvapfabio@gmail.com>
---
Changes in v3:
- Remove Assisted-by trailer.

Changes in v2:
- Add document to Documentation/translations/pt_BR/process/index.rst
  instead of the top-level index.
- Remove top-of-file Sphinx label to prevent cross-reference and build conflict.

v2: https://lore.kernel.org/r/20260910190736.1665-1-silvapfabio@gmail.com
v1: https://lore.kernel.org/r/20260910151145.1226-1-silvapfabio@gmail.com

 .../translations/pt_BR/process/index.rst      |  1 +
 .../pt_BR/process/programming-language.rst    | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/programming-language.rst

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index 7841eca..6e73b9e 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -38,6 +38,7 @@ devem estar familiarizados.
    :maxdepth: 1
 
    Requisitos mínimos <changes>
+   Linguagem de programação <programming-language>
    Informações sobre clientes de email para Linux <email-clients>
    Como aplicar patches <applying-patches>
    Backporting e resolução de conflitos <backporting>
diff --git a/Documentation/translations/pt_BR/process/programming-language.rst b/Documentation/translations/pt_BR/process/programming-language.rst
new file mode 100644
index 0000000..4e5826e
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/programming-language.rst
@@ -0,0 +1,60 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Linguagem de programação
+========================
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
2.43.0

