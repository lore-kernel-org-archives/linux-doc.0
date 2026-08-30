Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957563B47E2
	for <linux-doc@vger.kernel.org>; Sun, 30 Aug 2026 16:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788106355; cv=none; b=r0RKaoYl4efzzN6G4Yc7z4lGNYLSljdTTVCUhf4z3NctprGGqc1v5WLOD/BxSsBZhQX+yzbz46KzFBVQrk0/fXnfWWP3e1FTIizCVlraC05hn4b/TcnbqNenJBquRkcwHTQTOGn9KSzpRv2Nu2fQWf39jtkSM/fuCYhLcbZV2Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788106355; c=relaxed/simple;
	bh=9DJZMB7UOJGJmvWQBrhA3BWiZH+aupD6L+/YhsXD9T4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n332hrhnftu9tiBKY5h+3uJkHCzHU1KdjnXd65VF4HVDFyxcU2vWr6+GSDHsAa3Xx5Vu0cXBFU1K8RI8He7xPO41LiKnKfeziU73uzvzksqiurewBlDHiD0YxhE0oQmMag/71R9yWecKMWkTMR4hCf1ExWfnnt0wt6TDWegEih0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwpDsnls; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwpDsnls"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398e9698a70so23259a91.0
        for <linux-doc@vger.kernel.org>; Sun, 30 Aug 2026 09:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788106349; x=1788711149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oPpwMsCahf6JtLGhYR2mgNDmu982ouZaUg+WHl9e+M=;
        b=EwpDsnlsNhcPubF9v5YWvGR1JdL0FHlkcQp0CsLQopdjjKRI+TOZ/BYZhH14FaBxmK
         cgyOZGSEiwOyfhT4lb9L/Ta3lDzeA/xdSUnmqHcBuu1V+PWQnUEJej63DH00aT0KghCb
         I6s8e2EsK/ww5XFn6ruKzHxy2ZyPT6J1/CvosFHaeZWJjg7QLxjDR+O5+H7E5QTVUueD
         rlqlBs9jy4LPr+bh4sXjNm8V1vhNOmDa34NcfR+/4fIxFu0rJqYpUP6WlfRhPeSZTaEP
         O/TMIhMIx0SgNVEtsnysD1FvQ9Q6YVkZ6UZjPbCbzmjpkswUNb5qLYq6uIucvijWNYc0
         bqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788106349; x=1788711149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3oPpwMsCahf6JtLGhYR2mgNDmu982ouZaUg+WHl9e+M=;
        b=H86RXFtfbNrpqTOGzYNL3VeIjJ3uQIWeJMwiYDw0TeVqnAuWb1pr63F0rtBLw/iM1l
         bs3EIxf9X6gIBr2SeCL5iKUlcsHIU5g9RfiIo0Sm6I3lXig62RQ25/pVUZ6yf8EWeSMS
         n7CchFZiXK+xPMNBQv9r6YXwSs3dirfiec8jxvnCXZQIKUTUFg4hIOXgRojnBXmFIsca
         wCnSsLH3HBWU6YvQuHd1r4C7Sp4oOCXwc/pjonAysZSJrBzdE6/yfWApcJ5EySaksutJ
         dCR8BtwJ13R4+7LvA+3ow9PQBJ3TvkvjHhCczeA2SYthUwHqD1MlN6CM8EcqLIVEGTbz
         8nAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOV1BV4/9Ozg+QnIGmzms6Tg1wfBXM49x86pK0BCurJz4jSvaX51nWIxIj0Nb1bBXTxlbO57yN71Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mjrFs/cSHnx0RoravV9Sb64fNAtMkNMNtqWk4S5i/K7LHyQPoM
	w3mwwXiGYYKdSFcgLYwWNQyYBINIVNcT0i3Vk9YyidbGeRe7xx4VTTLt
X-Gm-Gg: AYBFou1wj4ZVwsHH9Xs5yDqQV4vHLRrOJzYgXIB8Tm0DWssLDCaYvyyFB76li1HetwA
	32Ml3MyJuXtnUJXFscuOzmtspU538owr/TW78hHAA9CQnwG87VfzNrkBrMjt5Z6kY+DsIcABaQE
	i6wyWhYHNDIqtAXUh25PbOQ+GdV2vtz2/H8N5lAQ+Pn6GKvhKv9LTxUeG1EWUTmU8WnmhEDWQnJ
	NDUjeQPdmwAbukuP0Ukcsjq8GRHhP5ZCBWhQPq9ZP5HB78r2cHkTjVMjYMXYVmLHoMJapfOzNHu
	+oqgL5q03JZzaUJz2H4z+cLoHfPs54bnrrxUj5TVzmeS2DOnKo71SAqG31QzxoVQMHRPI1noVui
	MTRZS8kbYMyhBrKG9L8zWBn5Z3lqyA4V8o46n55V3OYejQM/7PEjEAxVP0F5JPMgwAkTFouWtXW
	18D4V8ontCWi+OUF0a0ahTX7NarksQHRBTjKJB/224FtdyFn3Zp7NiVZ/WiHP4daUnBMu8c6d/W
	F7aOaPZ30urW0t2OCx9v54zlskcFMSTvMU=
X-Received: by 2002:a17:90b:3ec1:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-396d0f2dcd8mr23466138a91.10.1788106349495;
        Sun, 30 Aug 2026 09:12:29 -0700 (PDT)
Received: from localhost.localdomain ([134.195.101.83])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm5719005eec.1.2026.08.30.09.12.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 09:12:28 -0700 (PDT)
From: Yu Jin <lambda.jinyu@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yu Jin <lambda.jinyu@gmail.com>
Subject: [RFC PATCH 1/2] docs: riscv: document the Sv32 virtual memory layout
Date: Mon, 31 Aug 2026 00:12:04 +0800
Message-ID: <20260830161205.80162-2-lambda.jinyu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830161205.80162-1-lambda.jinyu@gmail.com>
References: <20260830161205.80162-1-lambda.jinyu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RISC-V virtual memory layout documentation describes the 64-bit
paging modes but leaves the Sv32 section as a TODO.

Document the rv32_defconfig layout and clarify which boundaries depend
on the configured size of struct page. Distinguish the maximum direct-map
range from the portion backed by physical memory. Also explain why the
34-bit physical addresses encoded by Sv32 page table entries do not make
all of that address space usable as RAM by the current RV32 kernel.

Signed-off-by: Yu Jin <lambda.jinyu@gmail.com>
---
 Documentation/arch/riscv/vm-layout.rst | 28 +++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/vm-layout.rst b/Documentation/arch/riscv/vm-layout.rst
index eabec99b5852..8e1447cf574e 100644
--- a/Documentation/arch/riscv/vm-layout.rst
+++ b/Documentation/arch/riscv/vm-layout.rst
@@ -16,7 +16,33 @@ RISC-V Linux Kernel 32bit
 RISC-V Linux Kernel SV32
 ------------------------
 
-TODO
+Sv32 provides a 4GB virtual address space, with the upper part used by the
+kernel. Unlike the 64-bit layouts, the kernel image is part of the direct
+mapping. The following layout is produced by ``rv32_defconfig``.
+
+::
+
+  ========================================================================================================================
+      Start addr    |   Offset   |     End addr     |  Size   | VM area description
+  ========================================================================================================================
+                    |            |                  |         |
+           00000000 |    0       |         9c7fffff | 2504 MB | user-space virtual memory, different per mm
+  __________________|____________|__________________|_________|___________________________________________________________
+                                                              |
+                                                              | Kernel-space virtual memory, shared between all processes:
+  ____________________________________________________________|___________________________________________________________
+                    |            |                  |         |
+           9c800000 | -1592   MB |         9cffffff |    8 MB | fixmap
+           9d000000 | -1584   MB |         9dffffff |   16 MB | PCI io
+           9e000000 | -1568   MB |         9fffffff |   32 MB | vmemmap-sized reserved area
+           a0000000 |   -1.5  GB |         bfffffff |  512 MB | vmalloc/ioremap/modules; BPF JIT uses the last 128 MB
+           c0000000 |   -1    GB |         ffffffff |    1 GB | direct mapping of physical memory
+  __________________|____________|__________________|_________|___________________________________________________________
+
+The layout before ``VMALLOC_START`` depends on the configured size of
+``struct page``. The direct mapping row shows its maximum range; usable RAM is
+limited by its mapped portion and the 32-bit ``phys_addr_t``, despite the
+34-bit physical addresses encoded by Sv32 page table entries.
 
 RISC-V Linux Kernel 64bit
 =========================
-- 
2.43.0

