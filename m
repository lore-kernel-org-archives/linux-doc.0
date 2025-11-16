Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E29226CF6
	for <linux-doc@vger.kernel.org>; Sun, 16 Nov 2025 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763288814; cv=none; b=lfBpmJzeEdoL//0il2jOwUyyg2zUV5nJKxthztZnqahKejtkKUluLL4IUvno85bh4X1fjH6q7yHMqSpKX9SEl5EhNr0bvHYMJ/ZdT5D7ffNxpzlsdt9u3nw6bfUQuEB2NQ6X+zFF/UtI7uPvVvsdLWeu1kl1MkMqrnu+1D+xeV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763288814; c=relaxed/simple;
	bh=clgtUYw5rt5w52t3X8HMQeTAmuK9tVYgjTAmXQ2sm5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PS0AEa05NlgKc5EXlFDn7JQW6Vmnxt4FfydtH7/S2W++QT2hPtl3woWyyx7nYH2mh7wXVZvUoRs+bUovgIAa07hbLjj2fFhdHn2KkMjsoCNHHm+DhP036FNSYJTTQ4uWXHa3FmNvfqXtRfA90X/0yReYpsfRUF5xyMhEYKzTrwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJ9rzYGr; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJ9rzYGr"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-343641ceb62so675567a91.1
        for <linux-doc@vger.kernel.org>; Sun, 16 Nov 2025 02:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763288812; x=1763893612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJ+N8G92YoM+zZXR1FORFnEYfj+H6/K38acOW4y1NuU=;
        b=LJ9rzYGrAMFm/1CaYFpKr6gsTF8Us5h+kD6wwHO1ydPJG93lMBaFoqJhzA6d4BkoAw
         ylfSU/g9eaUrgbEUcOxsMnPJKRdXYaqrRhW3b7k6AXB5ub4kk8xkQPYOARnmXrkYocXD
         Ja674JpixoNjN07iN3brXXmPB6Pl+dLDY6f27U6sxnatQAuqztK45M5dX9G0C+8ejbZ7
         DTLdKp+RviQkbyohWmimKtAnQNfoFKRx1cK27xXm2muz/iCleRr8MMo8M+jFn/n759/G
         TLta8yNDp+UdHNG3NWbFzpdIWwBxjCoRkVQ8x/i79Xdu1KOrgdiTPs5/96MsL2XGADVO
         88MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763288812; x=1763893612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJ+N8G92YoM+zZXR1FORFnEYfj+H6/K38acOW4y1NuU=;
        b=D/kLeeQVZNZsIBr2skL+AG/555tRtAmFQnduS4HydMY30HXJd20IzzeCKqYVev7zsh
         uRzg2TBmj2cdTPV4wWWYzdHCcdTDMVIgl9rwF0TV0JnZdVsKwA2gAqu/TKobmWWhGo0Z
         TXoBnNgMlAlrCD9SyXCCih0EABbUu2mfJfaCIyZtvEwz6OiTgTjk+z6zwKWUgj8ui/cM
         ILL/pE3NORPAwEx1PuiIjAWuKGIBrd5jTDIK76PsN2rJ4h6Xe+DLENLUVcwykkdmKPUF
         abxHus9zPoK5dnO0//u60Gw2bQ5uD/xkchwqVsjuoRGFHLeH+bV6Xi1R9zM1pg7RJKdJ
         ZVag==
X-Forwarded-Encrypted: i=1; AJvYcCWdJOi6Ns4+9Y9Mf0c2OYNgf7sy2Smne+2x5C+oDd3cm1orwBw3U6yLOsRUOc52h+IRogs3+wuC/R0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8bpehSyolwsrJlBGj0FydeIg2zf19OQHaKHNmMp/91UpciK+T
	E7xvCjoG7YvIKZmgqGz6vk7gC8oImrpsXrXevuDpjJb3XSBc92/yn221
X-Gm-Gg: ASbGnctdZ9g+HdANVernyGoaKGH86zX7QGjZuIWN7d+A0jmMpysTACLjoiKpfCQob56
	MpYMu1P54ifrPB3kQHKPQXyk2qHJpu6jNz4yD+TFvgtM4Fy93XgbUQALwX73mz1sdvHD4nbdyJn
	b1x3OOzonR5UD1+AfZqWNatcCVCws7HQDHC+YQyKJCkTb4rEHm6pXiR8vzx3wa1jopwBUJhYGNe
	mQc8wQ+oRP6M9/Taylq9PNDjLsCa/MLWArDEl+EooUIQmsxJTrl6/iwrh008x6pboTy+C6pVBDH
	A6mBMy0tkfabcclMBgWYVZ1KhrkvPKqrd53te//moHkbpFlKOvFN+b6PbBPCvbovy8UOlNSqQuM
	weGxMRCag255hCOL1uHZ+gujulKB1HCl2EsYirZg/VNBVwl7cfvfCEV4qbjv86J2BViZNVApm19
	w2PbAtEVoBdCwuR4zWSyCUVqtx15HLgfyWxBr5UOQ=
X-Google-Smtp-Source: AGHT+IGvPmdU+a4QAMMORvGgMNcfV1zypfuI+abDPPob8rFvWtatHU/T67rA9BzKK5Y5FB4xjsuYqQ==
X-Received: by 2002:a17:90b:1e04:b0:340:29db:6196 with SMTP id 98e67ed59e1d1-343fa74d1c8mr5752409a91.4.1763288812207;
        Sun, 16 Nov 2025 02:26:52 -0800 (PST)
Received: from elitemini.flets-east.jp ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345651183b2sm6109086a91.2.2025.11.16.02.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 02:26:51 -0800 (PST)
From: Masaharu Noguchi <nogunix@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: corbet@lwn.net,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bagasdotme@gmail.com,
	akiyks@gmail.com,
	nogunix@gmail.com
Subject: [PATCH v4] docs: f2fs: wrap ASCII tables in literal blocks to fix LaTeX build
Date: Sun, 16 Nov 2025 19:26:44 +0900
Message-ID: <20251116102644.25400-1-nogunix@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sphinx LaTeX builder fails on nested tables in f2fs.rst, producing:

  “Markup is unsupported in LaTeX: longtable does not support nesting a table.”

Wrap the affected ASCII tables in literal code blocks so Sphinx renders them
verbatim. This avoids nested longtables and fixes the LaTeX build on Sphinx 8.2.x.

Changes in v4:
 - Rebased on 62242ac51061
 - Cleaned up Changelog placement (move version history above '---')
 - Verified `make htmldocs` and `make pdfdocs` build fine

Changes in v3:
 - Replace TABs inside ASCII tables with spaces

Changes in v2:
 - Wrap nested ASCII tables in literal blocks and fix missing blank lines

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>
Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>

Link: https://www.spinics.net/lists/kernel/msg5921848.html
Link: https://www.spinics.net/lists/kernel/msg5918264.html
Link: https://www.spinics.net/lists/kernel/msg5875662.html
---
 Documentation/filesystems/f2fs.rst | 131 +++++++++++++++--------------
 1 file changed, 69 insertions(+), 62 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index a8d02fe5be83..cb90d1ae82d0 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -188,34 +188,36 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 enabled with fault_injection option, fault type value
 			 is shown below, it supports single or combined type.
 
-			 ===========================      ==========
-			 Type_Name                        Type_Value
-			 ===========================      ==========
-			 FAULT_KMALLOC                    0x00000001
-			 FAULT_KVMALLOC                   0x00000002
-			 FAULT_PAGE_ALLOC                 0x00000004
-			 FAULT_PAGE_GET                   0x00000008
-			 FAULT_ALLOC_BIO                  0x00000010 (obsolete)
-			 FAULT_ALLOC_NID                  0x00000020
-			 FAULT_ORPHAN                     0x00000040
-			 FAULT_BLOCK                      0x00000080
-			 FAULT_DIR_DEPTH                  0x00000100
-			 FAULT_EVICT_INODE                0x00000200
-			 FAULT_TRUNCATE                   0x00000400
-			 FAULT_READ_IO                    0x00000800
-			 FAULT_CHECKPOINT                 0x00001000
-			 FAULT_DISCARD                    0x00002000
-			 FAULT_WRITE_IO                   0x00004000
-			 FAULT_SLAB_ALLOC                 0x00008000
-			 FAULT_DQUOT_INIT                 0x00010000
-			 FAULT_LOCK_OP                    0x00020000
-			 FAULT_BLKADDR_VALIDITY           0x00040000
-			 FAULT_BLKADDR_CONSISTENCE        0x00080000
-			 FAULT_NO_SEGMENT                 0x00100000
-			 FAULT_INCONSISTENT_FOOTER        0x00200000
-			 FAULT_TIMEOUT                    0x00400000 (1000ms)
-			 FAULT_VMALLOC                    0x00800000
-			 ===========================      ==========
+			 .. code-block:: none
+
+			     ===========================      ==========
+			     Type_Name                        Type_Value
+			     ===========================      ==========
+			     FAULT_KMALLOC                    0x00000001
+			     FAULT_KVMALLOC                   0x00000002
+			     FAULT_PAGE_ALLOC                 0x00000004
+			     FAULT_PAGE_GET                   0x00000008
+			     FAULT_ALLOC_BIO                  0x00000010 (obsolete)
+			     FAULT_ALLOC_NID                  0x00000020
+			     FAULT_ORPHAN                     0x00000040
+			     FAULT_BLOCK                      0x00000080
+			     FAULT_DIR_DEPTH                  0x00000100
+			     FAULT_EVICT_INODE                0x00000200
+			     FAULT_TRUNCATE                   0x00000400
+			     FAULT_READ_IO                    0x00000800
+			     FAULT_CHECKPOINT                 0x00001000
+			     FAULT_DISCARD                    0x00002000
+			     FAULT_WRITE_IO                   0x00004000
+			     FAULT_SLAB_ALLOC                 0x00008000
+			     FAULT_DQUOT_INIT                 0x00010000
+			     FAULT_LOCK_OP                    0x00020000
+			     FAULT_BLKADDR_VALIDITY           0x00040000
+			     FAULT_BLKADDR_CONSISTENCE        0x00080000
+			     FAULT_NO_SEGMENT                 0x00100000
+			     FAULT_INCONSISTENT_FOOTER        0x00200000
+			     FAULT_TIMEOUT                    0x00400000 (1000ms)
+			     FAULT_VMALLOC                    0x00800000
+			     ===========================      ==========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
 			 writes towards main area.
@@ -296,14 +298,15 @@ nocheckpoint_merge	 Disable checkpoint merge feature.
 compress_algorithm=%s	 Control compress algorithm, currently f2fs supports "lzo",
 			 "lz4", "zstd" and "lzo-rle" algorithm.
 compress_algorithm=%s:%d Control compress algorithm and its compress level, now, only
-			 "lz4" and "zstd" support compress level config.
-
-                         =========      ===========
-			 algorithm	level range
-                         =========      ===========
-			 lz4		3 - 16
-			 zstd		1 - 22
-                         =========      ===========
+			 "lz4" and "zstd" support compress level config::
+
+				 =========      ===========
+				 algorithm      level range
+				 =========      ===========
+				 lz4            3 - 16
+				 zstd           1 - 22
+				 =========      ===========
+
 compress_log_size=%u	 Support configuring compress cluster size. The size will
 			 be 4KB * (1 << %u). The default and minimum sizes are 16KB.
 compress_extension=%s	 Support adding specified extension, so that f2fs can enable
@@ -368,38 +371,42 @@ errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
 			 the partition in read-only mode. By default it uses "continue"
 			 mode.
 
-			 ====================== =============== =============== ========
-			 mode			continue	remount-ro	panic
-			 ====================== =============== =============== ========
-			 access ops		normal		normal		N/A
-			 syscall errors		-EIO		-EROFS		N/A
-			 mount option		rw		ro		N/A
-			 pending dir write	keep		keep		N/A
-			 pending non-dir write	drop		keep		N/A
-			 pending node write	drop		keep		N/A
-			 pending meta write	keep		keep		N/A
-			 ====================== =============== =============== ========
+			 .. code-block:: none
+
+			     ====================== =============== =============== ========
+			     mode                   continue        remount-ro      panic
+			     ====================== =============== =============== ========
+			     access ops             normal          normal          N/A
+			     syscall errors         -EIO            -EROFS          N/A
+			     mount option           rw              ro              N/A
+			     pending dir write      keep            keep            N/A
+			     pending non-dir write  drop            keep            N/A
+			     pending node write     drop            keep            N/A
+			     pending meta write     keep            keep            N/A
+			     ====================== =============== =============== ========
 nat_bits		 Enable nat_bits feature to enhance full/empty nat blocks access,
 			 by default it's disabled.
 lookup_mode=%s		 Control the directory lookup behavior for casefolded
 			 directories. This option has no effect on directories
 			 that do not have the casefold feature enabled.
 
-			 ================== ========================================
-			 Value		    Description
-			 ================== ========================================
-			 perf		    (Default) Enforces a hash-only lookup.
-					    The linear search fallback is always
-					    disabled, ignoring the on-disk flag.
-			 compat		    Enables the linear search fallback for
-					    compatibility with directory entries
-					    created by older kernel that used a
-					    different case-folding algorithm.
-					    This mode ignores the on-disk flag.
-			 auto		    F2FS determines the mode based on the
-					    on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
-					    flag.
-			 ================== ========================================
+			 .. code-block:: none
+
+			     ================== ========================================
+			     Value              Description
+			     ================== ========================================
+			     perf               (Default) Enforces a hash-only lookup.
+					        The linear search fallback is always
+					        disabled, ignoring the on-disk flag.
+			     compat             Enables the linear search fallback for
+					        compatibility with directory entries
+					        created by older kernel that used a
+					        different case-folding algorithm.
+					        This mode ignores the on-disk flag.
+			     auto               F2FS determines the mode based on the
+					        on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
+					        flag.
+			     ================== ========================================
 ======================== ============================================================
 
 Debugfs Entries
-- 
2.51.1

