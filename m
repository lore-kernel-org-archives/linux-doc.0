Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E40E2C11E4
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 05:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773984277; cv=none; b=ZtMGEqBLopjfAXdIE+pSyy8ncLHBPNTguagHXmijFXvhgURSRXOlrRn8Miy24obbfjrh4fpIJNnp4omU19anlPak0WwcTc0dTw3tQkH7YQhyFgYJw8aKTrAdc5uwGhwDDGdttPHMVNiYgdrJjG7qFxfoAZA9w831wf3jel5tLaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773984277; c=relaxed/simple;
	bh=XTy61AdYWWJdbL/8/InZlSZnoZsdovmZHMW+Vr904Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JPY8W8tO/1EP+4zM0rEEqoNCJ4vcomDoFR6g+A6oSOtoeEENUqKqAHDU/oMg/Qu3/M7IDe6gNgWiqkg0RcVka928yMUZY7m+v0iMgg0c7HkwWMjBE7baR8myO9t6+dZRA0G172ybcSAI2udGvE39Bx6kulZRkiEG7bE8PFjKR64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMUSji1B; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMUSji1B"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ad9a9be502so1514365ad.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 22:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773984276; x=1774589076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dMXG2iiWDtSJZMsB11hiOBrR4Hw4ibVnoY6QikWleZY=;
        b=UMUSji1BQMVVubowB4AzwzUJt7uMIrK/84bBs2ToHuPb0OPxn/7yxHYlooOKo5osQ7
         /O1zsjNM01MKYu3yV0KD9fkgCFWI+9JJDeF3dhw9QDMB6sTF/tdIJCQnEcQMH50uO0kM
         4X2Taq+7QFFvVUchYfuvO+C1p9mvKYC2C13ywJa7PNC/1fippimflej01zHDBu6g1BrR
         UPYDK5zc/3r+Gi/aNgquRh22NGQgBls3PUoHsZsWR+uIeLJ7okOxr4Pgnzt+XEJzeC4F
         TfPCjcW1PxyUxHMo4ZZtiEGS2ZCbIp3Hf1ORbuIwNkljn9GRDYQFEJMrICrlqoWr9OLe
         ZMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773984276; x=1774589076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMXG2iiWDtSJZMsB11hiOBrR4Hw4ibVnoY6QikWleZY=;
        b=daBNVxWlxpg7oFRK6OhW5NYs7tkUnYckkJ/FRJWm1Q4TJaEptjB2zrwTm94GqyJjKh
         1R/r+aAMf/Vr10MM97fp/QSHaK8gFPmGWV8amxKpTBFAAWKgp7KcEhag5/kEJvh8tDBN
         fg2vbScsXTQ1ELzIUFuXLHiwTE4E9e8IHyzXAZvwiqKFB0POvOYj0oNaIXMdLEhe5jsq
         usbBLIQZ0I4N82SSAsuFgHqhMUFMvy22X462Et7X3g15qL1mcdVR08Hv3bGn2v1izvFv
         VdcYQ1w7UjDhuLmgT5YS3uOSSdtJScVbRYdK6dyG9TfhBEBCe6hJLJbE8cjpOl0B0Gl3
         lFFA==
X-Forwarded-Encrypted: i=1; AJvYcCVn6nNMly6qVThGo3Jx3Ru2R62Zt4wBvw0AN5ZLxsXuiSs6dMpKICyoAI1h1l5snKR7iXm8jPy9f9c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx77vXjoXfYrzEFlHMEK0Uz7B4B5A5Hw7eiuDs2rzJsBFADU09Q
	KjKR89Z1STzs+ny/Z/IZJKmXlg1PBTFcnet1mQG17Wv5M5Dok1wkj8l0
X-Gm-Gg: ATEYQzzZBsXTol7fgous3+QmqUp6rdOKdy66ksWOM0/NtUysRtGsE9SMYzc7SgtZAFO
	TaWoiTaVr3mULqSJQ7Hpk1c6IwGbWfNJg6Q+QMTAxb8GGlj1tJvCOMDKdYTR4zlO7Q/IUvvomnH
	nE3C3r3/Hl2Gwm84aFAkotzqURSp9slfnbp30rxAMCK7SiAxeF8wTqkZYnSI9Kp18txBVJdAOP8
	GY8GG5Qv9CtF0H/P79e+6e9xvydZkqT+Qfx7dATZr6wd26FP+6GaNS4X9ym+CAWsms4uKf9myOX
	qVfQnKDXsCdKwe81mcuM58jgrSXcZZY+5MAurWSn1bVTaB58ku6SbDNYK9FKv/UOdmnrobQyJUR
	6naEX5rG2sknfEgK8UDBa7sk7hTAGD3/kMJOOmQcVM0AuP46Qealy4waB9xF2hhPAd4ZWNEcoh8
	WJpAP3qTotHWZWQL0lMnWPHJMAGGk95HwClAI3WpTfqwfCSmNL8Ok=
X-Received: by 2002:a17:903:191:b0:2ae:8272:deb0 with SMTP id d9443c01a7336-2b0826feb3dmr17511375ad.15.1773984275780;
        Thu, 19 Mar 2026 22:24:35 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:898b:301c:d085:a35:99e7:ffec])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08352ae70sm10024185ad.23.2026.03.19.22.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 22:24:35 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: linux-mm@kvack.org,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Liew Rui Yan <aethernet65535@gmail.com>
Subject: [PATCH] Docs/mm/damon: document min_nr_regions constraint and rationale
Date: Fri, 20 Mar 2026 13:24:28 +0800
Message-ID: <20260320052428.213230-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current DAMON implementation requires 'min_nr_regions' to be at
least 3. However, this constraint is not explicitly documented in the
admin-guide documents, nor is its design rationale explained in the
design document.

Add a section in design.rst to explain the rationale: the virtual
address space monitoring design needs to handle at least three regions
to accommodate two large unmapped areas. While this is specific to
'vaddr', DAMON currently enforces it across all operation sets for
consistency.

Also update reclaim.rst and lru_sort.rst by adding cross-references to
this constraint within their respective 'min_nr_regions' parameter
description sections, ensuring users are aware of the lower bound.

This change is motivated from a recent discussion [1].

[1] https://lore.kernel.org/damon/20260319151528.86490-1-sj@kernel.org/T/#t

Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---
 Documentation/admin-guide/mm/damon/lru_sort.rst | 4 ++++
 Documentation/admin-guide/mm/damon/reclaim.rst  | 4 ++++
 Documentation/mm/damon/design.rst               | 7 +++++++
 3 files changed, 15 insertions(+)

diff --git a/Documentation/admin-guide/mm/damon/lru_sort.rst b/Documentation/admin-guide/mm/damon/lru_sort.rst
index 20a8378d5a94..3d08baf9802c 100644
--- a/Documentation/admin-guide/mm/damon/lru_sort.rst
+++ b/Documentation/admin-guide/mm/damon/lru_sort.rst
@@ -221,6 +221,10 @@ But, setting this too high could result in increased monitoring overhead.
 Please refer to the DAMON documentation (:doc:`usage`) for more detail.  10 by
 default.
 
+Note that this must be 3 or higher. Please refer to the :ref:`Monitoring
+<damon_design_monitoring>` section of the design document for the rationale
+behind this lower bound.
+
 max_nr_regions
 --------------
 
diff --git a/Documentation/admin-guide/mm/damon/reclaim.rst b/Documentation/admin-guide/mm/damon/reclaim.rst
index 8eba3da8dcee..153bf42645dd 100644
--- a/Documentation/admin-guide/mm/damon/reclaim.rst
+++ b/Documentation/admin-guide/mm/damon/reclaim.rst
@@ -204,6 +204,10 @@ monitoring.  This can be used to set lower-bound of the monitoring quality.
 But, setting this too high could result in increased monitoring overhead.
 Please refer to the DAMON documentation (:doc:`usage`) for more detail.
 
+Note that this must be 3 or higher. Please refer to the :ref:`Monitoring
+<damon_design_monitoring>` section of the design document for the rationale
+behind this lower bound.
+
 max_nr_regions
 --------------
 
diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index dd64f5d7f319..68a25e07203c 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -165,6 +165,13 @@ monitoring attributes, ``sampling interval``, ``aggregation interval``,
 ``update interval``, ``minimum number of regions``, and ``maximum number of
 regions``.
 
+Note that ``minimum number of regions`` must be 3 or higher. This is because the
+virtual address space monitoring is designed to handle at least three regions to
+accommodate two large unmapped areas commonly found in normal virtual address
+spaces. While this restriction might not be strictly necessary for other
+operation sets like ``paddr``, it is currently enforced across all DAMON
+operations for consistency.
+
 To know how user-space can set the attributes via :ref:`DAMON sysfs interface
 <sysfs_interface>`, refer to :ref:`monitoring_attrs <sysfs_monitoring_attrs>`
 part of the documentation.
-- 
2.53.0

