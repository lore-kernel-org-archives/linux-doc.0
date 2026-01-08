Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C323ACA5C;
	Thu,  8 Jan 2026 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767866668; cv=none; b=NjbEHD27o9F8xjzgKXVDnzFr0ieHKZYPNPNG/Z/tm7TXAnf4BNaPqdgh+SImDqcLBe3LRilMH8qtr7sHWKJpqb+eAViEVZmvSGCWlHovZNOgTwXTiXnuXgApjH+BKVbM6VKj1R1EnSb+T3u1tnJA7oyp5oqH2ErhZduZk4mbgT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767866668; c=relaxed/simple;
	bh=unOempmEb/n8B9I8THZwoU7+EwBVXCFGEDdHbIronZc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qjsxX+Drxzv8Lm+xRoOS841eg+JqGwE+5BKroPxlskuZmnepAzSRsAUemFmGNXX2Y2y0NO/p7hsqRXztHT7wsinBf1vHaj4DNWfBgQFm24djooBOyM7Nr9q6ss0Jnu2bw8an0w+5HLqmSxucwR+uR7TkfNw4eriKJohuMJufrtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=qh8AsLB3; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="qh8AsLB3"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=B/KiSPVfZlJLES0Cq5kpT9jZNq7/5hZc3ERAiQRnCYs=;
	b=qh8AsLB3A3u3WJ8KjnYw7Sq/4qSsdbJ7ft27OrF+FB4KJbn1fBBlCnSyCePXW4TWLJQzkLVS+
	9hwpYHuRqMrAmAqMyGb9J2oB0mEcWkAxQ8O+iYS8mX0KNLUo/NQgy+AX70UBRQ28i9mvCVmCXX6
	Yhq0VaChKIXSdiIKDWIu/c4=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dn0lT4CPyz1T4GY;
	Thu,  8 Jan 2026 18:00:37 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 140EA40567;
	Thu,  8 Jan 2026 18:04:22 +0800 (CST)
Received: from kwepemq200002.china.huawei.com (7.202.195.90) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 8 Jan 2026 18:04:21 +0800
Received: from M910t.huawei.com (10.110.54.157) by
 kwepemq200002.china.huawei.com (7.202.195.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 8 Jan 2026 18:04:20 +0800
From: Changbin Du <changbin.du@huawei.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Changbin Du
	<changbin.du@huawei.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v2] tools: jobserver: Prevent deadlock caused by incorrect jobserver configuration and enhance error reporting
Date: Thu, 8 Jan 2026 18:04:03 +0800
Message-ID: <20260108100403.2888782-1-changbin.du@huawei.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200002.china.huawei.com (7.202.195.90)

When using GNU Make's jobserver feature in kernel builds, a bug in MAKEFLAGS
propagation caused "--jobserver-auth=r,w" to reference an unintended file
descriptor. This led to infinite loops in jobserver-exec's os.read() calls
due to empty token.

My shell opened /etc/passwd for some reason without closing it, and as a
result, all child processes inherited this fd 3.

$ ls -l /proc/self/fd
total 0
lrwx------ 1 changbin changbin 64 Dec 25 13:03 0 -> /dev/pts/1
lrwx------ 1 changbin changbin 64 Dec 25 13:03 1 -> /dev/pts/1
lrwx------ 1 changbin changbin 64 Dec 25 13:03 2 -> /dev/pts/1
lr-x------ 1 changbin changbin 64 Dec 25 13:03 3 -> /etc/passwd
lr-x------ 1 changbin changbin 64 Dec 25 13:03 4 -> /proc/1421383/fd

In this case, the `make` should open a new file descriptor for jobserver
control, but clearly, it did not do so and instead still passed fd 3 as
"--jobserver-auth=3,4" in MAKEFLAGS. (The version of my gnu make is 4.3)

This update ensures robustness against invalid jobserver configurations,
even when `make` incorrectly pass non-pipe file descriptors.
 * Rejecting empty reads to prevent infinite loops on EOF.
 * Clearing `self.jobs` to avoid writing to incorrect files if invalid tokens
   are detected.
 * Printing detailed error messages to stderr to inform the user.

Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Changbin Du <changbin.du@huawei.com>

---
  v2: remove validation for all bytes are '+' characters. (Mauro)
---
 tools/lib/python/jobserver.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
index a24f30ef4fa8..8206e4c1497b 100755
--- a/tools/lib/python/jobserver.py
+++ b/tools/lib/python/jobserver.py
@@ -91,6 +91,10 @@ class JobserverExec:
             while True:
                 try:
                     slot = os.read(self.reader, 8)
+                    if not slot:
+                        # Clear self.jobs to prevent us from probably writing incorrect file.
+                        self.jobs = []
+                        raise ValueError("unexpected empty token from jobserver fd, invalid '--jobserver-auth=' setting?")
                     self.jobs += slot
                 except (OSError, IOError) as e:
                     if e.errno == errno.EWOULDBLOCK:
@@ -105,7 +109,8 @@ class JobserverExec:
             # to sit here blocked on our child.
             self.claim = len(self.jobs) + 1
 
-        except (KeyError, IndexError, ValueError, OSError, IOError):
+        except (KeyError, IndexError, ValueError, OSError, IOError) as e:
+            print(f"Warning: {e}", file=sys.stderr)
             # Any missing environment strings or bad fds should result in just
             # not being parallel.
             self.claim = None
-- 
2.43.0

