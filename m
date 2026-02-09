Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A6B33C19E
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770624811; cv=none; b=fQqPn5qQjCemrEgRLRW+PKuCTMYRU+HWfOuKOHehiJQYd15YQgoFAV+Fq8vJ3ddeEuhM866SWcVKTZUpQkVei6bekkTDv/aCE+yMa20PYeEKJZR8+kAO7zQ3V+Vd9+jptzQeNlvc+TN4XKVPUiMzSePct7D4oD8bEiR5IMU4Rks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770624811; c=relaxed/simple;
	bh=Q+TmxulfMcavgr+JesAtNFoH4Xtiev43+iyad3YhA6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JhzMhsEL4kXQkWz6V1hCf/yjdmXSD6vuDU6amcGgeaGGR0DNu361TGfN7sntyo1oogiM6gkFhc69pR5vGVRW2P7P77TT9BOgIqU0QKT/PkeCZ4zeJokU0E4f8bevUNdoCZT8atNHQsjtm4ChPLVptCP7bsnfddSu/Qoy6oQWeuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IoFde1PB; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoFde1PB"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2aadac3e23dso5001375ad.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 00:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770624810; x=1771229610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u7ECsemPt0+8hrEaXFS0vyfUJpZDXufVX7a966wW9n4=;
        b=IoFde1PBRGATcmLZexFmGdKT48OSkODkaGR6biP47Vdjof/rtWJpLMPhM22kwzQcCI
         WJb1f22LVXZ3p0A1va0EAg5Yr3oPkxdLJwKgQ/pXP+lzQo4oiHiThvx51i/mnjqhZ2pv
         x9rl5JoyH0YFS6qsYgTXjQBRuRtODMxLUVAOiI14m75u31udeXVHVsDxkqgDkYYHUqyg
         X+W1iWAgNIynb4SN5pRoIrEfLXQgnZX+kT0BKlv8z13CZL2S66VWlUigA7Cr6jA38cCw
         uh2p5e93uBEr/oaysqIVVZATIElKHrQrng8ndM5G78NsexMn4rJVqcm6k8MsgzZ0rqGV
         SdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770624810; x=1771229610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7ECsemPt0+8hrEaXFS0vyfUJpZDXufVX7a966wW9n4=;
        b=Tx4fu+t/lC+R30YHeLV8na4daLYEVcsNdSeMV0GPB1p820t0xF8OFHKTq4XzYVGKV/
         WZOGa2dxu2wWLQ3igdnKRc724P3L8D/uxRztC+nQO7RE6K6iYpDXkzoRMK4tEUOA1Yk7
         Y+w0L1C7AI7Dl4saiVuxsg+2uY1/e0LvHUoVErBVMw9hCmN6XdrfHUH9OHBdznMpnxV0
         jhr5RY4D/nTNoDDTKh7YHR9b84BeGDV5gCueFG0wuQ4oRJigr/kES+FhCntvpVyjd5cT
         NlYKvZPma9JIRW2DSJnSSDxmogT6TCWWYcqe49FW5RhdPbLdwjMlTfGUJoJyEvlBLmN1
         L6rg==
X-Gm-Message-State: AOJu0YxUpYGB+03LyZKR1lX/T0QksI915VyCszOxSfljDNN/hRCFHd56
	st7L3HsEwYTpGpHwjQwm4r8WpMIZugi595wn+e6BKnJa0kl4yKMWevSY
X-Gm-Gg: AZuq6aJrp00bIsIPgB7de7YWHYypXM0CGJ8+z0zIfR861t7gQvA7QQspDBIQ6LVjB7a
	ukJUsBxR1JRmt6y+2mIL0/xI3Jg/OJ7sHrvBinMMKhdfhgis2FyPoNbeGwMnNA36ERJMytCGiJd
	KVes03CFbXTOAyLzMc5qeMo+EgKXj4qjCD/YKzwhTbHHMIIvsrfrpyIz+/EihL3RMkKmMRHy8oM
	n6Oe4IkfauzTaflyIFaWP7VAGUL0mHSqY9KIF4LAVkJgk6pvuMyGzEjin7In2EdinRTnpc7O1Lc
	CEDf+AoOOU2LcMzvxu+4FnJvIt/XUsOMU3whGA5wLsOW46YMxAFHe1P5/SpUVWheYncNPZaS250
	8SIw2Oiuo034oGuCJzZP/90NOa6S7KsB9j+oTPDmPs0p6urGK7vl3UFjhn2ytn0FdYdJ+7tuzYm
	OYXRPGWn2XY5mAbZgFQVBwRWyiArU4PSYvuJjFdL0HbpKXZ0BseyjWTPHMWPYMfaZYdORZyeNLr
	g==
X-Received: by 2002:a17:902:f681:b0:2a7:80ac:85b0 with SMTP id d9443c01a7336-2a9516089bfmr97678645ad.2.1770624810288;
        Mon, 09 Feb 2026 00:13:30 -0800 (PST)
Received: from localhost.localdomain (123-194-188-82.dynamic.kbronet.com.tw. [123.194.188.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521f8cb6sm101205775ad.79.2026.02.09.00.13.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Feb 2026 00:13:29 -0800 (PST)
From: Min-Hsun Chang <chmh0624@gmail.com>
To: corbet@lwn.net,
	akpm@linux-foundation.org
Cc: linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Min-Hsun Chang <chmh0624@gmail.com>
Subject: [PATCH] Docs/mm: fix typos and grammar in page_tables.rst
Date: Mon,  9 Feb 2026 16:13:23 +0800
Message-ID: <20260209081323.68339-1-chmh0624@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct several spelling and grammatical errors in the page tables
documentation. This includes:
- Fixing "a address" to "an address"
- Fixing "pfs" to "pfns"
- Correcting the possessive "Torvald's" to "Torvalds'"
- Fixing "instruction that want" to "instruction that wants"
- Fixing "code path" to "code paths"

Signed-off-by: Min-Hsun Chang <chmh0624@gmail.com>
---
 Documentation/mm/page_tables.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/mm/page_tables.rst b/Documentation/mm/page_tables.rst
index e7c69cc32493..d5a2c37b05e4 100644
--- a/Documentation/mm/page_tables.rst
+++ b/Documentation/mm/page_tables.rst
@@ -26,9 +26,9 @@ Physical memory address 0 will be *pfn 0* and the highest pfn will be
 the last page of physical memory the external address bus of the CPU can
 address.
 
-With a page granularity of 4KB and a address range of 32 bits, pfn 0 is at
+With a page granularity of 4KB and an address range of 32 bits, pfn 0 is at
 address 0x00000000, pfn 1 is at address 0x00001000, pfn 2 is at 0x00002000
-and so on until we reach pfn 0xfffff at 0xfffff000. With 16KB pages pfs are
+and so on until we reach pfn 0xfffff at 0xfffff000. With 16KB pages pfns are
 at 0x00004000, 0x00008000 ... 0xffffc000 and pfn goes from 0 to 0x3ffff.
 
 As you can see, with 4KB pages the page base address uses bits 12-31 of the
@@ -38,8 +38,8 @@ address, and this is why `PAGE_SHIFT` in this case is defined as 12 and
 Over time a deeper hierarchy has been developed in response to increasing memory
 sizes. When Linux was created, 4KB pages and a single page table called
 `swapper_pg_dir` with 1024 entries was used, covering 4MB which coincided with
-the fact that Torvald's first computer had 4MB of physical memory. Entries in
-this single table were referred to as *PTE*:s - page table entries.
+the fact that Torvalds' first computer had 4MB of physical memory. Entries in
+this single table were referred to as *PTEs* - page table entries.
 
 The software page table hierarchy reflects the fact that page table hardware has
 become hierarchical and that in turn is done to save page table memory and
@@ -212,7 +212,7 @@ threshold.
 Additionally, page faults may be also caused by code bugs or by maliciously
 crafted addresses that the CPU is instructed to access. A thread of a process
 could use instructions to address (non-shared) memory which does not belong to
-its own address space, or could try to execute an instruction that want to write
+its own address space, or could try to execute an instruction that wants to write
 to a read-only location.
 
 If the above-mentioned conditions happen in user-space, the kernel sends a
@@ -277,5 +277,5 @@ To conclude this high altitude view of how Linux handles page faults, let's
 add that the page faults handler can be disabled and enabled respectively with
 `pagefault_disable()` and `pagefault_enable()`.
 
-Several code path make use of the latter two functions because they need to
+Several code paths make use of the latter two functions because they need to
 disable traps into the page faults handler, mostly to prevent deadlocks.
-- 
2.50.1

