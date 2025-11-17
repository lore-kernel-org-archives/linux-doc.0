Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2274731D756
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 12:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763382486; cv=none; b=VAuoem6u8HL/OJxm2iuzG+A/O/apqGw/DNA7VG6lg7HiBwG+nNJD8iqHnu5zaVyxryUEmJpjpljbXZJE0DlxXo64yNItM91R73G12P1v+57BlkfroKVnfBktxCOv7IA93D1wSUty4nMT+j7aQY0v+IjXvCC3kMnnOrxyzRPffxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763382486; c=relaxed/simple;
	bh=KemoD6CyOf/MF3W1iBVO0Gc16lK80LE9a13RkNc1XQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t5r+lPHBWnszEoEr2ebYFDLKDa/xv6Toam3knEwvq+p/GPIze2BKAoDs91MgBpsjnGh9BeLKTRwl8fCMYELzgHeoLyQW1TeCGiCvchWvNoaJqWHBEphNqcavFBZ/6EmgZWNLxHkaGiLgUZIa677I3ctVXMXNV3VnCpRbbXRNmNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZVlA0iZ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZVlA0iZ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2960771ec71so7596275ad.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 04:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763382484; x=1763987284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BxFwABS4E9AqqW3H7WCXTzoCQXbQOjdnmgdZA6SbR24=;
        b=MZVlA0iZ1w7fsq8ACH7FFMRU4+2RLUIshHin2j/NPnT2LGhq9qPg12sajBs4QBl7Fn
         7SVjqxA/Xljv2vFsXZ2nYYkxGzMOvxQ6TX8BEh2MR9MRZ1c25fJYb85igX3afUPLr80z
         cDQws1Ws+J+PfKt1PqHeU9JNCe06842tNGkD0cxv/4cc5CLqM7EqVKVi9SmWnOSW8BB3
         lhNZ18sXZQTFEAYJrwLrWyUKjg55EGgwD0QF4nEw3a4oi+5+MlzP/PXY00KDVhgNZJST
         QqxoP0AeMI8qrkz9s2/VQ4RpO9uVPtRDqaSo7ne2PLl7uv3cTwHmIKcjJK32wJoEY3jq
         XN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763382484; x=1763987284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxFwABS4E9AqqW3H7WCXTzoCQXbQOjdnmgdZA6SbR24=;
        b=LZKL0BTBAY+wSoMylKtHOuj7YLyZ0IWO4Wou/V9CRbjxPGefgq7bQgaK+xg2JhXJpw
         FS5RIjgbj4AjPvS+miz2aJBLYXIVrQ9vEwQzz7BaO4fH3i1OKX4cZWdsZdg3lnSn0ma/
         5s+gBwGajgqTGKVFFLGFKo9wWjt944qQBvYZ54A9gOXQ8CF3j7RnrXVpWX3XqcTEBdm1
         jQIN81s74PZkPnz6ldN0FZkDvNpfqL5AtQex0hG1Hs8tb9Hl5GLbJa87qeadUutOGkxZ
         xR66bEAFuJXZrErcup1zNJjXmsP3HZHSruixVfnHKotYFR7xLFB4Ug7/d0ohClwHpZL4
         tppA==
X-Forwarded-Encrypted: i=1; AJvYcCWnH/W4B/W5QjFKd+vzJtzgY7Mc373oS4Oc2wdDvjR2zUV4I57NJtk767DJKfnHRW+OukEFU2LLu/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyopEC6MRMMLRGtGzEbS0T6yqCx86bOWQkEfZcye4aZDOeZVCgl
	sBfL1W88DXZGZcmmagvweyRQe4DKg8wCWImbyFuLSxIPaAA0kgBBzPkSFvP7aeZQ
X-Gm-Gg: ASbGncsP0jkj3kNn1hc+047YNUzaBQvmSU9p9jQdZE3Vf8l8lVcOKkFo+4W1rnyO6R1
	EPl6nKuBnDON2v7u07IPV5GtgjdEK+Q3/9L6y2BSszm7IAA8E2tizk/aXdS4MvY+33KKJkiOUoE
	x5ZT/k8ntfGRkBHyME9iAVbjkSbcNgtMIhMyKoUKm0kHiy41i+yojxch4y7p1yFK0dnvl5CD6AB
	li/aPafEpHLO2Z4YhC4WYtZAQQFVtxkfxA7Qe4ZkMIYWVms7cjvEjysKXwEMl2ns/Ka8G26kWfZ
	3Yydhzdt+E7PutPdsoeDYeZcDEDc1qpmdhsYWf1ouzGieLoJEtP2CeRaT/gpA2DEb2eQvLoNuhT
	hA48dH/Eah3/R0ljpwZUBVwDEaOHLJTiLmmSAzumL9YwGIhl5xXkJYoKAz26XDSfCzS0jVhg/EK
	8XXX2ZPPk21Ve90CQwt0UfzZqBHMzB
X-Google-Smtp-Source: AGHT+IG//xVmBBm8Lcd2pfIWDTXsKbwEnW3B3WB83QwmOBkRuUAs/3VQEOXgbd0NazUgZkeqTpOWGg==
X-Received: by 2002:a17:902:ecd0:b0:277:c230:bfca with SMTP id d9443c01a7336-2986a6d55e0mr69417135ad.4.1763382484230;
        Mon, 17 Nov 2025 04:28:04 -0800 (PST)
Received: from elitemini.flets-east.jp ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b1055sm139841435ad.59.2025.11.17.04.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 04:28:03 -0800 (PST)
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
Subject: [PATCH v5] docs: f2fs: wrap ASCII tables in literal blocks to fix LaTeX build
Date: Mon, 17 Nov 2025 21:27:54 +0900
Message-ID: <20251117122754.297742-1-nogunix@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sphinx's LaTeX builder fails when converting the nested ASCII tables in
f2fs.rst, producing the following error:

  "Markup is unsupported in LaTeX: longtable does not support nesting a table."

Wrap the affected ASCII tables in literal code blocks to force Sphinx to
render them verbatim. This prevents nested longtables and fixes the PDF
build failure on Sphinx 8.2.x.

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>
Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>

---
Changes in v5:
 - Fix commit reference style (commit <sha1> ("<title>"))
 - Move version history below '---' per canonical format
 - Update Link: tags to lore.kernel.org where possible
 - No code changes from v4

Changes in v4:
 - Rebased on commit 62242ac51061 ("Documentation: f2fs: Reword title")
 - Cleaned up Changelog placement
 - Verified `make htmldocs` and `make pdfdocs` build fine

Changes in v3:
 - Replace TABs inside ASCII tables with spaces

Changes in v2:
 - Wrap nested ASCII tables in literal blocks
 - Add missing blank lines around code blocks

Link: https://www.spinics.net/lists/kernel/msg5929575.html
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

