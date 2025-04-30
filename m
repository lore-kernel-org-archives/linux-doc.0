Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6935D2882CE
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 18:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036691; cv=none; b=DQ84mdG+gCGa8w/7PM/08KXYFZKGJLmb9HcGDMditTxRGARDQd8rxDTecCzC1p69GVt712X/nL/9LPrwDnov0J0BiDFmuffx6qlHxcpLXySsLwKm84+fzVF9FL9X/Zatp6+fFosbBjvErvKuixjKiKpnSgFCU0rsc2Ir9/U0niM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036691; c=relaxed/simple;
	bh=iirzwEeYoxznZHJe7vcY27yiljb3AwlzwC5WRq52rLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D85e0f9TolVXLsuygR92HPh9MOCn1BVZ1mweJefTQhey19JGNHlGsrE+Igjcehf6V7Qomo9ndf5caw6M9Se8+UNbQ+mdJ39BI4J2FNEwTXbB7miGOMwwPS0aoD/kuRl4EF0a/gHuyKG4tl7A5tVOXkUYKjdn2DMb+K9YtF/BMTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=hrnPfHha; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="hrnPfHha"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4767e969b94so3157291cf.2
        for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 11:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746036688; x=1746641488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A39YiB1Z+l6GCsVmrhqArPxiVLmwBB2VQEqP9tXT4Ig=;
        b=hrnPfHhaQAzbrxbEaJMbYQ9nSMkwK3qabvTrVWPR51RX9eV6xdN4LMIrJNXRu3aLd+
         R/lU/gXZceDxMVeebN9N0tpY6DyD92BBpzVIuAP61GPU+efI/QzI8VkZpZCv/AP3Lh5b
         OM3n4RituY+VnxqBZDUgD3jEamKW54F8pMzMd6PIhVonpvEhqb7AZJisAsnaLVJowC0Q
         l3OmCs0rkOV1GZo13/lJCLsdNbJ9RRJlLNlsc0PhUq98X9gx/AdFV2xYiolpTdW/l3bf
         V2itiyeNxsAwbWhgNPTSJ15yN7myDiwjkpgYLzCXsyOpQ1oq9cUuzogUaAi4y9HUfOUb
         9DqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036688; x=1746641488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A39YiB1Z+l6GCsVmrhqArPxiVLmwBB2VQEqP9tXT4Ig=;
        b=nFox52Ge0PM3Gb4IHOVBq76s77Z+hmDd7K1Mjldb2mLYuaw4STmoWrOPyXGk+uGvpt
         AFIFPXERw+/FOfnfINMl1ujy5aDpo7m0D/iVP/Sq0ZxERBFDV9Jn6p3MgdTGihmIlJGP
         qou7RAx7UjbpK2H+6EeuzzoxzZIvLFZEcE2C0mxsb7Ys84yvbezykkLb0ZZBeLuLh335
         SesfnZWnky0KHVSdiYZ3cGWOLIJfbFGVsLd7EO92Ix+EtIULXVyi5NjrJrcSw2jpcgNn
         rd0iWZbj92bIKLQm0/6KWBuFOGJPpwv6Ysh1+KhtAz9NLVVL0xCbRA/ep9JPH+3QVRvn
         YXrg==
X-Gm-Message-State: AOJu0YztfEzBhW7SQjzSESaYYhgCjVDtkHJapCAmY2PBb9xFy+3wNaxU
	YSLZKTGngPIeVZx1LXsK8/FQ9AQE6rOO8sT5RQh+VcXMM6KeTLgRBNWezVUGxw8=
X-Gm-Gg: ASbGncvHcCF7io5OxOxDhSyZcehh/5oFobFmvFODin+E7CuogNOFEJPqRYqxASK8UbH
	jco096MeQtq6PrXgsW8k7hsHoJZ1p/BjAOi2ilhgbtaFf9W8RmBYrQw82kjZZBp3mQdjoYvINOx
	noIY4Y2lP6XjlOU2StYd8BQ9o572S4RQ92LDmvS4JfQLMCXAHT2wbyOB7aqbdNVHWYOuwsZSv3y
	CHcCUskNnmG4yWmIO6z5wOYyMEBFX42XxFUpVM0RmySrWpKm7j4AW2MfkssxyeSso8m+YwByE2p
	mKV/qIfUklXMyhEgr5DD3MaZ3v3sciQRl7QauAJVuh7s0SL7+QrSn1TpULbwpZPPL8ZdNxsnRyQ
	HIc3ci24e6OwF3TrJ+iGcnl8y3WdO
X-Google-Smtp-Source: AGHT+IEjj5fRlO+G4AeYsj9CnMTHgu74PV6/AnY9a7Hyw1zOc1l/ean48c9t9b0uKuyRkKfZm4P+pg==
X-Received: by 2002:a05:622a:4a17:b0:477:644a:72ec with SMTP id d75a77b69052e-48ae7a20044mr4433871cf.13.1746036688396;
        Wed, 30 Apr 2025 11:11:28 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48a64fe04efsm5897421cf.19.2025.04.30.11.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:11:28 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-cxl@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	dave@stgolabs.net,
	jonathan.cameron@huawei.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	dan.j.williams@intel.com,
	corbet@lwn.net
Subject: [RFC PATCH v2 16/18] cxl: docs/allocation/tiering
Date: Wed, 30 Apr 2025 14:10:46 -0400
Message-ID: <20250430181048.1197475-17-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430181048.1197475-1-gourry@gourry.net>
References: <20250430181048.1197475-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Carve out a space for folks to explain existing tiering mechanisms
and how CXL capacity interacts with it.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 .../driver-api/cxl/allocation/tiering.rst     | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/allocation/tiering.rst

diff --git a/Documentation/driver-api/cxl/allocation/tiering.rst b/Documentation/driver-api/cxl/allocation/tiering.rst
new file mode 100644
index 000000000000..623bb23088be
--- /dev/null
+++ b/Documentation/driver-api/cxl/allocation/tiering.rst
@@ -0,0 +1,31 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============
+Memory Tiering
+==============
+
+todo
+
+Memory Tiers
+============
+
+todo
+
+
+Transparent Page Placement
+==========================
+
+todo
+
+Data Access MONitor
+===================
+
+to be updated
+
+References
+----------
+
+- `Self-tuned Memory Tiering RFC prototype and its evaluation <https://lore.kernel.org/all/20250320053937.57734-1-sj@kernel.org/>`_
+- `SK Hynix HMSDK Capacity Expansion <https://github.com/skhynix/hmsdk/wiki/Capacity-Expansion>`_
+- `kernel documentation <https://origin.kernel.org/doc/html/latest/mm/damon/>`_
+- `project website <https://damonitor.github.io/>`_
-- 
2.49.0

