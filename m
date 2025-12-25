Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2A82D8DD6;
	Thu, 25 Dec 2025 06:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766644007; cv=none; b=L/ZYd6MLWPBU064Gb9t5yvLi+/TSssSsJlJpJxMYwWq6A1+icsBuMLudJ/77geB7+405bxCZymNTdBwpk/O0ZoxGrIHq4ev4looHSSrk001rQmVyqLYcQB1J+QX5pYsw+8AD810uv0dRR+88hLKyJJ3z0aviikC//zxYa+iB/sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766644007; c=relaxed/simple;
	bh=sgQl1OnFyrxZQQabUGtiAG0tQCGBqZ10WQOOBhLbA4s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C1qoXs4TiZ1Lxahuho1cpxEfi6iU+56IW1YsmX0YPkLcyJ9zx/nAcJ5gkWnCHNjjWw9z6jpBJfvW+h3d3ePFsLOEPSNm9oj/Xdc29pn0hQy4a41kaeiIqH+ZuYNxneJcckxi/A+XBdTXHPNQuc6sRJ1tQhL3lvhS/hBod+h+dc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=lY7BU2hS; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="lY7BU2hS"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=EA6xoF5pt4fVH6WTINhXjL5GW/lOmjGQznfqtF5zMKw=;
	b=lY7BU2hSterx9iUXMTz/AbKeFMVTxv49mcICcGcfVrVGGrYBoHHwsikpePuBOkxNYSekYsiQ8
	6ciUvsBTnS/fP7fCa0/0tC2Jr80bqbMBVdEXP4398ge+FbotrjZhoh3mHGiuQ5FubZa60Vu+ibg
	FkXtC9foAg8VWCz3hDgS8oE=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4dcJbP35dbz1cyR2;
	Thu, 25 Dec 2025 14:23:29 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 6819D4056C;
	Thu, 25 Dec 2025 14:26:36 +0800 (CST)
Received: from kwepemq200002.china.huawei.com (7.202.195.90) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 25 Dec 2025 14:26:36 +0800
Received: from M910t.huawei.com (10.110.54.157) by
 kwepemq200002.china.huawei.com (7.202.195.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 25 Dec 2025 14:26:35 +0800
From: Changbin Du <changbin.du@huawei.com>
To: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Changbin Du
	<changbin.du@huawei.com>
Subject: [PATCH] tools: jobserver: Add validation for jobserver tokens to ensure valid '+' characters
Date: Thu, 25 Dec 2025 14:26:22 +0800
Message-ID: <20251225062622.1500046-1-changbin.du@huawei.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq200002.china.huawei.com (7.202.195.90)

Add validation for jobserver tokens to prevent infinite loops on invalid fds
When using GNU Make's jobserver feature in kernel builds, a bug in MAKEFLAGS
propagation caused "--jobserver-auth=3,4" to reference an unintended file
descriptor (Here, fd 3 was inherited from a shell command that opened
"/etc/passwd" instead of a valid pipe). This led to infinite loops in
jobserver-exec's os.read() calls due to empty or corrupted tokens. (The
version of my make is 4.3)

$ ls -l /proc/self/fd
total 0
lrwx------ 1 changbin changbin 64 Dec 25 13:03 0 -> /dev/pts/1
lrwx------ 1 changbin changbin 64 Dec 25 13:03 1 -> /dev/pts/1
lrwx------ 1 changbin changbin 64 Dec 25 13:03 2 -> /dev/pts/1
lr-x------ 1 changbin changbin 64 Dec 25 13:03 3 -> /etc/passwd
lr-x------ 1 changbin changbin 64 Dec 25 13:03 4 -> /proc/1421383/fd

The modified code now explicitly validates tokens:
1. Rejects empty reads (prevents infinite loops on EOF)
2. Checks all bytes are '+' characters (catches fd reuse issues)
3. Raises ValueError with clear diagnostics for debugging
This ensures robustness against invalid jobserver configurations, even when
external tools (like make) incorrectly pass non-pipe file descriptors.

Signed-off-by: Changbin Du <changbin.du@huawei.com>
---
 tools/lib/python/jobserver.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
index a24f30ef4fa8..88d005f96bed 100755
--- a/tools/lib/python/jobserver.py
+++ b/tools/lib/python/jobserver.py
@@ -91,6 +91,8 @@ class JobserverExec:
             while True:
                 try:
                     slot = os.read(self.reader, 8)
+                    if not slot or any(c != b'+'[0] for c in slot):
+                        raise ValueError("empty or unexpected token from jobserver")
                     self.jobs += slot
                 except (OSError, IOError) as e:
                     if e.errno == errno.EWOULDBLOCK:
-- 
2.43.0

