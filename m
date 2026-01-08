Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1B84BF3D2;
	Thu,  8 Jan 2026 11:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870956; cv=none; b=IXKoxT45wSII/LXGD6QOHSGYovz+mbcoA4uYox0T3IgNGjwMUae7KVe9PkVflNgUR6mNrxmmoQUYgT6BVmQqSBYuaeGptzppbStqDVS/fX0iK27ke7rUhPwSLTapD+REwuA3ZotX6PhXXFqcymtfNoq4N5Qv6zkmKMctPDizcFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870956; c=relaxed/simple;
	bh=9fIe5lZB8kXbHGRFkGGf2pipDLr38M/rS7Z1qMa9Kq8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jywWxAO79zL5aj5w1MjmXxL6l2WhczimghUOJ+225ySSbw4ti8gkxIzdp75nVSciU/bTfBQrv4wg/9ak7mQtuQF90Q4zWjfFffKNp/mF5bI1UaH2SSeO52l1idu0wUeaM2j/3vVGgH7XWFvpK1IP/EDQsrzIPuGJyedmm2sQ+Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=osXt/XjS; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="osXt/XjS"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rR+hPnKXppitFtPVw6bSJCCGCkaLlEVILuJbZIhkRSw=;
	b=osXt/XjSI6btlihtlMay7q9HooLXHBZoi6oNgSyev5CJ1eMRa2PtNByJ/u1W0XdUpW7Va/V6P
	3BsLGuHJCVn11hnLsZdvBFE8Tp5YmXimHuzMnovwgQuCYJ6Os2h/+lQiLbd5dK0RsL1H3Ax1Bx/
	+KmfYM1cXm4hDZZe9qVl3hA=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4dn2LS1CtzzmV6h;
	Thu,  8 Jan 2026 19:12:32 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id D3A3B40565;
	Thu,  8 Jan 2026 19:15:48 +0800 (CST)
Received: from kwepemq200002.china.huawei.com (7.202.195.90) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 8 Jan 2026 19:15:48 +0800
Received: from M910t.huawei.com (10.110.54.157) by
 kwepemq200002.china.huawei.com (7.202.195.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 8 Jan 2026 19:15:47 +0800
From: Changbin Du <changbin.du@huawei.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Changbin Du
	<changbin.du@huawei.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v3] tools: jobserver: Prevent deadlock caused by incorrect jobserver configuration and enhance error reporting
Date: Thu, 8 Jan 2026 19:15:34 +0800
Message-ID: <20260108111534.2952866-1-changbin.du@huawei.com>
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
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Changbin Du <changbin.du@huawei.com>

---
  v3: format exception with repr(e).
  v2: remove validation for all bytes are '+' characters. (Mauro)
---
 tools/lib/python/jobserver.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
index a24f30ef4fa8..bd231f847032 100755
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
+            print(f"Warning: {repr(e)}", file=sys.stderr)
             # Any missing environment strings or bad fds should result in just
             # not being parallel.
             self.claim = None
-- 
2.43.0

