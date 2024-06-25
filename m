Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF2C17559
	for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 00:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719276623; cv=none; b=BH6555s5VycMgCkjNsh9PnLpIXmnZ0wbHc4tInI8J8BYQyHNcL3sJL67yjzyFE9PR8AU+y8xKqJ2bTxtPaDst7xMwxy6W0yjZJvspfgGEGmcnEiQI+z7l1wp043EIWiY8gk43aHibFBtXND0y2w+kcPyAYzxcfYnCwT3h/ydbR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719276623; c=relaxed/simple;
	bh=xfavRhkPnZCS2POrDvsuNxPZ2zYbwjnwZ52u+3fooG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bFG3f1fk5OcsO8WDAuoDwPBvNIOMxvJkeWH/8UIeYgI5sN8IXj6mdUcxE8XAz3hlG+NprYTDduHg9d5ajA5ynTN20T5M7Eqw3i+gwxycnefzx6ZyTWmpN2MOr00NxrCD8ubAkF85qiqq/N4fqDjVqqznPx0ZTmiiJuQv8Wn1X5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=WKraHZPP; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="WKraHZPP"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f47f07acd3so40644265ad.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 17:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719276620; x=1719881420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nnSgK6fY+iLtRTDSAhrszcxAOUvzG0XuSCnjEWrisjQ=;
        b=WKraHZPPG+oSj9CXeLmi9tF45NEC1AX6yOW4PvX2n0K0IiJnOSmDYmVDRLxXKF23mr
         bkTGqSgeKa5QrqbI3a5BvQuuOvN5POduzJHrz+0oSPLrOlfJfkBc75QXqV1ywDT56W96
         1aS6wEaCPGmAdV+OQ9aeO09KrW3BTzFfuf7xOdYoNGAVcV6ZBcglnKiNanh7TN+6vGJI
         OszpTVNaTwa5qkH44nSTTPh4u7vzDUgmXbMhoh/3E5q6Mf+aGjOeNG/YfN/pOYzRWCPf
         t6TrZg4s+j686bPEEfKk63bXc0CH3m0qy4mygA8/CttvLXul0Y9TNnLXhfW4AJsPxFG2
         pS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719276620; x=1719881420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnSgK6fY+iLtRTDSAhrszcxAOUvzG0XuSCnjEWrisjQ=;
        b=fogFWxBUt4OMBhRnZjX/lSz0hnUaqLQ7m56Qq12aKUeMx+uK/d0U2MewIQYk9pVWZS
         xLr2ThF8n09RoBuKizwzXmyKslm/5sxPLlSonIr2R3GoDkE2XuhuvlvM0AdY8E+uztT9
         CcuzGqZHXBDJeqsMgycYVNgF2vIe7Xa7bN3JiM21gQL0rqqbXfgPIFNu2qrSFU0ENMh7
         u2BmwxQaheWtjoa8/qx9rNikny6mJJwrgm0Yi2USfxNx7E8i76g2osxyfk3UObBWdbVw
         Hk6J1HAWhaRCVf+dKrbquWtgA5taBJXRwS6ap4GDEJ8ani798ypr4H5PZ50dA0qTzn9s
         HSag==
X-Forwarded-Encrypted: i=1; AJvYcCVCqjDcyF6uIn9Msx00lqTRNFDuu5iz6rZY7wHhxTHRIczolsCo3V1qeIiA1EI6EPlz+Br6p8zE2Ak9Kis7oyW+g2x9WI+PxVa+
X-Gm-Message-State: AOJu0Ywl47B+ERhkKuHFg3cVPg2zSU9AcRqjB1rRNpy25XGFwxGZjlPA
	/gpj5AGc81Hbpmgro9fDS9EMGW0xSru2sLQVoNkKUfIKlrRP7Su1wd2uqCAwpFU=
X-Google-Smtp-Source: AGHT+IHApu4tSWv9QAY/GKACS90i6vXuL/EeTsIFIOOg7FuFkA0Ybzt8e0yLcPcwfLJUGW/EmQK7pQ==
X-Received: by 2002:a17:902:dac7:b0:1f8:6bae:28f with SMTP id d9443c01a7336-1fa1d3e00bdmr81145035ad.9.1719276619768;
        Mon, 24 Jun 2024 17:50:19 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbb2a7csm68150235ad.256.2024.06.24.17.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 17:50:19 -0700 (PDT)
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
Subject: [PATCH v3 0/8] RISC-V: Detect and report speed of unaligned vector accesses
Date: Mon, 24 Jun 2024 20:49:53 -0400
Message-ID: <20240625005001.37901-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
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

Jesse Taube (8):
  RISC-V: Add Zicclsm to cpufeature and hwprobe
  dt-bindings: riscv: Add Zicclsm ISA extension description.
  RISC-V: Check scalar unaligned access on all CPUs
  RISC-V: Check Zicclsm to set unaligned access speed
  RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
  RISC-V: Detect unaligned vector accesses supported
  RISC-V: Report vector unaligned access speed hwprobe
  RISC-V: hwprobe: Document unaligned vector perf key

 Documentation/arch/riscv/hwprobe.rst          |  19 +++
 .../devicetree/bindings/riscv/extensions.yaml |   7 +
 arch/riscv/Kconfig                            |  57 ++++++-
 arch/riscv/include/asm/cpufeature.h           |   7 +-
 arch/riscv/include/asm/entry-common.h         |  11 --
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/hwprobe.h              |   2 +-
 arch/riscv/include/asm/vector.h               |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h         |   6 +
 arch/riscv/kernel/Makefile                    |   3 +-
 arch/riscv/kernel/copy-unaligned.h            |   5 +
 arch/riscv/kernel/cpufeature.c                |   1 +
 arch/riscv/kernel/fpu.S                       |   4 +-
 arch/riscv/kernel/sys_hwprobe.c               |  42 +++++
 arch/riscv/kernel/traps_misaligned.c          | 143 +++++++++++++---
 arch/riscv/kernel/unaligned_access_speed.c    | 159 +++++++++++++++++-
 arch/riscv/kernel/vec-copy-unaligned.S        |  58 +++++++
 arch/riscv/kernel/vector.c                    |   2 +-
 18 files changed, 480 insertions(+), 48 deletions(-)
 create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S

-- 
2.45.2

