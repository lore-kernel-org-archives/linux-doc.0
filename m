Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618DD4334DF
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785783571; cv=none; b=EMYo3Biv1R5zayTsvqRpg69UmjF93rewq5i6tesXdMEHeY8VF2w340jYO8zyLJulAL/ikKJrxuPqjEh2eU1RPP9XgYUGwPbhDWYILjfKMCTCFSLpv9kH5IICOKxStglpYGdo78BQ1WnvYVHAM9jFCk67QmRrwJUXJSe+P6FU2IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785783571; c=relaxed/simple;
	bh=56ruhbewxz6rK3Zi1rhc5Ta0sDk+oqtu27DH17c4UOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kq7vl+M2PjZ66aC4yToAHV4tM7OHCtI8p3TPYWiNe4ITPLVcjTW39/XQzJxnjdcrDPe9I3p0CgUsOVYbPHQJ8k+jDUpFMl7ZQW4l9a6eflDZlYsxldaTSGj0lvj1fXV04caER832jTG8ujOGxGTjuVc86fsBurDJKmOk1nuAmRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Po2xVu7D; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Po2xVu7D"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bf83925ddaso1154030e0c.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 11:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785783568; x=1786388368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5S5Tdw4xaUDIwswhPUSbbfrZCmo+s58DPqkuxSMuZQ=;
        b=Po2xVu7DFCBYzrYMsxhs5pyz9+/jOPnJonYlBfi5CCMSf8GVrbBpjXUiPkQMt9mE/D
         2OmGdC/uzXb7H9ujyRYAE1+W/MvnLtYlBPw/Tsc4AYw/RA0BX0zaCwiSsXq2fge/hIJi
         7ViYtvz2rAOfaSNuMdyfnWIPAdpkR7HczBwUuDGOksDEUYJrNqvvMxbZGlPhz/9NSPUT
         Aq5hbjlff1HW3cnbS++PJ8ze67SLIcPset9DuKO4JEek5vxoIYeOUCjVQyD6WDfqNd7x
         JPHoYa/i9iGAVeeAeR5TZzD3ufur00iBYlAciAx1GoUiuTJDQO8xcj1WHF2tlJPFoS+5
         1BOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785783568; x=1786388368;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q5S5Tdw4xaUDIwswhPUSbbfrZCmo+s58DPqkuxSMuZQ=;
        b=fiA1NN8wbdCbDHM0c6H6qv+yA2gWT1lldstmz7vgkkgN0dnvuyX5WzCblt/vaF2DfA
         8txoF4X/z+TwWrXbxv8rrSyZ0bgp0QvXcX1adSt9QWZz90Kk0+Rw5OFyAfnsjwHGy4kh
         y6tGs3akbRWG91MF7+LGGBivoo+6gesHHYKow6HxSwcfdLGNIANqV8nL08dRNhR8U+QM
         A+bFnRhkFC4B9kcK3cq07BZ4mu7gH13z8Z1MNt74qz58H/sAW1uA+LqAX2XdU582SxGe
         ENa6pC5tB6GRBPeAE8O7bUoHAz17eIo0PV/Y85AKdlDjIYVSq/atR9z29QbTeBz999LP
         ZZ+g==
X-Gm-Message-State: AOJu0YweAmQmBDKA1uV2X3A6337bu8Zn+GTeRMPWKBFYhPZIvCAB1PI0
	NS/9UfgVfTn0Z23fZ6F1RU2suCJYPh+BX25zBvCvgbFY5OeoIfFxcTJV
X-Gm-Gg: AR+sD13umz2xsqJ4mo8ztXEqnjuRJrZV5gxFJBp36qnxSkbnpFD46uwknGT1V4GiEYl
	12bVOLhXaCi03wDZS6qBKP0V5wyz1df9nV8TGQ0RCOb1jc1FgUIaAFN1JcZScIkbX/PkFx1L/oS
	qdXl7tMKA7XNwRRKP1IsTfvgYgJDH4KlWC7G9aoKBKRwojSPIgu7AjlTbdkU00qEGlwYyOoq9zM
	8X6vxXOqf0iBfk7dPrd4DhkYRcwXofYoZNemhFxH0JWd8P5BH8IKM8LgmzEi6QnrYnM4lQiqoWJ
	Pwgz8tawBeuzRK+xp62WkDERZqBinmRzZUA1fjMmVaXm8Nb9ewHnd8Ff9vbq/Jf6BCqQ/fZf0Xz
	EiU4DropsfoC13+NfODjOdVs5mfdba+oR4q/6MdJlgr7sNudmL/EpyCz30K/TrZ7xTfKvXBRDFp
	XXUBG5tHu5IaceEd3f0a83lub0kv6LheXqlz69vPOnoVnqmExCnqAr7ggCRENV
X-Received: by 2002:a05:6122:6609:b0:59e:372f:6db9 with SMTP id 71dfb90a1353d-5c38785aa7amr3028488e0c.12.1785783568174;
        Mon, 03 Aug 2026 11:59:28 -0700 (PDT)
Received: from ASUS.. ([187.65.135.28])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c37ede14basm8855023e0c.15.2026.08.03.11.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:59:27 -0700 (PDT)
From: Abel Philippe <le590616@gmail.com>
To: danielmaraboo@gmail.com
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	Abel Philippe <le590616@gmail.com>
Subject: [PATCH v4] docs: pt_BR: process: Translate programming-language
Date: Mon,  3 Aug 2026 15:59:18 -0300
Message-ID: <20260803185919.921073-1-le590616@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate the programming language documentation into Brazilian Portuguese.

Changes in v2:
- addition of SPDX-License-Identifier: GPL-2.0
- addition of the missing half of the file

Changes in v3:
- change "linguagem de progamação" to "linguagem de programação"
- removing duplicate "``rustc`` [rustc]_" from programming_language.rst

Changes in v4:
- remove zero-width characters

Signed-off-by: Abel Philippe <le590616@gmail.com>
---
 pt_BR/index.rst                        |  2 +-
 pt_BR/process/programming-language.rst | 58 ++++++++++++++++++++++++++
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 pt_BR/process/programming-language.rst

diff --git a/pt_BR/index.rst b/pt_BR/index.rst
index 5b8b60cf930f..de99839db0b4 100644
--- a/pt_BR/index.rst
+++ b/pt_BR/index.rst
@@ -83,4 +83,4 @@ kernel e sobre como ver seu trabalho integrado.
    Conformidade de DTS para SoC <process/maintainer-soc-clean-dts>
    Processo do subsistema KVM x86 <process/maintainer-kvm-x86>
    Adicionando uma Nova Chamada de Sistema <process/adding-syscalls>
-
+   Linguagem de programação <process/programming-language>
diff --git a/pt_BR/process/programming-language.rst b/pt_BR/process/programming-language.rst
new file mode 100644
index 000000000000..239b89e088e5
--- /dev/null
+++ b/pt_BR/process/programming-language.rst
@@ -0,0 +1,58 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Linguagem de programação
+========================
+
+O kernel Linux é escrito na linguagem de programação C [c-language]_.
+Mais precisamente, ele é normalmente compilado com ``gcc`` [gcc]_
+sob ``-std=gnu11`` [gcc-c-dialect-options]_, o dialeto GNU da ISO C11.
+O compilador ``clang`` [clang]_ também é suportado; consulte a documentação em
+:ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
+
+Esse dialeto contém diversas extensões da linguagem [gnu-extensions]_,
+e muitas delas são utilizadas rotineiramente no kernel.
+
+Atributos
+---------
+
+Uma das extensões mais comuns utilizadas em todo o kernel são os atributos
+[gcc-attribute-syntax]_. Os atributos permitem introduzir
+semânticas definidas pela implementação em entidades da linguagem (como variáveis,
+funções ou tipos) sem a necessidade de realizar mudanças sintáticas
+significativas na linguagem (por exemplo, adicionando uma nova palavra-chave) [n2049]_.
+
+Em alguns casos, os atributos são opcionais (isto é, um compilador que não os
+suporte ainda deve produzir código correto, mesmo que ele seja mais lento ou
+não execute tantas verificações e diagnósticos durante a compilação).
+
+O kernel define pseudopalavras-chave (por exemplo, ``__pure``) em vez de usar
+diretamente a sintaxe de atributos do GNU (por exemplo, ``__attribute__((__pure__))``)
+para detectar quais deles podem ser utilizados e/ou para encurtar o código.
+
+Por favor, consulte ``include/linux/compiler_attributes.h`` para mais informações.
+
+Rust
+----
+
+O kernel tem suporte para a linguagem de programação Rust.
+[rust-language]_ sob ``CONFIG_RUST``. É compilado com o ``rustc`` [rustc]_
+sob ``--edition=2021`` [rust-editions]_. As edições são uma maneira de introduzir
+pequenas alterações na linguagem que não são retrocompatíveis.
+
+Além disso, alguns recursos instáveis [rust-unstable-features]_ são utilizados no
+kernel. Recursos instáveis podem sofrer alterações no futuro; portanto, é um
+objetivo importante chegar a um ponto em que apenas recursos estáveis sejam utilizados.
+
+Consulte ``Documentation/rust/index.rst`` para obter mais informações.
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

