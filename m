Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4EA1A01C6
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 02:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736302110; cv=none; b=H+8Xgo+3g65+4a0BDPel25XD2/COao+XvyX7lZb3S1wJdC+fbchTPq4+Web4pp1RloVg20gimJ/HmIlwKPHY+RRdbWfGtf8kx7ZBWtrckQhH+geF2cLAdhPZWPDeU+EZyL4paf6++wvbtQm6wErvae/HgcI58s5v+7VX/r0tiVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736302110; c=relaxed/simple;
	bh=I9cHVjQ2uo3OIuDJZJCfKTtcXpKfadJsSGAtAuWupyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FlyCyVCSe9YXUbHErF1HugMWR3TyfebaP9U9w9Sk9II97mkO9ioFzzs6Xiz3pq3aXv9LejQBuCh8vCGPjoygEg+uRtTsaVTGVxofzN1mB2O00WF3u81I7oJ1CxTXC8/FvQdHU/TBwTZq4NPfN6HNBeypirWAipHtdcIETAqOKqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=2CSyziDA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="2CSyziDA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21644aca3a0so65456935ad.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 18:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736302108; x=1736906908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GiD2Rla/xsm4bXG8M0ZJW8z5mN+wlqQHFTji6CER+Qg=;
        b=2CSyziDAUy7D1LKtG0YJlyazCblfHUoj00ZLH193UT+n1W6KHzAr7DNhjnILUGhhkj
         HF6TzqKeYJb1To/luJ4K3SH7jEevaYcRYgKmC6pPPNZLj41Vfi5cTEssgYEmqnzep4wq
         I9HujL4ZvFjie05Z+nCEDAzhI5cM+lcVoe5UGqTwHze/zP70by+bWDU9cmuJag2e52k8
         P2794LalBE3aziHmQYuBjzOerxjBU4QtfsTcPgM335g1P1g4kaGL1ErzLdX4NAi+I0Sn
         mvhmMxwqEOQ3lBJ2C++JJNj0tR9EGLWygw2lMGLwiC6Sm2jvaNpdQPAgnnAO8UF7MnxQ
         bg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736302108; x=1736906908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiD2Rla/xsm4bXG8M0ZJW8z5mN+wlqQHFTji6CER+Qg=;
        b=tNfDFP1cgbVSO2ScmEbjEAB85lcqjCAqmEitPNlM6RLt5KQQ++DzO73CEhxC1EmiYA
         vAT67dU1G1Az7ZeNQ6kIBaskc2g+/H7kG3C+c8PKjvfXSweWlFvE2LyYFRT72dUam/HA
         unrbUp7YdHZC1Hb79rckCys9lSTPY+BYF1HU3GTDGqb8RY42OSitLMNI3JnxdWMONwyU
         a/Ai7zQ+yt7lugdCJnXZp9Q0ZylD8WT86Mo+NuuvymgtUM5zzxDeNJjCh6YEm7MC5Q0b
         jeUCYEib3TrhBFSBe5XIVStF5vOrr1+13RQW40INfoV3mWPHlabqeFD5aIaVV78c4vtx
         F3Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUOwlAFZmnjS38GHxzfnvfN6ArSeaAsjW9XDfYGxhNMOgKXFn3vMX3mTHBAZyzHHCrQ0ne+mYde6gQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YziiuT3RKRQxyZHX8uqBLO/acVR4AXxj8v/8MT2tGJJ0vzjB2T9
	MXSnNEpLcc3tLsYOqK0Hznkpzf25wU2IX5m+8+BuYvoZlfHnVL/1LyWCz8K6wuE=
X-Gm-Gg: ASbGncvP61U0gbGhPYO9eD61AW5HngnFflDbiz3yDjTD3M8tXktTppY8YtgRitTQo13
	pe8zQqu3uSgCymQOJi+wN4N9ktrRtAZR/Jrlp6hIOZvkS/NLTVvUsXQIrTvGNu24Os7mXfMxo9i
	cZSN5Yd7H5EY2SnI8GwC99dvnDJkWDs9lQt2p65iDwv7sr/UsnaAZLGnLyVuZBlIt7iHIDSiRKi
	q5UNmA8YvwLEj5gSBLI+HEjvGKMtyftC8Xf+MQRIeVwMwBMGlxBnOVWgiqq3WL5JpoFzww0
X-Google-Smtp-Source: AGHT+IECAsCvSGPUt+Ua6JpGMjzYDeZrG0nUvrr9rrlzl5DMSyKPhsQn+kcgYII00Gjxc/49yA6YXA==
X-Received: by 2002:a17:902:c941:b0:215:7fad:49ab with SMTP id d9443c01a7336-21a83f46a12mr18729865ad.10.1736302107872;
        Tue, 07 Jan 2025 18:08:27 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca0282fsm316662405ad.259.2025.01.07.18.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 18:08:27 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 07 Jan 2025 18:07:56 -0800
Subject: [PATCH v5 08/16] perf tools: x86: Use generic syscall scripts
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-perf_syscalltbl-v5-8-935de46d3175@rivosinc.com>
References: <20250107-perf_syscalltbl-v5-0-935de46d3175@rivosinc.com>
In-Reply-To: <20250107-perf_syscalltbl-v5-0-935de46d3175@rivosinc.com>
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
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7222; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=I9cHVjQ2uo3OIuDJZJCfKTtcXpKfadJsSGAtAuWupyg=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3rtPaaVNrUB6v7z7W0f9y5QfKZvEiYR0Wx27MVXM8vi1
 Tl/9LM6SlkYxDgYZMUUWXiuNTC33tEvOypaNgFmDisTyBAGLk4BmMhPdUaGLZW9Esp3Z9Xndlfl
 qsXYHelki1E1PGkkq/x4Jp/Ij5x3jAwPtOcXHzKVLSze6F77WfBDwcFlktslGa3LH+lckj9va8I
 FAA==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Use the generic scripts to generate headers from the syscall table for
both 32- and 64-bit x86.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.config                         |  3 +-
 tools/perf/Makefile.perf                           |  2 +-
 tools/perf/arch/x86/Build                          |  1 -
 tools/perf/arch/x86/Makefile                       | 25 -------------
 tools/perf/arch/x86/entry/syscalls/Kbuild          |  3 ++
 .../perf/arch/x86/entry/syscalls/Makefile.syscalls |  6 ++++
 tools/perf/arch/x86/entry/syscalls/syscalltbl.sh   | 42 ----------------------
 tools/perf/arch/x86/include/syscall_table.h        |  8 +++++
 tools/perf/util/syscalltbl.c                       | 10 +-----
 9 files changed, 20 insertions(+), 80 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 4e05dd2e9596e87cdd0dc91f4c5b071b4545c574..a9606e7254908c101ad41f1e3f249af5418711f3 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -31,7 +31,7 @@ $(call detected_var,SRCARCH)
 ifneq ($(NO_SYSCALL_TABLE),1)
   NO_SYSCALL_TABLE := 1
 
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),x86 powerpc arm64 s390 mips loongarch riscv))
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),powerpc arm64 s390 mips loongarch))
     NO_SYSCALL_TABLE := 0
   endif
 
@@ -58,7 +58,6 @@ endif
 # Additional ARCH settings for x86
 ifeq ($(SRCARCH),x86)
   $(call detected,CONFIG_X86)
-  CFLAGS += -I$(OUTPUT)arch/x86/include/generated
   ifeq (${IS_64_BIT}, 1)
     CFLAGS += -DHAVE_ARCH_X86_64_SUPPORT
     ARCH_INCLUDE = ../../arch/x86/lib/memcpy_64.S ../../arch/x86/lib/memset_64.S
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 52d2a02f0813d67ed1159b30b6ce0b431eda28f2..51282ee096f53718c8311a392a410b4e580cb76b 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-generic_syscall_table_archs := riscv arc csky arm sh sparc xtensa
+generic_syscall_table_archs := riscv arc csky arm sh sparc xtensa x86
 ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
diff --git a/tools/perf/arch/x86/Build b/tools/perf/arch/x86/Build
index 87d0574913431b7c4505caf78f41d48b180a2fbc..02a1ca780a2071d322f75fb2885c3a36bc278e8d 100644
--- a/tools/perf/arch/x86/Build
+++ b/tools/perf/arch/x86/Build
@@ -2,7 +2,6 @@ perf-util-y += util/
 perf-test-y += tests/
 
 ifdef SHELLCHECK
-  SHELL_TESTS := entry/syscalls/syscalltbl.sh
   TEST_LOGS := $(SHELL_TESTS:%=%.shellcheck_log)
 else
   SHELL_TESTS :=
diff --git a/tools/perf/arch/x86/Makefile b/tools/perf/arch/x86/Makefile
index a6b6e0a9308a8e401c65eb802e5815a41fbdefe9..a295a80ea078199547e816d18531820bfdba7961 100644
--- a/tools/perf/arch/x86/Makefile
+++ b/tools/perf/arch/x86/Makefile
@@ -1,28 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 HAVE_KVM_STAT_SUPPORT := 1
 PERF_HAVE_JITDUMP := 1
-
-###
-# Syscall table generation
-#
-
-generated := $(OUTPUT)arch/x86/include/generated
-out       := $(generated)/asm
-header    := $(out)/syscalls_64.c
-header_32 := $(out)/syscalls_32.c
-sys       := $(srctree)/tools/perf/arch/x86/entry/syscalls
-systbl    := $(sys)/syscalltbl.sh
-
-# Create output directory if not already present
-$(shell [ -d '$(out)' ] || mkdir -p '$(out)')
-
-$(header): $(sys)/syscall_64.tbl $(systbl)
-	$(Q)$(SHELL) '$(systbl)' $(sys)/syscall_64.tbl 'x86_64' > $@
-
-$(header_32): $(sys)/syscall_32.tbl $(systbl)
-	$(Q)$(SHELL) '$(systbl)' $(sys)/syscall_32.tbl 'x86' > $@
-
-clean::
-	$(call QUIET_CLEAN, x86) $(RM) -r $(header) $(generated)
-
-archheaders: $(header) $(header_32)
diff --git a/tools/perf/arch/x86/entry/syscalls/Kbuild b/tools/perf/arch/x86/entry/syscalls/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..84c6599b4ea6a160217a3496449b205f2263f0fb
--- /dev/null
+++ b/tools/perf/arch/x86/entry/syscalls/Kbuild
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_32.h
+syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/x86/entry/syscalls/Makefile.syscalls b/tools/perf/arch/x86/entry/syscalls/Makefile.syscalls
new file mode 100644
index 0000000000000000000000000000000000000000..db3d5d6d4e5699d338afc55f6415612ef924d985
--- /dev/null
+++ b/tools/perf/arch/x86/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_32 += i386
+syscall_abis_64 +=
+
+syscalltbl = $(srctree)/tools/perf/arch/x86/entry/syscalls/syscall_%.tbl
diff --git a/tools/perf/arch/x86/entry/syscalls/syscalltbl.sh b/tools/perf/arch/x86/entry/syscalls/syscalltbl.sh
deleted file mode 100755
index 2b71f99933a549607b0c18aa2b8be16b860f603c..0000000000000000000000000000000000000000
--- a/tools/perf/arch/x86/entry/syscalls/syscalltbl.sh
+++ /dev/null
@@ -1,42 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-in="$1"
-arch="$2"
-
-syscall_macro() {
-    nr="$1"
-    name="$2"
-
-    echo "	[$nr] = \"$name\","
-}
-
-emit() {
-    nr="$1"
-    entry="$2"
-
-    syscall_macro "$nr" "$entry"
-}
-
-echo "static const char *const syscalltbl_${arch}[] = {"
-
-sorted_table=$(mktemp /tmp/syscalltbl.XXXXXX)
-grep '^[0-9]' "$in" | sort -n > $sorted_table
-
-max_nr=0
-# the params are: nr abi name entry compat
-# use _ for intentionally unused variables according to SC2034
-while read nr _ name _ _; do
-    if [ $nr -ge 512 ] ; then # discard compat sycalls
-        break
-    fi
-
-    emit "$nr" "$name"
-    max_nr=$nr
-done < $sorted_table
-
-rm -f $sorted_table
-
-echo "};"
-
-echo "#define SYSCALLTBL_${arch}_MAX_ID ${max_nr}"
diff --git a/tools/perf/arch/x86/include/syscall_table.h b/tools/perf/arch/x86/include/syscall_table.h
new file mode 100644
index 0000000000000000000000000000000000000000..7ff51b783000d727ec48be960730b81ecdb05575
--- /dev/null
+++ b/tools/perf/arch/x86/include/syscall_table.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/bitsperlong.h>
+
+#if __BITS_PER_LONG == 64
+#include <asm/syscalls_64.h>
+#else
+#include <asm/syscalls_32.h>
+#endif
diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
index ccf234a54366f9921c3b9a02ffb0a365d17244bc..02f23483bfff83809c4e649a2d054dba6975d12c 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -14,15 +14,7 @@
 #include <string.h>
 #include "string2.h"
 
-#if defined(__x86_64__)
-#include <asm/syscalls_64.c>
-const int syscalltbl_native_max_id = SYSCALLTBL_x86_64_MAX_ID;
-static const char *const *syscalltbl_native = syscalltbl_x86_64;
-#elif defined(__i386__)
-#include <asm/syscalls_32.c>
-const int syscalltbl_native_max_id = SYSCALLTBL_x86_MAX_ID;
-static const char *const *syscalltbl_native = syscalltbl_x86;
-#elif defined(__s390x__)
+#if defined(__s390x__)
 #include <asm/syscalls_64.c>
 const int syscalltbl_native_max_id = SYSCALLTBL_S390_64_MAX_ID;
 static const char *const *syscalltbl_native = syscalltbl_s390_64;

-- 
2.34.1

