Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8182A481CE
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 18:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721846177; cv=none; b=MHk5x+xvGrrawgi3Z01CQVSK3M9L4VqQV/EPNogVJj+0GKfKTLqD4yFWt1rVpqrN9uEHoypc0CVP6Iur5eYfI81ocIEW9E03MjbH86B6jQZ1GnhnjTebcyJEIRuUhlIHlmRFpWHS0OtSXVHxQ58PdcBlRq3jkAJhCWYO7dc0vuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721846177; c=relaxed/simple;
	bh=gDtY5C6xVC5PsL6KJ4ty39GAhxQ2UvVyUxqwsakJsSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W9dSIzEaih6hN5+hQe9JIMrwvJ9MeGZk8H1jsl26BOfDNZPvPZUr/BeWGqvPlzPzx2i37SVV7BNiwmJHQkHTl/e3tkO8EVVn49eTVUX6+OrND0qPFymLNfADUFWh1xhF0J2mBpmFaP505oxkl8/0ljHClNgnMHGHvu3y3NTDVgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ZPb1LWaX; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ZPb1LWaX"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2cf213128a1so89077a91.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 11:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721846174; x=1722450974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sm/wAJveVBv0q7tk/dMFAOUxjubw/u5BATqZaSVqdOk=;
        b=ZPb1LWaXlurk4laMl5cPcxh+byrHms4SaWKQtnEzt1sz4O7hOFWmdk/N9aM6RqADqu
         kD81exdLdsRwqLII6m6wCtxN70l8hXYLiTPi9weP7scoZ8iHnYFOXD+c56oPz3JDaVRx
         kGCVZWlmlsxirobkh++CImpdyydRKWHd2seaW9EaX6jjvT3BlnxxQilYOmdvCYDyDz52
         MB1oWZ7Y1POpFZUZy3rDn8O8Gh7FJDdCFe9eRnvd4RaVxRnfGeK4N6GB2t+xMy9RbzNs
         /D9sBBVHuCzKYP1YtPGLxSvSFx1WNpkcSc12csJ8dLVs03rsOXcE7D+vKIFGDYqZuRnE
         hxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721846174; x=1722450974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sm/wAJveVBv0q7tk/dMFAOUxjubw/u5BATqZaSVqdOk=;
        b=d2Sni7xA1xjJsvzzTnlVSQjytP1V7gcqIaMJdPAqwIM8vKxObEzWf4NYvpCLDBWrc3
         iSRjcdRGI5833QRgKBdS291BoH2kdmYb0nqHn4YK5244PpjglZrCdgybPj7LUXlvzchf
         0dHtmTz8U+a9e0VnfS1iCdc/3DFgoWDg2XLdhsA7TDuGstDu03YQ5SDhzFRB4jaoPCpB
         YfsxrdDR4POvWkfHondBMXf5pPORUmuFcgw3SyWGg05vwxOKO63pjuL+1JIf8XRP0zIt
         9TTZC34b4tyNLCSW67/zefRXYPtLlwZiJGK6zov7z+GSckCOyu6Hgdl6OzfUgLMB0Xvf
         +Msg==
X-Forwarded-Encrypted: i=1; AJvYcCWvjPtDF0nOoTtsrqnkz+Uob7MRUWXut3i5Zg1Rhof9/HrludFrqmvklWR23LKFsp6z2TVI9pD1nAcADkLkkOQkkR2kB5a4WqHH
X-Gm-Message-State: AOJu0Yzh+K0EQTvJpOAO3cZpacmXUp1YFT66xpdI5fbKJeQPl/0hpPo8
	dbQrj4BD4URuE2MTkdoBR3qOS3N93bMn3vWbcx3rX6tEQFzxkh/3wtmvssLb5OI=
X-Google-Smtp-Source: AGHT+IH3zF5NChQtBzQf3AtZCLeYvOcpbH4+G0JFh9sfOmScH/VpntNYEqKMklwYdqLHBNmrtYSRgA==
X-Received: by 2002:a17:90b:281:b0:2cb:4c25:f941 with SMTP id 98e67ed59e1d1-2cf23865f3amr447525a91.17.1721846173689;
        Wed, 24 Jul 2024 11:36:13 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73a189esm1997830a91.2.2024.07.24.11.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 11:36:12 -0700 (PDT)
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
Subject: [PATCH v6 0/8] RISC-V: Detect and report speed of unaligned vector accesses
Date: Wed, 24 Jul 2024 14:35:57 -0400
Message-ID: <20240724183605.4038597-1-jesse@rivosinc.com>
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

The Zicclsm is patches are no longer related to this set.

Changes in v6:
 Added ("RISC-V: Scalar unaligned access emulated on hotplug CPUs")

Jesse Taube (8):
  RISC-V: Add Zicclsm to cpufeature and hwprobe
  dt-bindings: riscv: Add Zicclsm ISA extension description.
  RISC-V: Check scalar unaligned access on all CPUs
  RISC-V: Scalar unaligned access emulated on hotplug CPUs
  RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
  RISC-V: Detect unaligned vector accesses supported
  RISC-V: Report vector unaligned access speed hwprobe
  RISC-V: hwprobe: Document unaligned vector perf key

 Documentation/arch/riscv/hwprobe.rst          |  21 +++
 .../devicetree/bindings/riscv/extensions.yaml |   7 +
 arch/riscv/Kconfig                            |  57 ++++++-
 arch/riscv/include/asm/cpufeature.h           |  10 +-
 arch/riscv/include/asm/entry-common.h         |  11 --
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/hwprobe.h              |   2 +-
 arch/riscv/include/asm/vector.h               |   2 +
 arch/riscv/include/uapi/asm/hwprobe.h         |   6 +
 arch/riscv/kernel/Makefile                    |   3 +-
 arch/riscv/kernel/copy-unaligned.h            |   5 +
 arch/riscv/kernel/cpufeature.c                |   1 +
 arch/riscv/kernel/fpu.S                       |   4 +-
 arch/riscv/kernel/sys_hwprobe.c               |  42 +++++
 arch/riscv/kernel/traps_misaligned.c          | 134 +++++++++++++--
 arch/riscv/kernel/unaligned_access_speed.c    | 156 +++++++++++++++++-
 arch/riscv/kernel/vec-copy-unaligned.S        |  58 +++++++
 arch/riscv/kernel/vector.c                    |   2 +-
 18 files changed, 484 insertions(+), 38 deletions(-)
 create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S

-- 
2.45.2

