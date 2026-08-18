Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED3238B124
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 07:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787036721; cv=none; b=qO63TRI6DdqygCEStF5fazKL1CtWctvO9mriAgp8KQ8WWzAWlyPLEXf8YqNoqqp8jG2uyo3P97eT7Z9Ncm0UJnDwbV6wUMfedgbeeaFIqrMfokSprpUlFKS2NccipDH2beMHuhQ4FyOIHIsxtJmShzln5AsXerhWysWmNcRRQlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787036721; c=relaxed/simple;
	bh=Io2+2DoyZ+/tP/NSGU5iQkRUwbQAexl+mSKZsuY3WBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uP1kEFrsgDaWFmev50SL1ym/FRPvBnG0Hb8BmeTqrztAzdE/ydL8FCXNanPUusQbWLeKdANnEaZ8aB6Uw9BSGvkVLLc7/6ZzGBYCIs/F+mh1YObkxRDZfPTLL6VE64T20fYEAIppvspBsbc7h1bOgeJqzAUYGlPKB+YzGvQ/agk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qe+BWnKc; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qe+BWnKc"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4957739c22fso70245e9.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 00:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787036715; x=1787641515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s31nZQVBL8BUGSoys1iksqFJSqf6kbi1kgLlk3gjtUc=;
        b=qe+BWnKcR4lWZRuXgJDapSs3d1RrG+QZw1cMc4XAxHdx2uOtJPArZmRTRV510ARcq0
         Akq9FrEEgoOy0UyAQZTAhY3EzEaWISYi8Le1WCgQb80z20OxC/WoqfpBGPUOIHprgYf5
         71Odtf9gy06mHDAy+zabMbCn3Z5mapO8YE+OYxu0pRy1CTgC8FqMTZ4/YClKVp8VoQRV
         R4F10AoMqxjfGnA8jx3p4JIEI7zG10Xw73uwHMaKJtWB9tVDxzYrZCYddpmi8H/rBwqk
         gPszXSewOvboeuITB1H/9IioklbVIIKMF0WBGMwp2UQ9mtLLJOCFXffczbPxQ9e2vgWK
         Hc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787036715; x=1787641515;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s31nZQVBL8BUGSoys1iksqFJSqf6kbi1kgLlk3gjtUc=;
        b=RCXMCLiS0hVtzRhceFS1uhJxmTJVZVGs4fHe0n+zC34L/ymk49DXGMeBx6MFl/v82m
         lbzONKA4ISbw/XW6p7QWjFy+a1eqXE1pT37K0MxFRI0SC1qw0VyIxmPtdX28bE2LddUf
         ohqKluJixx8LjKDi6kaa5MihvdzcCIHp/aDPNR32rFqMGu5W9kWy6uv1tHJUF+gduxnO
         wlDEGSRmHXvs0jSz5slBjpkOLiQdvTBByuu+d4P6gSdkth30Esln+cWtGTgaUTJNkuGz
         UNQ3rzSe+suO/aVl85KFMGCyLffezP5q+hE434yLzVReZjnJQAb6Rxi0uJ5ZSUC/eKdf
         xzsA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4sm49KLvogBGxBn0ltunLrKiAyyQfd8K96MRm0qKPweqHWjfNTxHbsbCfpIUTjV2Y7ERps+6F91w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfBrQzCwPZZKYupFpEmnzM0RltZMoKHZLnwwqJaZCjrmml6vX7
	JQvA7ae1+OY9gXtSeDdA73A8epk4kr3WZpgQFVujm+46/pmBaeHmdqEl
X-Gm-Gg: AR+sD10Ab7GvmlA37nfMglpvCIbDZoimlFgaz4eGBmULFLw1bk/Is/ZOPM14nNmyU2H
	DICL3JMozAYhcCnI0UL18sTkF0zvbDdGW3FLYEmqwKTkwBm/4flGlnfRaDHjrXSb0eeBqR+0AJ+
	jaXFEniRtyRJ5H6qJ1DFD90Oym5HKsLmPVEQ+mmiIM17PqMqHda/WpUSyoKsugoDqnBk2V18GpK
	/zFgm0pCTfXATVMTxQ/sTeDTQ/1qUnJE6e4oxdFsHNdz+7TPdpvqKM01WWEHHYT8IGAmkvTkS4J
	CGAp5HFDr1m7oexhLJMMLWSVJc4hQlMvnL/hkFqnQ4KHWSNKflNcssU1KGrrrg6PvK8lZh8JMOu
	tQ397jgk2VsYjLpWK27lw9jsfjj38jSld6bEqHH/9ku7IZTGNJIz/PMgWLEn2t9BitHkSLUdokK
	GTdqcHxypyGygT3T1g1UWKj8hyp/KTNT3vkf5pXim1TduvQNJBMNyqKShXZ09PDbJWxsEk9eL/e
	3vQ4jo8f7HrzGXESBLtKTYFf/PtHO0wukPKPovJfQgd5kbIaQoG6Tpz+JU+RhJFp/Ffx/GYNN8N
	vIdggqndtEfbdxnYBkvktX3EBgyFUnDOIFIaz+HlTiz3Ag==
X-Received: by 2002:a05:600c:a0d:b0:498:1371:660c with SMTP id 5b1f17b1804b1-499878d5e0dmr231844905e9.0.1787036714647;
        Tue, 18 Aug 2026 00:05:14 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996188217sm495557495e9.13.2026.08.18.00.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 00:05:14 -0700 (PDT)
From: Doehyun Baek <doehyunbaek@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Doehyun Baek <doehyunbaek@gmail.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	SJ Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 7/7] docs/zh_CN: update DAMON LRU sort translation
Date: Tue, 18 Aug 2026 07:03:49 +0000
Message-ID: <20260818070358.455768-8-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818070358.455768-1-doehyunbaek@gmail.com>
References: <20260818070358.455768-1-doehyunbaek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the Chinese translation of .../admin-guide/mm/damon/lru_sort.rst.

Update the translation through commit c9380cdd949d
("Docs/{admin-guide,mm}/damon: fix DAMON documentation details").

Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
---
 .../zh_CN/admin-guide/mm/damon/lru_sort.rst   | 68 +++++++++++++++++--
 1 file changed, 64 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst
index 03d33c710604..6af0dd59ef5d 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst
@@ -48,7 +48,7 @@ DAMON_LRU_SORT使用DAMON寻找热页（范围内的页面访问频率高于用
 
 为了让系统管理员打开或者关闭并且调节指定的系统，DAMON_LRU_SORT设计了模块参数。
 这意味着，你可以添加 ``damon_lru_sort.<parameter>=<value>`` 到内核的启动命令行
-参数，或者在 ``/sys/modules/damon_lru_sort/parameters/<parameter>`` 写入正确的
+参数，或者在 ``/sys/module/damon_lru_sort/parameters/<parameter>`` 写入正确的
 值。
 
 下边是每个参数的描述
@@ -71,6 +71,41 @@ commit_inputs
 ，DAMON_LRU_SORT会再次读取除了 ``enabled`` 之外的参数。读取完成后，这个参数会被
 设置为 ``N`` 。如果在读取时发现有无效参数，DAMON_LRU_SORT会被关闭。
 
+一旦向该参数写入 ``Y``，用户在再次读取 ``commit_inputs`` 返回 ``N`` 之前，
+不得写入任何参数。如果用户违反该规则，内核可能表现出未定义行为。
+
+active_mem_bp
+-------------
+
+期望的活跃内存与[非]活跃内存比率，单位为 bp（1/10,000）。
+
+在保持其他配额设置的上限的同时，DAMON_LRU_SORT 会自动增减配额的有效水平，
+目标是让热/冷内存的 LRU [降低]优先级处理产生该活跃内存与[非]活跃内存比率。
+值为零表示禁用该自动调优功能。
+
+默认禁用。
+
+autotune_monitoring_intervals
+-----------------------------
+
+如果该参数设置为 ``Y``，DAMON_LRU_SORT 会自动调优 DAMON 的采样和聚集间隔。
+自动调优的目标是在每个 DAMON 快照中捕获有意义数量的访问事件，同时将采样
+间隔限制在最小 5 毫秒、最大 10 秒。将其设置为 ``N`` 会禁用自动调优。
+
+默认禁用。
+
+filter_young_pages
+------------------
+
+相应地为 LRU [降低]优先级处理过滤[非]年轻页。
+
+如果设置该参数，则在每次 LRU [降低]优先级处理操作前再次检查页级访问
+（年轻性）。如果该页自上次检查以来未被访问（不年轻），则跳过 LRU 提高
+优先级操作。如果该页自上次检查以来已被访问（年轻），则跳过 LRU 降低优先级
+操作。当该参数分别设置为 ``Y`` 或 ``N`` 时，会启用或禁用该功能。
+
+默认禁用。
+
 hot_thres_access_freq
 ---------------------
 
@@ -163,6 +198,8 @@ min_nr_regions
 对冷内存区域监测的最小数量。这个值可以作为监测质量的下限。不过，这个值设置的过
 大会增加开销。更多细节请参考DAMON文档 (:doc:`usage`) 。默认值为10。
 
+请注意，该值必须为 3 或更高。该下限的理由请参考设计文档的 :ref:`监测 <damon_design_monitoring_zh_CN>` 章节。
+
 max_nr_regions
 --------------
 
@@ -176,14 +213,34 @@ monitor_region_start
 
 目标内存区域的起始物理地址。
 
-DAMON_LRU_SORT要处理的目标内存区域的起始物理地址。默认，使用系统最大内存。
+DAMON_LRU_SORT要处理的目标内存区域的起始物理地址。默认，使用系统的整个物理内存。
 
 monitor_region_end
 ------------------
 
 目标内存区域的结束物理地址。
 
-DAMON_LRU_SORT要处理的目标内存区域的结束物理地址。默认，使用系统最大内存。
+DAMON_LRU_SORT要处理的目标内存区域的结束物理地址。默认，使用系统的整个物理内存。
+
+addr_unit
+---------
+
+内存地址和字节数的缩放因子。
+
+该参数用于设置和获取 DAMON_RECLAIM 的 DAMON 实例的 :ref:`地址单位 <damon_design_addr_unit_zh_CN>` 参数。
+
+``monitor_region_start`` 和 ``monitor_region_end`` 应以该单位提供。例如，
+假设 ``addr_unit``、``monitor_region_start`` 和 ``monitor_region_end``
+分别设置为 ``1024``、``0`` 和 ``10``。那么 DAMON_LRU_SORT 将处理从地址零
+开始、长度为 10 KiB 的物理地址范围（以字节表示为
+``[0 * 1024, 10 * 1024)``）。
+
+带有 ``bytes_`` 前缀的统计参数也使用该单位。例如，假设 ``addr_unit``、
+``bytes_lru_sort_tried_hot_regions`` 和 ``bytes_lru_sorted_hot_regions`` 的值
+分别为 ``1024``、``42`` 和 ``32``。那么这表示 DAMON_LRU_SORT 尝试对
+42 KiB 热内存进行 LRU 排序，并总共成功对其中 32 KiB 内存进行了 LRU 排序。
+
+如果不确定，只使用默认值（``1``）并忘记这个参数即可。
 
 kdamond_pid
 -----------
@@ -252,7 +309,7 @@ LRU的优先级的提升，同时降低那些超过120秒无人访问的内存
 进展且空闲内存低于20%，再次让DAMON_LRU_SORT停止工作，以此回退到以LRU链表为基础
 以页面为单位的内存回收上。 ::
 
-    # cd /sys/modules/damon_lru_sort/parameters
+    # cd /sys/module/damon_lru_sort/parameters
     # echo 500 > hot_thres_access_freq
     # echo 120000000 > cold_min_age
     # echo 10 > quota_ms
@@ -261,3 +318,6 @@ LRU的优先级的提升，同时降低那些超过120秒无人访问的内存
     # echo 400 > wmarks_mid
     # echo 200 > wmarks_low
     # echo Y > enabled
+
+请注意，该模块（damon_lru_sort）不能与其他基于 DAMON 的专用模块同时运行。
+更多细节请参考 :ref:`DAMON 设计文档的专用模块互斥性 <damon_design_special_purpose_modules_exclusivity_zh_CN>`。
-- 
2.43.0

