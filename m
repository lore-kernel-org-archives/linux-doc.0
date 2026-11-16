Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815360;
	b=gk2Ndw9is1pTm/Bkpy/ssZVd/B1Iq3l+tpFF1+5SaVVULx67nyZC+5NS+rK1xucg257J
	 VhOxZjj333gx4GVWgy85OzBNXjssR92gSgQSirgiFohBpiQSGS+G3Ndvp/EkKs+Vxe4Jy
	 IKZDdZtf/UnGtp1nv6hv+zUw3JrI7/BfUiLsdhdzmWjrEQ90BK8OKhLE+yyLmjoMn7kuq
	 aqrBs8ID6Zz3HaO6z/ZNiXWvDdVre++LyuJacD/MTjv5hlKQBK+c4EwfNPnnCdMy2KMFs
	 +Nh25WxMUKOcnCV7UsTQ6Q+slMl7s4CWUP318A2FN5583YOww36b28WjQoyLdgcjslA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815360;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=qfEwEGdsfpaSsQ0CV8iU4w1B9JOv1XHHo5P0ONr0dGk=;
	b=T9kPP7G96cW6y9fVKw9Tctohka7IP6TBlgXwkc5R8pfbVhMCBCRG4qVzX6KxPawPEi/v
	 axK4KPGl1jr1T+4lMDZ56cerT7PgSGYCaUDXSgH48C8SV/Ni6SaPZ1aMQez3qWOdL9PsU
	 QFPCv7zeV0xm6c9eZw8xtahezQfB3wlM4oPLIkem588AmWr0lG90Ovuipob9dd+X+47Ov
	 Ovj1RzZoH2sbuypV4RPsQxY9XqUjLq/JHSJGD4LpZjxE3OcLjyLagFdYYDsYF4ErJ1JGM
	 v9TNqmqAp4JYLNg+aTH/ELoBttyCsB4UX+xBHBiBhIyl5vf0lxCOLF79ngReFr6XzvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UslJmPZB;
	arc=none smtp.remote-ip=209.85.210.225
Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC81C606A31C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 07:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC81C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UslJmPZB
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-8a07078200fso1298765b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 23:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815359; x=1795420159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qfEwEGdsfpaSsQ0CV8iU4w1B9JOv1XHHo5P0ONr0dGk=;
        b=AjS0INnJPzrfWRfuXFJXjZwrk2eLQwjuOnVzr/mtY6K+1lxXn2gdHWQIKvNvmMTZcS
         xVZeezavBxIayXztnB1oUJ4WHrMr1W1rUr82y931NLZFJ7KTucXmRPXsH8xtxHKKm6vp
         /KURPqvqHwgQXm2Qlj8YIMLdw9q7KgK7Jm0pzeoAu/i4BCar2nq8feQ1SAOdEbcZw0B2
         d8YkPeoZIiPkZkgO60k62NkbfI9W7/+VqZ8CVTHF2+l1IWDU32N+dgGaj82nNPTwnkSf
         7Yfnt1eMoDueDBDRiub4MDd9o9UmVrj9EL6exFhv8X2CztAg5ST5ZpBswXj6QXLVdrOa
         hzxw==
X-Forwarded-Encrypted: i=1; AL+hErHN4+0F55rFiMTIUmjjzgfxYztA7Gy2PsbxPf51aU5duuQC5x0zamPb+qbL2u8fHeDKRzV6Uo5nn+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h9ReqAJoX64okADlIoTdyU18UTZmm5WVELof4LbaItlnlrEpl
	9B1hnX/EziOrczLJ+mkzq7R4LrpAj65koqR5dIirN4lq/Vpi8L0ejUB5oKqmstY7Xz9piKdnOQB
	H2bVxB5awZl1N2kLjMOKaYDtbwobnQedJqHUrRGun2zo8ntqcwUJmtwvc9NBj5HqpUol9TFpZw3
	aaI1rzVU9IyZMup7QZqtLXDfE2AT8KmZFneckcnhcTe/o4AQvQcVFIU7YQ/grKkxo/JUKf78TRK
	pYVjDj5m9S11LfL/DUl
X-Gm-Gg: AZFdTZcCrR/ZoTKszgckI7HrB+whq580rG+dU+0WPpbrUGLFIV8t+e/9eoPh76cVgyi
	0L74sWAz9Ipa5rbf2PzgRpfA+nEHLXoLfTdRzE7TevWUpmlWg7Eygtt+/0j3vhaKJL5NUjtWMFl
	Pg2F4Y6mCCInhhW5J5Mhn8NzZWQdT1WytsbYSLHx8eBJBUxotOgFI5morazswFxXcvZYTPwIzpn
	pts9HHiTJGZZghQX2GzIiAjoViyWUlwTGh7AltShca+OYozAEPnHgQ43liV+zPVK6XovIG2NXLR
	kGy7nTY6RyJQUD3A5KfMOFdbUG1xWdC6SwmQl1TdHwgnkXu4bnsHDoi624Qs041ZQptwLfIyfa+
	pj08Kct2usEu2lr2EU5DaPSa5TEm2i3oOz8tediGESkjqsX8nSOM7sBPvP8jr9f5MXCIWLxgocd
	EeFnYu6nYANUCTTyI0a+8z8TBeMjm8sVz7FQ4Rxw==
X-Received: by 2002:a17:90a:f947:b0:3b1:2810:dfdb with SMTP id 98e67ed59e1d1-3b1b0b86ae0mr9652093a91.48.1794815358991;
        Sun, 15 Nov 2026 23:49:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae96f125sm11101497a91.4.2026.11.15.23.49.18
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:49:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91256a7b7b3so53562706d6.2
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 23:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794815358; x=1795420158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qfEwEGdsfpaSsQ0CV8iU4w1B9JOv1XHHo5P0ONr0dGk=;
        b=UslJmPZBBMWxXiIGaZ+wfVp2KPNXzFws9P0FePRAxwQZGpES3oH8a8jKyUUTE1fnm4
         rbYJ6AAVmTsjKY0F+DYCGYOB13q+Ww1bf1uA8nQ7RJG5DPLZ7LLj5YvrKmWnYkJrses5
         sqOjGIX7dGOPOe0Pf91azz3xovi59t/wuqcFM=
X-Forwarded-Encrypted: i=1; AL+hErEYTrB97GkcRFdCzV2eUCyZEFoPi+FAs2t4KYXOuGmx80bHvuOV8BliIa0ZpRMNreUkSBsL6A5Nu6U=@vger.kernel.org
X-Received: by 2002:a05:6214:4b10:b0:91e:f04a:b237 with SMTP id 6a1803df08f44-91f242135efmr158105566d6.39.1794815358059;
        Sun, 15 Nov 2026 23:49:18 -0800 (PST)
X-Received: by 2002:a05:6214:4b10:b0:91e:f04a:b237 with SMTP id 6a1803df08f44-91f242135efmr158105406d6.39.1794815357480;
        Sun, 15 Nov 2026 23:49:17 -0800 (PST)
Received: from bld-ams-bvg-44.ams.broadcom.net ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f8319d44bsm36603646d6.4.2026.11.15.23.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:49:16 -0800 (PST)
From: Stefan Chulski <stefan.chulski@broadcom.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	linux-cifs@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Chulski <stefan.chulski@broadcom.com>,
	Ilya Lifshits <ilya.lifshits@broadcom.com>
Subject: [PATCH RFC v1] ksmbd: add use_unbound_wq module parameter for the ksmbd-io workqueue
Date: Mon, 16 Nov 2026 08:48:49 +0100
Message-ID: <20261116074849.475815-1-stefan.chulski@broadcom.com>
X-Mailer: git-send-email 2.54.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The "ksmbd-io" workqueue has always been per-CPU. Commit 69635d7f4b34
("fs: WQ_PERCPU added to alloc_workqueue users") only made that
default explicit as part of the treewide transition to unbound-by-default;
it was not a ksmbd-specific decision.

Per-CPU work keeps request processing on the CPU that queued it, which
is good for cache locality, but it also runs work on CPUs that were
isolated from workqueue noise (isolcpus=, nohz_full=) and prevents the
scheduler from placing blocked or long-running workers elsewhere.
Which behaviour is better depends on the workload and platform.

Add a boolean use_unbound_wq module parameter. It defaults to false, so
behaviour is unchanged unless it is set; when true, "ksmbd-io" is
allocated with WQ_UNBOUND instead of WQ_PERCPU. The "ksmbd-break"
workqueue is already WQ_UNBOUND and is not affected.

Document the parameter in ksmbd.rst.

Signed-off-by: Stefan Chulski <stefan.chulski@broadcom.com>
---
 Documentation/filesystems/smb/ksmbd.rst | 6 ++++++
 fs/smb/server/ksmbd_work.c              | 9 ++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/smb/ksmbd.rst b/Documentation/filesystems/smb/ksmbd.rst
index 728cfca13205..a045ed6db9b3 100644
--- a/Documentation/filesystems/smb/ksmbd.rst
+++ b/Documentation/filesystems/smb/ksmbd.rst
@@ -158,6 +158,12 @@ How to run
 
 	$ sudo modprobe ksmbd.ko
 
+   - Optional module parameter ``use_unbound_wq`` (default ``0``) makes ksmbd
+     use an unbound workqueue instead of a per-CPU one for request
+     processing, e.g. when CPUs are isolated (``isolcpus=``, ``nohz_full=``).
+
+	$ sudo modprobe ksmbd use_unbound_wq=1
+
 5. Start ksmbd user space daemon
 
 	$ sudo ksmbd.mountd
diff --git a/fs/smb/server/ksmbd_work.c b/fs/smb/server/ksmbd_work.c
index 6e5122e2d6fc..0447b2da84d5 100644
--- a/fs/smb/server/ksmbd_work.c
+++ b/fs/smb/server/ksmbd_work.c
@@ -7,6 +7,7 @@
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
+#include <linux/moduleparam.h>
 
 #include "server.h"
 #include "connection.h"
@@ -18,6 +19,11 @@ static struct kmem_cache *work_cache;
 static struct workqueue_struct *ksmbd_wq;
 static struct workqueue_struct *ksmbd_break_wq;
 
+static bool use_unbound_wq;
+module_param(use_unbound_wq, bool, 0444);
+MODULE_PARM_DESC(use_unbound_wq,
+		 "Use an unbound workqueue for request processing (default: false, per-CPU)");
+
 static int ksmbd_reserve_iov(struct ksmbd_work *work, int need_iov_cnt)
 {
 	struct kvec *new;
@@ -108,7 +114,8 @@ int ksmbd_work_pool_init(void)
 
 int ksmbd_workqueue_init(void)
 {
-	ksmbd_wq = alloc_workqueue("ksmbd-io", WQ_PERCPU, 0);
+	ksmbd_wq = alloc_workqueue("ksmbd-io",
+				   use_unbound_wq ? WQ_UNBOUND : WQ_PERCPU, 0);
 	if (!ksmbd_wq)
 		return -ENOMEM;
 	ksmbd_break_wq = alloc_workqueue("ksmbd-break", WQ_UNBOUND, 0);
-- 
2.54.0

