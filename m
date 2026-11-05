Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793842714;
	b=1AL9E8EZm1/4QrzFYcEW3arfG243+/0UscEGOtJaTR5dtjzKo2f4r82Z43nG4tA6r+d1
	 33OT01jcrdhYxlmDw5xuUB1NKSue6WD9wmqYLayW3azJ6Bopfw2TOs8k1puGUD4bs+v60
	 zJ6La4Kvd3sagsCIdGYHsSvX74FmLtsaIIAh9NHduaT/U+n8+hEHMuADqaplg02cz/WPF
	 og+QoWMyDmoztl+m/kE1luv85kBev51+qYJkCrwpW86sJu7napQYvINu7HgRr2Vjt8e5F
	 CSrp/csrAm4VGhdbg3rAm0eUuIsuyzWQ96Uh/siI1oNRoT+873nazfjgsh0u+fuxVeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TYS9NFes0pX3u5RGLOyKL2oHpVaqbTMJYMFIjZ8YRdw=;
	b=dUphM2Af6TC12/CB65eoA1axhEAvEmyYGaT1XuoCYRO4reWLk/w7fddj4tz8B5J5/MH3
	 74CyfrGwf+4FRZLvLkPmjb3GE+uRxez1XvOxVLeGr0WSRxCdKUZ9dyCxFEbhtczcbLsyQ
	 2shzzOlN//zd2kLBuNbOel2Zr3nkdRGSUCuiMGHE5q9HKK5i7WbIA3F//GngqmJGA4l6/
	 JETX+Ejk+e/cqYaadBQBq4UeFRZdVlIP/8TXRJ4PL1v5b3XeJil0fMFGXRq0CRev78dVW
	 pGWqE3IbjMLkg9jhoKKZDRpE7viTGCBdqLUnQoS8Al62JZC1nbngwSmIOfWCbJnNMEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rJAfSQhw;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09151606A326
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 01:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09151606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rJAfSQhw
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so920766a91.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 17:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793842713; x=1794447513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYS9NFes0pX3u5RGLOyKL2oHpVaqbTMJYMFIjZ8YRdw=;
        b=rJAfSQhwGfz9QaIyxt24TLwNJgE9KzlaG0i7Y9s8cMSvfN9GNqx8piEbi5DrzkExG3
         v4AA0Tn0pweD9qM3a6XtyP+E3AK/ZNtXvuUfQC4Dt+R1/CZYppKElmBQRYeR/wZjat4e
         S/kGsbsxNbjiEA489HGJdUsbpWhBW+s01Jvm+guE9Tx1iJT0tdtCdZSJAnEJLVoS3Kg4
         DV4ot8sFz9RRo/29OX2roqh0l3AI+93LK72rF5142YHrJU7wFTOBiE32uQ9PwrtePDRC
         G7Fvm0OikX73+8jStqjkQLJ1eShQRUapNNHoXT9dNOOmVgTVbAJdBw0K329b0YEH1Hl5
         K3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793842713; x=1794447513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TYS9NFes0pX3u5RGLOyKL2oHpVaqbTMJYMFIjZ8YRdw=;
        b=pYcC5hmFKFC+lTANEoV1ECt5g45cM+yjjuWA+Hg5XMnhjmScSIXTSQvd2hom8MpeYM
         oofKKlTXZlDqrz5pbqifKX9YU8cY6eNY8hI2DeE9AZYDh6jzjaSUVffVlWE6pUyN0WMZ
         1FrxzZZtlZ6+g7Mk22LNwxF7PvyfdUavnYEnZ25OIiYTRVWkjw55YIQRTHeulMWZm2Xm
         IhXdZf/TRswX316MKtbRxogKz2OwMf3Vl0dLjJHtdwx9prQF3YBTuQSw64lCmRUwLkyo
         /3gn1dxXa1Mlf89uTcKe9BRULFgPbnk/Tbk9h6OSbYliolxMuhbZ/WYtPEX4KB0Lh2Ev
         5l+w==
X-Gm-Message-State: APuU4Z+TkL7m/CsLn6q08u+n9uCdXRqmcfTZeUfSa2BUb/ZkAeyMM6z4
	IqLbbClA2SIHwVDoI3ibnjWleDLnLZRns3/jwKmWg6k7gLC4hycEWS8r
X-Gm-Gg: AYBFou2Deay69gVCXEtXmsc5YsxChLI4xFqRU4ya5UWN3WkvSOMg5zXUe+p9eDLwgs/
	PIeT5K9hFStbla9KHIXF++G+pNHXTazKS3EVXfVnebZpZT+vWUpQ00j+26E9IVA2ErQ8G/l2z57
	uiZIOLTXJwCYmeIJl8SYNXSUoFDBM9ICbsSQDzWzxK4cP+bGKvgF9jp6iEfNZ3UGOj97vQ3Okdo
	yBL/+zdUS8DcJag8IjUGrtPe3nZKZniiR2xzE/bjbFomYuq1MZfw92KVmjiO3g7TMYJ7do0LQV9
	CUJ/8uIfa09Nk/BKIZ+RrtMvsj3xMiBoLZqBdMpYfU12gBOb1O1XH5LReo0lf+y9OjyqY+WYXcB
	QwD3eqsbFU4c90Nsd1nk0gu8YCEtavjUlNKELshC4nymlVHmCi35thjOzrhOPLFnV0KHNJ8Y9Ip
	VUxatZEuVYBmts1OVmA6K0VfIKpBvR+2PwYiI+NSjlIvY16tzye3ApO4fVqr1Ji08h1vSOSmwCr
	m68wLKdJJpuDhXL6ptHxN2fhkPt3KI0Lq7HqeSdzNssXlx89q7yc+wyxMjK7J1NFml8C3RwajKY
	kGZcFhGDPSji5KpaXtZxrU1D85kwcYuBebQbHlJznknWWq4RpQc1uk7V9w==
X-Received: by 2002:a17:90b:17cd:b0:3ac:b7b9:6471 with SMTP id 98e67ed59e1d1-3ae8987a7bfmr15048640a91.65.1793842713202;
        Wed, 04 Nov 2026 17:38:33 -0800 (PST)
Received: from penguin.lxd ([67.223.127.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31d2b5esm1164975a91.15.2026.11.04.17.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:38:32 -0800 (PST)
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
Subject: [PATCH v2 1/4] Documentation: kcov: clarify coverage example
Date: Wed,  4 Nov 2026 19:38:20 -0600
Message-Id: <20261105013823.29741-2-matthew.l.weber@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261105013823.29741-1-matthew.l.weber@gmail.com>
References: <20261105013823.29741-1-matthew.l.weber@gmail.com>
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

