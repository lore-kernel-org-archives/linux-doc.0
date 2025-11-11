Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611783246FF
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 13:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762866242; cv=none; b=F4BtVm2e2jZ9mgJNKczrwscP3aPMFGDPiqyqW1BKor8X3RYlPWFZi8tCJ8BDvQRCKEHVz8YU5V7RSZvK6l8jNep/Pf3s+r0FtxgxbC+cK0TVG9NVHG9iaylcT9meXz15FwbKYprUU3dHPEmYmtnh1R0b5LhfJdHpBef5F1ZKBQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762866242; c=relaxed/simple;
	bh=usfAPbPnDwiWzpmUk70Fe8p4bCbppbDN/yF4Q24vmEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bxh5Mw4vv0+pjPS0fD636zDE0716QJn32XOazPBngjAvbXkPLzdYN/vrGsoGLNKM+5K1JbduH+1IyLuXKmCH4VSRS7lIswZbcS11CeDR4ILjNhMVw3Czuqg0/mJxaxYSnbORntZ6c+eNRHKEoMzuD2oQvFn9DTxoz9wTpJmhc6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLBwYwpq; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLBwYwpq"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7a432101882so249737b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 05:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762866239; x=1763471039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ozXRud7hnbH/C6N6bIIB2OSxH4nIfZC/nZQgtGIV7s=;
        b=lLBwYwpqjN2jCu1S93DRaWqBUYgPgDxR3OBiJ2nplQZIvCAOLzErZaBSstYQAZ1UXn
         jfdaLZPUNEDbXZLPh2bLcw0KVdvVnoZUDc8CUxPP5ycxEaKKVJ2C4+rkCnTmEIt7+mCS
         5aV5dKfBnz0oLvK+SPFTdEOhzX8GMb82360S2c6QZ7VzhVwqrnfJxyB/SyT1SVQep8lq
         rK7x94pu6YiMkm3dYh1dUlgi4YbfZTStLBNcBd6AxA35YYv98E1d3JWlZA/80jkhO0Aw
         bUrMRhRABDHt2PVYPt1Huw0hMnQEqdrjGDME9+a2RY6KjErZpInr7XzcZw16sOyNfSCr
         7kPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762866239; x=1763471039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ozXRud7hnbH/C6N6bIIB2OSxH4nIfZC/nZQgtGIV7s=;
        b=stBOyLEgz1nsvl5l9btno0xYwMlmJvFM5S1iDFnSC9gijXInOF9UrXQOsJ4Jz2M1Lf
         r6wZ/pQCNbkuKHIFrvTpyXidULwhd4WYXBD7UHtv3UW7fvrNWN6IVggD4PdzbW+dap0m
         SItK0NQlWNudQfxBYgiOI3jSEj45tbDkVuADOXiLe2THdqaLwgUNwU2iY5WvgTYPjDhb
         cwwA49Zee6GOj7EYdzNG0jphLkcbgllodfA44OdQx4wl+iG0I25mk6rPXpS4Ka8iCdLb
         tffmTsY8MiuixaxXU05LqY9ongK42RFN35pabmkqf6hbcCYmN6Wsg1hTRponCjotsLmz
         XSbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUFMYpbAyDlCpa7L//0CDYpy2V/f8b6U9SRuFaU9FDFG1KpISiL5k+QsExxLY/JTSzH6PtSO6qEeU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvquLnZu5mCGwyymTIPehurL6szqaJU7fJ2TiQa4ESdbJu/7AM
	mg8ZMXirKLFXTwAC6Pa7oBJ9uAJYcxvEDiN/VAsx5I0aXmRGP67jNinY
X-Gm-Gg: ASbGncuSv6a+i4z+zz58XrrSkdb9o0510lX6ZlDLOHGHs22pEMAIL/cYv541kH1VENQ
	tzL4WYs2IR8KoXSARHNeUzkUVxDPWgCQDH1T5yKZgZx81M1GQzbK4WfKE9kfiukSn+wmmMP/g6T
	o1bv1bMgJwAhOa8OUqHnf37ZxJ38A9w410icWCztybzUXu6K37mNlT76IJCURyalFO07dGawCe8
	ZIdyBnaVVJyKyjNXyIMaKjZ+K8teZq5gRLg2QNJLk5LeSAI/CeBgPanO0DUkgS2zo1ZR3RjWx3I
	MyP/GsrN/v1Ec9rOTSxEjr7CBYo/yuUrpp6Bqe1hY3tv1Yb4f/paKTydyiMqId05JRsQjEyk0LS
	HJfBlalBXvMsXTnMSR0la3c9exp2YVPEadTBNs9VZTdzf/fNbycj7GhQcml3GCWUN6U6N+4lhLt
	vcWmmVxSKPznkkGqUH5g==
X-Google-Smtp-Source: AGHT+IHu4EywhajIUey4lbULY1rrvTzR5HGvXc4GreqR0sPeWXBldY1/v7wftHXonsc2QxGK9vnrZg==
X-Received: by 2002:a05:6a00:4fcb:b0:77f:1a6a:e72b with SMTP id d2e1a72fcca58-7b226e825d4mr7474236b3a.5.1762866239288;
        Tue, 11 Nov 2025 05:03:59 -0800 (PST)
Received: from elitemini.flets-east.jp ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0ccb5a517sm15010286b3a.57.2025.11.11.05.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 05:03:58 -0800 (PST)
From: Masaharu Noguchi <nogunix@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: corbet@lwn.net,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akiyks@gmail.com,
	bagasdotme@gmail.com,
	nogunix@gmail.com
Subject: [PATCH v3] Documentation: f2fs: wrap tables in literal code blocks
Date: Tue, 11 Nov 2025 22:00:39 +0900
Message-ID: <20251111130349.3856302-1-nogunix@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Akira and Bagas,

As suggested, I replaced TABs inside the ASCII tables with white spaces
for better readability. No other content changes were made.

Thanks for your reviews and acks.

Best regards,
Masaharu Noguchi

---
Sphinx LaTeX builder fails with the following error when it tries to
turn the ASCII tables in f2fs.rst into nested longtables:

  Markup is unsupported in LaTeX:
  filesystems/f2fs:: longtable does not support nesting a table.

Wrap the tables in literal code blocks so that Sphinx renders them as
verbatim text instead. This prevents the LaTeX builder from attempting
unsupported table nesting and fixes the pdfdocs build.

Akira Yokosawa pointed out that the in-development Sphinx 8.3 latex
builder already handles these nested tables. I still want to fix the
current documentation because Sphinx 8.3 is not released yet, and the
LaTeX build on the stable 8.2.x series (which also requires
"docutils<0.22" for now) remains broken without this change.

Link: https://lore.kernel.org/lkml/20251011172415.114599-1-nogunix@gmail.com/
Changes in v2:
 - wrap the compression level table in a literal block and add the
   missing blank lines so docutils no longer warns about malformed
   tables
 - consistently use ``.. code-block:: none`` for the other ASCII tables
   that previously triggered the LaTeX error
Changes in v3:
 - Replace TABs inside ASCII tables with white spaces for readability
 - Keep Reviewed-by and Acked-by tags as the technical content remains unchanged

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>
Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
 Documentation/filesystems/f2fs.rst | 115 +++++++++++++++--------------
 1 file changed, 61 insertions(+), 54 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index a8d02fe5be83..1de0bc83d76e 100644
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
+			     mode              continue        remount-ro      panic
+			     ====================== =============== =============== ========
+			     access ops        normal          normal          N/A
+			     syscall errors    -EIO            -EROFS          N/A
+			     mount option      rw              ro              N/A
+			     pending dir write keep            keep            N/A
+			     pending non-dir write drop        keep            N/A
+			     pending node write drop           keep            N/A
+			     pending meta write keep           keep            N/A
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
+			 .. code-block:: none
+
+			     ================== ========================================
+			     Value            Description
+			     ================== ========================================
+			     perf            (Default) Enforces a hash-only lookup.
 					    The linear search fallback is always
 					    disabled, ignoring the on-disk flag.
-			 compat		    Enables the linear search fallback for
+			     compat          Enables the linear search fallback for
 					    compatibility with directory entries
 					    created by older kernel that used a
 					    different case-folding algorithm.
 					    This mode ignores the on-disk flag.
-			 auto		    F2FS determines the mode based on the
+			     auto            F2FS determines the mode based on the
 					    on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
 					    flag.
-			 ================== ========================================
+			     ================== ========================================
 ======================== ============================================================
 
 Debugfs Entries
-- 
2.51.1

