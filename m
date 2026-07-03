Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D0D257ACF
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 02:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783045596; cv=none; b=bk7KxqSt0c+EHi3YvhCjpb9qFYraGBr9dgP2tJsdscxKgdnaK9T0VEhPn5mPjaGFxPg2ugpuPlHlHDr9hZ7nf8wcGpFkp1Ww6oVdjMn2vXMKwYtQ6Mddz8B9U+g8e2pKZ/cP2zCtQ92vG3N3e5co8wunySc0X3x30Fy5xwqlqKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783045596; c=relaxed/simple;
	bh=T3XsEkIdyxoaeuMSiyD5B3ZHZUj9TDXqUjBQMbTBX/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B5t9tgJaoecaHtJ5HtJxW7WDi3B5GNzsjZtPkwZiPcmewYGlzDRC9G26uGJdefEWvlg19Jee+qoHSJ1DJTcIWs8fAkM25t1nBM1LFsw+7pSL+yi3YTDOwNvyTPhXBBgksG80COygJIqNXFU6lv+1FfO0vMZyRBNmRQ8xJpGyjVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HAOh61zc; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HAOh61zc"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783045581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZI0lTmkO/UHIT4+QlSIiK8ejRok32RfZUe5uhwcA5/U=;
	b=HAOh61zc+mozxiYtcPNEO5Yx8iORG5T8Mkpg/vMHNt2052hHUqbiQmAarZ6Dw+Wa155V9M
	3s5333q3wzpR9SONk7wmKAVZRq1Oa6jrucylyEZauSAr7GDU5Puc5fP1m+9Lie//AcBW+2
	G42rxvyD2sX024RzcWXP/b0U8+rU9uQ=
From: Leon Hwang <leon.hwang@linux.dev>
To: linux-mm@kvack.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Leon Hwang <leon.hwang@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Gary Guo <gary@garyguo.net>,
	Anand Moon <linux.amoon@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
Date: Fri,  3 Jul 2026 10:25:07 +0800
Message-ID: <20260703022507.187457-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

mseal.o is built only for 64-bit kernels, so 32-bit kernels fall back
to sys_ni_syscall() and return -ENOSYS rather than -EPERM.

Document the -EINTR return from mmap_write_lock_killable(), fix the
CONFIG_MSEAL_SYSTEM_MAPPINGS typo, and describe system mappings in
terms of VM_SEALED_SYSMAP.

Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 Documentation/userspace-api/mseal.rst | 18 ++++++++++--------
 init/Kconfig                          |  2 +-
 mm/mseal.c                            |  4 ++--
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/userspace-api/mseal.rst
index ea9b11a0bd89..1f1cf206670c 100644
--- a/Documentation/userspace-api/mseal.rst
+++ b/Documentation/userspace-api/mseal.rst
@@ -50,8 +50,10 @@ mseal syscall signature
          * The start address (``addr``) is not allocated.
          * The end address (``addr`` + ``len``) is not allocated.
          * A gap (unallocated memory) between start and end address.
-      - **-EPERM**:
-         * sealing is supported only on 64-bit CPUs, 32-bit is not supported.
+      - **-EINTR**:
+         * Interrupted while waiting for the mmap write lock.
+      - **-ENOSYS**:
+         * The kernel does not implement ``mseal()``.
 
    **Note about error return**:
       - For above error cases, users can expect the given memory range is
@@ -62,7 +64,8 @@ mseal syscall signature
         memory range could happen. However, those cases should be rare.
 
    **Architecture support**:
-      mseal only works on 64-bit CPUs, not 32-bit CPUs.
+      mseal is built only for 64-bit kernels. 32-bit kernels return
+      ``-ENOSYS``.
 
    **Idempotent**:
       users can call mseal multiple times. mseal on an already sealed memory
@@ -131,20 +134,19 @@ Use cases
 - Chrome browser: protect some security sensitive data structures.
 
 - System mappings:
-  The system mappings are created by the kernel and includes vdso, vvar,
+  The system mappings are created by the kernel and include vdso, vvar,
   vvar_vclock, vectors (arm compat-mode), sigpage (arm compat-mode), uprobes.
 
   Those system mappings are readonly only or execute only, memory sealing can
-  protect them from ever changing to writable or unmmap/remapped as different
+  protect them from ever changing to writable or unmapped/remapped as different
   attributes. This is useful to mitigate memory corruption issues where a
   corrupted pointer is passed to a memory management system.
 
   If supported by an architecture (CONFIG_ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS),
-  the CONFIG_MSEAL_SYSTEM_MAPPINGS seals all system mappings of this
-  architecture.
+  CONFIG_MSEAL_SYSTEM_MAPPINGS seals mappings marked with VM_SEALED_SYSMAP.
 
   The following architectures currently support this feature: x86-64, arm64,
-  loongarch and s390.
+  loongarch, riscv, and s390.
 
   WARNING: This feature breaks programs which rely on relocating
   or unmapping system mappings. Known broken software at the time
diff --git a/init/Kconfig b/init/Kconfig
index 5230d4879b1c..12bb39f637b1 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2112,7 +2112,7 @@ config ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
 	  from a kernel perspective.
 
 	  After the architecture enables this, a distribution can set
-	  CONFIG_MSEAL_SYSTEM_MAPPING to manage access to the feature.
+	  CONFIG_MSEAL_SYSTEM_MAPPINGS to manage access to the feature.
 
 	  For complete descriptions of memory sealing, please see
 	  Documentation/userspace-api/mseal.rst
diff --git a/mm/mseal.c b/mm/mseal.c
index 9781647483d1..0464c7b94ab9 100644
--- a/mm/mseal.c
+++ b/mm/mseal.c
@@ -132,8 +132,8 @@ static int mseal_apply(struct mm_struct *mm,
  *   addr is not a valid address (not allocated).
  *   end (start + len) is not a valid address.
  *   a gap (unallocated memory) between start and end.
- *  -EPERM:
- *  - In 32 bit architecture, sealing is not supported.
+ *  -EINTR:
+ *   interrupted while waiting for the mmap write lock.
  * Note:
  *  user can call mseal(2) multiple times, adding a seal on an
  *  already sealed memory is a no-action (no error).
-- 
2.54.0

