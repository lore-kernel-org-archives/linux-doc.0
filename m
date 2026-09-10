Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F33E49E5ED
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053120; cv=none; b=E4hA2qdbEupQ+C6xLESlYkttmDcE3ZN4M9n8IpuFIOTOm1INhZU2rXv11fK4EYDjlIU/UezZ7quuimuhhskt3S8n04gKgImWJHRYuTFYFZsBxg+o51mVTmNPXVWZCFTuSLf0ZZBXZCY7sxVi5oNDbqUO4g02b4PlEtV7emstRTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053120; c=relaxed/simple;
	bh=uWfdJ2K4VtNaAP1M3OjcxFEQOxBzwVCMokzUUcVueoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t44bKkEQuV2kURJbAj6tHUQLS31Jjd2FOFgBpcgSihAiKTaC1lt63/THJFK7ws1L5wSLb6rAGKkfOFRneb2rpjK3Op/O78WybVoMWbBP0yfE7cswqwZ9gxRUvomd3WNkPp9G0Ie36OUT/XKagCeaxXbqLvcKyrrYFFQlb758eAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcriSyJu; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcriSyJu"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90cd8e45460so96881896d6.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 08:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789053113; x=1789657913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CxqyrUzxh+n3XqLVIUhKRsepPbKenHZ6pXHh4gtnraM=;
        b=NcriSyJugGix9W2kytZEKTLCwOsPEbM4Imt13+KbgN2+H3KgtLteKTs0P+ysawo4mO
         B4NCFFgcrmkX/UsgF0zyYcBZLzQaOBCcE+/a0o2G8ro1YZHUv0B4Ehkt+UPrslVRxwDf
         yXMaE8m/7KMSc+9eNhmsNN0EQbx8Ha6ylsy9lmRim6uu0DiTSsbJCF9RWpo+xkLfIoOw
         Ly4fSJ9G/xGi59dy+w0nS6ZkZnOu3nl+ARjzYv0PBH26seKMtmzmsFVcN/OxDUzsQuoh
         khYBviYIxtWENXClQ+I34zCTXqQMwF6VJ2zH4ZqSeieXQF5zBZkiY6lVbqCyi+LUu3Q5
         cYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789053113; x=1789657913;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CxqyrUzxh+n3XqLVIUhKRsepPbKenHZ6pXHh4gtnraM=;
        b=CzF1jzd2k0p0bxlSwpVhlIVVq4yzbRDy7RJdLlqItbR0jAKQ4gpx+0h5Dnkv3Cn98h
         TGTNeyNLMiaFxJt7g/WMRWwQWpeDPBMyE4iuPxOHw8LuRFxD6b+EBrxdQbkIJCVIgS8d
         PZKorKHNBUgyWdsx+mMwsRAO+9lIs7a2p+EdKI82Uye9VYKqtX8GNATZGwYN1oAR+r/4
         MldX5EVOOXeA3LKLNKTfqzrY38SDeiv5WH4SyPMD5SFeZCGUGLH3Vp3nf8W5s5mgUhRX
         lceBKPqrabMmvFtGAQrZqlUw7oc3XuXABPZbObTuQ3NjdXxNK7JFBX8ulmWSQ+6hZwxj
         W1LA==
X-Gm-Message-State: AFuF++knjtAzBZ9OQccUX0/feIE0Bb2lRq28JDbNOozNE1kHGNz6R5uV
	Eo6pBZhtr2hNXYcHnBjdn6whnF0lFdcVF4to5jw+Ilz1FXYqE50EgKk6
X-Gm-Gg: AYBFou2CWjd2BIfMNaUUAH2tw5svevln7ugdNn2XE5ZymC0NUgkA64hbHbDnr3Nx5Eh
	nlC9E5Br5pAa/8LtLu1Pum2pPDHTJyvCfkBZ56Mk4U8nVs8pIIzD9rXjrCdPsWnVWf8vQJjpeZZ
	dE+EEpPFjrGqL0xBFHkWKFFkLFFYzobSEqJd2NUB5Cc8Ye5UoU9MVkK6ZLdEhtzSxEpJqyEX5g3
	e8IQvxpE9jBxozDM+EgLtIr5FjGeLdm9bUe7L3U1kaphF+b6ffk/qlJHV6PdmWgtcWWL790ViEW
	BgNmNpGuYXrZHUM77N4w7f0EELRxQlCijsP+bPFvrczGyI2OAA8k+2/89bdGxH6/TgazSmjOd3Y
	ZVVaiNqnaEiQD2/Sq11IAslmJUUgXkS2AzKTog/2C3hCmbxkaNNyFCMic84mi34sOyoJ0HCCxDQ
	qxv6ezrgCG8m6XGw2UhaE3ndaSnRVg85KrH9HFrsZMcEvoD2yx8Nvxern7OZMN2WZmjXkyS+7k8
	g==
X-Received: by 2002:a05:620a:4095:b0:939:7c5a:23fd with SMTP id af79cd13be357-9398075e0c0mr4819548285a.47.1789053112598;
        Thu, 10 Sep 2026 08:11:52 -0700 (PDT)
Received: from x-wing ([2804:14d:78b6:4583:a459:a51e:dab5:de9d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f18467sm5132885a.11.2026.09.10.08.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:11:51 -0700 (PDT)
From: Fabio Pereira da Silva <silvapfabio@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Fabio Pereira da Silva <silvapfabio@gmail.com>
Subject: [PATCH] docs: translations: pt_BR: translate programming-language.rst
Date: Thu, 10 Sep 2026 12:11:45 -0300
Message-ID: <20260910151145.1226-1-silvapfabio@gmail.com>
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

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 71eb024fbec8..d24da0262f73 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -73,6 +73,7 @@ kernel e sobre como ver seu trabalho integrado.
    Requisitos mínimos <process/changes>
    CVEs <process/cve>
    Lista de verificação para patches <process/submit-checklist>
+   Linguagem de programação <process/programming-language>
    Interface de drivers do kernel Linux <process/stable-api-nonsense>
    Conclave (Continuidade do projeto) <process/conclave>
    Manuais dos mantenedores <process/maintainer-handbooks>
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
