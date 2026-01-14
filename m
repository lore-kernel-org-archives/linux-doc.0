Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6159537FF5C
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 11:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768388930; cv=none; b=ldHkvswnHPhKB8F/mA8vgvzdsny7oMXjEHmx9G9Q3bF+PXAmqLLjJ37hXocacykVxzfuSxPAvcxsEsRw5BHgKlz32bl9cqfMiRfPlxEq7I/ochPjdkiD+ZgixgSgWQPxsrdUEcCRETtQnJzb1jmQHeae8F9sIsl5ZYemMPzCaXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768388930; c=relaxed/simple;
	bh=NGDpNgaYAnKJpFJ27LdnKRDIF7bjbzvgTyRhQktCjO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PWkBmgTT0JaJXY3oUGA8nSCc7IYPoOGSFZy8oi9GqYn8sR7lims2JV+ARLq8DyFPUfzLoANrSterCe/hsNgz9Se0CSSMeG4zTXYnmPYaweXzS0GR97R4bkXDIHrJWiPANflc5vuZ58gxmA+AzFCLKUCkadupI6HVxK3uyq38FZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=AjzIh0RA; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="AjzIh0RA"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0ac29fca1so54557065ad.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 03:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1768388926; x=1768993726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rp+ERt1dfU/la6Ha2tXOSz2jWN3a9Tr4qXg0gnWoaNY=;
        b=AjzIh0RArrWimh5hKL1MDgEkrBOHoLNgMq5EiwNcySzypMjPTjqCX64siqpiSNN56b
         SmeTA5PQAM0EyhqIRMLfq+bQ0qDBAIxcxYbntdZxXmrKaf6cNigi5+TVmZYbRQ4Murcr
         M+P3N4WhtF5p51/ofqEWiFcOUQrMa5Va40ApfVoclVX+ZD2gOB6x/8bdIke5LnDXqTF3
         1wIbE/hCDYn0l/r1TNd8vnbGGjMJGEoUrAfmd1KmKMOrjAFzKbRAW5JScqKjlV7S9sVA
         cRGmT0KvIDO3oX9SjJRu5P/B1xbR79oaBCl5LEWKzXuvhkK5r/DJO/vMGG6eGZuUGwHF
         uTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768388926; x=1768993726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rp+ERt1dfU/la6Ha2tXOSz2jWN3a9Tr4qXg0gnWoaNY=;
        b=f5w3wXd4rgWn7CBlBmfudAZflbIn2qj64e4K5NR2PRC9KFeIHNcxU53F+o2Nq+Rbr0
         rGf/IG6ohDy2mmEzYd/zQ+AvRh4SN22P03bkj4AiFH046uPQIaWRG23QbZQxb1MEpIfI
         e2x2x7QSvoF5NTWojR10fhOxPLJbFnP5GrOiVJI28Nt+AK3OPyZeX9NmUX7gJgjBhFLn
         DLRJp25fQhwgOQDioaUyST9WrHasi+qObjG/MwE67ji1BqnyyR9ctgwM8MZ/nF4ZCDGr
         DENiGj5sVUvuxd2jityLjPyyuDuMhowp/TIYaxOfMzOmZ9jDRJmjNgF13+1n36szH9gf
         8fMw==
X-Forwarded-Encrypted: i=1; AJvYcCWf9qGjILUpPV5nijbuROoi7NkHlnFIzwG+Ohfvp16b0HcxaeXKJJe/XCASSkLDS0wOHuFNqaIfjqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YywHsFlQeovdcheYyspCIDDk/rZb+ikRawsr2U1RKwYSRstYYKa
	tqIUyecS1/m9T976Y3jvB3JkTXRuJ/AKV0zyz84Tm6ROszOJQMCKBbHGv3Y1gGB8YkA=
X-Gm-Gg: AY/fxX5awHzFHly3vw8hrpHri2b4SlpZ2UoYOZrm2RJcG18aG6PwJr2L2B8ZFej8ok5
	lyjnEv5QfKzt98YsT6GRWXUViCDGe5MpFhaAMOPgJ/+eHfvl8geXAatyLHOi5gzi4kfjO+enG4I
	hBeO9GPvVbA6Ng19/ILoPPTpZhIQZeJBJEqvDqf0MCcFUTCsmB5l6rXEuVOASF4T/1f8IjgrrJs
	D/bxXbIykMpXCrw4JST4nbfIxEyOPyYuUNxAArUBNiGmTcgaDAjPYAIsbPEPYjgnQQ8M2FRV+fr
	htjD4CYlLsn38CtFu/4Uz7JMA9JPa0mq9PIwLdd7E/JRHj5BHG+NoJ9bE/nKaq7SyfuRVem2WyP
	1D6QIoM/+rdzlftQkZ5x8wX4VJULNPlW3EW24DX37jJJ8dKd4FViZmf1INFi2M6zVrKLUNDrA
X-Received: by 2002:a17:902:f686:b0:2a0:d728:2e79 with SMTP id d9443c01a7336-2a599e05654mr24223935ad.16.1768388925818;
        Wed, 14 Jan 2026 03:08:45 -0800 (PST)
Received: from localhost.localdomain ([147.136.157.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd492fsm103732285ad.98.2026.01.14.03.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 03:08:45 -0800 (PST)
From: Tang Yizhou <yizhou.tang@shopee.com>
X-Google-Original-From: Tang Yizhou
To: tj@kernel.org,
	corbet@lwn.net,
	axboe@kernel.dk,
	hch@lst.de
Cc: cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tang Yizhou <yizhou.tang@shopee.com>
Subject: [PATCH] docs: Fix blk-iolatency peer throttling description
Date: Wed, 14 Jan 2026 19:08:37 +0800
Message-ID: <20260114110837.84126-1-yizhou.tang@shopee.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tang Yizhou <yizhou.tang@shopee.com>

The current text states that peers with a lower latency target are
throttled, which is the opposite of the actual behavior. In fact,
blk-iolatency throttles peer groups with a higher latency target in order
to protect the more latency-sensitive group.

In addition, peer groups without a configured latency target are also
throttled, as they are treated as lower priority compared to groups with
explicit latency requirements.

Update the documentation to reflect the correct throttling behavior.

Signed-off-by: Tang Yizhou <yizhou.tang@shopee.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 7f5b59d95fce..d6f7ef08b67d 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2238,8 +2238,9 @@ IO Latency
 
 This is a cgroup v2 controller for IO workload protection.  You provide a group
 with a latency target, and if the average latency exceeds that target the
-controller will throttle any peers that have a lower latency target than the
-protected workload.
+controller will throttle any peers that have a higher latency target than the
+protected workload, as well as peers that do not have a latency target
+configured.
 
 The limits are only applied at the peer level in the hierarchy.  This means that
 in the diagram below, only groups A, B, and C will influence each other, and
@@ -2265,8 +2266,9 @@ How IO Latency Throttling Works
 
 io.latency is work conserving; so as long as everybody is meeting their latency
 target the controller doesn't do anything.  Once a group starts missing its
-target it begins throttling any peer group that has a higher target than itself.
-This throttling takes 2 forms:
+target it begins throttling any peer group that has a higher target than itself,
+as well as any peer group without a latency target. This throttling takes 2
+forms:
 
 - Queue depth throttling.  This is the number of outstanding IO's a group is
   allowed to have.  We will clamp down relatively quickly, starting at no limit
-- 
2.43.0

