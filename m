Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6096540F8ED;
	Wed, 27 May 2026 13:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779888980; cv=none; b=cwCjv05WhIgeU1knXOd3yIIlVNqA4mYp8yhuSxG/ek6djTsig1bCxviC3dRocyAkDDIYumdKfQLB3chXyHprz3OuwNejSLa6EywpHH4bsr6b5/KtLicJ/s+T9gGYfmw1xPpk+MRDsFgqltZ3aOse/KUPk+w3DmG+C48CQ//AAyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779888980; c=relaxed/simple;
	bh=YgxJKmPXIYin1Yn8QCUn7+UdsOWRLnPzXNB6JtJLDZY=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=spmxkmZM+U36ztJLkQa0FzLVDAVBxyYNUXdmfhuEqCXxbXGh6xbd1B8uFIKVGc7XihR9Lcho05TaeYqINtNrgHxYE6OCpRIuOTJs4eHkx7CZA1XjYNBrsG25jJaAvJmpV78OUbqFK1H2pgTDv/c7mTU1dH+kAQyDgQJupdIK10k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4gQVxt4SPZz4xNtN;
	Wed, 27 May 2026 21:36:02 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 64RDZvCm068562;
	Wed, 27 May 2026 21:35:57 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 27 May 2026 21:35:58 +0800 (CST)
X-Zmail-TransId: 2afc6a16f33ebc8-e93f5
X-Mailer: Zmail v1.0
Message-ID: <20260527213558929EhiHHy9EDTMjmg3uuDOMi@zte.com.cn>
Date: Wed, 27 May 2026 21:35:58 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <akpm@linux-foundation.org>, <fan.yu9@zte.com.cn>,
        <yang.yang29@zte.com.cn>
Cc: <corbet@lwn.net>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4IG5leHRdIHRvb2xzIGhlYWRlcnMgVUFQSTogc3luYyBsaW51eC90YXNrc3RhdHMuaCBmb3IgcHJvY2FjY3QuYw==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 64RDZvCm068562
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Wed, 27 May 2026 21:36:02 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A16F342.001/4gQVxt4SPZz4xNtN

From: Wang Yaxin <wang.yaxin@zte.com.cn>

Background
==========
After commit 9b93f7e32774 ("tools/getdelays: use the static UAPI
headers from tools/include/uapi"), the Makefile was changed to use
-I../include/uapi/ instead of -I../../usr/include to ensure tools
always use the up-to-date UAPI headers.

However, only linux/taskstats.h was added to tools/include/uapi/ in
commit e5bbb35a07b3 ("tools headers UAPI: sync linux/taskstats.h"),
but linux/acct.h was missing.

Problem
=======
This causes procacct.c to fail to compile with:

procacct.c:234:37: error: 'AGROUP' undeclared (first use in this function)

gcc -I../include/uapi/    getdelays.c   -o getdelays
gcc -I../include/uapi/    procacct.c   -o procacct
procacct.c: In function ‘print_procacct’:
procacct.c:234:37: error: ‘AGROUP’ undeclared (first use in this function)
did you mean ‘NOGROUP’?
  234 |  , t->version >= 12 ? (t->ac_flag & AGROUP ? 'P' : 'T') : '?'
      |                                     ^~~~~~
      |                                     NOGROUP
procacct.c:234:37: note: each undeclared ident

because procacct.c uses the AGROUP macro defined in linux/acct.h.

Solution
========
Add the missing linux/acct.h to complete the static UAPI header set.

Fixes: 9b93f7e32774 ("tools/getdelays: use the static UAPI headers from tools/include/uapi")
Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
---
 tools/include/uapi/linux/acct.h | 128 ++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 tools/include/uapi/linux/acct.h

diff --git a/tools/include/uapi/linux/acct.h b/tools/include/uapi/linux/acct.h
new file mode 100644
index 000000000000..0e591152aa8a
--- /dev/null
+++ b/tools/include/uapi/linux/acct.h
@@ -0,0 +1,128 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ *  BSD Process Accounting for Linux - Definitions
+ *
+ *  Author: Marco van Wieringen (mvw@planets.elm.net)
+ *
+ *  This header file contains the definitions needed to implement
+ *  BSD-style process accounting. The kernel accounting code and all
+ *  user-level programs that try to do something useful with the
+ *  process accounting log must include this file.
+ *
+ *  Copyright (C) 1995 - 1997 Marco van Wieringen - ELM Consultancy B.V.
+ *
+ */
+
+#ifndef _UAPI_LINUX_ACCT_H
+#define _UAPI_LINUX_ACCT_H
+
+#include <linux/types.h>
+
+#include <asm/param.h>
+#include <asm/byteorder.h>
+
+/* 
+ *  comp_t is a 16-bit "floating" point number with a 3-bit base 8
+ *  exponent and a 13-bit fraction.
+ *  comp2_t is 24-bit with 5-bit base 2 exponent and 20 bit fraction
+ *  (leading 1 not stored).
+ *  See linux/kernel/acct.c for the specific encoding systems used.
+ */
+
+typedef __u16	comp_t;
+typedef __u32	comp2_t;
+
+/*
+ *   accounting file record
+ *
+ *   This structure contains all of the information written out to the
+ *   process accounting file whenever a process exits.
+ */
+
+#define ACCT_COMM	16
+
+struct acct
+{
+	char		ac_flag;		/* Flags */
+	char		ac_version;		/* Always set to ACCT_VERSION */
+	/* for binary compatibility back until 2.0 */
+	__u16		ac_uid16;		/* LSB of Real User ID */
+	__u16		ac_gid16;		/* LSB of Real Group ID */
+	__u16		ac_tty;			/* Control Terminal */
+	/* __u32 range means times from 1970 to 2106 */
+	__u32		ac_btime;		/* Process Creation Time */
+	comp_t		ac_utime;		/* User Time */
+	comp_t		ac_stime;		/* System Time */
+	comp_t		ac_etime;		/* Elapsed Time */
+	comp_t		ac_mem;			/* Average Memory Usage */
+	comp_t		ac_io;			/* Chars Transferred */
+	comp_t		ac_rw;			/* Blocks Read or Written */
+	comp_t		ac_minflt;		/* Minor Pagefaults */
+	comp_t		ac_majflt;		/* Major Pagefaults */
+	comp_t		ac_swaps;		/* Number of Swaps */
+/* m68k had no padding here. */
+#if !defined(CONFIG_M68K) || !defined(__KERNEL__)
+	__u16		ac_ahz;			/* AHZ */
+#endif
+	__u32		ac_exitcode;		/* Exitcode */
+	char		ac_comm[ACCT_COMM + 1];	/* Command Name */
+	__u8		ac_etime_hi;		/* Elapsed Time MSB */
+	__u16		ac_etime_lo;		/* Elapsed Time LSB */
+	__u32		ac_uid;			/* Real User ID */
+	__u32		ac_gid;			/* Real Group ID */
+};
+
+struct acct_v3
+{
+	char		ac_flag;		/* Flags */
+	char		ac_version;		/* Always set to ACCT_VERSION */
+	__u16		ac_tty;			/* Control Terminal */
+	__u32		ac_exitcode;		/* Exitcode */
+	__u32		ac_uid;			/* Real User ID */
+	__u32		ac_gid;			/* Real Group ID */
+	__u32		ac_pid;			/* Process ID */
+	__u32		ac_ppid;		/* Parent Process ID */
+	/* __u32 range means times from 1970 to 2106 */
+	__u32		ac_btime;		/* Process Creation Time */
+#ifdef __KERNEL__
+	__u32		ac_etime;		/* Elapsed Time */
+#else
+	float		ac_etime;		/* Elapsed Time */
+#endif
+	comp_t		ac_utime;		/* User Time */
+	comp_t		ac_stime;		/* System Time */
+	comp_t		ac_mem;			/* Average Memory Usage */
+	comp_t		ac_io;			/* Chars Transferred */
+	comp_t		ac_rw;			/* Blocks Read or Written */
+	comp_t		ac_minflt;		/* Minor Pagefaults */
+	comp_t		ac_majflt;		/* Major Pagefaults */
+	comp_t		ac_swaps;		/* Number of Swaps */
+	char		ac_comm[ACCT_COMM];	/* Command Name */
+};
+
+/*
+ *  accounting flags
+ */
+				/* bit set when the process/task ... */
+#define AFORK		0x01	/* ... executed fork, but did not exec */
+#define ASU		0x02	/* ... used super-user privileges */
+#define ACOMPAT		0x04	/* ... used compatibility mode (VAX only not used) */
+#define ACORE		0x08	/* ... dumped core */
+#define AXSIG		0x10	/* ... was killed by a signal */
+#define AGROUP		0x20	/* ... was the last task of the process (task group) */
+
+#if defined(__BYTE_ORDER) ? __BYTE_ORDER == __BIG_ENDIAN : defined(__BIG_ENDIAN)
+#define ACCT_BYTEORDER	0x80	/* accounting file is big endian */
+#elif defined(__BYTE_ORDER) ? __BYTE_ORDER == __LITTLE_ENDIAN : defined(__LITTLE_ENDIAN)
+#define ACCT_BYTEORDER	0x00	/* accounting file is little endian */
+#else
+#error unspecified endianness
+#endif
+
+#ifndef __KERNEL__
+#define ACCT_VERSION	2
+#define AHZ		(HZ)
+#endif	/* __KERNEL */
+
+
+#endif /* _UAPI_LINUX_ACCT_H */
-- 
2.25.1
