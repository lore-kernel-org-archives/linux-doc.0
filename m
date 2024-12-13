Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37386DDDC
	for <linux-doc@vger.kernel.org>; Fri, 13 Dec 2024 00:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734049996; cv=none; b=muK/Nf1sBTkkptR3EzkeX2kDLkfkbWS9D2u9f4/HmkgRo6rGyvVCUJaQxRfHj5jJx93F7CGabnXE/w6jcCyb3+rCz5vcQWQleiG8Gf4w7fUtEM8vFcvGAX/NFd8cbpU8QRfjCI0yaDgg2yU7D4AhBrU0aQKNhjK1iuC6jSFLvFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734049996; c=relaxed/simple;
	bh=IQtfuUT0+eGZ51OwwywtWIPS5QSw2EsnD9K86OE9bhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YtoWWvS1Wb4UT0J6Ofs5sGimwwgGWSpcsmyQeeoQxxh885BgH8wP8JUaPF2oTEubLrrl7kco3C+Pqo9r8HjTMAzIR0EyDT1Alz/fGbwlN647Lt3JDkW8nrc//aFXLirBahZljvIEdKY+1/BIzWQplci3S1W8+LUE2WFLSFLnOlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=BsxPjUM2; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="BsxPjUM2"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-728eccf836bso1114479b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Dec 2024 16:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734049993; x=1734654793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/t4tAnrXs8dbqT90IARLfldAs+rJPVA/lhEFBD44es=;
        b=BsxPjUM2rRrUQUQ0leQAsyEBnudUfLUiSscfanhA3lw9tM15qIZ1pTrWZ8V58Js6JW
         4x0oLX4nCVVG5srsUvkF3yG604MecM6lLevn4wUtvarZElKXk2TtQyZkIc56iAVqEAX0
         2tUpyx6EmGid4CQqJHpvpysbvMn+QYi5L5puj/1cvp6875vA0FlAmoMC/35OJFKHOCSl
         gU6CnoNPWTGDh311cgOj3PdY7AHoqo+iVIT82NKIMJn2nFh7FdLrGUoTD30fNcmaxoZ/
         p3YeFy68G7mOU8efe++wUALhLvuJz7BtvpFp6jT6H5En91tm4R8ST4TA4tnE7LjZb+E5
         y4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734049993; x=1734654793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/t4tAnrXs8dbqT90IARLfldAs+rJPVA/lhEFBD44es=;
        b=WR+wuoGZvyxVLIVsTwLo8HgGEB8R3eGMS/Uag171Fiuiawp7IvjUMNW32FImI1bFfa
         fqP+cFNUgA9zQU+MYy4JDHuVSARf2qpdMJ2jn/VGPFjKhckv7dsIW5rTgcuS0K3A+YXd
         NJLu1CiBnMsyakc2iOsCYjJqrbKbwQ/29k7bEtUe5TwQ4qQPj+Xkx9efs3mHb2ZZwDL5
         +mI9IRsjK20H1qnBpT9lCOZ5PNWNjzjgZUZNZ8Mkl7lK2Lll7s2+zfQg5doCp6eggsLN
         7Zpj8XIP5Farn7zdGSaFrwmDpiWr0j+urxCQCCdWWno+7QtbYF6I4tHxU31/fb7A97Ri
         kp0A==
X-Forwarded-Encrypted: i=1; AJvYcCUUZCPSKEx46Koc97G/q5hElPcGlniRzhpREeBx0TgMp7BclX/KvnSKZVONUz7LhLbU6Gm4x1ZzRKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB5NwWjM2ab9lsd67T49Ar2OG6dA9+MJxUuyfraEtCZLXSvqc7
	EG36p15jxV+BcXWC/WCb9JleOXt9JRACnw2eVwEIbYJLRYPWSPbRoQRkZFbz9KU=
X-Gm-Gg: ASbGnctgsMShPhExs58v22tr9Wexacp+7frBqTttVEPEbk7UOdL2lm/xt0ArPLBPPyb
	HiMXpIIPapJk3CP0oA2NRDi+tJrBdse5fAapevTBIiXS8r6wabztsGZTH6+wQP39imhtLgrdIE7
	sVVqowhY8JQEIkoOCP4+0leGIXKqXzRlWY//27d4w9YMXYfTlv8mu/qtBkpEZW2s48V/KhUnH9h
	ytS+fnFXS/K7sexwOKcx31iGumPDyRPN20/P6GNTffIRvKLvw3VHrzJucvMQNN6VeqAAuDg
X-Google-Smtp-Source: AGHT+IEd23eNeza65b/mFf2Ef1epXFx4Y/eggrgjqxpS7nxWsumxa7/TVE+fCJ8K+wC5TazJMd2/IA==
X-Received: by 2002:a17:90b:54c7:b0:2ee:c9b6:c26a with SMTP id 98e67ed59e1d1-2f28fb68ef6mr1014242a91.11.1734049993490;
        Thu, 12 Dec 2024 16:33:13 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142e0ce50sm1934462a91.39.2024.12.12.16.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 16:33:12 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 12 Dec 2024 16:32:52 -0800
Subject: [PATCH v2 02/16] perf tools: arc: Support generic syscall headers
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-perf_syscalltbl-v2-2-f8ca984ffe40@rivosinc.com>
References: <20241212-perf_syscalltbl-v2-0-f8ca984ffe40@rivosinc.com>
In-Reply-To: <20241212-perf_syscalltbl-v2-0-f8ca984ffe40@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Leo Yan <leo.yan@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2767; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=IQtfuUT0+eGZ51OwwywtWIPS5QSw2EsnD9K86OE9bhw=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3p0w97f96cdWBjf3P5j8qf/XPecPv058Sizvjb1nfH/N
 DZe06qojlIWBjEOBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACby9R8jw6mSmU2bFY+3Lfy/
 XOjNdrf3s3MDnGu57qrvuLzXbt28jB+MDKsnS+vzMHHtjLyR+cPn56XF7vwGb3eaLjRf//zjQ7t
 NKlwA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Arc uses the generic syscall table, use that in perf instead of
requiring libaudit.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.config                           | 2 +-
 tools/perf/Makefile.perf                             | 2 +-
 tools/perf/arch/arc/entry/syscalls/Kbuild            | 2 ++
 tools/perf/arch/arc/entry/syscalls/Makefile.syscalls | 3 +++
 tools/perf/arch/arc/include/syscall_table.h          | 2 ++
 5 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index a72f25162714f0117a88d94474da336814d4f030..3959a9c9972999f6d1bb85e8c1d7dc5dce92fd09 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -36,7 +36,7 @@ ifneq ($(NO_SYSCALL_TABLE),1)
   endif
 
   # architectures that use the generic syscall table scripts
-  ifeq ($(SRCARCH),riscv)
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc))
     NO_SYSCALL_TABLE := 0
     CFLAGS += -DGENERIC_SYSCALL_TABLE
     CFLAGS += -I$(OUTPUT)/tools/perf/arch/$(SRCARCH)/include/generated
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index f5278ed9f778f928436693a14e016c5c3c5171c1..3b463b42b0e3982e74056e672b2ee6adad5a3f0e 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-ifeq ($(SRCARCH),riscv)
+ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc))
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
 include Makefile.config
diff --git a/tools/perf/arch/arc/entry/syscalls/Kbuild b/tools/perf/arch/arc/entry/syscalls/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..11707c481a24ecf4e220e51eb1aca890fe929a13
--- /dev/null
+++ b/tools/perf/arch/arc/entry/syscalls/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_32.h
diff --git a/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls b/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
new file mode 100644
index 0000000000000000000000000000000000000000..391d30ab7a831b72d2ed3f2e7966fdbf558a9ed7
--- /dev/null
+++ b/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_32 += arc time32 renameat stat64 rlimit
diff --git a/tools/perf/arch/arc/include/syscall_table.h b/tools/perf/arch/arc/include/syscall_table.h
new file mode 100644
index 0000000000000000000000000000000000000000..4c942821662d95216765b176a84d5fc7974e1064
--- /dev/null
+++ b/tools/perf/arch/arc/include/syscall_table.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/syscalls_32.h>

-- 
2.34.1

