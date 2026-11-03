Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718535;
	b=48UpBbf1NWJIdU4B5muix7JJGSQOMCkx9cpsytrX3opLy62ToWH8eJ5epw5tYfpKKynS
	 mtTwgZ5znmbegAdKk34n1W/0brPbYQFjYrUNNeLzIvMLnQrJKPH1offaEDWCNvdErlLg+
	 RrU23VKmjWEhtJSHUXfETWVRX95QrnW/L41DpqzT645PiTUHWk9D5HfJjUml653TH42ux
	 7dpWV/VUmSYLDdynBQUGoPVbVXkxAh5GEuKCJKMpaHeAFSLEcCn6xruXFHk+0ZD/neDPD
	 QfW5Lu5ngtHZRT4q+YVF60e7IBYR3P6y7x5cxx7tn2Km9qxUW+MbjiHV1zU/qWyiQiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TYS9NFes0pX3u5RGLOyKL2oHpVaqbTMJYMFIjZ8YRdw=;
	b=MhisyjEd2gHxhqZaGaDGdjsC6STYzC1FB1Dbl5zXjpxx4wZs1W3lKg5DfnSTqNmatEA1
	 lbpcxHUbvR/ZJL2M+YesE46Pw0RUTxOlBlPWc+a03j2qkgTu06/yvd8ZJ20443SZla4Lo
	 dyMwXX3173InVMcwWszCKgZwPO+SPHZlUACeWtTZnhFi8EMh3pnRaklg8Jjaz1ZXEOJ4I
	 tpSFNQrxHh2wEIhFAQwl2xgWCihBBKBUrnnBbUgPP1uuFfH2eROd/xFxRLZlp9fKDDIWK
	 U1uN9I86UK3EZP5Rm/tX2NH9DWA3fQ0gHVIoj70FVWP1tUHokF/LLpWghD57BQtW0KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWtI4kiT;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9E1606FCCA
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 15:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E9E1606FCCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWtI4kiT
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-47b47de8b4cso2363633fac.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 07:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718533; x=1794323333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYS9NFes0pX3u5RGLOyKL2oHpVaqbTMJYMFIjZ8YRdw=;
        b=rWtI4kiTGNoXT1C1bcQXiqVVGk33DsXyXg55gK/LPhNvgn/rJxJKGg6NSiEm5XEdUz
         b4bbFzR1k6G/LhvCBDODi+6ji9CApnN8bT9czaNaGOD8daFTcafGnghXbEHJYwINixdV
         ZKsZlDQ6Qh1r1hnNhzKhJlYRm1E6/ZJD6GUqVzUHjjfrlqTzSP++28bIb6Ju2LnxdWA8
         Vf/zzz+cRLbe19vXNecUM8yh9Y7fWhUU1PIbg+C6VeYq4akTz+eQ6H8Pl1rqKfrYN/fU
         loukcK2AF3waKQG34iJRYRjSBHoeALxeQbSmQqui4kVS+Px4/OQGr23vUKuEouefi2l6
         lP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718533; x=1794323333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TYS9NFes0pX3u5RGLOyKL2oHpVaqbTMJYMFIjZ8YRdw=;
        b=wpMkttiQiEYIlqQFgw4cRKlbaCtO+ll0M02Nz5TqHx69aO0aEqRh775jblecWNuHqT
         svyxXLfwKFHmlheGf5zjvIdjnozAiJawfWKEzFIsPw/9EMc+Q8Je0FxX0zDznE7zX6yY
         BcU8fdO5ws6TYR7KlT4XTAMFB2wWHsA0HuZOW9OyG5p3WlupPWqS7yZaPaX652Z3J1w2
         HljYSJBypnEJSQIpQNOR4O1VfdjRM0DsT53M2dOw17g0r6kSfsiZ5s6GZyW5244SJB/b
         mzKxg9hTVJca4oEd7mJeFnlbZm2VZTUPuEdAnHbSml9jK8QVmv4K3vxcZxevhpR7Pqay
         hA4Q==
X-Gm-Message-State: APuU4Z97tSR8ESP2ePauv69DFCZjM97s5iSMnjxkvWetHiMnr5qrzBJK
	LIaXGLfyL/mS23VFqwsD0cWuS7zuXU5VpLm1lmPSACtjzlwZ8rB70G9KC34dAEE1PEc=
X-Gm-Gg: AYBFou0FQtDrBdAB01e0Krcb9m1K+IImpnFvlvKn6mGnjLohdAQL8LTeEWtx/P/YxlT
	CJnM+QVgMvVQ0hrFaHAcADYElKpWVVgVjzWmZkJ77usKcIioMs447Rz5jKIeBdefMT9ROeMJFyu
	UNAEP1U4dAQdPo2XTnEwraLsKRixJQLpJep3WlFNypMEFWJHaWsd386RaugHVmlbyjMnW7z8O2j
	e+IPTx4bFMisxDW/FT6VunWPHmZ6+moQxU0TjUpDlwl5qBWgoFMR9GGAFPCOmHd+jnbLaJxkenK
	QH+JT6S5Xo7Xzbcz0cUHDS4cLk+JeSz0lkRQqlX0YunKJfD95sQfcQmp/52oJV0jAXqanu+2myP
	rzX9s1nPPfnwh+o3zU1vOLGKZCooizp7u+iJkVsrqBkvclSUMYqu1eH/GLbO5/XE+0sZ1ZPS+YC
	IxdFna7cHOrWU1RF2alUFas/z5RXOqLEGdIcbHiVaINAzilct9c91wDVxw8p9pIdPWOqKcO3cKv
	uduCmBaMX37liusUP0vPJPV1o0pCeqL7g/ecC19jG6kSu/Zu2AhtlzK/zbUWLsJGM9ycCGCFzt3
	5+UyisjliTSLqhsCQlS1UzQRMqkFjxHVbOFSFg==
X-Received: by 2002:a05:6870:7a18:b0:4a6:f698:df8f with SMTP id 586e51a60fabf-4a907781260mr8302880fac.42.1793718533281;
        Tue, 03 Nov 2026 07:08:53 -0800 (PST)
Received: from penguin.lxd ([2605:3f84:842:3300:216:3eff:fe58:9322])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a95d970b9bsm4730448fac.8.2026.11.03.07.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:08:51 -0800 (PST)
From: Matthew Weber <matthew.l.weber@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	kasan-dev@googlegroups.com,
	Matthew Weber <matthew.l.weber@gmail.com>
Subject: [PATCH] Documentation: kcov: clarify coverage example
Date: Tue,  3 Nov 2026 09:08:42 -0600
Message-Id: <20261103150845.13008-2-matthew.l.weber@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261103150845.13008-1-matthew.l.weber@gmail.com>
References: <20261103150845.13008-1-matthew.l.weber@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clarify that the saved count bounds the printed entries while KCOV
remains enabled, including during output. The examples continue to disable
KCOV after printing, as before.

Document the KCOV configuration requirements and how to symbolize
collected PCs.

Signed-off-by: Matthew Weber <matthew.l.weber@gmail.com>
---
 Documentation/dev-tools/kcov.rst | 44 +++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
index 8127849d4..0c3099c06 100644
--- a/Documentation/dev-tools/kcov.rst
+++ b/Documentation/dev-tools/kcov.rst
@@ -31,6 +31,15 @@ Collecting comparison operands is supported with GCC 8+ or with Clang.
 To enable KCOV, configure the kernel with::
 
         CONFIG_KCOV=y
+        CONFIG_DEBUG_FS=y
+
+``CONFIG_KCOV_INSTRUMENT_ALL=y`` (the default) instruments eligible kernel
+code throughout the build. If it is disabled, only explicitly selected code
+is instrumented.
+
+To resolve collected PCs to source locations, also build with debug information
+(``CONFIG_DEBUG_INFO=y``) and retain the matching ``vmlinux``. Debug information
+is not required for collection itself.
 
 To enable comparison operands collection, set::
 
@@ -94,7 +103,7 @@ single syscall from within a test program:
 	__atomic_store_n(&cover[0], 0, __ATOMIC_RELAXED);
 	/* Call the target syscall call. */
 	read(-1, NULL, 0);
-	/* Read number of PCs collected. */
+	/* Save the output count; KCOV continues recording until disabled. */
 	n = __atomic_load_n(&cover[0], __ATOMIC_RELAXED);
 	for (i = 0; i < n; i++)
 		printf("0x%lx\n", cover[i + 1]);
@@ -111,7 +120,36 @@ single syscall from within a test program:
 	return 0;
     }
 
-After piping through ``addr2line`` the output of the program looks as follows::
+In PC mode, the first ``unsigned long`` holds the count and the remaining
+``COVER_SIZE - 1`` slots hold PCs. KCOV stops adding entries when the buffer
+is full, so increase the buffer or shorten the collection window if the count
+reaches it. An empty buffer can indicate that the target path was not
+instrumented; it is not proof that no kernel code ran.
+
+The count is read while KCOV is enabled and sets the number of entries printed.
+KCOV remains enabled while those entries are printed, so the output syscalls
+may add entries to the buffer. They are not included in the printed list,
+because the loop is bounded by the saved count. Syscall entry/return paths
+around the target can also appear.
+
+Symbolizing PCs
+~~~~~~~~~~~~~~~
+
+Save the example as ``kcov-example.c``, compile it for the target, and run it
+where debugfs is mounted and accessible::
+
+    cc -O2 -o kcov-example kcov-example.c
+    sudo ./kcov-example > kcov-pcs.txt
+    addr2line -f -i -e /path/to/matching/vmlinux < kcov-pcs.txt > kcov-symbols.txt
+
+For a cross-built target, use the matching toolchain's compiler and
+``addr2line`` (for example ``aarch64-linux-gnu-addr2line``). Use the exact build's
+debug ELF, not another build's ``vmlinux``. KCOV subtracts the kernel's KASLR
+offset on architectures that support it; do not apply an assumed relocation
+adjustment. Instrumented modules need their own debug ELF and load-address
+handling rather than symbolization against ``vmlinux``.
+
+The output can look as follows::
 
     SyS_read
     fs/read_write.c:562
@@ -184,7 +222,7 @@ Comparison operands collection is similar to coverage collection:
 		perror("ioctl"), exit(1);
 	__atomic_store_n(&cover[0], 0, __ATOMIC_RELAXED);
 	read(-1, NULL, 0);
-	/* Read number of comparisons collected. */
+	/* Save the output count, as in PC mode. */
 	n = __atomic_load_n(&cover[0], __ATOMIC_RELAXED);
 	for (i = 0; i < n; i++) {
 		uint64_t ip;
-- 
2.39.5

