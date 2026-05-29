Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEE62AF00;
	Fri, 29 May 2026 05:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780034329; cv=none; b=Ah4NeYZ+J4miE4zx9LJMBD7oGg9d3V1Q+ig+IZne9pqutVz1WzkqwiRzqidzkx/9HpMkWvH+ITumZhFLOFCnSaWjDGlesj6nFv9LsA160Q0cqYmqO/Qi8RJR5Bq/Dalg0HTHr7H50RObip5oFxIr+IHFB4optmokUEAtoHyQ+IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780034329; c=relaxed/simple;
	bh=ipvgrDEKbelAty2m5S3d+Q0WZ2ojm3AKhtkdVbaItVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sh/Rs3fHCguV5o5i3AeLmeNgJMqP+kLOYrBuqodBBdDOQsu8frAaUibjIGRs9akxkMSAF80vQGANOHnG4SqskaC2nvGmDVOTp7muJfrOoMU6S+QITQnl7/rqH6IM+xkASQCgsPk5ze07QuGcABGQEfys4z9BO+17PSZfeGPPCW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=HeF7Nxg2; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="HeF7Nxg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780034326;
	bh=ipvgrDEKbelAty2m5S3d+Q0WZ2ojm3AKhtkdVbaItVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HeF7Nxg2ckhmJQE2iQBlzoqrZhBlxDZE6IW0gCLm9K3/RWIZtOVfqtXQYPKxVQEaT
	 ulx+ILCiqPAk1W5Sf3Ywnsx7mX54L/xMhy1dravHEkkw7hQRpmFNJqcAXGgWVx8/Gk
	 vagP5gIDUzgNU3jgQpBEyR+ebG4liCSdZCgbHMMs=
Date: Fri, 29 May 2026 07:58:45 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: wang.yaxin@zte.com.cn
Cc: akpm@linux-foundation.org, fan.yu9@zte.com.cn, yang.yang29@zte.com.cn, 
	corbet@lwn.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	xu.xin16@zte.com.cn
Subject: Re: [PATCH linux next] tools headers UAPI: sync linux/taskstats.h
 for procacct.c
Message-ID: <6263830a-1559-440d-b914-8e3aff08fdaf@t-8ch.de>
References: <20260527125034.ba695164344d2645dd055af0@linux-foundation.org>
 <20260529124410822pexFmlFsVNGRXq_DUHUmg@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529124410822pexFmlFsVNGRXq_DUHUmg@zte.com.cn>

Hi!

On 2026-05-29 12:44:10+0800, wang.yaxin@zte.com.cn wrote:
> >> From: Wang Yaxin <wang.yaxin@zte.com.cn>
> >> 
> >> Background
> >> ==========
> >> After commit 9b93f7e32774 ("tools/getdelays: use the static UAPI
> >> headers from tools/include/uapi"), the Makefile was changed to use
> >> -I../include/uapi/ instead of -I../../usr/include to ensure tools
> >> always use the up-to-date UAPI headers.
> >> 
> >> However, only linux/taskstats.h was added to tools/include/uapi/ in
> >> commit e5bbb35a07b3 ("tools headers UAPI: sync linux/taskstats.h"),
> >> but linux/acct.h was missing.
> >
> >Please let's Cc the author of both of these commits!
> 
> Ok
> 
> >> Problem
> >> =======
> >> This causes procacct.c to fail to compile with:
> >>
> >> procacct.c:234:37: error: 'AGROUP' undeclared (first use in this function)
> >>
> >> gcc -I../include/uapi/    getdelays.c   -o getdelays
> >> gcc -I../include/uapi/    procacct.c   -o procacct
> >> procacct.c: In function ‘print_procacct’:
> >> procacct.c:234:37: error: ‘AGROUP’ undeclared (first use in this function)
> >> did you mean ‘NOGROUP’?
> >>   234 |  , t->version >= 12 ? (t->ac_flag & AGROUP ? 'P' : 'T') : '?'
> >>       |                                     ^~~~~~
> >>       |                                     NOGROUP
> >> procacct.c:234:37: note: each undeclared ident
> >>
> >> because procacct.c uses the AGROUP macro defined in linux/acct.h.

AGROUP is somewhat old. When linux/acct.h is not present in
tools/include/uapi the system header will be used. In my case this
symbol existed there, so I didn't see the error.

> >> Solution
> >> ========
> >> Add the missing linux/acct.h to complete the static UAPI header set.

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>

> >
> >It has always annoyed me that we do this by copying the file.  I'm
> >surprised that there isn't a way of using the original file directly.
> 
> Using -I../../usr/include avoids duplicate headers and relies on a
> single original copy, but requires make headers_install. This aligns
> with commit 9b93f7e32774 ("tools/getdelays: use the static UAPI headers
> from tools/include/uapi").

This requires the presence of a kernel build. Which is not guaranteed
for tools/. You could put it in samples/ which is part of the regular
kernel build and can depend on up-to-date UAPI headers.

> Using -I../include/uapi/ keeps two separate header copies, which may
> cause inconsistencies when one copy is updated. Can we optimize it
> with symbolic links, or revert to the first solution?

See tools/include/uapi/README for the background of the current
solution. I would stick with it.


diff --git a/tools/include/uapi/linux/acct.h b/tools/include/uapi/linux/acct.h
new file mode 100644
index 000000000000..0e591152aa8a
--- /dev/null
+++ b/tools/include/uapi/linux/acct.h
@@ -0,0 +1,128 @@

(...)

+#ifndef _UAPI_LINUX_ACCT_H
+#define _UAPI_LINUX_ACCT_H
+
+#include <linux/types.h>
+
+#include <asm/param.h>
+#include <asm/byteorder.h>

These headers do not exist in exist in tools/include/uapi/ either.
So we need to rely on them to exist in the system UAPI headers.
This should be fine.

(...)

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

Pre-existing issue, unvalidated:
This looks problematic, as on m68k userspace and kernel disagree on
the existence of this field. This should probably use
!defined(__m68k__).

+	__u32		ac_exitcode;		/* Exitcode */
+	char		ac_comm[ACCT_COMM + 1];	/* Command Name */
+	__u8		ac_etime_hi;		/* Elapsed Time MSB */
+	__u16		ac_etime_lo;		/* Elapsed Time LSB */
+	__u32		ac_uid;			/* Real User ID */
+	__u32		ac_gid;			/* Real Group ID */
+};

(...)


Thomas
