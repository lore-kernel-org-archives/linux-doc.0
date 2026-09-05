Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CF312CDBE
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 02:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788575003; cv=none; b=J5TNmQtTsAV6A0xQqDw+WYis4/zVRQkdpIFQFgVDvF9PlsQw4SBq3x3ilxvaOKgifAFczkjg9GsGBAHviHWMbN/gURZ0H2P3/BQo6VrgIGxTgzQvGKFn7HA+zD6qtZvLc/CL+V4BtroQKD0Ri+NkFHZil33cmeEQ9eo7XxLhiIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788575003; c=relaxed/simple;
	bh=xyGZM56EkT54TGlWSx3gPzxQTJvAGCoe1g3KpghWzoo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ESZOEL6F7j+tfnP101BdiCEZtkKLAGXAduekYKms0yoZmda2jf6+TENmPkXoNV5y8OKbeKzvonPxZnMGWz9CffcHN+t/IEspfcyGfGg1bB+01mVUStvegEGJslo5zQ7baLmYjvaXec5HgTytlUcKn1MG9tMc5jMk1byyohTAs9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X91mZV1l; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X91mZV1l"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so15666165e9.2
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2026 19:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788575000; x=1789179800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WbfEpisKez36CFmA1of7zehX26ip3wI6pp+HshpNatQ=;
        b=X91mZV1lQkCK/Raq/UHmqE4StUfHMKW7I4Li7ESBy++2peIAcDycsNGvhQDnUUwQsE
         p9fjI3btIaMesOdiD7vikEmuDSLA0HiWGQX6VmU3upXiOIV8tjbCFbntdHpzu/jLecDG
         MilZuBYsF8NIqfPjDhT9CZ3UqvO8u/i2xksYHLWm8ReIfzQZPjLWcdIrAlRAuyEPljv8
         Bqbp7xJc7WPooquuhN3ov4dsJ47K0rcyZAe+3s3lM85/EgnkHC+Tlr0EtrI3lQ+2AYJ6
         VlNM/xCAMK5WkH2bUbWpWAm2i+SvKdKB4MUgLs7NKBNxbzN+s/CrR7Isk6Hrh9ITuhfZ
         fG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788575000; x=1789179800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WbfEpisKez36CFmA1of7zehX26ip3wI6pp+HshpNatQ=;
        b=NoGzreXRWuLkemAWKyD7Pa7USYQzoG2vqnHn0i2NldpRE4GvqvnpQrySzVjdiUtqil
         /PQozYhSIdr0a8O+9pB7VHvhw8m8hwQkLC9Y9/qb1VBtxuktZNarue4qU6lm1s2oTxqk
         LNmcZ0iE5UX4sMthAhQH1AYK2kjHVmtBmKCxjDqIl8SAFS1MH7a3asR5pDpzEgEPUt2q
         GYO8iozuQ+VLF3pXFZvCUmnT7mMGrRf0d0KhnQ2LVKGq0mO78MqGhEtGsNASW2137mPA
         i5ohaCa4P8CQdEOrgO/rbsFQlUAVZK2f9Lsgc1TfrkTFlqHXhtETZZiJkXvyhaS+xZ4c
         dflw==
X-Forwarded-Encrypted: i=1; AKwUvBxH6NnVE6mTJvkjWGynQVsNAAIgbBi0Ri334En1vVF7g0xK8DMtdfuNwqhuWeFD5vg0kO9j6CWTURo=@vger.kernel.org
X-Gm-Message-State: AFuF++niy+wZLzsO+c9CRgMJPQcxr7OHGwROyd14DUqOFC6W0liCLIeD
	3YTQyRLVZMkFnAQQu+vM9wqgnKFFPwSJrMXGrn89Rl8QMAW1et24O20U
X-Gm-Gg: AYBFou0UWV2oY2kwUbg+laGfotElDNRdvgItTeFavmaZvJQzPoskm8YUb7R8/m2Xcc7
	bj/QctdpZMJkQygAeX5UI1ivlKWFCICbqwF3pT1v8cd5DNj2YeH3fXPdkWFQQOezOtCWvhSqVqF
	p6lJcJIpw/LXOSnSd5Yfqsx91zNYSz+1CteORu9/Bu5GobzrijOycwmQCqVfZwbuRLNxh/Q7ZYU
	+D1Z8RkFwHP9YcwidsomuuHBbNLeqS14yByNAoFM4zVhC+/8qOM0kBFZkBufQcnbcCvwYak0bz/
	HNMsBJuYF/EUAA8Y6UZOY1tP3YcnyuPaPSqTwj3sSAxmhIGC0p1Xo6wKJ8dU+QsD2ArhrC+PtOW
	IV6Hon5RSOe8pIICbvvLliRwb6sipRMkKSp+G4kh6QmCuJHiqN2czrcpFm8SLUrSxjOYgFezyR8
	iCGxKlrB3C0jYmwwDlR/jAEE0CTjRYp9mQ7H0PNPmff0nOA7EvYHTtdUh5fnpd4MpskARmVuy1R
	EWZ3gTKXdjAgWw2ZJsvjqUP2OerIX99LvQl8tVvEL+OKeEL0r1y5kgf+SQu1+Lzw1YtiBSSB92t
	+pEmkhPHnU0DQdcBudmZvsi+ER9iksGea+Jr+3EuLPAuyvSsXbpWhQ1VAeIN9e0rsI8BIJpMLNm
	txQ==
X-Received: by 2002:a05:600c:5487:b0:49c:fc6c:bdfb with SMTP id 5b1f17b1804b1-49cffee2ee2mr35144485e9.18.1788575000385;
        Fri, 04 Sep 2026 19:23:20 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c81c3sm9696996f8f.26.2026.09.04.19.23.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 19:23:19 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pierre Ossman <drzeus@drzeus.cx>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: core-api: Fix the ISA DMA example
Date: Sat,  5 Sep 2026 04:23:10 +0200
Message-Id: <20260905022310.82529-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The example never matched the ISA DMA API: the functions are named
enable_dma(), disable_dma() and get_dma_residue(), clear_dma_ff() takes
the channel number, and claim_dma_lock() returns an unsigned long.

Fixes: ddb99f3d35b1 ("[PATCH] ISA DMA API documentation")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/core-api/dma-isa-lpc.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/core-api/dma-isa-lpc.rst b/Documentation/core-api/dma-isa-lpc.rst
index 17b193603f0a..296838ff295a 100644
--- a/Documentation/core-api/dma-isa-lpc.rst
+++ b/Documentation/core-api/dma-isa-lpc.rst
@@ -115,17 +115,18 @@ sure that all data has been transferred.
 
 Example::
 
-	int flags, residue;
+	unsigned long flags;
+	int residue;
 
 	flags = claim_dma_lock();
 
-	clear_dma_ff();
+	clear_dma_ff(channel);
 
 	set_dma_mode(channel, DMA_MODE_WRITE);
 	set_dma_addr(channel, phys_addr);
 	set_dma_count(channel, num_bytes);
 
-	dma_enable(channel);
+	enable_dma(channel);
 
 	release_dma_lock(flags);
 
@@ -133,9 +134,9 @@ Example::
 
 	flags = claim_dma_lock();
 
-	dma_disable(channel);
+	disable_dma(channel);
 
-	residue = dma_get_residue(channel);
+	residue = get_dma_residue(channel);
 	if (residue != 0)
 		printk(KERN_ERR "driver: Incomplete DMA transfer!"
 			" %d bytes left!\n", residue);
-- 
2.53.0
