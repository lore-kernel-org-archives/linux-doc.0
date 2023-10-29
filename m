Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAABED260
	for <linux-doc@vger.kernel.org>; Sun, 29 Oct 2023 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="dUQMGWml"
Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 212D2B6;
	Sun, 29 Oct 2023 09:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4679; q=dns/txt; s=iport;
  t=1698596443; x=1699806043;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tnLPf2sXvL47AFGYLhJ5JeQR75s5yKHgRqPY7h3jlkw=;
  b=dUQMGWmlr6zJHnqK0ctf1p8UGN/QLNS0fKBpHFpKhSIR9BKAtgzpCzsx
   vqHwhrrV/j/o+cVoL7wvhT3zRFlYkTEX8MVeyeY4ihZBsUvY9uANhtAJ2
   mLb6jzoNZhAK/M6o4kmBRsr3ziTZ4P/k4ICvSjstGoH4h7+oNsTgRAnJl
   E=;
X-CSE-ConnectionGUID: ctT8cW7XT0Ol1SfrPHGlGg==
X-CSE-MsgGUID: Rcnz4D2DR4inPJWVDkBJWg==
X-IronPort-AV: E=Sophos;i="6.03,261,1694736000"; 
   d="scan'208";a="10098900"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-7.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 16:20:41 +0000
Received: from localhost ([10.61.205.52])
	(authenticated bits=0)
	by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 39TGKexk126456
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 29 Oct 2023 16:20:41 GMT
From: Ariel Miculas <amiculas@cisco.com>
To: linux-doc@vger.kernel.org
Cc: serge@hallyn.com, Ariel Miculas <amiculas@cisco.com>,
        Phillip Lougher <phillip@squashfs.org.uk>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: filesystems: document the squashfs specific mount options
Date: Sun, 29 Oct 2023 18:19:24 +0200
Message-ID: <20231029161924.50648-1-amiculas@cisco.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-User: amiculas@cisco.com
X-Outbound-SMTP-Client: 10.61.205.52, [10.61.205.52]
X-Outbound-Node: aer-core-5.cisco.com

When SQUASHFS_CHOICE_DECOMP_BY_MOUNT is set, the "threads" mount option
can be used to specify the decompression mode: single-threaded,
multi-threaded, percpu or the number of threads used for decompression.
When SQUASHFS_CHOICE_DECOMP_BY_MOUNT is not set and
SQUASHFS_DECOMP_MULTI is set, the "threads" option can also be used to
specify the number of threads used for decompression. This mount option
is only mentioned in fs/squashfs/Kconfig, which makes it difficult to
find.

Another mount option available is "errors", which can be configured to
panic the kernel when squashfs errors are encountered.

Add both these options to the squashfs documentation, making them more
noticeable.

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 Documentation/filesystems/squashfs.rst | 59 ++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/filesystems/squashfs.rst b/Documentation/filesystems/squashfs.rst
index df42106bae71..0a7fa66b70f8 100644
--- a/Documentation/filesystems/squashfs.rst
+++ b/Documentation/filesystems/squashfs.rst
@@ -64,6 +64,65 @@ obtained from this site also.
 The squashfs-tools development tree is now located on kernel.org
 	git://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git
 
+2.1 Mount options
+-----------------
+===================    =========================================================
+errors=%s              Specify whether squashfs errors trigger a kernel panic
+                       or not
+
+		       ==========  =============================================
+                         continue  errors don't trigger a panic (default)
+                            panic  trigger a panic when errors are encountered,
+                                   similar to several other filesystems (e.g.
+                                   btrfs, ext4, f2fs, GFS2, jfs, ntfs, ubifs)
+
+                                   This allows a kernel dump to be saved,
+                                   useful for analyzing and debugging the
+                                   corruption.
+                       ==========  =============================================
+threads=%s             Select the decompression mode or the number of threads
+
+                       If SQUASHFS_CHOICE_DECOMP_BY_MOUNT is set:
+
+		       ==========  =============================================
+                           single  use single-threaded decompression (default)
+
+                                   Only one block (data or metadata) can be
+                                   decompressed at any one time. This limits
+                                   CPU and memory usage to a minimum, but it
+                                   also gives poor performance on parallel I/O
+                                   workloads when using multiple CPU machines
+                                   due to waiting on decompressor availability.
+                            multi  use up to two parallel decompressors per core
+
+                                   If you have a parallel I/O workload and your
+                                   system has enough memory, using this option
+                                   may improve overall I/O performance. It
+                                   dynamically allocates decompressors on a
+                                   demand basis.
+                           percpu  use a maximum of one decompressor per core
+
+                                   It uses percpu variables to ensure
+                                   decompression is load-balanced across the
+                                   cores.
+                        1|2|3|...  configure the number of threads used for
+                                   decompression
+
+                                   The upper limit is num_online_cpus() * 2.
+                       ==========  =============================================
+
+                       If SQUASHFS_CHOICE_DECOMP_BY_MOUNT is **not** set and
+                       SQUASHFS_DECOMP_MULTI is set:
+
+		       ==========  =============================================
+                          2|3|...  configure the number of threads used for
+                                   decompression
+
+                                   The upper limit is num_online_cpus() * 2.
+                       ==========  =============================================
+
+===================    =========================================================
+
 3. Squashfs Filesystem Design
 -----------------------------
 
-- 
2.42.0

