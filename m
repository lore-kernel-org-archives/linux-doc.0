Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD3C22BAC8;
	Thu, 16 Jan 2025 16:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737044548; cv=none; b=n7HGbhLcVU6QPP8LK21dzuv0eh/guws7LRqU2xD0LyXjv5cy2o0SPQi+fBMfAztLSyx7zgPatxIGjsTBN8iCjPv3Rw7KDG816YK71/DSX79ctj52bp82MRUWiCTl7jgN/1uYdanlWZ5m8bnqLRDSJzOCNbhD4QMnIzrGz82Re20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737044548; c=relaxed/simple;
	bh=Lqr/SSVqZVMVCbBtPVw8VymWQ72FmCTUTj7/4bPShsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sW/Cl9Zv5JtdsMOYftEG50InksGECU5RZ0IMU6mzvm029ZM73/hTZlW3cNWuSkEfaMe5lRnChWZcv+X2YyHsed027AwvDk7YFJJPRgYRQdCJBQReiE9DjGAcKymOlvzoAfBnk6cGlbQOc24WISqFLoJkCMgGUB7FL2eqTjd3mAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=K4dEGsD1; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="K4dEGsD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=zVh3y
	bnqxuKyHojWLHl9VHU10Wl90lnLDt9ijksRbmQ=; b=K4dEGsD1WklvcpeQVhdfe
	2AIjuc/VHc7OWV5jsUjsOtV+bo9crGzg3jdUtYZjTuBgrdOsMmvbjFdZX94+FuWq
	0FJZfovXsD80UAWKyQ06dvU7KTTp+Yjp4yQwHHefHwXUMGuT+XNALvi4bI9LlVgE
	6JkJjmZH7+kKVnIwtBAZag=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wAndRz1MYlnLGZ2Gg--.56956S2;
	Fri, 17 Jan 2025 00:21:15 +0800 (CST)
From: Jiayuan Chen <mrpre@163.com>
To: linux-doc@vger.kernel.org,
	rdunlap@infradead.org,
	corbet@lwn.net
Cc: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	Jiayuan Chen <mrpre@163.com>
Subject: [PATCH v2] docs/arch: remove deprecated function name
Date: Fri, 17 Jan 2025 00:20:56 +0800
Message-ID: <20250116162056.186121-1-mrpre@163.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250114094832.350073-1-mrpre@163.com>
References: <20250114094832.350073-1-mrpre@163.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAndRz1MYlnLGZ2Gg--.56956S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr4fAw45XF4DCr4fGFWruFg_yoW5KF1xpr
	ZxGas3Jr4DXFy0v34jvw48Zry3Aw4kXF15Grn7Kr15uwn0qwnIvrW3KF1avFyj9r1rtayY
	vr90vr1DWws8AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piX4S7UUUUU=
X-CM-SenderInfo: xpus2vi6rwjhhfrp/xtbBDwXWp2eJLJBUhQABs5

The dumpstack.c file has undergone many modifications, and the
print_context_stack() function was removed or rewritten a long time ago,
so it's better to remove the incorrect guidance.

I also want to preserve the original contributor info by keeping email
adress and name.

Signed-off-by: Jiayuan Chen <mrpre@163.com>
---
 Documentation/arch/x86/kernel-stacks.rst | 51 +++++++++---------------
 1 file changed, 18 insertions(+), 33 deletions(-)

diff --git a/Documentation/arch/x86/kernel-stacks.rst b/Documentation/arch/x86/kernel-stacks.rst
index 738671a4070b..f780f4b09761 100644
--- a/Documentation/arch/x86/kernel-stacks.rst
+++ b/Documentation/arch/x86/kernel-stacks.rst
@@ -112,41 +112,26 @@ Printing backtraces on x86
 ==========================
 
 The question about the '?' preceding function names in an x86 stacktrace
-keeps popping up, here's an indepth explanation. It helps if the reader
-stares at print_context_stack() and the whole machinery in and around
-arch/x86/kernel/dumpstack.c.
+keeps popping up, here provides guidance about it. It helps if the reader
+stares at printk_stack_addressk() and its callers and pay special
+attention to the 'reliable' parameter ('?' basically means that the
+address is unreliable).
 
-Adapted from Ingo's mail, Message-ID: <20150521101614.GA10889@gmail.com>:
+The detail about '?' can be found in the comments within dumpstack.c:
+::
 
-We always scan the full kernel stack for return addresses stored on
-the kernel stack(s) [1]_, from stack top to stack bottom, and print out
-anything that 'looks like' a kernel text address.
+    /*
+     * Scan the stack, printing any text addresses we find.  At the
+     * same time, follow proper stack frames with the unwinder.
+     *
+     * Addresses found during the scan which are not reported by
+     * the unwinder are considered to be additional clues which are
+     * sometimes useful for debugging and are prefixed with '?'.
+     * This also serves as a failsafe option in case the unwinder
+     * goes off in the weeds.
+     */
 
-If it fits into the frame pointer chain, we print it without a question
-mark, knowing that it's part of the real backtrace.
 
-If the address does not fit into our expected frame pointer chain we
-still print it, but we print a '?'. It can mean two things:
+You can also get more info from Ingo's original emal [1]_
 
- - either the address is not part of the call chain: it's just stale
-   values on the kernel stack, from earlier function calls. This is
-   the common case.
-
- - or it is part of the call chain, but the frame pointer was not set
-   up properly within the function, so we don't recognize it.
-
-This way we will always print out the real call chain (plus a few more
-entries), regardless of whether the frame pointer was set up correctly
-or not - but in most cases we'll get the call chain right as well. The
-entries printed are strictly in stack order, so you can deduce more
-information from that as well.
-
-The most important property of this method is that we _never_ lose
-information: we always strive to print _all_ addresses on the stack(s)
-that look like kernel text addresses, so if debug information is wrong,
-we still print out the real call chain as well - just with more question
-marks than ideal.
-
-.. [1] For things like IRQ and IST stacks, we also scan those stacks, in
-       the right order, and try to cross from one stack into another
-       reconstructing the call chain. This works most of the time.
+.. [1] https://lore.kernel.org/lkml/20150521101614.GA10889@gmail.com/
-- 
2.43.5

