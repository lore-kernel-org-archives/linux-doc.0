Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE5E12E7B
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 10:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dG2tWBbh"
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2353119
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 02:56:01 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c6eac9c053so17671111fa.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Nov 2023 02:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354560; x=1699959360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TTPh4b9H/nO8hrW4fuWs0VYK/m0j/zKHKOI67JxMX58=;
        b=dG2tWBbhRDHvbIkW5ClEAiaUyelabHcTrliKlXVzC2YLfDNI49M7R8iTAiy5vo/Yn1
         JAn40viFDD0tXr0nabvxcYbgPDrw9cD6gLge9dm+IJIdVHvtSEJhfSpzyyIbWajLII04
         XCMFyowDBR+d/3RUpU5cI+K/NQJB2gg2hlRpG6U4FHd3Ueicij5MLhanD+1+AiT+OT+M
         4qat3VKGM8VAyIn+yHFcaGbRocLC83zZrBW6lAECJrL3wZjXwqZRK93no7yq/I0rG/pb
         uUnMIrJ+EiXY2fayyJoqFaanmpf+l3IE+8v4p+0S/TZM+RtVdtO2zlfSMg4w0kSwJ1Md
         na/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354560; x=1699959360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTPh4b9H/nO8hrW4fuWs0VYK/m0j/zKHKOI67JxMX58=;
        b=k1UCL8NmlAfsdlcZqBr8TUsG5yl0OH3dmJMkYLLePdGVPF/FKoD8ZSupiUClDpefsR
         69eI0X9Rtwage7CEYPfB86kJUXc5drkEZl+Zgz8TTr+2nLDAiwLSfJ+XpDI0KFp+da1m
         PDyAq7hb96T//b/Y+xZiam4PuVIZdrcz+xV5UUZCLMss5g9gXJbI7xrrKliU+uwhuGT6
         2B437UdC68GYUdA60UHvJzp0QdE1KhgzasgBcnSYE/7gVglJTWzxI54YeWWX0Ds1RFpi
         Dzxi5ZDv4Ge/+/kQHzM12NOmOOavIrVQHuN41TEUQPq4AX7g3qZvPs7saiB4U0egbfwF
         uyAg==
X-Gm-Message-State: AOJu0YxfvFEb80ebEnLp/NCDm2hcMcvCtYklbPyxliSTPAHjxvR+mqzl
	9okWduOksE01pmgRzLYogPNjYrUhImmsCAItSeH26Q==
X-Google-Smtp-Source: AGHT+IH6kSTyN/uSnqdIlgzf5lG+Dfp4JV8XqbpNFHyUam9HN1gSjiiGpNBk+IykQOWB11yd1ldOxw==
X-Received: by 2002:a2e:a9a2:0:b0:2bf:e5dc:aa68 with SMTP id x34-20020a2ea9a2000000b002bfe5dcaa68mr26713821ljq.3.1699354559989;
        Tue, 07 Nov 2023 02:55:59 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:55:59 -0800 (PST)
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
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v3 00/20] riscv: report more ISA extensions through hwprobe
Date: Tue,  7 Nov 2023 11:55:36 +0100
Message-ID: <20231107105556.517187-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to be able to gather more information about the supported ISA
extensions from userspace using the hwprobe syscall, add more ISA extensions
report. This series adds the following ISA extensions parsing support:

- Zfh[min]
- Zvfh[min]
- Zihintntl
- Zbc
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
- Zfa
- Zbkb
- Zbkc
- Zbkx
- Zknd
- Zkne
- Zknh
- Zkr
- Zksed
- Zksh
- Zkt

Some of these extensions are actually shorthands for other "sub"
extensions. This series includes a patch from Conor/Evan that adds a way
to specify such "bundled" extensions. When exposing these bundled
extensions to userspace through hwprobe, only the "sub" extensions are
exposed.

In order to test it, one can use qemu and the small hwprobe utility
provided[1]. Run qemu by specifying additional ISA extensions, for
instance:

$ qemu-system-riscv64 -cpu rv64,v=true,zk=true,zvksh=true,zvkned=true
  <whatever options you want>

Then, run hwprobe:

$ ./hwprobe
Base system ISA:
 - IMA_FD
 - C
 - V
Supported extensions:
 - Zba
 - Zbb
 - Zbs
 - Zbc
 - Zbkb
 - Zbkc
 - Zbkx
 - Zknd
 - Zkne
 - Zknh
 - Zkt
 - Zvkned
 - Zvksh
 - Zihintntl
 - Zfa

Link: https://github.com/clementleger/hwprobe_dump [1]

---

Changes in V3:
 - Rebased on top of origin/master
 - Rename bundle_ext to subset_ext since it is used for superset
   extensions (Zvbb for instance).
 - Add an invalid id for pure lasso extension
 - Fix wrong type for check_isa ext, int -> unsigned int
 - Use bundled extension for ZVBB/ZVNHB
 - Split ZBC hwprobe support from scalar crypto patch
 - Fix typos (Evan)
 - Added a few Rb: from Evan
 - Change Zfh/Zfhmin to Zfh[min] to be more coherent with other commits
 - Reword comment about CHECK_ISA_EXT to be more clear

Changes in V2:
 - Fix typo in first commit title (fatorize->factorize)
 - Add Zfa support
 - Fix missing uppercase for Zvkt naming in dt-bindings
 - Add Conor Acked-by on dt-bindings commits
 - Add scalar crypto support from Conor/Evan.
 - Use reporting of bunbled extensions for vector crypto

Clément Léger (19):
  riscv: hwprobe: factorize hwprobe ISA extension reporting
  riscv: hwprobe: export missing Zbc ISA extension
  riscv: hwprobe: add support for scalar crypto ISA extensions
  dt-bindings: riscv: add scalar crypto ISA extensions description
  riscv: add ISA extension parsing for vector crypto
  riscv: hwprobe: export vector crypto ISA extensions
  dt-bindings: riscv: add vector crypto ISA extensions description
  riscv: add ISA extension parsing for Zfh/Zfh[min]
  riscv: hwprobe: export Zfh[min] ISA extensions
  dt-bindings: riscv: add Zfh[min] ISA extensions description
  riscv: add ISA extension parsing for Zihintntl
  riscv: hwprobe: export Zhintntl ISA extension
  dt-bindings: riscv: add Zihintntl ISA extension description
  riscv: add ISA extension parsing for Zvfh[min]
  riscv: hwprobe: export Zvfh[min] ISA extensions
  dt-bindings: riscv: add Zvfh[min] ISA extension description
  riscv: add ISA extension parsing for Zfa
  riscv: hwprobe: export Zfa ISA extension
  dt-bindings: riscv: add Zfa ISA extension description

Evan Green (1):
  riscv: add ISA extension parsing for scalar crypto

 Documentation/arch/riscv/hwprobe.rst          |  81 +++++++
 .../devicetree/bindings/riscv/extensions.yaml | 210 ++++++++++++++++++
 arch/riscv/include/asm/hwcap.h                |  36 ++-
 arch/riscv/include/uapi/asm/hwprobe.h         |  26 +++
 arch/riscv/kernel/cpufeature.c                | 189 ++++++++++++++--
 arch/riscv/kernel/sys_riscv.c                 |  64 ++++--
 6 files changed, 566 insertions(+), 40 deletions(-)

-- 
2.42.0

