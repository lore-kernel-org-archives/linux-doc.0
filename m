Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9942F7EE3
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 03:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784171846; cv=none; b=uWo1Oot2BmGZNk7zPQFkApGo2DYiHisVj2rPNrHJkPMDkQXjNRIeIRcSlCt5UlW0f4CkS86GRH7GFK4An/fyutB+1FftG+fJj8WiQkqmPqgcmSc7vnB6EJRuKxPHetCr1uUNU6sbTFDB2Vwy+kQgOHnYq0Q/0Pyk5i7k8Y+Bsv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784171846; c=relaxed/simple;
	bh=yuYwAH1tqzXEU/m24ASSlYCOnQ18iZEfWhEC5GQ6Ok8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sJanCE1YH3orrmrZQ5wuFwVa1TTnEKE8Gl1P/omAO784QRU7mDhn5NBUeQVoJnKZ+fCX0+bhCKwd10faqwLVxdtb11TeDZg9tT9FMlI/7/9Mg7YN5c/esY9BuAIDmt+PLOlH1AuIc+v4HqlU4CiT21xEcrAEfapidfhcHlepJaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvcerRdS; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvcerRdS"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6679d88abdcso3191842d50.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 20:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784171844; x=1784776644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzbU2hAgrKRKlrG+Kt61lW0Jt2FPCINA7SJ3nQaxWcA=;
        b=YvcerRdS2Fr/d2LLyPS/7Xu/N9F6ksMWCziePSXa3mDOTNP6KP/jJMHTNDboOKbGGI
         X1gdZI19G9f9MPLNzZXuFU2OaJI9Hrk2jXs7jVFMT9VOAIWqp+VIJ4TShZFFXUpl5rav
         30257tS0m9502Z2H8Ne5Dm5WgRyUn0Vh/TuphCQIrhj/EWNRRQ8mqM9ncCsmRsbAC87Q
         Hs7G1Zpz9irjsQ95GePUR/4atQ/792J3YNktc7k6YTdvK9CZQkpKJlnQWnw6FaIU6VnO
         BQJLoTt59h6ItzEJorCc4ZK3olBkVibvt3NkcXEHLfeDIXBZMP1L+BbGaeSNnDyONFlH
         x+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784171844; x=1784776644;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dzbU2hAgrKRKlrG+Kt61lW0Jt2FPCINA7SJ3nQaxWcA=;
        b=JfQHEfogNKK7a4jHzSbp1/pfuPtfJ5R8MZfM4ouUGRu1dTCnPwhacwLsS9oFXedMOA
         V7dX3SXz8odjeuoOlCwaFozSNDDgtJO173rLMQVtGgCfJtfMd+tXtJCw+CLGE813dGk+
         I3D6hyCk+WG81TopN577mWxn85BbBNIRc6HrPiv3VYgAl+vPDfNXY/noVKvljdwq1XJR
         bboZL8Ee92Q+cgZ6Dh+KWyLc09wxP6xraXq0JRuFuexD3idYjqvVtFJ8oazJ+gzLqXTO
         R4US03GqoGcacmFz3C8TXj8w/CqHSK8Os/5O26F5MjGR5bMWx+Kwk+sDH+XEcbfmGUZO
         5V4w==
X-Gm-Message-State: AOJu0YyL4wFv50HicGeB7nK2dpUbpTOrSGm/X387zYq27UbRw2em1RbB
	R1rmnNsGMEOPgOntX9NZdD8QRRvXF391Jjb1/k5rBm2S159rT3pfzb97R+eJSmTDNTQ=
X-Gm-Gg: AfdE7cmV4Qsi6S585NbOytknIfg5L/uSCnvbDZvqVpVamsHFosHRlT3p/LKs7ZwlkdW
	22KegWkLJSpARbB8qyjKt2amRNs9hOZPxi6nfRWxVkZdAZ8U34mpEi0oN+GMgPZNrcgkf6PiVEZ
	hEq3Fdedx34gocPXImuybhXGRI6P2ZOZQrFnTEgPQTXf/1AllRqg+uONxGYQddHHKxgwC701QQC
	xJ1OVsiIH+J4Pm76cK/VKQfmiL+22fgwEAuCSTCEk/DfXVsNY+h/z5KGJdztnSrTqVgSu/XL1Gc
	8QGgdSpGnpy1hlmjdzsQdtEGz50hKw51RidFJeHMpQcan9N71tWAn6HqwX1oWaFqgsXRFWX73Yp
	zuxUoi5YD1lSEmc11vU3wvDR4FdC7+caHiDYJ4ogXK+d0u5Ba9khULpcmOvxcBgcFcuuC
X-Received: by 2002:a05:690e:1595:20b0:667:83ad:b3e0 with SMTP id 956f58d0204a3-667d7bde59bmr10962322d50.65.1784171843863;
        Wed, 15 Jul 2026 20:17:23 -0700 (PDT)
Received: from ASUS.. ([187.65.135.28])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6681fe46cd8sm2263876d50.15.2026.07.15.20.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 20:17:23 -0700 (PDT)
From: Abel Philippe <le590616@gmail.com>
To: danielmaraboo@gmail.com
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	Abel Philippe <le590616@gmail.com>
Subject: [PATCH] docs: pt_BR: process: Translate programming-language
Date: Thu, 16 Jul 2026 00:17:11 -0300
Message-ID: <20260716031712.497037-1-le590616@gmail.com>
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
 pt_BR/process/programming-language.rst | 58 ++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 pt_BR/process/programming-language.rst

diff --git a/pt_BR/process/programming-language.rst b/pt_BR/process/programming-language.rst
new file mode 100644
index 000000000000..1fc0a6be7f65
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

