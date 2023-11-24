Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vrull.eu header.i=@vrull.eu header.b="lcVns6H2"
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E5810DD
	for <linux-doc@vger.kernel.org>; Thu, 23 Nov 2023 23:22:26 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50aa8c0af41so2734694e87.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Nov 2023 23:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1700810545; x=1701415345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A+QJwQ2ibzfm4ZH4G7RxTWHsFFrHVq+i8PDqnY0Hrac=;
        b=lcVns6H2pfJSYqMv5D93CbOOs4B6CgPrNkEk8ZrKWnoYUSDz9+vDaIJovSPYEUy6az
         k/pRaPPFrXQHjcKzMKOz85YmkiALrblpw0xMgXACObsv9J+hbYEY9XKCuhrLOLvwHnVq
         MGLVNFbk2XYTmR3PdC2fzn1BIdZyP6Ggg7/Wpyz8C9VvK4JjLnaAPK/V/HodrWwhrpbe
         Gr3/3wdh+FXnsQjeWrGYzpnQIL30YeldnXyKeaPeMTFGKgDhTX1IX94/ldFpBWVSYuoP
         wsHYs4x7+rnVAt3YLlhqxeWPqh69ZKNytUEiIep7mWpuGSpGmwmfqqOEEUZSTthaIWPG
         cMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700810545; x=1701415345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+QJwQ2ibzfm4ZH4G7RxTWHsFFrHVq+i8PDqnY0Hrac=;
        b=qDFKsIDdmmPW64IleyHI8DacI1sPBrXJccLNCGpOaQowqqGpw89CMG1TVB2hFc1L63
         sJ4DNRHuJbVYY++wZU8paiVOHsqKv/ATg3UmmVqeKvs1HNUsgvD480QtXkIvdSAWoSIc
         DNteEOCC85bZirUyXzzmL1Z1N06eTV1re/W8/QsDmPq9szz5KvjvREPjpD9CpG2i0f3M
         +oYwxB4Z9Bdg+91SHWuTuLO1BiwrbGCThYOmadyR4HmTePb6zPh00ut2jCmCbVjrv+uu
         ee+Gs6fzXzctnGfNk6RSH6eeKCqMrkiptWVchyVrDMHPv5OGQndU17JjEWooaSXQflSR
         BtCQ==
X-Gm-Message-State: AOJu0YwWwb2EqLBAZ/4cEZZLGPowKHmFFFGaJUk6rm8RjzBDC8DSgrn0
	g870y8NbvWEo0hXOAjGTATHlh157KC3Bj3+AMDF+TNlU
X-Google-Smtp-Source: AGHT+IG4KyTl5CwzMZ1gy4FucyPBBLxaEgYRfo01XZveBgxlerDUkvXhDFprA+AP7dQahAlFaE4+/g==
X-Received: by 2002:a17:906:2259:b0:9ee:a767:12e7 with SMTP id 25-20020a170906225900b009eea76712e7mr1762679ejr.6.1700810524590;
        Thu, 23 Nov 2023 23:22:04 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id q18-20020a1709060e5200b00992f2befcbcsm1709930eji.180.2023.11.23.23.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:22:04 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lustig <dlustig@nvidia.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [RFC PATCH 0/5] RISC-V: Add dynamic TSO support
Date: Fri, 24 Nov 2023 08:21:37 +0100
Message-ID: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Christoph Müllner <christoph.muellner@vrull.eu>

The upcoming RISC-V Ssdtso specification introduces a bit in the senvcfg
CSR to switch the memory consistency model at run-time from RVWMO to TSO
(and back). The active consistency model can therefore be switched on a
per-hart base and managed by the kernel on a per-process/thread base.

This patch implements basic Ssdtso support and adds a prctl API on top
so that user-space processes can switch to a stronger memory consistency
model (than the kernel was written for) at run-time.

I am not sure if other architectures support switching the memory
consistency model at run-time, but designing the prctl API in an
arch-independent way allows reusing it in the future.

The patchset also comes with a short documentation of the prctl API.

This series is based on the second draft of the Ssdtso specification
which was published recently on an RVI list:
  https://lists.riscv.org/g/tech-arch-review/message/183
Note, that the Ssdtso specification is in development state
(i.e., not frozen or even ratified) which is also the reason
why I marked the series as RFC.

One aspect that is not covered in this patchset is virtualization.
It is planned to add virtualization support in a later version.
Hints/suggestions on how to implement this part are very much
appreciated.

Christoph Müllner (5):
  RISC-V: Add basic Ssdtso support
  RISC-V: Expose Ssdtso via hwprobe API
  uapi: prctl: Add new prctl call to set/get the memory consistency
    model
  RISC-V: Implement prctl call to set/get the memory consistency model
  RISC-V: selftests: Add DTSO tests

 Documentation/arch/riscv/hwprobe.rst          |  3 +
 .../mm/dynamic-memory-consistency-model.rst   | 76 ++++++++++++++++++
 arch/riscv/Kconfig                            | 10 +++
 arch/riscv/include/asm/csr.h                  |  1 +
 arch/riscv/include/asm/dtso.h                 | 74 ++++++++++++++++++
 arch/riscv/include/asm/hwcap.h                |  1 +
 arch/riscv/include/asm/processor.h            |  8 ++
 arch/riscv/include/asm/switch_to.h            |  3 +
 arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
 arch/riscv/kernel/Makefile                    |  1 +
 arch/riscv/kernel/cpufeature.c                |  1 +
 arch/riscv/kernel/dtso.c                      | 33 ++++++++
 arch/riscv/kernel/process.c                   |  4 +
 arch/riscv/kernel/sys_riscv.c                 |  1 +
 include/uapi/linux/prctl.h                    |  5 ++
 kernel/sys.c                                  | 12 +++
 tools/testing/selftests/riscv/Makefile        |  2 +-
 tools/testing/selftests/riscv/dtso/.gitignore |  1 +
 tools/testing/selftests/riscv/dtso/Makefile   | 11 +++
 tools/testing/selftests/riscv/dtso/dtso.c     | 77 +++++++++++++++++++
 20 files changed, 324 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/mm/dynamic-memory-consistency-model.rst
 create mode 100644 arch/riscv/include/asm/dtso.h
 create mode 100644 arch/riscv/kernel/dtso.c
 create mode 100644 tools/testing/selftests/riscv/dtso/.gitignore
 create mode 100644 tools/testing/selftests/riscv/dtso/Makefile
 create mode 100644 tools/testing/selftests/riscv/dtso/dtso.c

-- 
2.41.0

