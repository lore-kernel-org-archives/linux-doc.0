Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D430B1C3F2B
	for <linux-doc@vger.kernel.org>; Tue,  1 Oct 2024 13:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789790; cv=none; b=UAbZlacX7Vhups0lLxPr//6ckugodSi06/7ZkF2nxKeUZtgQlF7JeA7Yq3zKSz7Wl8zw2sj7UaXr6vsgSvIWqHhFRgOsuHdEosQNEc+RcZr+TX2hb8Dt4X7QLdYGHTyJSPPo4wyhzbTczFUTH0Fy7B1QA1slcCalVx6dr6XpQcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789790; c=relaxed/simple;
	bh=IOhPXRviUFeroPbMFU3TpHWs2o4u7OHmSDGH9K+blQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UPcKsQWm4+ZRPC021HvfD2Nq3+mNPjCM+/G5OF20+isyC/sZZneUF28MDjbzgOARh/Cst0RKoqXl6GU21g5dplSapOglxOVoFMjD/Stowy/hWxnU4El0VlW5kQqIXH+CabKYJCua6eRg4AzSbOdP2uBQgsVlbEWAIWdo3Jc1GyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A418FDA7;
	Tue,  1 Oct 2024 06:36:57 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F29273F64C;
	Tue,  1 Oct 2024 06:36:26 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	corbet@lwn.net,
	joey.gouly@arm.com,
	will@kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v1 2/2] Documentation/protection-keys: add AArch64 to documentation
Date: Tue,  1 Oct 2024 14:36:18 +0100
Message-Id: <20241001133618.1547996-3-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241001133618.1547996-1-joey.gouly@arm.com>
References: <20241001133618.1547996-1-joey.gouly@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As POE support was recently added, update the documentation.

Also note that kernel threads have a default protection key register value.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/core-api/protection-keys.rst | 38 +++++++++++++++++-----
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/Documentation/core-api/protection-keys.rst b/Documentation/core-api/protection-keys.rst
index bf28ac0401f3..28ef6269041c 100644
--- a/Documentation/core-api/protection-keys.rst
+++ b/Documentation/core-api/protection-keys.rst
@@ -12,7 +12,11 @@ Pkeys Userspace (PKU) is a feature which can be found on:
         * Intel server CPUs, Skylake and later
         * Intel client CPUs, Tiger Lake (11th Gen Core) and later
         * Future AMD CPUs
+        * arm64 CPUs with Permission Overlay Extension (FEAT_S1POE), introduced
+          in Arm v8.8
 
+x86_64
+======
 Pkeys work by dedicating 4 previously Reserved bits in each page table entry to
 a "protection key", giving 16 possible keys.
 
@@ -28,6 +32,21 @@ register.  The feature is only available in 64-bit mode, even though there is
 theoretically space in the PAE PTEs.  These permissions are enforced on data
 access only and have no effect on instruction fetches.
 
+arm64
+========
+Pkeys use 3 bits in each page table entry, to encod3 a "protection key index",
+giving 8 possible keys.
+
+Protections for each key are defined with a per-CPU user-writable system
+register (POR_EL0). This is a 64-bit register, encoding read, write and execute
+overrides flags for each protection key index.
+
+Being a CPU register, POR_EL0 is inherently thread-local, potentially giving
+each thread a different set of protections from every other thread.
+
+Unlike x86_64, the protection key permissions also apply to instruction
+fetches.
+
 Syscalls
 ========
 
@@ -38,11 +57,10 @@ There are 3 system calls which directly interact with pkeys::
 	int pkey_mprotect(unsigned long start, size_t len,
 			  unsigned long prot, int pkey);
 
-Before a pkey can be used, it must first be allocated with
-pkey_alloc().  An application calls the WRPKRU instruction
-directly in order to change access permissions to memory covered
-with a key.  In this example WRPKRU is wrapped by a C function
-called pkey_set().
+Before a pkey can be used, it must first be allocated with pkey_alloc().  An
+application writes to the architecture specific CPU register directly in order
+to change access permissions to memory covered with a key.  In this example
+this is wrapped by a C function called pkey_set().
 ::
 
 	int real_prot = PROT_READ|PROT_WRITE;
@@ -64,9 +82,9 @@ is no longer in use::
 	munmap(ptr, PAGE_SIZE);
 	pkey_free(pkey);
 
-.. note:: pkey_set() is a wrapper for the RDPKRU and WRPKRU instructions.
-          An example implementation can be found in
-          tools/testing/selftests/x86/protection_keys.c.
+.. note:: pkey_set() is a wrapper around writing to the CPU register.
+          Example implementations can be found in
+          tools/testing/selftests/mm/pkey-{arm64,powerpc,x86}.h
 
 Behavior
 ========
@@ -96,3 +114,7 @@ with a read()::
 The kernel will send a SIGSEGV in both cases, but si_code will be set
 to SEGV_PKERR when violating protection keys versus SEGV_ACCERR when
 the plain mprotect() permissions are violated.
+
+Note that kernel accesses from a kthread (such as io_uring), will use a default
+value for the protection key register, so will not be consistent with
+userspace's value of the register or mprotect.
-- 
2.25.1

