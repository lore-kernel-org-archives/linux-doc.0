Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1389612FF9C
	for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 19:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718306197; cv=none; b=ipBbByLHBkSzzgkPe8/jdfLerkjDfpJjE7vBnndsHlcxSAUufPj1x7bok/8xXe8STiEkTI1yqW9qj97jjux6aIoFWsKQYDZ6pgMX7Fe5KQTeru1OgJ/RXrJ2owj1Mx8HLxfHbBGZqBHJLkdptXklCtjTnBWm2GGpZaDjSYGJLkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718306197; c=relaxed/simple;
	bh=xwz2gGVasPLG4WICRlhAaUV6zxKEkVvjxfn+L/yOsK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CIxNRxfwdXtI0UIM8T+9nPEV8/KixqUWhF1HHV71XwKQ5fkPjzKsJgvVdWJkqZZs1qrT/6PbrdRwQU6WdokEmurxx8A/+rx0MmKmzYX3kQNLnSA6ZwSsq6unQwqAN8BvWgvgDEhhf+JFoMrKgs+YuUxrlmwNcGgYIF6dLBZ8EN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=NCFslb8p; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="NCFslb8p"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f44b45d6abso11474795ad.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 12:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718306195; x=1718910995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hpOwinj0W1yetvQNtkELpr5Kiud2ruzeFCMoj01VdbY=;
        b=NCFslb8pBIwyyil2TGL5uUyQi3bwW3CfWqDmgEpcXozuF5NHnSAZLFDm7gOSY3yGhR
         VZeyg5FgRmFzK36fWdCinVqVftCeaDx3sPxSp0qMZrfCd+IIKdLZjpP6ig6igmNimKIG
         SzZ13IxlTAKAfTvspd/xAfe0GGedWsRNcG8W5DTH1VJ2TztylOTfVOp8hCFC/w8o112a
         PHKjQUzOVH5YranCPXjRcuv9MKTzSxXU3OhPlfNsgSXBh1Clei2uLnDgFwBhrds9bKTW
         T3TMOotDrNHH7Q1SqSfCzufuZ6lJb+EiLnawL/VMi3v6alVUwwM2z7hgNIOruqAOIOLK
         01sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718306195; x=1718910995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpOwinj0W1yetvQNtkELpr5Kiud2ruzeFCMoj01VdbY=;
        b=GUeKPeyDpM4DWB3KzxO+I2/D5HNlKSqurMc3ZD3rsre4DI8rwLIJXpM9ZbdDZk+lWA
         mV89mLsmSTm9onZtTQKqN8bPE7eYiPyVpPneddQqa0CztkLuHOJ7qhurKfdZ4adghG51
         GSPrvAW0y1ZV5YbphC9matnMcmcZz3AStxpFyYrcBJJOQhb9FS+EOCHdd+XQ+66dkVdb
         xOG1pHPfoAZSQwVRONuwT4ZoJj90Y27qess/WNK7peJTVIVIVfcbKy9XMLqEtz2sIP14
         1Ju3aNjxgjNGpAdoJhKUeVZ5efx0s6DolkXNyuPYQp0ziboatMz9L2Xqiki+XHPN7Ted
         9qtA==
X-Forwarded-Encrypted: i=1; AJvYcCUs18s3tbBbjylo8YwCYf0gPIe/UDZyxUbqwQ90MFPN82OT3YYzprNdw3a/PQ/6mH5xOdDPwO++15uHzyGMxSl3J7BgzKRzFVZU
X-Gm-Message-State: AOJu0YzsoQbwQ1aqEmsrcP8LlgoQtInplQwpEed//85PZCnaYH3JBPdw
	sSMG4YE8H2gbiBTbbbwwuoHpLEXhNUXCgyDZj3hhRha1uuvUf5gCRY3wXMjL448=
X-Google-Smtp-Source: AGHT+IHHy8Y/gbuqVUoKIBAHl3Kik8dEPGS63zG9zTuBzI8FXFYH9pTlmfj7DD0pHAJEd7bxMGtqFw==
X-Received: by 2002:a17:903:1249:b0:1f7:393c:fcdf with SMTP id d9443c01a7336-1f8625c0537mr7044225ad.6.1718306195179;
        Thu, 13 Jun 2024 12:16:35 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e7ca78sm17471015ad.106.2024.06.13.12.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 12:16:34 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/6] RISC-V: Detect and report speed of unaligned vector accesses
Date: Thu, 13 Jun 2024 15:16:09 -0400
Message-ID: <20240613191616.2101821-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for detecting and reporting the speed of unaligned vector
accesses on RISC-V CPUs. Adds vec_misaligned_speed key to the hwprobe
adds Zicclsm to cpufeature and fixes the check for scalar unaligned
emulated all CPUs. The vec_misaligned_speed key keeps the same format
as the scalar unaligned access speed key.

This set does not emulate unaligned vector accesses on CPUs that do not
support them. Only reports if userspace can run them and speed of
unaligned vector accesses if supported.

If Zicclsm is present, the kernel will set both scalar and vector unaligned access speed to FAST.

This patch requires the following patche to be applied first:
RISC-V: fix vector insn load/store width mask
https://lore.kernel.org/all/20240606182800.415831-1-jesse@rivosinc.com/

Jesse Taube (6):
  RISC-V: Add Zicclsm to cpufeature and hwprobe
  dt-bindings: riscv: Add Zicclsm ISA extension description.
  RISC-V: Check scalar unaligned access on all CPUs
  RISC-V: Detect unaligned vector accesses supported.
  RISC-V: Report vector unaligned access speed hwprobe
  RISC-V: hwprobe: Document unaligned vector perf key

 Documentation/arch/riscv/hwprobe.rst          |  19 +++
 .../devicetree/bindings/riscv/extensions.yaml |   7 +
 arch/riscv/Kconfig                            |  59 +++++++
 arch/riscv/include/asm/cpufeature.h           |   7 +-
 arch/riscv/include/asm/entry-common.h         |  11 --
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/hwprobe.h              |   2 +-
 arch/riscv/include/asm/vector.h               |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h         |   6 +
 arch/riscv/kernel/Makefile                    |   7 +-
 arch/riscv/kernel/copy-unaligned.h            |   5 +
 arch/riscv/kernel/cpufeature.c                |   1 +
 arch/riscv/kernel/sys_hwprobe.c               |  48 ++++++
 arch/riscv/kernel/traps_misaligned.c          | 142 +++++++++++++---
 arch/riscv/kernel/unaligned_access_speed.c    | 154 +++++++++++++++++-
 arch/riscv/kernel/vec-copy-unaligned.S        |  58 +++++++
 arch/riscv/kernel/vector.c                    |   2 +-
 17 files changed, 484 insertions(+), 46 deletions(-)
 create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S

-- 
2.43.0

