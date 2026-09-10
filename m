Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD185867DE
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 19:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789067265; cv=none; b=KgPIy8goUXdpubykc5+8YVk/5aTKXPknthHGNS9Yk7FtKg+swAxEjJek5QCBnPaY9ntRtejxCcQE8df9NuXkGV5oDpo+bB7S3ByCUiPbxRCcwOAIs28lrrOVjnODQvxOSrN7HMV3lRLPoAW3U57MBQJkYQ1VeQhHB1E+pzS2C9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789067265; c=relaxed/simple;
	bh=yoseB6NvFkEMNpnUvnB+jdU8AEs7rHAKhVoRrbLuJRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gyRB18pFxZi2OGcgqunQjOeMr6ECYYvQrF9OEkFY0NvIga+4/NVrWbbzFdMwg51FO9x4fNF/6FJcOw504Kfpd9tpMs1PC3rxbvc5wNfJADWwwPMWpsoizIQHC6+sLbS0AdyVt/g2cUdeEf09wEAe+9AUUwDyQks0vYPC58oq8IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2PUd3/y; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2PUd3/y"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-966e7380109so177956241.3
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 12:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789067263; x=1789672063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CO26wWANOD88jwdHKgWjjDCs9aOhd+wvVApfcj4XEOw=;
        b=B2PUd3/yEHXg8k931hP914vz+wuQN0zjJpBcTfe8nF57Sz0SOXhuEyeESnsCnP8hcL
         jva03foms3kbavXq9HALfUNABzKI8WEvIm4lNBvYhybI/G4FMfGrPu8MBpWwGTZFflgh
         LZVJZekCrNxvm8dEiAZVJGEilMHrrTuRJDewMe1NKQVItdLvfaIFfi5G2ckbuF3Pf+h7
         Kp20KJgiUnSJbt142udfv3YsQeETLM61i/82UborL32czip5hbcRWIwr0oRvID7z5fKG
         XzMi7yHQT1jgpzfpxqQepvcMcmeIEc/5uwOvtGJNuTn2sPYZSkQKNfg6cyKoIwKz1FcP
         ilHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789067263; x=1789672063;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CO26wWANOD88jwdHKgWjjDCs9aOhd+wvVApfcj4XEOw=;
        b=grMOdIqpg7LQAsRxgrm7xF/yZV9FGgFeSjVHLgiffRJQ7DIDiuHA0O6Njdnn6GkvW+
         vmDgrA6ZYj0C7bGaoU0RMPxGc2Nb3/+rW+Da2IQZt2S28Wjznk/WwlUYuAXmBip6ClPe
         CYridGY9QWEUMnGzu7jbRRqIXukgV/BGhC8IXLiFpxVKjaMAz0jqwKKhIDRtdFjNoYzl
         D6zhXmQwC/Xx526njrspE2UvJyEmeueqIHDU5d5nEMn650XpfNvIwVvdD6BtvjobkRWX
         QYN3gxKzPvzZAKyKfXYctaSi+h0+8tRQ7NarVtXbohBEQGy3HSqxVgOD5jKw63D/7AAM
         jw2A==
X-Gm-Message-State: AFuF++lhlSv0zLVLJm/tKyPZzFluJGON79K/fdtvQuaTN8EQWpf9O6NX
	GX9gr26H1zNqjYa3KFkSqX9GJEEyLTLAUftXfpI565VTk3ZFQoq60b8nbD/c6A==
X-Gm-Gg: AYBFou16+WwK0dNGYwyACG25OywQPfOinD+2WROuLfo0bDAHCg51AC2yCXHJ0XKCip2
	lYXOkHP4uWrrADcq5MiTcBCiVhoa293t37MI53O3Qa0hu9GJ1ZEWALA2rUADqnsNW3vpkO516nm
	QvuGC4UtXjLFRESXJ8xo2HqXifndkpo2pRTSHmpPLfPNdqMineEsQj+ZhW9LBGB9wd5ynu0wlT8
	jJbQ5lNmZrYElDnsTtynNX8URpDfRhJm3V8+oVXNmoICBycEZzcE3bX2quOKiqsOkshDCITSw2+
	1ahgtqfecuzWSlyZS4Kdkk3QSA/XEd3UWS3ajkBegEOPpFA5gA5hRBwvsiFoSrq4veoA2x7kSF4
	Mw2IlFZJZSxg35uGdrB12JvERbnSurWCp3J0cA8n0Im+0svYu5Y3Syd+ayfEMwVd7fTjQ3RuSeU
	qSTY8Cp0vC3y/yU3U1uFgL56OMC2Cw2PoFbVQQUxJAZ79pgsOny6N4vIKpOxDsf5M/V6EfcOo0O
	g==
X-Received: by 2002:a05:6122:311a:b0:5c7:d204:db7b with SMTP id 71dfb90a1353d-5c8462776e8mr1842787e0c.3.1789067262946;
        Thu, 10 Sep 2026 12:07:42 -0700 (PDT)
Received: from x-wing ([2804:14d:78b6:4583:bc62:f651:fe2f:303b])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982b9f41426sm421383241.6.2026.09.10.12.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:07:42 -0700 (PDT)
From: Fabio Pereira da Silva <silvapfabio@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Fabio Pereira da Silva <silvapfabio@gmail.com>
Subject: [PATCH v2] docs: translations: pt_BR: translate programming-language.rst
Date: Thu, 10 Sep 2026 16:07:36 -0300
Message-ID: <20260910190736.1665-1-silvapfabio@gmail.com>
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

Assisted-by: Opus 5:Opus 5-3-opus
Signed-off-by: Fabio Pereira da Silva <silvapfabio@gmail.com>
---
Changes in v2:
- Add document to Documentation/translations/pt_BR/process/index.rst
  instead of the top-level index.
- Remove top-of-file Sphinx label to prevent cross-reference and build conflict.
- Include Assisted-by: Opus 5:Opus 5-3-opus trailer as per documentation.

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

