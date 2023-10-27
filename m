Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3484418C0D
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 15:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="OI/xy8fy"
X-Greylist: delayed 63 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 27 Oct 2023 08:09:37 PDT
Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 088E0C4;
	Fri, 27 Oct 2023 08:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4467; q=dns/txt; s=iport;
  t=1698419377; x=1699628977;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z30PGUp2OXocE8topJov5NYF/tsEceZZC+SDL8xdOnU=;
  b=OI/xy8fyMOjNhb8VPmSXX9JAKPm01kfV1nO1JQSDFqQssv2T8rWQhMk8
   m1yByGuyhK62X8WfiyscnN2sY4f5MQYpA7cmiDi5OY0J5LfqoVYo42x4J
   wQdecWw7QgRlj3GoGB1X/iRwuwe49zXF/mGs9EmdRrawCmm9PaNOnTSC1
   c=;
X-CSE-ConnectionGUID: Mb9aEPJAQOWVefeqwFY5Vg==
X-CSE-MsgGUID: lDbVgR8gTvuMaTrKYVRPQw==
X-IronPort-AV: E=Sophos;i="6.03,256,1694736000"; 
   d="scan'208";a="6852703"
Received: from aer-iport-nat.cisco.com (HELO aer-core-11.cisco.com) ([173.38.203.22])
  by aer-iport-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 15:08:31 +0000
Received: from localhost ([10.61.193.113])
	(authenticated bits=0)
	by aer-core-11.cisco.com (8.15.2/8.15.2) with ESMTPSA id 39RF8Uxw125999
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 27 Oct 2023 15:08:31 GMT
From: Ariel Miculas <amiculas@cisco.com>
To: linux-doc@vger.kernel.org
Cc: serge@hallyn.com, Ariel Miculas <amiculas@cisco.com>,
        Phillip Lougher <phillip@squashfs.org.uk>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH] docs: filesystems: document the squashfs specific mount options
Date: Fri, 27 Oct 2023 18:08:14 +0300
Message-ID: <20231027150814.217689-1-amiculas@cisco.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-User: amiculas@cisco.com
X-Outbound-SMTP-Client: 10.61.193.113, [10.61.193.113]
X-Outbound-Node: aer-core-11.cisco.com

When SQUASHFS_CHOICE_DECOMP_BY_MOUNT is set, the "threads" mount option
can be used to specify the decompression mode: single-threaded,
multi-threaded or percpu. It can also be used to specify the number of
threads used for decompression.
This option is only mentioned in fs/squashfs/Kconfig, which makes it
difficult to find.

Another mount option available is "errors", which can be configured to
panic the kernel when squashfs errors are encountered.

Add both these options to the squashfs documentation, making them more
noticeable.

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 Documentation/filesystems/squashfs.rst | 58 ++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/filesystems/squashfs.rst b/Documentation/filesystems/squashfs.rst
index df42106bae71..f71ac870603b 100644
--- a/Documentation/filesystems/squashfs.rst
+++ b/Documentation/filesystems/squashfs.rst
@@ -64,6 +64,64 @@ obtained from this site also.
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
+                       If SQUASHFS_CHOICE_DECOMP_BY_MOUNT is **not** set:
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

