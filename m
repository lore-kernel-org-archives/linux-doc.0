Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD8B25C6E2
	for <linux-doc@vger.kernel.org>; Sun,  9 Nov 2025 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762682066; cv=none; b=qQDTOe/pP8xJ2LJ0XPw7+tRQgnuQ0KdJck0UFIcwuQ0ABm9hHv/2YGpdtLqRmq4blyOFG0EKUBftW4dmH+2MGtafwRyfkIHAIXHbeTkhFE5i/IPTvw02h9VZslx5ydynLF2QJhnIsdnFInhpoglxCmpsFFxkYk4S4GNNu1eFUfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762682066; c=relaxed/simple;
	bh=RgoZ0Fk4zJLGfI2ojrl3UMeiwuZKAGycVmYMTGzuki8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LgPeB1J18t9FFAaXZhZwpTcAbxzgix9wJ5YT2lF2z0BJgZhPc4ZXdL8TYNCj6VUhoUo9CuQzKHiTQUU6TytklRbc1ead24VnARJACd2C1gBTH/QFMjCcgzxN/c3pE+9TzeTYPkS8CksBRbVZx4If8koI6TktkcH4ClQC5jlc8i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEUBGIWK; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEUBGIWK"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-343610f3990so333872a91.3
        for <linux-doc@vger.kernel.org>; Sun, 09 Nov 2025 01:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762682064; x=1763286864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W2mJACnQxh4sD/p1rN5JTzDZGkA2szKxHiA+o6hUrw0=;
        b=WEUBGIWKn8zjiI2FT4nmGFnDAv1GtR8DnyQcBymXWurETqCNJ9Q6JB2g52sNyhDGGr
         S78PLGzNf/01yT/GX7oL2UKdmWdaJbAJu7L/pfO8CIeVTHRSb/ruOJeWTGbWEBmt1x8q
         HFd3QylXKpGUN3uaGjJskXqjvu8JgVaDz0kP3PNXiG+S6481+LRTnI9tgBrl/+rntjYD
         YvuiSkr1tsP3ze8p619J2Qh+xINJNEtMWJTidwwEFBg6Bx/joRvmv3Ahii+GDcyTR87L
         p3oxErHV3+YiBwXScAT4hIuBfRTbGJ3MKnHE8gbYTNlIWRiUuT0iHwAwl2+2FYvuanVb
         KibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762682064; x=1763286864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2mJACnQxh4sD/p1rN5JTzDZGkA2szKxHiA+o6hUrw0=;
        b=wezCpNJyMEcKF18hyfessdKSc+7gWX4SzOIfvXsbdMDqHPN/brZVg4bf4xELrXBAae
         lSk31+EjjdVFLfu8mtS6Wy7M6ZOWE1LUeY9P0GtN5gywn4Ezs918BI7wTsX9eAWpobLn
         8kVWeBykjwOTUuqL8ADWB1nLTOvstlkbDjy05YghxPPcklwehkg3diH+2Vaug7xBihvP
         RThxRP6CsCWMQBlGa7FO7cwtBR6UqbASUlF0U2KNxYOp+1u7fppcKr+i4BZHwu8cojbj
         2Ud2Nk4d835xIO8VRN/YBRM8JIWvw8h/d5sc8UCMKjfMPyRRTctsfHFqHdmleHdyD65g
         UrwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXmAhSjndfk1Ua3Kwgwtuk72+gzQRa8ZO55WLAdgPSrx5JShA15KL8Lk2sC/AFc/eFJ5iF8rXo1rI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB2/Q8F++Sa/pJbXADFU4Rj3IDhad6eRkkJG64Pag2u+qumJ8n
	pFqtJ0lQ4JAgYYDfB6nmkb7T/49qqTcRoxy0ofnlrAY/9Ei7UH20TUCD
X-Gm-Gg: ASbGncuXO/uZpMfCYqkq7BWesMOFKJP5AXG73DDFYhFKrw+HKhoPndrSVaT4hJ+mU8g
	sB2h4kjuLuQSFWBoZZjgyyy9fhB2SQBZlC39Jpn5bRXxzxGg7lkWy/TmMw2tMjVRvbVCbiVXr1h
	y/5aih8onyeRD1YB15cx5Twx1d6/UPhCsG9iBD2lQC6l2jk849SO+rYs6qbKfpzbhYQ3/GavsT2
	NQ3mb0F/KS8fz/siMQDYJUJgvEE1daTJT7bhLe46aNu3EafJjZREClaLndgZEiSvqtQItyzKZTY
	UUsSFCr+7VGyCxY36KdYpIWBs3Ppo5EWcCaZtOT9VnwGl0T44k3tYigVhe9z4q8XOJVGGe+BtN1
	ooZ6zH2m3XM7k8yegsKVeJyJTMkMbAmklXNzC1syVJo6cHkOiEqV8OBZ0qY/IPBwgj9lyXLf5oL
	5TMaBi+rUPEoYtdHNnRbaShdv0R+TI
X-Google-Smtp-Source: AGHT+IGb0U3tFr9TL8bOD50VtKU25lK/Pj6KKmtdQ7daasGpBhl7uujoLGSXyt/2ZeJKF5VCSgi1Gw==
X-Received: by 2002:a17:902:d4c8:b0:297:fe30:3b94 with SMTP id d9443c01a7336-297fe304a7fmr17440385ad.9.1762682064333;
        Sun, 09 Nov 2025 01:54:24 -0800 (PST)
Received: from elitemini.flets-east.jp ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c70381sm109013265ad.66.2025.11.09.01.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 01:54:24 -0800 (PST)
From: Masaharu Noguchi <nogunix@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: corbet@lwn.net,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akiyks@gmail.com,
	nogunix@gmail.com
Subject: [PATCH v2] Documentation: f2fs: wrap tables in literal code blocks
Date: Sun,  9 Nov 2025 18:54:16 +0900
Message-ID: <20251109095416.2428351-1-nogunix@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
 Documentation/filesystems/f2fs.rst | 115 +++++++++++++++--------------
 1 file changed, 61 insertions(+), 54 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index a8d02fe5be83..07b8e752476d 100644
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
+				 algorithm	level range
+				 =========      ===========
+				 lz4		3 - 16
+				 zstd		1 - 22
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
+			     mode			continue	remount-ro	panic
+			     ====================== =============== =============== ========
+			     access ops		normal		normal		N/A
+			     syscall errors		-EIO		-EROFS		N/A
+			     mount option		rw		ro		N/A
+			     pending dir write	keep		keep		N/A
+			     pending non-dir write	drop		keep		N/A
+			     pending node write	drop		keep		N/A
+			     pending meta write	keep		keep		N/A
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
+			     Value		    Description
+			     ================== ========================================
+			     perf		    (Default) Enforces a hash-only lookup.
 					    The linear search fallback is always
 					    disabled, ignoring the on-disk flag.
-			 compat		    Enables the linear search fallback for
+			     compat		    Enables the linear search fallback for
 					    compatibility with directory entries
 					    created by older kernel that used a
 					    different case-folding algorithm.
 					    This mode ignores the on-disk flag.
-			 auto		    F2FS determines the mode based on the
+			     auto		    F2FS determines the mode based on the
 					    on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
 					    flag.
-			 ================== ========================================
+			     ================== ========================================
 ======================== ============================================================
 
 Debugfs Entries
-- 
2.51.1

