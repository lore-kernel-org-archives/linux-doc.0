Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E551DDF5
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 11:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ZXA+xqEJ"
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52AA9E
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:19:15 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-405e48d8e72so11541025e9.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023154; x=1697627954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xgxCkZcwRtJ6lnqrc2aMJ8ZnEwBE0+jayLLcWD/cr6c=;
        b=ZXA+xqEJG9IXfUqLeTMbsMPF0Zjynjxr1IJr1KSY8PBnZONnlBlGxH/Y4FaxRYFbMw
         WnHuB39tv5+fhlLCdzu0qbnr59AuHv3pzrtqW5ktxBb95ClH3BS7C4jS6rkTklVQ6ZJq
         XdIT3B27sXwYSk8zCF9EzOU5RUmZKPgXRUzgmiul1ekhtWKfNtcp1GlXtJiAbI6eg562
         j089qGJ67OGb+ZVnJLeh2G2hV4ydzSuEfUAGoc6+qSQvl5sP91u56h+Hze3kU0xp5pmz
         xAbaEpT9cHKywJfptSO0ei6aZQAViUQfUVAGcCpLlA8dU56b2LEzD+y31/nblLTUpmuo
         Lkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023154; x=1697627954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgxCkZcwRtJ6lnqrc2aMJ8ZnEwBE0+jayLLcWD/cr6c=;
        b=kwOzeJQ56W53uyO/3KnGR2/EHSr1jQbhLpAV17wPofLM/S8L7bfsqc88pAFhL5l7/M
         pK/K0fYVpfC5iJpeMEFtHO17eSAkbkGqlX2VzhKCqXjUbT3ikJAS7XLtuq1d213244oX
         oHC+SAeXZFR54yZnbCV3RTmb7mhHZD8GOScBjw2KW7xuJMybTfsYrrR5IfUvJpkhWkgJ
         Ct4vxY1t1H7PU0P7M/+g6rv/hnkyL+8sfgMAitYuRn2LLYbaHY2Lz/V6TOeFQMTK80Mf
         zhOiVKA/kJfPK5QHoM0cikLXukfdcnk4trjvJlN9u9XD4zgvOeuLEdcIf8BthXHXudXQ
         C8zQ==
X-Gm-Message-State: AOJu0YwgIRt0se8oHsfqBWfKX0ToaVKi6JyfrcoW2kh/1RkGCJn6XVPA
	U/+Kuof4rxwYl4GeeEMTIwJpOg==
X-Google-Smtp-Source: AGHT+IEo/nqOQf5Nm/GUklG2Aaubo3KEMXGfw3sm6uWoHOgjqGYxkEcgDn49UXNfcqfEstuD4y7hWg==
X-Received: by 2002:a05:600c:3b9a:b0:3fe:21a6:a18 with SMTP id n26-20020a05600c3b9a00b003fe21a60a18mr18661658wms.3.1697023153795;
        Wed, 11 Oct 2023 04:19:13 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:13 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v1 00/13] riscv: report more ISA extensions through hwprobe
Date: Wed, 11 Oct 2023 13:14:25 +0200
Message-ID: <20231011111438.909552-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

In order to be able to gather more information about the supported ISA
extensions from userspace using the hwprobe syscall, add more ISA extensions
report. This series adds the following ISA extensions support:

- Zfh[min]
- Zvfh[min]
- Zihintntl
- Zvbb
- Zvbc
- Zvkb
- Zvkg
- Zvkned
- Zvknh[ab]
- Zvksed
- Zvksh
- Zvkn
- Zvknc
- Zvkng
- Zvks
- Zvksc
- Zvksg
- Zvkt

Clément Léger (13):
  riscv: fatorize hwprobe ISA extension reporting
  riscv: add ISA extension probing for Zv* extensions
  riscv: hwprobe: export Zv* ISA extensions
  dt-bindings: riscv: add Zv* ratified crypto ISA extensions description
  riscv: add ISA extension probing for Zfh/Zfhmin
  riscv: hwprobe: export Zfh/Zfhmin ISA extensions
  dt-bindings: riscv: add Zfh/Zfhmin ISA extensions description
  riscv: add ISA extension probing for Zihintntl
  riscv: hwprobe: export Zhintntl ISA extension
  dt-bindings: riscv: add Zihintntl ISA extension description
  riscv: add ISA extension probing for Zvfh[min]
  riscv: hwprobe: export Zvfh[min] ISA extensions
  dt-bindings: riscv: add Zvfh[min] ISA extension description

 .../devicetree/bindings/riscv/extensions.yaml | 127 ++++++++++++++++++
 Documentation/riscv/hwprobe.rst               |  65 +++++++++
 arch/riscv/include/asm/hwcap.h                |  21 +++
 arch/riscv/include/uapi/asm/hwprobe.h         |  21 +++
 arch/riscv/kernel/cpufeature.c                |  21 +++
 arch/riscv/kernel/sys_riscv.c                 |  53 ++++++--
 6 files changed, 294 insertions(+), 14 deletions(-)

-- 
2.42.0

