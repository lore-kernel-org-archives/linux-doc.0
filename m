Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDC1395DA4
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 22:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773873022; cv=none; b=KdtRKqYg+qOG8zT0j26gCSfR1fyFlFg/gzGiPS4qRH0q9MmowcrrsT1/XivLxl4/SVfd6/uM1n8QA1cTvwNBJtEqOBEu/gQrNxHtCG8873MNbQbvKrzP3lhNtApo+HWf4mmnxAQe6GZ/2+wcTJiHfZa9DSj/hx9MIzwG3YmqJjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773873022; c=relaxed/simple;
	bh=XUG2nMpJeoG6B9ljhBEIzGZmx65mAIf5essHdmFCXwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISDmjZDMvh48xDnqkxZC3Gzds/uB0WLVS/nHwmWH2YkQuDcpzA49VA/p8HzMfpPILo6zX4jeB0CWLDuNS+m24df/Ti0pB3t71FESlBOXqEnYD2NuDxWz+vvCAxbKsZzDdPlPkZPBdLO21EGKN2d5fOrxFt6GrRtqeD7JQvCjMx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1FK5mud; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1FK5mud"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-67bb5e4cf5aso13507eaf.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 15:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773873019; x=1774477819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNNnmWHnRUZm7wwtDTGZLy0ujBXuugSXcNtRiTK4tAk=;
        b=N1FK5mudQcE3fXighw0xP7NsaVdH4YqhKiHyb7kJO8zob8omU4FgxwVL6E6VFzwLyW
         HdIf4S66cUz1KHWEKh3R2k4mB5fP4wh/RRmQaundb2vgUHxzASh6kZvW+RfZP0UaEyZf
         a4pG1ndpONim1Cvzfv0zY4qf7DLodxDAliP42orDJRgBk77mOhga4Q70rV05epfM7O3g
         yh+brGbHN8nV3/gVsPQfKgslFToDdmvm1+f6PwrpYyoefADU35i6hPAEqr/kPWGQBlW8
         aBdRaj3ZBIAcyVDrmhJURbc3ZJEXC0jRwQ9DYfFXgaDx1SWNTnxBdrV1Jb3Y+zdyvtgo
         EqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773873019; x=1774477819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XNNnmWHnRUZm7wwtDTGZLy0ujBXuugSXcNtRiTK4tAk=;
        b=Zvl/yoEoAJOtgyfTHbqgi9/xRRu0qc9oGKjAKhzA1qLSy107md8HFg5v9geobc61BX
         /Kv+7/xYFM6r8sZUz213U/M6z0P8L/sHdahW/fO1Azo7nlx7STLJH69I8khXgWJoYUSk
         IbT42VkTzVocV/ClWTc5JWlHpTe9hZyNj2jYznn52SL53f3eOHflwExb1Uz6UDe+nwpp
         3wELO/2cKqtC0EkJ97SHnrR/tiQjQ2rW0c72xHw/O/X/yDwXUdcHoFqJvYJ4ugS1z/kS
         PnZtdz3fQK5MqqofUJJ7k1yRKey5omQm09aH7oxhJF85wbet2GNARzs25Q5vFizfzCqn
         P9Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVgevtz5zUlKb7M0yozqru5N5yEPNNq1Bm2U9d79NtVSyFyG3fwaaQroYtwyzf1e6l5fFwY8bowUVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGnGxB/JkCV2fADdcSaIP9Y14RxaxzwSf7W/iRQtTkw7UQjIuC
	L1yncYGSiHzEwTMhYp9R8CAkDMrIZ1dbIEPrf0CsPKgQVzWZjmoU3pOi
X-Gm-Gg: ATEYQzyHqZoGORmclXKN+JG0cnBP4QNKoKpZUnQxsBgiTqogO4qjVaswGavyePhpyV5
	njkCCns6a9a5+WClQbOGCHJJSvnDFJinkl5Utj3Je4vBjWdfsOOVS3UBJhDzkiSFI3nnaKrKEpv
	z8jN1Ka8cduHT3Py9LR0efuwznSHLHpTuaTSmS/sovme8Zy/PLss816po3xK/va3TtRQrA/B0Z8
	K4F5vbQUE4HwrdQy3gn6Z5P1HnW/dnB3fZdUQPLk//Mn/opCMrb74twlnWMg6J/yC4hZGUUZ4rF
	aSEVy8kT0nUo67x5Js0rbsQanmQ/ojAgJ5SztHg6gxj1yUvHqJBgV2k19pa8DIb0men6cvchjus
	PFmU1k8qqePP1EoOT1N6J/UEfioAhLeyS8bgX9nXf/QWg4EJVwMyN7c2tI0fJep3vo7NkyDzB2E
	+b0lG00j4U9tHqYmil7UO2yjPmdG/wQ0s2uc/KkwXBQal6TfrANGdeYgJr
X-Received: by 2002:a05:6820:c89:b0:67b:ad6a:ac10 with SMTP id 006d021491bc7-67c0db1a703mr3715865eaf.50.1773873019226;
        Wed, 18 Mar 2026 15:30:19 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:58::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c0d88c5bbsm2544446eaf.10.2026.03.18.15.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 15:30:18 -0700 (PDT)
From: Nhat Pham <nphamcs@gmail.com>
To: kasong@tencent.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	apopple@nvidia.com,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	bhe@redhat.com,
	byungchul@sk.com,
	cgroups@vger.kernel.org,
	chengming.zhou@linux.dev,
	chrisl@kernel.org,
	corbet@lwn.net,
	david@kernel.org,
	dev.jain@arm.com,
	gourry@gourry.net,
	hannes@cmpxchg.org,
	hughd@google.com,
	jannh@google.com,
	joshua.hahnjy@gmail.com,
	lance.yang@linux.dev,
	lenb@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pm@vger.kernel.org,
	lorenzo.stoakes@oracle.com,
	matthew.brost@intel.com,
	mhocko@suse.com,
	muchun.song@linux.dev,
	npache@redhat.com,
	nphamcs@gmail.com,
	pavel@kernel.org,
	peterx@redhat.com,
	peterz@infradead.org,
	pfalcato@suse.de,
	rafael@kernel.org,
	rakie.kim@sk.com,
	roman.gushchin@linux.dev,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shakeel.butt@linux.dev,
	shikemeng@huaweicloud.com,
	surenb@google.com,
	tglx@kernel.org,
	vbabka@suse.cz,
	weixugc@google.com,
	ying.huang@linux.alibaba.com,
	yosry.ahmed@linux.dev,
	yuanchu@google.com,
	zhengqi.arch@bytedance.com,
	ziy@nvidia.com,
	kernel-team@meta.com,
	riel@surriel.com
Subject: [PATCH v4 15/21] zswap: do not start zswap shrinker if there is no physical swap slots
Date: Wed, 18 Mar 2026 15:29:46 -0700
Message-ID: <20260318222953.441758-16-nphamcs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318222953.441758-1-nphamcs@gmail.com>
References: <20260318222953.441758-1-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When swap is virtualized, we no longer pre-allocate a slot on swapfile
for each zswap entry. Do not start the zswap shrinker if there is no
physical swap slots available.

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/zswap.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/zswap.c b/mm/zswap.c
index c5e1d252cb463..9d1822753d321 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1211,6 +1211,14 @@ static unsigned long zswap_shrinker_count(struct shrinker *shrinker,
 	if (!zswap_shrinker_enabled || !mem_cgroup_zswap_writeback_enabled(memcg))
 		return 0;
 
+	/*
+	 * When swap is virtualized, we do not have any swap slots on swapfile
+	 * preallocated for zswap objects. If there is no slot available, we
+	 * cannot writeback and should just bail out here.
+	 */
+	if (!get_nr_swap_pages())
+		return 0;
+
 	/*
 	 * The shrinker resumes swap writeback, which will enter block
 	 * and may enter fs. XXX: Harmonize with vmscan.c __GFP_FS
-- 
2.52.0

