Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BF33446C7
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770648987; cv=none; b=qfyir4j73+M6x63Z1mWVrwEOOAE9AN6SsMej/c3bSSf9uQ7K9SjAi6D1Dxsa07Tnbvc/nBCCWXultrTHYp9w4r5lQYnpBO8dPIfnjOFkfwSb/AbtHG+v+RdQgpl4Ro4T8RJ7p6QsiSv5u3/9enAN2TTccwi8wP2aYWtfa7s/GuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770648987; c=relaxed/simple;
	bh=w5fg8R5bRexavkpGFdyth/M5t9vS5r8b/nDimyTxroI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QcoynW8stx+qPX5cPyWTRLrjnfYyfi92G1xRuCb60lZy3G7d0P6ACsTRKPMyicwqWf4Hyu5QSTofU2bQVNrHt7aYtl5V/P+Gd8gkfDvLQPN4d/UzIQP4iHpr8aqRl8jgCOWWQ+cSpqOrp4FCgGLdx6ksPwIEibgtryeoqi8ZpSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ca2bFP63; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ca2bFP63"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-823081bb15fso1538734b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 06:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770648987; x=1771253787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hWcBvSDIuanvdGG8hK0w4PUAsRvRha3/h7urmdr6y1E=;
        b=Ca2bFP63+bmZERMrNi+YjZxTnYznBMOrLlxPnUTQ83vNS63zDCeDDqkLEqK81Z2Ebe
         5Gzy/eb2j9jyW5lbuyaq/Rks/V9gCGlbQtb0aNL7HFLGvnN2fiMBiEI5p70COKSwi+oC
         4/nYbSgdsSSQWyENcjaKn3EbIJz/akyBdcD1jD0EmllcTgx5MiUUZ5TZs4LkKHu2AYvD
         ZmLypqqMSEXcEDkPnR8BSIlh4Wgs6OcoaL5LeqLlFs8km+n0fpeXPr9nSwZh/yYt5e2D
         d4qvWFTXPWc5HsWfznoaojOFLEcecnBgAla1A1pzmVTeHP5jwCby0yCCpOUDZGaL1Lgi
         mhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770648987; x=1771253787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWcBvSDIuanvdGG8hK0w4PUAsRvRha3/h7urmdr6y1E=;
        b=NR3wF5fcfo83PlZJfyrCJwDq3KbEoxo9VLquP+qPhgMnEb7xM9JXIBj4wxNNyBV8s+
         C+dxya5G2IJ9Qud9CZeD7GiW7QqEfgCRNDV49FUWspy5SGLZjmgKPbhKeNjcvKgm9U0f
         z6zoKv6WXYkIpbeUGU7SZ81J8hPUCIh+JLEbPtSBQidgCe1Bb0tiXSbjdkwJsgPDlJod
         D8HE1iEXKy2G0IYkAuxYuohaDTUAk1IxDHS23XkeqcCOBGzDCKgZNy9CT+VOnKjqqtrm
         NAsTyhScHVryr12NECYzRZkK6yOkDbsEIE/Ms6Zi5PIK6YwSLTEbn43K65lc7Z1AB/gP
         6lfA==
X-Gm-Message-State: AOJu0YySUJYtbsxDmw1AEGb91YHOgna1WP6oNX3DYdn9Kf0yBRPi88J/
	J42j3K1RipmNGOvgyyOqnEvlpWgmrzmPhWucJ0bofSrKRq0ZMPKoo1rU
X-Gm-Gg: AZuq6aL3D8JJm5bJ5hgOxpdhklYcNRNmy8TpFSWkAnUZNKrJlhXJuf1utgz25zbB6JU
	FmbYjteqlcuyW+QIUFecrQdkJ/D4UpcSFcYOq4RdhIyfOG8/dn1X5+2lIQcGrSRb35rGMwbnDYt
	JhNdWXPYtNW6Dt0y6ytCRcYsIxEGipXW7tx7zBRzoiwjH8zSfb6Ewtm1NxAwapvx62c1yqIpf9y
	8szDFO0ZvqinSaFVIXiApvOD2igvAOdmjOzyF0OjYmYaAlIxlG9reGZUvwMW3A4PeHogA1uIWfV
	3GZsTE+8a4yHTTAJppybev5PrFWOYxqnz9D9ziLqTYt32pRry5qBUDFTXkordsVGCY4yonAL81v
	7kPbGywu6rngO2bR/K2jI6bsXkLcAPpX14WjAS+wuBcZecpnLddXB+YoxA/K+RCWxzX+SKCA87B
	2jzQqEM5mlW+PXN4FDCBcQssOzfxBa88ZqpLsx38mdl7dP2BA5g4+7J/EjFjEgcDQdGDn1pVf2j
	g==
X-Received: by 2002:a05:6a20:7f8c:b0:35d:e4b2:b389 with SMTP id adf61e73a8af0-393ad366d00mr9773794637.58.1770648986687;
        Mon, 09 Feb 2026 06:56:26 -0800 (PST)
Received: from localhost.localdomain (123-194-188-82.dynamic.kbronet.com.tw. [123.194.188.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb61e4a1sm9193974a12.27.2026.02.09.06.56.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Feb 2026 06:56:26 -0800 (PST)
From: Min-Hsun Chang <chmh0624@gmail.com>
To: corbet@lwn.net,
	akpm@linux-foundation.org
Cc: linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Min-Hsun Chang <chmh0624@gmail.com>
Subject: [PATCH v2] Docs/mm: fix typos and grammar in page_tables.rst
Date: Mon,  9 Feb 2026 22:56:03 +0800
Message-ID: <20260209145603.96664-1-chmh0624@gmail.com>
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
- Correcting the possessive "Torvald's" to "Torvalds's"
- Fixing "instruction that want" to "instruction that wants"
- Fixing "code path" to "code paths"

Signed-off-by: Min-Hsun Chang <chmh0624@gmail.com>
---
 Documentation/mm/page_tables.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/mm/page_tables.rst b/Documentation/mm/page_tables.rst
index e7c69cc32493..126c87628250 100644
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
+the fact that Torvalds's first computer had 4MB of physical memory. Entries in
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

