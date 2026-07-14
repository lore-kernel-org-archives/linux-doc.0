Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A54E3815D0
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 22:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067849; cv=none; b=P8t11R+SsAwpxMKZOWcnl4UtkxdXzJ1lJ1+nbWIs9S7jkgxM6v9GNIMTZ0f0dnDAatW0nU9mHppFXMkuOki/tJiSdnpxL/e0vVCCjBQQdbef4wJtRH/itERa1kKQPDteNIyrAFYm8l7ndxbMV8aRel3n9s2dvYLsqoYVnfkrAqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067849; c=relaxed/simple;
	bh=ZVv51kkj/kj4OOd6RkTZiaJNMeC9JNbrUyE+EEEKqNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YOnMmoNsa//5xVCk0vGRhcyvwczghTGwBcNE+UkqwrjpD9QcULezrnnEdQspMHjlWXFj/TsveSbfizhD6uDPv4dwXfHp6PeXx2PoLsIutbVPGYTlivYJ7RKzitJdh1U9xM0bNUwxnbHpEUw3rV1MaFTSspsT5uqq24DNkysDyIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghPXn6lH; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghPXn6lH"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66804667af2so1274937d50.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 15:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784067847; x=1784672647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGuAr8s27mzX9esIdo6fHj8sJEVhZQDcUCPRA7bKKZY=;
        b=ghPXn6lH7xJpt8I9pycoYBDrnZ+jJfyUCmUqB6/lLY8yynS+oVYqmtek8e+vWO4Hlv
         9nk9EyWQMzCXZ/A+FDc5a6iwSdTXdKsolWVdrY/TWLLYQ8u4fFOZLIKqS/Lkjclceyr9
         Kh6f/yZ3HzA1EHDyJkxYevzu/rhAnJcGL/W4U708Or2sArDzXeMDi9qVO2gzuIACfhm2
         qvpRseG9wdt8Jhm90cLDiqYCH8+It0ytwLebsfh1KWz3pVQk6UYwTZXQHM6Ojf3dl8g2
         flkYYu5Qz1qxcotLWzozQ0eYkL9JCCUfBTZyhjkTO9DomP9Ict/mwLvalML9HsOGC1xx
         SLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067847; x=1784672647;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aGuAr8s27mzX9esIdo6fHj8sJEVhZQDcUCPRA7bKKZY=;
        b=L3kHXEwSPx4MlzfefbzlOfzmv2kQMTzy+wHDQFoNf4kIksnNOYIgRlSj+AzrmtReIl
         5tymnodgdJnEEOz2x0/BLbCMir06AX3GU3ksENen4LHp11xeDSqk1s9406lDWXyij+Tj
         q6yeWu23+QkpTOj+I5WIHSlMctPoe3h0z63X11l+a20RRAs1rxxqRYjk1H+ImcrCLS7B
         3PYyXnXcBGWvIz3a4bWn/XWeiaN4kEA1wAYnW6y3JptxY6apUrDnzKrTQp8qpx1OLZ+c
         bMb5d9yhoCb2SNjcHWlvX/pLKw3D5Xjkz1oIJk4j2ecAxrwHQVeW9PkB2Fy5OmSZiBGR
         eHuQ==
X-Gm-Message-State: AOJu0Yw72ZiVsqFw39ZMk2KMwlB5+rJRODONGXCtsDTDeeDVWyju+pJs
	ylkJHbuQOgpYUBmJyhJrXO8d/GVU7Bgf1bCmz5BZFVgURkrvbdyl+56E
X-Gm-Gg: AfdE7ckD2AgHo5n+7sajr8bKsTqWlraHGgym45bcdSn/k3fw9PKl8oqm33RmPy8hvfz
	s7/Ed+R3X/ZOVHevqvnb7JMjrqFUtvP/NRYgiUvsieAtl2tgDUPbfS6zkcVY7vJntoDX7/CMO+y
	xhoa26U1YmJSqaYWuq6e86QKFPr9HnpfPjS8ukGQzS+y0wbxaWb2LxrGbXUcYOKtXo2c73SbZww
	1LfSJZ1slL9rE6vyrevEOCopwa9bqGhSJx0B21cc5TH6aRhYBl7iNjXiP6EDduUo8Kg5pWXqVOg
	LisvdF5Q34GwsatnvBuollsrnEpOTvqH2WhyBQBGG50v2/hgqtxvFnsS0bnnBR++EFbXptUBiY5
	23jlHU7lpi2R85UEYRAK7o0Cj4ascXKbU4rUQEijCiXNhZdVvmYZgVZs1SwuTVV14+J5dNzruLu
	k9/2+cVFhn+KA5Ug==
X-Received: by 2002:a53:d058:0:20b0:667:ca27:479e with SMTP id 956f58d0204a3-667d7b0077amr8471140d50.8.1784067846998;
        Tue, 14 Jul 2026 15:24:06 -0700 (PDT)
Received: from ASUS.. ([187.65.135.28])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be9834dsm154256137b3.9.2026.07.14.15.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:24:06 -0700 (PDT)
From: Abel Philippe <le590616@gmail.com>
To: danielmaraboo@gmail.com
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	Abel Philippe <le590616@gmail.com>
Subject: [PATCH] docs: pt_BR: process: Translate programming-language
Date: Tue, 14 Jul 2026 19:23:53 -0300
Message-ID: <20260714222354.107462-1-le590616@gmail.com>
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

Signed-off-by: Abel Philippe <le590616@gmail.com>
---
 pt_BR/process/programming-language.rst | 56 ++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 pt_BR/process/programming-language.rst

diff --git a/pt_BR/process/programming-language.rst b/pt_BR/process/programming-language.rst
new file mode 100644
index 000000000000..740e03cddff2
--- /dev/null
+++ b/pt_BR/process/programming-language.rst
@@ -0,0 +1,56 @@
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
+[rust-language]_ sob ``CONFIG_RUST``. É compilado com o ``rustc`` [rustc]_ ``rustc`` [rustc]_
+sob ``--edition=2021`` [rust-editions]_. As edições são uma maneira de introduzir
+pequenas alterações na linguagem que não são retrocompatíveis.
+
+Além disso, alguns recursos instáveis ​​[rust-unstable-features]_ são utilizados no
+kernel. Recursos instáveis ​​podem sofrer alterações no futuro; portanto, é um
+objetivo importante chegar a um ponto em que apenas recursos estáveis ​​sejam utilizados.
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

