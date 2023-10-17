Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780773D3AF
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 13:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="fm2c5JYn"
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69597F0
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:28 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2bbbe81185dso14807921fa.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548526; x=1698153326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JJAHN6fXys4+chbQTYaGErBWbio2Bi7IHGHKbLKG294=;
        b=fm2c5JYnDCSmEuaYK5enFPY3pn1ldB925uWsz71o4NkS+v2r4sjhk4IbHAogdSsBY6
         RwyZdluZ4lHzhuEvBztdZ5noKdOeyPotirA1FRG62YC/DTDlE9QxaX/hqrHIUM8LZl8o
         RmvSzbC4Z7MFx/j0t46gHe2ZSFhQDWLpS2eRpuhdknez8969ueAJkgLDf9HGj0RM0ckd
         prFerHVVPY0wQRJh91PbDWGazOWQpXJEdP0htjR0v5aaaKg5nVal55WebVr7TsjJYpyg
         YwfrSkoX8aGpIOvHo9SXtPsmiskdNm4hGzlyYuVxgkObAy/EzsiooOikcY4Pnqmyxaxg
         OnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548526; x=1698153326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJAHN6fXys4+chbQTYaGErBWbio2Bi7IHGHKbLKG294=;
        b=iTkn715IqsHjw6DVOZS4e/2U7IWa/T8useFQBjHGJl4cpbXC6MVJzpno+AFmEmruQp
         Q4fRirG+8KpxwYvFzmS2uLt2a0CZv73MFIyPsdpCsivbQHwZTXjslyigDKJZg1TXBca3
         X97q1k+D/ea905gnjngMyCB5BLMR75BSw42wphM3ZdBOajK7NBu4wUAXV8RavF5X9dGw
         4xdwiLX2co4COrtkVCQHRwFMapIT8fsNvXNRpr865pnawVO7Tz36EFrgmCQmKbxyV5ri
         /iAbxNXHn0A7/6C0urb3QQuOJV03X718B6w69G9cTeNZF2J7psC/WPalix0TEr66vB5t
         ZZ5w==
X-Gm-Message-State: AOJu0YxGK4p0mt+KwUluhXscc+vWpmbbyZVLLl7YrKZH3PDUhBo35DY1
	DDv4AKa85ej+N2hxneD2DtcX2w==
X-Google-Smtp-Source: AGHT+IFmJd0Jv9jaCEa9LrAcAAx0Uv4PFE1Q1v9qEK4kiLK109S5gB4b1spDwnBQbpEQP4T9Ww4c5g==
X-Received: by 2002:a05:651c:119b:b0:2c5:36e:31ef with SMTP id w27-20020a05651c119b00b002c5036e31efmr1527955ljo.5.1697548526439;
        Tue, 17 Oct 2023 06:15:26 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:25 -0700 (PDT)
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
Subject: [PATCH v2 00/19] riscv: report more ISA extensions through hwprobe
Date: Tue, 17 Oct 2023 15:14:37 +0200
Message-ID: <20231017131456.2053396-1-cleger@rivosinc.com>
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

Then, run hwprobe_dump:

$ ./hwprobe_dump
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

Changes in V2:
 - Fix typo in first commit title (fatorize->factorize)
 - Add Zfa support
 - Fix missing uppercase for Zvkt naming in dt-bindings
 - Add Conor Acked-by on dt-bindings commits
 - Add scalar crypto support from Conor/Evan.
 - Use reporting of bunbled extensions for vector crypto

Clément Léger (18):
  riscv: hwprobe: factorize hwprobe ISA extension reporting
  riscv: hwprobe: add support for scalar crypto ISA extensions
  dt-bindings: riscv: add scalar crypto ISA extensions description
  riscv: add ISA extension parsing for vector crypto extensions
  riscv: hwprobe: export vector crypto ISA extensions
  dt-bindings: riscv: add vector crypto ISA extensions description
  riscv: add ISA extension parsing for Zfh/Zfhmin
  riscv: hwprobe: export Zfh/Zfhmin ISA extensions
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

 .../devicetree/bindings/riscv/extensions.yaml | 210 ++++++++++++++++++
 Documentation/riscv/hwprobe.rst               |  81 +++++++
 arch/riscv/include/asm/hwcap.h                |  33 ++-
 arch/riscv/include/uapi/asm/hwprobe.h         |  26 +++
 arch/riscv/kernel/cpufeature.c                | 165 ++++++++++++--
 arch/riscv/kernel/sys_riscv.c                 |  64 ++++--
 6 files changed, 543 insertions(+), 36 deletions(-)

-- 
2.42.0

