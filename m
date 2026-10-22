Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684155;
	b=piMbYQo/GUCLRfMKpvd7j0Wz74UFMdFQcIR+6BZ4BbuyI1vRopulnxBDcIvZxYbNvVkY
	 f1FQM1O2j8hFjp8HBMEuPsNRYDOCOJw0FV306+9ELzM5GU7qapUd1CJJTZudp4uLbw1x7
	 ZD36C4A2aWpf3DRMVBzo6nMGY5pu1tD9jNidWCDNYnYjYIiB1cdqBLrA4uOLSu5Rc9yqu
	 uRHpy+FRzMTg/pSZ4thstY2Zk1AB7Q4stLBpqt4egY+i7ngiqbP64a7jMC6zZD/r9cfBH
	 sd8e8TEm7xJdmcJk6jGSERhO7Evrtj3gXJcuv95ddpjAkkOnBZVomc1vxcfRKtUkQcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z799PBwungCQk38WE1W1PhL2le/uFNC4uKYWvL5bioM=;
	b=QTiyQlDsv0fyk/W8W+lsS3s59vOxSNXogIRqmSoAfld+UTU6zoGx9EXTGgemHhQFSRU8
	 HMnxn3nN1dntiOJA4UktMF34XDlfROHbTgBXUKIkq4pERDPlJ8a1HkypTMfkC59AmXF5I
	 7wk4hyqlqcjYyXnXEnCsEOSevJkbE2uAvgI6C90L3PqtAaCtnm1lCTlQ0Ur5nlhQZTp0q
	 3jeGHAh6N56ju9XBljY2cn5rO47v5crG3ycuHnrEqCHxWSSLwOSOVZwVSIwbc1d8vcykt
	 o1Wg9MQ2Igos9huy1PZH08TZWPa9r2ul9vnKkCPrvaDN6YojnkXBR00vkCQGDprcXOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q0Tt3szP;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9596606A31D
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 15:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9596606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q0Tt3szP
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-78fb1fb9508so851005137.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 08:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792684154; x=1793288954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z799PBwungCQk38WE1W1PhL2le/uFNC4uKYWvL5bioM=;
        b=q0Tt3szPux3DPgEwJgq01tYB/z8hz5Z5comc5z2elERV9q0dif4r4otQOjmB8FxX4Q
         C/0RwLD9bL02aVie4BHo/7QA7IzAm5qP451LvM2HE1M2c+RuQqpjz/3CuAjREQcXlE78
         6EUNrWv/tC11fJwE0CMLxLFCMbjo9OZ6y4D0+7+dUkYLcaCvhF3JnulPQcUNib6CHjsh
         jBhJThUO9nHzSZEIfZ/a7GdEi7etW8YNnK3jQTq2iZBq8Z81rPh5NS53om8CnvCBCGe4
         TxwkdK3gtWJKBNclLwuRBYJsVTpi5RVzkyfGY1PRrRG+fFnB05KjBX2BeWFyMuuFzVBu
         XM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684154; x=1793288954;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z799PBwungCQk38WE1W1PhL2le/uFNC4uKYWvL5bioM=;
        b=rAy0HpCgmsYppQZJza+eow00AYdhIgf4TTre2P/+xCFIS2PfvhtqC35q+6qv/BpS5y
         67PRPKnj3pa2H59cbh+ybCaCrdCfmqxxIXZ+/lGLuUQMr08bjXbpPK/Xx/7IVfkbSnnB
         02XaTKcPR2LFtVcq3y6LOog1620gT6p35YCH1G53WkUrrh3rYXQXsof8OKJa932/5TS4
         j3mlnqnhGffINWxzUPb+wGEL4CNrl4IL0aU9hoI23Y+f6XTNU94PicK05uSuQbAjIkqR
         Rw4PbamaooIW/qakl6ekXJyW4gfLmIvBf4hd8i2Jshl0PCP5m5agsqZ7i02DPgJAHExi
         zJxw==
X-Forwarded-Encrypted: i=1; AKwUvBwQVsIk1YOpzA3PCx/EI22WMqQnap6AiljUPhbcxkahWjUYLx+LHQW2MWFZT9idFbQh058GFvkybQw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKxmwkJy7AnUttRJGD46L2oob/G7EJ3smN0WCICnV5C6wkcyJL
	KUqr9vgE4NOBSB97QmbYNCEM4KQoQgFABN7HFzqEC/JAORE99dP680zX
X-Gm-Gg: AYBFou0npXAKP4lTlhoxB4U/rOM/Skvgzg7zwZ4cuFVr9EsGDtWJiS36cgV2Ui8BhMS
	XWBnxp9ZLvTv+HvMsYlKyQREIImBTuSwVbvzBec/W4CVseQLjaykMNhF3dlRt7gISQYtue6isP8
	kLwTTcKWiernq3eABRQLC6p7g4O5k8ztEpYdUmmIe4o+0QvwAxpRSd3a6w5H9Sbt1QwDAcxoedE
	OVJviM8QHdoom0m2aTnoVektxdVjJiDqC3HEOUxOuahmrECQjypqFeTv1G4U3263zuYF0BK5uo3
	LO7CLZ49DuZS/q27OoTZWpM9L7O6YRD+B18vhIKzlZXcwGETCRnmlOfg9+JTZ9IphJ41s3TIbBX
	vOEPH4TY1CXwDiknltugSn5n113HUx4sc1cLLRTv87M0Z1gQcojzxRTvgU5Z+I1YyIJWZpdWiKe
	P9MCZzFWH2iEKISVSuDTCpo9689ZLXiB16BmZ1MIURzHMXm1bhWQtyeH3guk2w1frLGmPSE6Bn3
	wjnDWo17lCpXi9gPBscMbi/EXsHV/3Wup7E40vMAr6nubIw4bRe4V9xYzIWtliWUWqzpPr/T4xD
	e/YIOZ6q2UZkB/WuK0KYadKpjWpzqFkalPFKV3gMUM7JCCvivw==
X-Received: by 2002:a05:6102:1a1a:b0:7ba:95f3:8a07 with SMTP id ada2fe7eead31-7cca98139c9mr569745137.13.1792684153876;
        Thu, 22 Oct 2026 08:49:13 -0700 (PDT)
Received: from dell-pro-plus ([2804:29b8:5080:dd51:d55c:b555:e096:bdc4])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ccc2187b03sm21781137.10.2026.10.22.08.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:49:13 -0700 (PDT)
From: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
To: danielmaraboo@gmail.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
Subject: [PATCH v2] docs: translations: pt_BR: translate programming-language.rst
Date: Thu, 22 Oct 2026 12:48:40 -0300
Message-ID: <20261022154840.119951-1-ic.gabrielribeiro@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate the programming language guide and link it from the pt_BR
process index.

Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
---
Changes in v2:
- Use translation-specific labels for the page and all citations.
- Drop the obsolete Assisted-by trailer.

 .../translations/pt_BR/process/index.rst      |  1 +
 .../pt_BR/process/programming-language.rst    | 64 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/programming-language.rst

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index d072f7e46..ccfe86de2 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -39,6 +39,7 @@ devem estar familiarizados.
    :maxdepth: 1
 
    Requisitos mínimos <changes>
+   Linguagem de programação <programming-language>
    Estilo de codificação do kernel Linux <coding-style>
    Informações sobre clientes de email para Linux <email-clients>
    Como aplicar patches <applying-patches>
diff --git a/Documentation/translations/pt_BR/process/programming-language.rst b/Documentation/translations/pt_BR/process/programming-language.rst
new file mode 100644
index 000000000..91fc1a553
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/programming-language.rst
@@ -0,0 +1,64 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _pt_BR_programming_language:
+
+Linguagem de programação
+========================
+
+O kernel Linux é escrito na linguagem de programação C [pt-c-language]_.
+Mais precisamente, o kernel costuma ser compilado com ``gcc`` [pt-gcc]_
+usando ``-std=gnu11`` [pt-gcc-c-dialect-options]_, que seleciona o dialeto
+GNU do padrão ISO C11. ``clang`` [pt-clang]_ também é suportado; consulte
+a documentação sobre
+:ref:`Compilando o Linux com Clang/LLVM <kbuild_llvm>`.
+
+Esse dialeto contém muitas extensões à linguagem [pt-gnu-extensions]_,
+muitas das quais são usadas rotineiramente no kernel.
+
+Atributos
+----------
+
+Os atributos [pt-gcc-attribute-syntax]_ estão entre as extensões mais
+comuns usadas em todo o kernel. Eles permitem introduzir semântica
+definida pela implementação em entidades da linguagem (como variáveis,
+funções ou tipos), sem exigir mudanças sintáticas significativas
+na linguagem (por exemplo, a adição de uma nova palavra-chave) [pt-n2049]_.
+
+Em alguns casos, os atributos são opcionais (isto é, um compilador que
+não os suporte ainda deve gerar código correto, mesmo que o programa
+resultante seja mais lento ou o compilador realize menos verificações e
+diagnósticos em tempo de compilação).
+
+O kernel define pseudopalavras-chave (por exemplo, ``__pure``) em vez de
+usar diretamente a sintaxe de atributos do GNU (por exemplo,
+``__attribute__((__pure__))``), para detectar quais atributos são
+suportados e/ou encurtar o código.
+
+Consulte ``include/linux/compiler_attributes.h`` para mais informações.
+
+Rust
+----
+
+O kernel oferece suporte à linguagem de programação Rust [pt-rust-language]_
+quando a opção ``CONFIG_RUST`` está habilitada. O código Rust é compilado
+com ``rustc`` [pt-rustc]_ usando ``--edition=2021`` [pt-rust-editions]_. As
+edições permitem introduzir pequenas mudanças na linguagem que não são
+compatíveis com versões anteriores.
+
+Além disso, alguns recursos instáveis [pt-rust-unstable-features]_ são usados
+no kernel. Esses recursos podem mudar no futuro; portanto, é importante
+chegar a um ponto em que apenas recursos estáveis sejam usados.
+
+Consulte Documentation/rust/index.rst para mais informações.
+
+.. [pt-c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
+.. [pt-gcc] https://gcc.gnu.org
+.. [pt-clang] https://clang.llvm.org
+.. [pt-gcc-c-dialect-options] https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html
+.. [pt-gnu-extensions] https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.html
+.. [pt-gcc-attribute-syntax] https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html
+.. [pt-n2049] http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf
+.. [pt-rust-language] https://www.rust-lang.org
+.. [pt-rustc] https://doc.rust-lang.org/rustc/
+.. [pt-rust-editions] https://doc.rust-lang.org/edition-guide/editions/
+.. [pt-rust-unstable-features] https://github.com/Rust-for-Linux/linux/issues/2
-- 
2.56.0

