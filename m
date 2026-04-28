Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0952042314B
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 12:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777379227; cv=none; b=PVVpfVUQz2qdRoHrNgTTjkYlDRY+UbcJOJcFJVIYFtnnKKO+XiiR3u1q4/OrNULMyeaaDPUuNXtvZWfkjdWyw5EXlu4+HZmCmqc9YWyoWGcYaMBwHghXfESMZTjLOZahAdz6K7fpL2fH+TL0otiZ/oR0GvACnC6Ycd1KMHQFJWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777379227; c=relaxed/simple;
	bh=xcPscxFmFlvLehZTEo8r9Z26NBYGBJGvjku0jtR/Kcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pfhXsTW6LzhyvNYrj/0sMIXItR9NCmTJ9PAqj8RSKKm6n9vr4WsZ5V3rrHrEoK9z1mLySZiUcRNDRR70USxVtDJi6RnyqI7mvvHvBYc2UhrJlh2Xl/e+cP+arCUmYHJzgKCl85WG7R1IiQaV5F+3tsTKVUBuNcZPxP3XM5gJgDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiR7tBRo; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiR7tBRo"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so79118035e9.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 05:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777379220; x=1777984020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HSohUozqi8NkIG0nhDL5W8Zp3PsmTrbCjFJ+jEUQYvk=;
        b=eiR7tBRo9aH4qM1li/S8vF+3N+yv+zm/OMWP+lgwFILeHTqIDAcGohde2VYEREU1lG
         Ui8Qe+V85G+/a0bP3YnFEwgSXTG/yQa/4ev6cYzGS4fZXoavMlnsqeJadyVuEcJi6zMC
         b8hjZaBJvLy5gHe58jmYZuw4TACIBRvaqKsBNbt0ch22TQ39t42BB63mHW0sb5s/Y6l7
         /xN+FyTSx4SEIroN2QvD5seJEMiKUbGU42Yok3b163BvHE4nJU82hk8WjZuEivNmrnCd
         ehnn+1MU66H8s6cEB8R8UbjMl7v0VTB4QpQzkzLQ/eNkPv6zdn6dgj4rBedZjwat9gjh
         3Xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777379220; x=1777984020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSohUozqi8NkIG0nhDL5W8Zp3PsmTrbCjFJ+jEUQYvk=;
        b=ecPYndb9c7ebmC3A2bq8HWG4pJorcOp03ndY9x5HHxIAJH7B6J/95B8Sjygyk2Savt
         yDkibjEWFA7ybCB6LRgwZpvUkmCW7HEqgH+fgt9TI6mTW69cMG44+rVwMDusbu6YcDHR
         ptLxSOiQd8HPjXD4eu6lk+Z2CPBvH7vYeiY5DjzGKLhbpmSWXjZHZTfKAGwhGWKXBbBw
         X4N9/7tuSO1c2IURumi9ABBk7ScUYKYqxYosNE9H1A10rq1UP1se4eZTZ0EWs2Kctk8b
         T9JGbukMSbqhFg0tHzAKb20rN4geDv8Mk4F7xTSaVhAVvHvp8PPIW0vH4VKlXFx2ufeo
         kP5g==
X-Gm-Message-State: AOJu0YwFDxaE42iN8bp8AAbCy2IQZeHCJN4k4FWVn1JRSEYUtxs6aC4w
	mNW4rZ330sxm7B0ePI8YzHbBy4wLwV6xxjdCwGutdMeDycBuWBXLp5Fo
X-Gm-Gg: AeBDiesv4xU//cwJdrYxfIYAZMZRdinFNsC5lQA0CQX03q9NMuJgf8YJ6nJfa9+ShnS
	m7Abr60dsM7ckCQcTbDYp8VAlGm0FHKDHkcpX9BgRxWt7T50E9ocR56V27wXFl+0eMvlinI0NUZ
	weabvFNpFirDYylCSWQGuuuCEB6ynRz8vN7AMPsTM8FRmLflRvsVaCsduJwh1xzqZHRKOIwe1iC
	hsP6g/m1KLl6nE3quV9Knx5oZ+AZWBU8TPO7Sc6S8wFAsfPY18Amu4e7EnRAQjVv8hPPHBBFvQj
	I8FzUUrBQA0P/zClLJZ5DO03tqGQwI09V8rSUkYVStI6zuyy0tvGdm2NFhVlJ17CVCMWstU6rxT
	qhfp/V3OP4gJd42OG1xbpCYaOjk0Hl1zimW1FJmYTVX47KregOBVZOOl3YVRzDIADRl6TW820/t
	W3R1dvhIsQ5W5oKHZw3B50DMkx37jhmZ8C2vah1GA5QNlFUIOushbkEQ4BQn4/AkWbqu/crhijg
	8qzqZWq773yYtid4PyLy/DcK6FS6UU=
X-Received: by 2002:a05:600c:c177:b0:48a:5301:bb5c with SMTP id 5b1f17b1804b1-48a77b12a49mr40423285e9.16.1777379220201;
        Tue, 28 Apr 2026 05:27:00 -0700 (PDT)
Received: from x250.speedport.ip (p200300c65f496d3577a54ef28bd39e7f.dip0.t-ipconnect.de. [2003:c6:5f49:6d35:77a5:4ef2:8bd3:9e7f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463d4fa52bsm6387263f8f.15.2026.04.28.05.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:26:57 -0700 (PDT)
From: Myro <mirademche@gmail.com>
X-Google-Original-From: Myro <myro@myromyro.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Myro <myro@myromyro.com>
Subject: [PATCH] docs: proc: fix minor grammar and formatting issues
Date: Tue, 28 Apr 2026 14:26:53 +0200
Message-ID: <20260428122653.3550-1-myro@myromyro.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix missing "from" in "prevent <pid> being reused" and
add spacing in vm_area_struct range notation for readability.

No functional changes.

Signed-off-by: Myro <myro@myromyro.com>
---
 Documentation/filesystems/proc.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 873761087f8d..d828006bd91c 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -118,7 +118,7 @@ PTRACE_MODE_ATTACH permissions; CAP_PERFMON capability does not grant access
 to /proc/PID/mem for other processes.
 
 Note that an open file descriptor to /proc/<pid> or to any of its
-contained files or subdirectories does not prevent <pid> being reused
+contained files or subdirectories does not prevent <pid> from being reused
 for some other process in the event that <pid> exits. Operations on
 open /proc/<pid> file descriptors corresponding to dead processes
 never act on any new process that the kernel may, through chance, have
@@ -2199,7 +2199,7 @@ the process is maintaining.  Example output::
      | lr-------- 1 root root 64 Jan 27 11:24 400000-41a000 -> /usr/bin/ls
 
 The name of a link represents the virtual memory bounds of a mapping, i.e.
-vm_area_struct::vm_start-vm_area_struct::vm_end.
+vm_area_struct::vm_start - vm_area_struct::vm_end.
 
 The main purpose of the map_files is to retrieve a set of memory mapped
 files in a fast way instead of parsing /proc/<pid>/maps or
-- 
2.54.0

