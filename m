Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC5C189918
	for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 07:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722410653; cv=none; b=fVPtNcHdSDfZwQBGg4jw9qnG2cVReRj8vDzWOjyB1JUkG6J+XRxSqag6tx/Jk/0fhIA6T/vjy8F8iJAcIoEajSSrZL9FJpF776WCO/rzHwzz1RMQ76PXOQs9e6rsqJ2D5YLp+PeQyW+fBga5ZAJQZay91enQuhcpyEdKjP7L5S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722410653; c=relaxed/simple;
	bh=qFIA7MQ6Y/pej4TDx5fmgdlHGqXrkV8G9+sAeDh6+E8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cYphkHAzT4Sq1BoL9AlLtPyXjJVdyOx70bZAkzzsxtRKfovamU0nxxn33NstCgCZbEtBr2hMNvXPNTgxVmXVwdwB8PsogJ1PqYu2dk3F7uxTu00Mvb1AK1oYfU11DDRbufYmO6mWPH7MESrh9Xmm2nTDw9s83wi7INp0kA4SxdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=w5pZtxi8; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="w5pZtxi8"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f0dfdc9e16so66866131fa.2
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 00:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722410648; x=1723015448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4XEkcH/k055fjEkxInfrnU37BtyQRrpfdUKb2KmHLI0=;
        b=w5pZtxi8BGcSbgC9Gfq2UQ+hvdadD2WcTGKto0qjbJcfYMQOoZFS/E72JJCBNiS6+m
         +eEYKT6nAlpZlFuf7nijMJQyRNcGaK+4vlzBogJBdC4rHp1hpv/07tYQlLbdYe51npuS
         MCTKco5z1GuT9rhRG5cLwg4CqcfA8VieNWcFdOQ04iolib7uqmd6piSPvsxW3nsIWnJ7
         FPY0RoxfE4e8iZgrq+Psk9VQGzbEhIhOeZtsP6FIcZ/JHzD7OJzUW3XX0+gvH7sD+bjh
         XBrq61wRM/UuNSPQEmmVKK8Tgf2p5RcLocAXGUvNF/eafGgVmb5Ki0hTcFouMLchWhRZ
         PWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722410648; x=1723015448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XEkcH/k055fjEkxInfrnU37BtyQRrpfdUKb2KmHLI0=;
        b=vcvIUd0f+Zgp0uuAt/Agm1jjkdTE7OUYCaDlr1/UKXeK73+YlZiwavWM15gYgxnf66
         5JOzTCYh5DOrvhWDjXoXAc1NR34TvLyJF+lqV+2XB1yNf4Tx2sxxLhmKKgCCW9l9bMaj
         Of8LPAj5henwkJf8Jlh72ehAZaC+osiI/OU2OtuxdzY/OmSJseAAIHoagPRs69zKOyrJ
         H++2sHg2uoOgRGvUfQC1RvPmAV0wZigbAa+/0+NGEVJknZxLZbkcMHjwna+QugUruEpn
         L5Budg+NZIL9yINIXgXkeBlJ5fpLFUAMJuI+9fM6j7qGZMrF8YQvPZTB6LHJvq4hsNxr
         DqMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKpqup3G0m3NhThOPI0ISSNqco/VU2mTr6Ze0dpXtbhYRFFYcqfbviQJvr38APUCWELM5i2GV8at+DB0C5ptZdYrOiue+BE2sO
X-Gm-Message-State: AOJu0Yz9tzby7Vt4/NrdO+L6/q8tzwplbTKzZ37/oSliUB4wJZeV5zyx
	mXkqDpBDBbOUd4Uq6xBMA31n5kmEaUc4Ua4+f9nEQnVuczrV51JvJkdp9l8k3KQ=
X-Google-Smtp-Source: AGHT+IFUu/TAKJpoCZRx6pt/JYQm0PBZfuQkxnnENTxesjAVIWWsosjIBVLI4RqCcJMR34ar/hYuOw==
X-Received: by 2002:a2e:9d87:0:b0:2f0:1bb6:dbce with SMTP id 38308e7fff4ca-2f12ee5af77mr90747341fa.41.1722410647587;
        Wed, 31 Jul 2024 00:24:07 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bac614esm10131295e9.24.2024.07.31.00.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:24:07 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 00/13] Zacas/Zabha support and qspinlocks
Date: Wed, 31 Jul 2024 09:23:52 +0200
Message-Id: <20240731072405.197046-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This implements [cmp]xchgXX() macros using Zacas and Zabha extensions
and finally uses those newly introduced macros to add support for
qspinlocks: note that this implementation of qspinlocks satisfies the
forward progress guarantee.

It also uses Ziccrse to provide the qspinlock implementation.

Thanks to Guo and Leonardo for their work!

v3: https://lore.kernel.org/linux-riscv/20240717061957.140712-1-alexghiti@rivosinc.com/
v2: https://lore.kernel.org/linux-riscv/20240626130347.520750-1-alexghiti@rivosinc.com/
v1: https://lore.kernel.org/linux-riscv/20240528151052.313031-1-alexghiti@rivosinc.com/

Changes in v4:
- rename sc_sfx into sc_cas_sfx in _arch_cmpxchg (Drew)
- cmpxchg() depends on 64BIT (Drew)
- rename xX register into tX (Drew)
- cas operations require the old value in rd, make this assignment more explicit
  as it seems to confuse people (Drew, Andrea)
- Fix ticket/queued configs build errors (Andrea)
- riscv_spinlock_init() is only needed for combo spinlocks but implement it
  anyway to inform of the type of spinlocks used (Andrea)
- Add RB from Guo
- Add NONPORTABLE to RISCV_QUEUED_SPINLOCKS (Samuel)
- Add a link to Guo's qspinlocks results on the sophgo platform
- Reorder ZICCRSE (Samuel)
- Use riscv_has_extention_unlikely() instead of direct asm goto, which is way
  cleaner and fixes the llvm 16 bug
- add dependency on RISCV_ALTERNATIVES in kconfig
- Rebase on top of 6.11, add patches to fix header circular dependency and
  to fix build_bug()

Changes in v3:
- Fix patch 4 to restrict the optimization to fully ordered AMO (Andrea)
- Move RISCV_ISA_EXT_ZABHA definition to patch 4 (Andrea)
- !Zacas at build time => no CAS from Zabha too (Andrea)
- drop patch 7 "riscv: Improve amoswap.X use in xchg()" (Andrea)
- Switch lr/sc and cas order (Guo)
- Combo spinlocks do not depend on Zabha
- Add a Kconfig for ticket/queued/combo (Guo)
- Use Ziccrse (Guo)

Changes in v2:
- Add patch for Zabha dtbinding (Conor)
- Fix cmpxchg128() build warnings missed in v1
- Make arch_cmpxchg128() fully ordered
- Improve Kconfig help texts for both extensions (Conor)
- Fix Makefile dependencies by requiring TOOLCHAIN_HAS_XXX (Nathan)
- Fix compilation errors when the toolchain does not support the
  extensions (Nathan)
- Fix C23 warnings about label at the end of coumpound statements (Nathan)
- Fix Zabha and !Zacas configurations (Andrea)
- Add COMBO spinlocks (Guo)
- Improve amocas fully ordered operations by using .aqrl semantics and
  removing the fence rw, rw (Andrea)
- Rebase on top "riscv: Fix fully ordered LR/SC xchg[8|16]() implementations"
- Add ARCH_WEAK_RELEASE_ACQUIRE (Andrea)
- Remove the extension version in march for LLVM since it is only required
  for experimental extensions (Nathan)
- Fix cmpxchg128() implementation by adding both registers of a pair
  in the list of input/output operands

Alexandre Ghiti (11):
  riscv: Move cpufeature.h macros into their own header
  riscv: Do not fail to build on byte/halfword operations with Zawrs
  riscv: Implement cmpxchg32/64() using Zacas
  dt-bindings: riscv: Add Zabha ISA extension description
  riscv: Implement cmpxchg8/16() using Zabha
  riscv: Improve zacas fully-ordered cmpxchg()
  riscv: Implement arch_cmpxchg128() using Zacas
  riscv: Implement xchg8/16() using Zabha
  riscv: Add ISA extension parsing for Ziccrse
  dt-bindings: riscv: Add Ziccrse ISA extension description
  riscv: Add qspinlock support

Guo Ren (2):
  asm-generic: ticket-lock: Reuse arch_spinlock_t of qspinlock
  asm-generic: ticket-lock: Add separate ticket-lock.h

 .../devicetree/bindings/riscv/extensions.yaml |  12 +
 .../locking/queued-spinlocks/arch-support.txt |   2 +-
 arch/riscv/Kconfig                            |  64 +++++
 arch/riscv/Makefile                           |   6 +
 arch/riscv/include/asm/Kbuild                 |   4 +-
 arch/riscv/include/asm/cmpxchg.h              | 264 ++++++++++++------
 arch/riscv/include/asm/cpufeature-macros.h    |  66 +++++
 arch/riscv/include/asm/cpufeature.h           |  56 +---
 arch/riscv/include/asm/hwcap.h                |   2 +
 arch/riscv/include/asm/spinlock.h             |  43 +++
 arch/riscv/kernel/cpufeature.c                |   2 +
 arch/riscv/kernel/setup.c                     |  38 +++
 include/asm-generic/qspinlock.h               |   2 +
 include/asm-generic/spinlock.h                |  87 +-----
 include/asm-generic/spinlock_types.h          |  12 +-
 include/asm-generic/ticket_spinlock.h         | 105 +++++++
 16 files changed, 533 insertions(+), 232 deletions(-)
 create mode 100644 arch/riscv/include/asm/cpufeature-macros.h
 create mode 100644 arch/riscv/include/asm/spinlock.h
 create mode 100644 include/asm-generic/ticket_spinlock.h

-- 
2.39.2

