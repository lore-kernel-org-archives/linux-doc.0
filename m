Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DF938F65B
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 19:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131540; cv=none; b=gCyBa3z4KSHZQCWbLGCvbPnzHmfeEZXbxJ3dZIoUMlB2urWEUVPJl44SFsUTbnaQZV6pi7XK+y8/Hf+CytEOoFi+ayKv8J8bvKhCofEoM9iu5SOm+8NDihGS/vYzDBUWQPGFd0Ojx+Ig8PUAbBe6urDZpeW6Ij8fk3mKhSd/+bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131540; c=relaxed/simple;
	bh=dLOJNwezgriYhO1PZqtsX/aHxzI/yIGU4juBcSFDAu8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tVYnWP5yuMwOs1w1nFi9x9yDKbeKrl3g9ULCBARo5FmmOG/JGpXd8wEnJbeYWkpzS5nry44CS5O/JeWU7FIHjjpYUDfQZLZUOuqQhHO0clmm3GsYxz4P5zSO6kaUg6dzhRB2mEfbVRDDYFhLnrwb1NGhLTHxDpb3QMqctgvSqcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeiDj67h; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeiDj67h"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso16397965e9.1
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 12:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779131537; x=1779736337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGf0CT4yKcvvme5mdnXPLSkPCDM5qKcEM+nXnBaB49Y=;
        b=WeiDj67hTv5Hw40I57BkNRXYL6dPSIQe8S604hpKE3TH7xQdph5wsft+qeJb0xCP6Q
         emp1vBtHvt+ZxIZl2N+G4FdZnFM7x1+Xm8USAVYJRbYUHZqwTt3LIvPAKomLCcNh8MFk
         c4H4lXyq/rb3CSTzFILvHqg8zAjRfCbw9M0oNvZCKmvGt+CiSB3ZwsA9xcF08ORh91ql
         57q6pvTAKwiOmaeqOp83FbVR+jLqba5XXkZEbzwT4S1MVsHLH+Ql5c48BxC//jBKygJM
         OICFSItGoZXxtlhDZrj9hnAPa7x3nwoROMGzXBMTQrsyTUbR8lMZTlG7OL/th8Xvto5P
         LrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131537; x=1779736337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yGf0CT4yKcvvme5mdnXPLSkPCDM5qKcEM+nXnBaB49Y=;
        b=iMtlXb9QrNdehInGfLze3FZQYC+05IlB4c6IJzQfHrkDODEk7k+WXnXr44PX6Qdv4w
         6bs4xSnc8W6FEC3RqUPJPt0sCu8p1ndEe4ZmAciPDhQWyDCRfwaJPi0ZfmuQJrRG6zIj
         aZSGS0M7YB9IceXlh9/h8y7+btlAfJYwTG8F8Hjwq8AKS/Axq+aDKIiOc30w/YLX0R1k
         JlnCh0heKsfX3TC+SI05iJYxMGIyXI+rggcGmjmQSkyxkN2TkW1xzYz20JzfW5NjxqbB
         l7gIm0W8eWlVKBT/K3ygH4uBol9l0zpR5jVlee0Fc5EmIK37veYeD0lCEDaVxe1IMuFT
         dugg==
X-Forwarded-Encrypted: i=1; AFNElJ/AmcIumwY12n3v0Vs8eyg9GisBQiQUr5POhRv7juL4M95u9th7U5S5ZigejJ6IE3WJP22dpkSQdO0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj8/nGuNU+7DosVvrKTMDh8u26vi1hGhcYEwSi2cCacAX/XO4e
	qiWBGXktCnsAuT5YgIqIdGkTEynXNDYS/JIWTj5CP0bQ+xs384fs+Nj/
X-Gm-Gg: Acq92OGIw7VVc9vSgrpuNV/6HIUZO9wUYd/sPW829g0n4Y4+n5dNHPdJ5ylb0vsu4WF
	2PgN8RCrvBuVAReP7NnVccQIqdPZV9wZrjpMy91wOB7hMkTtL1pD0fz9VWNgAXGYJZ3LBn/iwT2
	TBh5zsnYV8sWjg9ve2wJOKosGIUQw+imY7a2fkjPNg1bkpo0jpwMisu02T/IjQ3YZVxzsQ2DAXl
	fvTSD29IVMTV6iNUZkAr9z/1CNRgRyYyiGmhSqTqtkFWCEpN0uuA+NLSIMtGT06reHZIelYY7IT
	PV6K8TcxwsZ02zLLPXjIU8Vl/VM5s/6jeuKUns7lG+Afno5iOVrlPaox+jstxL5ZpCrDCVmBuFk
	6+vGGvxqr/HPmIOsiBvQLq1Hjx0laRmfpoKOlyHTiuSPNZhQtB4kcKGAAH+QreTbP8RvpRCGTQo
	lKMeBFYWeNysHnHsGUmad1xHT30j+RKSDHzSsfl5fwNcO7tUqN8yQ=
X-Received: by 2002:a05:600c:a11c:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-48fe5fd536amr192002785e9.5.1779131537200;
        Mon, 18 May 2026 12:12:17 -0700 (PDT)
Received: from mshcherba-RedmiBook-16.. ([188.163.115.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm40043167f8f.34.2026.05.18.12.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:12:16 -0700 (PDT)
From: Maksym Shcherba <mshcherba2000@gmail.com>
X-Google-Original-From: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
Subject: [PATCH 3/6] Docs/ABI/damon: document update_schemes_quota_goals command
Date: Mon, 18 May 2026 22:09:29 +0300
Message-Id: <20260518190932.42270-3-maksym.shcherba@lnu.edu.ua>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518190932.42270-1-maksym.shcherba@lnu.edu.ua>
References: <20260518190932.42270-1-maksym.shcherba@lnu.edu.ua>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the DAMON ABI doc for the kdamond state file input command
for updating the current values of quota goals.

Assisted-by: Antigravity:Gemini-3.1-Pro
Signed-off-by: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
---
 Documentation/ABI/testing/sysfs-kernel-mm-damon | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-kernel-mm-damon b/Documentation/ABI/testing/sysfs-kernel-mm-damon
index ee29d4e204ff..0bd33c1e6790 100644
--- a/Documentation/ABI/testing/sysfs-kernel-mm-damon
+++ b/Documentation/ABI/testing/sysfs-kernel-mm-damon
@@ -36,7 +36,9 @@ Description:	Writing 'on' or 'off' to this file makes the kdamond starts or
 		kdamond.  Writing 'clear_schemes_tried_regions' to the file
 		removes contents of the 'tried_regions' directory.  Writing
 		'update_schemes_effective_quotas' to the file updates
-		'.../quotas/effective_bytes' files of this kdamond.
+		'.../quotas/effective_bytes' files of this kdamond.  Writing
+		'update_schemes_quota_goals' to the file updates
+		'.../quotas/goals/<G>/current_value' files of this kdamond.
 
 What:		/sys/kernel/mm/damon/admin/kdamonds/<K>/pid
 Date:		Mar 2022
-- 
2.43.0

