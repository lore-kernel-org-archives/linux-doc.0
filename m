Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831682E9749
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 15:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155938; cv=none; b=iPEIvl0aj5rpSFmUldvlZrPuv4IEh/Th7gE7DhnlJuzQo4ZJoDLHqyFiqkNhuS2hLjB8bhVXKA7OHYJ3U7vh/Y2ebZw9QcMG9sKjJNvc+q9WyH5dJeeEmxau1zbgCiphNcFblZfCj47v6NzkTZV+Ri7vUf4PAR1k7IWrGfHrsDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155938; c=relaxed/simple;
	bh=mHV1PgZGz2Vr0PogfSP9+zDd6Cac9V6lHQQyCpfY644=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sJ44WVjU21IXeP9tTG1F0q3ZOxzwj1lN6M6tfasf+j2NPFDys7DUkgTW7q9Qv9Ll+HtGPM4eDGNAYH8GwDx62ppkuQpyrQECtplpRSKg7Iqj7Dt3TM2yF3jyHgMI45eDROdaAjst+OGvOQTuX4Me51hrHr+gVXDAeF0dLBuNzgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJL0wNfI; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJL0wNfI"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82976220e97so3514373b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 08:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773155937; x=1773760737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dF0egp0NMjHto7AOlBLmoDYpDU8LRY2oTuHXLlJABsE=;
        b=TJL0wNfIx+H+rIlehKynL+fyzRHCaInXr+ElFUEv9SM9wreLfpM6ZQ7YYCz185daK5
         vx8V2bGe46RE0ZxcoFj9Rqss+s/VZD+HFO9hfbhp+0zOhjcXkhtzKEPZAu7sx0aSQExE
         eVBUKUZwDS/ugU86Su8M/vY1ay5aFHedu1f1wjDFQr5zlsvK31/FDen/xhS9rLn7oymO
         9riFdCnnLScNV39aITzi+WdIesyzDrj605jGJ9pHh5sYW4WoWcXhx+QlS1cHbI9kAEKW
         C+lr2J9b6GBe7QFaXFq63p3VOJ8bJcS0GDia8DgjI0hoKVq7uAu+SSe/seQDleMCRMSg
         8AdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155937; x=1773760737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dF0egp0NMjHto7AOlBLmoDYpDU8LRY2oTuHXLlJABsE=;
        b=dzquv6s1S3ukMxbVbqFdAs6jKh5yDPMnINHu5E3vVzQQmVih6NLfbSnv/OF+vPvFFk
         7Kzbn5RFhEoMbQn+an6XeAcPR25SQ1zQg1iah9up2X/N27rUAIpdb6TE48IL3t5SJR+7
         pcHI8hd/Y/rW/894sI2DmjLFLzuIPn2YcWyqC6DJBCiS5XlICGlzfBVq7Nx5hjY5CjZQ
         30xB6e+j+G0AKnQSqS2bQ9LHzinA710rKbzcZqhPCWaF/15BRPKdZdRTE8K+dLW5oDx/
         LWKhtOENKAzl1TxDyN/xFg/y+UEXC+ttRKhUP4EgpXoTOe3fIRk07wq50YQSCw1NjZUG
         f84Q==
X-Gm-Message-State: AOJu0Yx69vSW63pzeeoQrKw4cUZQP/h9KnmGVwb/nkwobV4my5yndFpv
	z12dARL0C65Q+5oF4SzZBkay3oLfffwT7kSVDOqJVq6J18kS/eYl3oJW7zFhXw==
X-Gm-Gg: ATEYQzwqF2HvLE/VCgqBVIEOwAuIF1uwP2qgw47Wauts8EsuJKQ1mAc0jevbY+Cz2hC
	cgfc7H5RyH0o+9YVuX4SbM7zCrqhv04s6XCd+yA2mk+dwOoAOmdfPniCEgAqTFlRpAvuVliK3yf
	K58d9tyHIDkqjSJ5uP6KCBI9un3fnf6n8FN9U1aZKvxqLDW9Zv347pvfQtAKHCaJExr4oEOfJsv
	xQ+VkuA5JmK8t3CN232n+uAyBM/0sS/as++KQ6vQt30kbCLqdZHrz+75xUi2dsj9M69PBvLgd4C
	8nkzk2usxzFLle7u8/83X3zi2Ev30rTM9gAqMptNg7eZCAYbV3jwX1txzC2cYwT5e0FPM9KsSUH
	hw9j2aXk/I5rgo3FcIshsi1IrZr3w4Vt5JjDh9KzXccPtZyi87MMaUBYX3FiO0bxc+4xiAQfAHe
	R74/05bElok3Bk39nSvMDcSfnhBOgzW2m8w2lTyA==
X-Received: by 2002:a05:6a00:2d89:b0:827:28ba:ff00 with SMTP id d2e1a72fcca58-829a2dbc7e3mr13800245b3a.18.1773155936776;
        Tue, 10 Mar 2026 08:18:56 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:42d1:111d:2b5b:9957])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48a20c0sm17011548b3a.43.2026.03.10.08.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:18:56 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH] docs: mm: fix typo in numa_memory_policy.rst
Date: Wed, 11 Mar 2026 00:18:37 +0900
Message-ID: <20260310151837.5888-1-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo: MPOL_INTERLEAVED -> MPOL_INTERLEAVE.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 Documentation/admin-guide/mm/numa_memory_policy.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/numa_memory_policy.rst b/Documentation/admin-guide/mm/numa_memory_policy.rst
index a70f20ce1ffb..90ab26e805a9 100644
--- a/Documentation/admin-guide/mm/numa_memory_policy.rst
+++ b/Documentation/admin-guide/mm/numa_memory_policy.rst
@@ -217,7 +217,7 @@ MPOL_PREFERRED
 	the MPOL_F_STATIC_NODES or MPOL_F_RELATIVE_NODES flags
 	described below.
 
-MPOL_INTERLEAVED
+MPOL_INTERLEAVE
 	This mode specifies that page allocations be interleaved, on a
 	page granularity, across the nodes specified in the policy.
 	This mode also behaves slightly differently, based on the
-- 
2.43.0

