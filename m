Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55A73BBFAD
	for <linux-doc@vger.kernel.org>; Sun, 30 Aug 2026 16:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788106345; cv=none; b=SCoOUUXdzSvmeLU/CIsCQ6t3CcIRkQKPfGw4XCDNDi0Pt7wlYSh8hUqHZ1FzOoe1RVOX4IIgiQQ/20ijhlzX65aaA7dE8j40kKY2jhH9oKBU937cvz3FPhiA0k2TWBFB6nDArOPTvZQ0MBd9rQ1I1tUi1xAAbD9Sxm2umVvwD20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788106345; c=relaxed/simple;
	bh=WGRxDjHlxjsHKcmgOxoFBp9g25CsZcUl9EK5P24iTbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nu8CCQkKmwqtnTPZZGoqFkhXCtkFqi8OazlhY0/MJwC2qcB1Fzz5vKirXDN6M/Pl2Uvj81GoheOcA9ahSfl2vY2Ah1StdTR0D6LjYQPTDE8YuEQo/cHP1OcaE6YN8voIvv6+0+tLcZP3ZP1dnjpWwaYLeymkpfisulnupuKPUQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYlpc4Pv; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYlpc4Pv"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1cbb64a1fso2526647a12.1
        for <linux-doc@vger.kernel.org>; Sun, 30 Aug 2026 09:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788106340; x=1788711140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v+ZZzE+7YChtFOdG6RvfuESoJaQ8tR6VAjdqUH+Gqes=;
        b=YYlpc4PvEX0LmQ17ONsiWjyrycnL/KF6tHV/pBdHNU2SpVywfCKNKt52HX+5W6NEJX
         IvTgGAmSkrC2Dgm8+fvLgJfQWvl/ovUzvNqt1qQ86gLFf4RhCUPF59wAOpeYx2Q6wae/
         UJh/Nm4IFDY/e4yfAbnrlTvCA7LK5/R7Exr0C/3tBVSyj33BCKnPmNDHOvbqWBJNoQMd
         SWF/DWDha22CaeAQiVpWYfwRZT8z4mt1mgTHtaKq6gB3J6NY6a5MyzE6a4bRVB3OOzV1
         PwjOxAh3UwehV3yY40T6tLYzFKx4gqP7nRH5ry2itlbkaAOPBkCxmfCMJKrLgLq1p2o3
         aX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788106340; x=1788711140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+ZZzE+7YChtFOdG6RvfuESoJaQ8tR6VAjdqUH+Gqes=;
        b=JuA3lq6LAiKVAOaxO3e9edT3HVn8gulHsw3DyIa6NaVpaHEoXXt8NArQ3l3GloKoSz
         eEpsZmxgK8CDkXaQ3nzqfFq8G3TrMc21f3py9mnhneWGcPbtJb4QY3Vi+3d32ZpYKscz
         kSU4xffm1P9HixEc6V2qcKHZNQKGibUPOYpUjOFHH9Cuuf3YNqJXFuMGgni4UDwFuwUC
         nBOpHSXkSFGlIjiOy1/ZdU0yZzv63S52yr9Cy62RGfWaQxjmkT2oIyIcx5se0cI+fmwq
         ga+7RuZefY28yLOGRyHJEzHBE6bXllw5cmmxa+8W8uvNS1V2vZ7tUbF2tZsC+UkH5hFr
         RNBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqn0PZOFYJjsZicwF2FMvABRYNVedDi+0Y98RjwB6xgUJHwtOYMyW/cKYCEVagGSDVu0UWKYzVpmHE=@vger.kernel.org
X-Gm-Message-State: AFuF++k5hzxo06Bw4ryupSWXJrbmU2U1W8vSO7LYcqB4TuduDVn7GYev
	T6hrVfkAzrwLEvNdiNsJizUYU1u29OwbfXSHqT5o4rL25CuLUpATjiqq
X-Gm-Gg: AR+sD11F33er10ahxgmtXCwpC3DBiP7pm3QlQHFJfCG3UW3P30s5rX1at+WGaAWKobo
	q0xDgFhn/o4xELYyrjWDBgQwDrSI/dMVRVcq1sFOii66TtIQB9Ze0lc/XaCra3gFBpwXAXy7HIJ
	yU5vaxHQvVsxmm2SoAJSVocQDgkKTvIi1UQLKdZa39HuFWrpkqFRsqx8e5Dlo6JJ2cyeXjYsLaQ
	cK5DYn+pvQ8B9VFPBuTYndaZmF2VKkx8fAtwxATf7mDz3g23TxlF/LnVNz+Ce93fmZRzikeuDaF
	1i5Qq1HWfad0bvoKD3GVas6uT675yUbs4HQHF6nEAo74y2XYvH69NYml1CgjmHexagICG8nOgPk
	E0picen/YqbPC7FgUc1UGq/5aOxxpP+whg8c0g2IXSeYdItDBPMVDELVwO9997ohgzHCF0AaZQu
	85MIMg7dIdL8dl/Z8yojqpAR9RFuaFxf2DoBjPiSJdSrowSylNi2QXucteUyaZwdOUkfeSEPKtj
	u23e7vQT437zJza6mwbcl2rLR3upmiCbYs=
X-Received: by 2002:a05:6a20:c998:b0:3cd:9bb1:c6f5 with SMTP id adf61e73a8af0-3d267a6b464mr35141406637.10.1788106340361;
        Sun, 30 Aug 2026 09:12:20 -0700 (PDT)
Received: from localhost.localdomain ([134.195.101.83])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm5719005eec.1.2026.08.30.09.12.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 09:12:19 -0700 (PDT)
From: Yu Jin <lambda.jinyu@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yu Jin <lambda.jinyu@gmail.com>
Subject: [RFC PATCH 0/2] riscv: document the Sv32 virtual memory layout
Date: Mon, 31 Aug 2026 00:12:03 +0800
Message-ID: <20260830161205.80162-1-lambda.jinyu@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RISC-V virtual memory layout documentation describes the 64-bit
paging modes but has left the Sv32 section as a TODO. The layout is
already defined by the RV32 page-table macros and can be observed in the
boot-time layout printed with CONFIG_DEBUG_VM.

RV32 remains relevant to current hardware rather than only legacy
systems. For example, Espressif announced the ESP32-S31 in March 2026 as
a dual-core 32-bit RISC-V microcontroller with MMU support.

This series documents the existing rv32_defconfig layout and corrects a
nearby comment that gives a stale fixed value for RV32 TASK_SIZE. The
implementation is unchanged.

The main point on which I would appreciate feedback is whether this is
the clearest way to present the configuration-dependent part of the
layout. This is my first Linux kernel contribution, so I would also
appreciate guidance on any process or presentation issues.

Tested on QEMU with a kernel based on commit 08dbfad3f504:

  - rv32_defconfig plus CONFIG_DEBUG_VM=y
  - full RV32 kernel and modules build with GCC 13.3.0
  - boot with qemu-system-riscv32 8.2.2 and 512 MB or 4 GB RAM
  - userspace reached using a minimal initramfs
  - runtime layout matched the documented addresses
  - the 4 GB boot exposed 1 GB of managed RAM, matching the current
    direct-map and no-highmem limitations
  - make SPHINXDIRS=arch/riscv htmldocs
  - scripts/checkpatch.pl --strict, no errors or warnings per patch

The boot-time layout was:

  fixmap  : 0x9c800000 - 0x9d000000
  pci io  : 0x9d000000 - 0x9e000000
  vmemmap : 0x9e000000 - 0xa0000000
  vmalloc : 0xa0000000 - 0xc0000000
  lowmem  : 0xc0000000 - 0xdfc00000

Yu Jin (2):
  docs: riscv: document the Sv32 virtual memory layout
  riscv: mm: correct the stale RV32 TASK_SIZE comment

 Documentation/arch/riscv/vm-layout.rst | 28 +++++++++++++++++++++++++-
 arch/riscv/include/asm/pgtable.h       |  6 ++----
 2 files changed, 29 insertions(+), 5 deletions(-)


base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.43.0

