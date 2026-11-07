Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794028652;
	b=SK+2xuc2/QI5SLwlswx2VerOHYYO5Dpw5Tu1CfWhysex2kHnwEvv6Zb8o4IpaebbBQdH
	 psXwZQ0VqMLbQe9AdmpMlu/15xRJ6PI0V5kLK4zZaQQc1bWQrp/E04d24HIJkk6I/RBzG
	 k0BCKcf1JaLolyHrDSUhaQlhEuw8evJ3cMldWjKenURkpaxgKwMlebUwt2NGvBjgkegn+
	 dMoapi0K3VDWnjPOp7VtFGr+l2wIBayJEdEwOatp8YwnqLP5bpIlUV+c0n00C9n03aGg8
	 5QIkerse8JE42M59eBZMnxdgXMXjN0+O3m8ylLe5JvQkuEZLsz5nhrw4Am0frOxNvwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794028652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sF0UOsiio986g30iDrox1EkIxmIR+gJ1qG6PTCrxja4=;
	b=3r2Ydk+D9qnE+mTgb/RRzUYLNUJSJw4RIZqagtF9hh0Q2K1juGD4hWJDRKIhwpVuhBwQ
	 dditY8idtxzHaxNqyHBSTwOw0ref35VFvCMLP2d/cImteVnfgiOh5YkO3Tj1h6DCo8tsO
	 VShsXukSQzzODbDXWrBDt7/fhqbecZfq2FyFvNxS0E2qiUJ0vNlVqmWV+R8QNWMQfTact
	 GQF4gsM+9KBI3JPVS7xky98x705M2lb0VmapunzCvfUEgppAdHvVdWYXc6h1RbNsAQFzN
	 2AdTRj4NS+yvVc5XQFJqeO9C6wfICgFeV8Um3uvCZ8COO5exRKneaJo8mU7XyHhoglQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YfCNFqgs;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82B7606A32C
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 05:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E82B7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YfCNFqgs
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2157507eec.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 21:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794028651; x=1794633451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sF0UOsiio986g30iDrox1EkIxmIR+gJ1qG6PTCrxja4=;
        b=YfCNFqgs5ptX7/y1e5eZqrklQ5J5QcziyQY0Zwzny3iWpwe8KXdKr/vfRo7lYjq2gz
         Hq7IBpo0aauTt27MrfleSQJmQvda0ZCUGMfKqRl8Z7Yp+bhYYQxCGftDRwNvzPZlXG3g
         H00hL8MdYQEoJLapglwe2tmYi39UpSuD+zpVZte99ild36cvusWMOjVMsXFYJ8zRqq+0
         te9bb9JNes2UThkOfAAI0xko/ZQRLiRtzzZ/qWrW2d9xtekiLzcX/RGUxrn3GzGg7yrt
         Gdp4xWx6Tu9RmbwU3qLnPatIEPW+20tZJu+ojp5nFlXz/iPe8SlMsaTSv7ZZKjY/033n
         aKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794028651; x=1794633451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sF0UOsiio986g30iDrox1EkIxmIR+gJ1qG6PTCrxja4=;
        b=YiM7yZVzmymhGmCI1IXGEMMHLVpgQ6Jw6k+Dz+FyPUTtKs5Kns0VKwXI28bCyEMxZS
         tbGk7r8eecuDmP7MJVtksDL3tMsUNHAiPygpgtnJPQToutFtSypC/JfsIClBpyY02GQD
         7hs28T4FOnkgdZls2G1f7Nzj1PySE+R+5Ft+6wwdxVr78/40OPgYBqkadxt9rTe8rven
         8ehoSs092bOsvmA7m7MD2TSj7C/1d2NhsK3bCQzP5wVC1ZbJ/WeVpTvm/8T6y4lp7QKN
         4tTDue6PJnktLZEPyCjB/1RFHH706HSh6wZAsR0iKAeRTur6Ru/2ZI3ImGzsHDtldNF5
         vtmg==
X-Forwarded-Encrypted: i=1; AKwUvBziEc0THuE7Hd8Yx+GILRiD25+4Mjse23Ar3Re0COaEkx+0D3hpr/979IM0MDBUAX5irHchhf1bBXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vfTvd8GOrASPLuhht2pCdpmTTnnH6b/BNHkhkScAGAynqStwe
	PThUaNuBn/osyhfWEYru/gulA6nFxjnhQB/0Z7SaxbM0TZGGjTm6Z8sD
X-Gm-Gg: AYBFou3SK+RS7WPTtIU97fOXrljvo5KlI64kj5P2mByc1SR9UOvQnbFGElrvG/PFUHL
	mZroDkadFJdB9pjWkm01TnnoBqlHfP24mlUNCE8rE2UT77I+DF058dWjLnDcbunKZzRfyhpBb1W
	+LN6pubPpQXbVOjifpj4W+TA/5LHJDTP+EzLHRTHI8gZmISFV+XGfhcS+ievt2lrBNLJ4dwSGmy
	NU7gFxqmqNIKOteJ4YdQ9iYzhA1YHMlDyKFldTD1Nq1BQIssb7Sl0Fy1NwOgIUQAFk9jifqqI+h
	/prbwVOMDLFwl7Aj6UFv5ToA211pmUMBO9wUTa/0ugQy9acei5U1Qp1Qy6X7cPhXSBcRCLtKbdd
	7V/QpzMlCcOao0yMVkgDTkImW2OFmxm/+iQgxdppqNXni5WDtOR4kErLBnKxIGJHcQ2WciQAtsM
	nIDc7grcofvE4hCtiRbWui1/pYSRNPgoucIfZH+U+qxDtkrM92PXL9BPqPOGFKklZghfh6iKQZn
	17PIy7uxTZa8096cAv9tJo//6glFA+bpdQmyzPOOKLVn1fdmHr56i29J9NHWey1KMa/wE11RMla
	3A9EaljjF185MWomwX4JLqVHzrQ4BgCDT8O+UZwX
X-Received: by 2002:a05:7022:1005:b0:1b2:42ae:94fb with SMTP id a92af1059eb24-1b25d32fe07mr7188206c88.37.1794028650847;
        Fri, 06 Nov 2026 21:17:30 -0800 (PST)
Received: from SHAN.localdomain ([171.79.50.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm12135641c88.19.2026.11.06.21.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:17:29 -0800 (PST)
From: Shanmugapriyan S <sundar25sengai@gmail.com>
To: mchehab@kernel.org,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shanmugapriyan S <sundar25sengai@gmail.com>
Subject: [PATCH] jobserver: Handle read errors before claiming a slot
Date: Sat,  7 Nov 2026 05:17:07 +0000
Message-ID: <20261107051707.1311-1-sundar25sengai@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If os.read() fails with an error other than EWOULDBLOCK before any
jobserver tokens are collected, the error handler falls through to
self.jobs += slot. Since slot was never assigned, this raises
UnboundLocalError instead of gracefully disabling jobserver parallelism.

Keep returning collected tokens conditional, but reset the claim, warn, and
return for every unexpected read error. Add a regression test that injects
EIO on the first read.

OpenAI Codex assisted with finding the issue and developing the fix and
regression test.

Fixes: b2664a90c171 ("jobserver: Split up the big try: block")
Signed-off-by: Shanmugapriyan S <sundar25sengai@gmail.com>
---
 tools/lib/python/jobserver.py     |  6 ++---
 tools/unittests/test_jobserver.py | 43 +++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 tools/unittests/test_jobserver.py

diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
index 7e94635bf..c8f220a36 100755
--- a/tools/lib/python/jobserver.py
+++ b/tools/lib/python/jobserver.py
@@ -154,9 +154,9 @@ class JobserverExec:
                 #
                 if self.jobs:
                     os.write(self.writer, self.jobs)
-                    self.claim = None
-                    warn('error reading from jobserver pipe', repr(e))
-                    return
+                self.claim = None
+                warn('error reading from jobserver pipe', repr(e))
+                return
             self.jobs += slot
         #
         # Add a bump for our caller's reserveration, since we're just going
diff --git a/tools/unittests/test_jobserver.py b/tools/unittests/test_jobserver.py
new file mode 100644
index 000000000..eafac510c
--- /dev/null
+++ b/tools/unittests/test_jobserver.py
@@ -0,0 +1,43 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Unit tests for the GNU make jobserver helper."""
+
+import errno
+import os
+import sys
+import unittest
+
+from unittest.mock import patch
+
+
+SRC_DIR = os.path.dirname(os.path.realpath(__file__))
+sys.path.insert(0, os.path.join(SRC_DIR, "../lib/python"))
+
+from jobserver import JobserverExec
+from unittest_helper import run_unittest
+
+
+class TestJobserverExec(unittest.TestCase):
+    """Test jobserver error handling."""
+
+    @patch.dict(os.environ, {"MAKEFLAGS": "--jobserver-auth=3,4"})
+    @patch("jobserver.warn")
+    @patch("jobserver.os.read", side_effect=OSError(errno.EIO, "I/O error"))
+    @patch("jobserver.os.open", return_value=5)
+    def test_read_error_without_claimed_jobs(self, mock_open, mock_read,
+                                             mock_warn):
+        """A first-read failure disables jobserver use without crashing."""
+        jobserver = JobserverExec()
+
+        jobserver.open()
+
+        self.assertIsNone(jobserver.claim)
+        mock_open.assert_called_once_with("/proc/self/fd/3",
+                                          os.O_RDONLY | os.O_NONBLOCK)
+        mock_read.assert_called_once_with(5, 8)
+        mock_warn.assert_called_once()
+
+
+if __name__ == "__main__":
+    run_unittest(__file__)

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.43.0

