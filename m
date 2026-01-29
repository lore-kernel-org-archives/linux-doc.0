Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669AD367F50
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 21:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769723905; cv=none; b=hVUMqbveqzrSqmR7yCcJoqzyOlUKjtVy/x0Dj1WBW3fX8EXhenJlrxwH/4gvmx6YS6C+MDgkcvIr/jkeuFAr0dIZcR66ZSm99unFnrMRsUxM0aOhW/9Kj2dwPtgiHVwI78SUdbeiRncgHCZM7B0NNpIaSSMnMtLLaRf67vFaIBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769723905; c=relaxed/simple;
	bh=MmVKleijncFNV3VTWlVTPh9Yt+NHsjAHFsJeZAvuy5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbLjauOLbt/7vP22msLY6bb5n/4FAo0XuZ4dd6mmxmBeKy5fBMt9+1WFh/Z6vus3A4vKRDxoN5v/+7tOhAoDDXMOGA/1mkjH+/OZlvy3chkMfZY0CsVG52DJ6bBCSjD08teJFDqZx8g0usx0l9FSoPLRbEjp+df1uHGNMeO7sZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1EyKUdm; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1EyKUdm"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-1249b9f5703so2222603c88.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 13:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769723904; x=1770328704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmNgqwiRPaM50yoR4bSwou2vHJzKZmxQW0OFYL7FLjQ=;
        b=S1EyKUdmk+gJvCtyvML8FSLY+7zEcHBFLJ4KyUjUU0wz/PmIL2ju5Mo0Lz6NG5eTk1
         GHQEPGFaSTNmH/xUq/ybEU0AQMtrLGPLdG9698i8XDPB1+3YCDqf7z+//oU0FQvrhElH
         RZwMV5+kNQTA1HuqRWIhpcoMF/ooMDQ+FdG534GDzO1WWFnKywBB0FRbfnrM8AqhVqIv
         AtVCOmkYG+nNacYAifD7yQYJ7VnpfaT/+x+HuwEukfBQrEDBW3PjusYF4zultxDBWtTd
         CRnfE80oUyEOi9sFmsw0kRj8+0RPX0HtG18sYXuAnGYnQn3vX+hR8jX44e8Csuxvzv9i
         uQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769723904; x=1770328704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nmNgqwiRPaM50yoR4bSwou2vHJzKZmxQW0OFYL7FLjQ=;
        b=InCr57UTGBah1xq4COBnrZoZM6s86dY9J/F/OsrAA6pSlOK0OKfJabvrLRcI88NYUk
         GQeu9yTAh+RiC3gZjOPX00R3EMyUeXM/IOJQNWbKTZl+Stf81vcJsoBzwnAcgPioNYIU
         93q9CDCMi7s9UdgAdwnJKmwzu3cthWVK60Iheby1U7ngdqcuYx6bT8qEJyQgX16Cwkq0
         zvLWy7M3UEMPGbE9wExScYqyd1OI68Ls0aPJWR33hzhdayasL7FPJwnXelZ+AMwB9dnP
         ozlgBD5YmECm5GlSENTnV318TYDdIYIMieI05NCWS6PtzPmTjkQ6tBCs8ySYEygYPa8t
         gsrw==
X-Forwarded-Encrypted: i=1; AJvYcCU6Gejxo/PVwVpbbPicZwrZoy3x1ZhP4oL1ECiuRw5/WWZK4aMg8OP2g1ajm89XQBLqAHRz/buCSWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRB2pEEJ3lc7WP7mjhYRMtwEnmKdMf0y04yCCZner4SrCE0b2i
	8uhMmRGEpt0WlvrwQjbmH/ZCiOoBiv2B3wZ1L17V4dpnOOqc2y+ILvHioNHzCAo=
X-Gm-Gg: AZuq6aJNwNnXFtgTwMzuRuRdf2nDrPRwSDAGWrX8nXt3+8lMIF2/XlHP3vnLYcQ62i8
	+U3ey5vmfIEsAPre5OzDMwjGKkXk4niI2qGROacBQbKAvtOLFvagIB3l0aQldw4wm/8Gnpd1ksq
	RucAZehFtCuc5Ct77URkXFJYceZCz4bnc3gJIMrbG75F92gC3JPZqVTXyFCk3OE8OWBAenHJdTy
	BRxQPNcaNI6HqeUnOcdhdJmiygzST0By+zY3OkKy/mkdd/9RJQGOf3WjwQI+7RIOdleOxEEGhMf
	b5U0H0xnLHsEHMERIwcjK6Ep4U1+C+FwC7zv7DfSK4axyqDrtZKAb6ndwtpjZJseqaKPu01zq/j
	fKxNcHinzEGuy1tiDj1iKNA+a64hcKSMOOBpHZ8hpSJQ0V/JNmVgQWYZjLT8ftBYkxDThOIg3Vm
	IZ9Dctd8TMew==
X-Received: by 2002:a05:7300:a984:b0:2ac:21b5:f43c with SMTP id 5a478bee46e88-2b7c86db7e2mr415692eec.20.1769723903529;
        Thu, 29 Jan 2026 13:58:23 -0800 (PST)
Received: from localhost ([137.201.204.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cf8f2sm9659960eec.7.2026.01.29.13.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 13:58:23 -0800 (PST)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Subject: [PATCH 3/3] mm/damon/sysfs-schemes: expose NODE_TARGET_MEM_BP metric
Date: Thu, 29 Jan 2026 13:58:14 -0800
Message-ID: <20260129215814.1618-4-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129215814.1618-1-ravis.opensrc@gmail.com>
References: <20260129215814.1618-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sysfs support for the new NODE_TARGET_MEM_BP quota goal metric.
This exposes the metric as 'node_target_mem_bp' under the quota goal's
target_metric attribute.

The metric measures the ratio of scheme-eligible memory (regions matching
the scheme's access pattern) on a specified NUMA node to the node's total
capacity, expressed in basis points (bp, 1/10000).

Users can configure this metric by:
1. Setting target_metric to 'node_target_mem_bp'
2. Setting nid to the target NUMA node
3. Setting target_value to the desired ratio in basis points

The current_value attribute shows the measured ratio, which can be used
by userspace to compute the actual bytes of scheme-eligible memory on
the node: bytes = current_value * node_capacity / 10000.

This is particularly useful for tiered memory systems to monitor and
control the distribution of hot pages across NUMA nodes.

Suggested-by: SeongJae Park <sj@kernel.org>
Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/sysfs-schemes.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/damon/sysfs-schemes.c b/mm/damon/sysfs-schemes.c
index 3a699dcd5a7f..50133263c592 100644
--- a/mm/damon/sysfs-schemes.c
+++ b/mm/damon/sysfs-schemes.c
@@ -1038,6 +1038,10 @@ struct damos_sysfs_qgoal_metric_name damos_sysfs_qgoal_metric_names[] = {
 		.metric = DAMOS_QUOTA_NODE_MEMCG_FREE_BP,
 		.name = "node_memcg_free_bp",
 	},
+	{
+		.metric = DAMOS_QUOTA_NODE_TARGET_MEM_BP,
+		.name = "node_target_mem_bp",
+	},
 };
 
 static ssize_t target_metric_show(struct kobject *kobj,
@@ -2554,6 +2558,7 @@ static int damos_sysfs_add_quota_score(
 			break;
 		case DAMOS_QUOTA_NODE_MEM_USED_BP:
 		case DAMOS_QUOTA_NODE_MEM_FREE_BP:
+		case DAMOS_QUOTA_NODE_TARGET_MEM_BP:
 			goal->nid = sysfs_goal->nid;
 			break;
 		case DAMOS_QUOTA_NODE_MEMCG_USED_BP:
-- 
2.43.0

