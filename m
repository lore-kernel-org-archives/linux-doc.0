Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494803264F9
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 06:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786517980; cv=none; b=iM18SR119zoqYls1IH+pOdOaaWfqzm8N2ue9zQRM3EeBstRMckkr/l2Oj2N0THpjtYjUlgv27Ifb5DWrYz801TAIIlIWTPG8KM+nLxJ9DxSEvtD433XPFaD7IzRbdExlyieUdplNhAbUSFnTEZcnWcWWSSVZMwJeBpt+fhwcRe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786517980; c=relaxed/simple;
	bh=Io2+2DoyZ+/tP/NSGU5iQkRUwbQAexl+mSKZsuY3WBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mzmBJHg5zv/QRKJZLPr3mm/WlESmifaqDErg3tQBEnelOIEv0R6wKiZh9HWOdLly1Kx77qpwCUCV6OUED9hC3JzaD485tSQbSXghH7POlbWbReylSpCl5qY076EOHRjZLBQfOVmWXTaQMPIlhuMJHftCCyuB1N+2SEilWXfVp4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHwwjQti; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHwwjQti"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954b3c5cbeso545275e9.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 23:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786517976; x=1787122776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s31nZQVBL8BUGSoys1iksqFJSqf6kbi1kgLlk3gjtUc=;
        b=DHwwjQtikIXUyVqW2O6xj1OuRQRTWEDeesvsHKcFYT9GUFaH81AIYBgaxONL450vXJ
         EJ58YSIc95synbCjZ6JDpCm9S470VNXAOHFVivGTY+qMrzL4Fc3SBo92ydZ5OMV6tVJ6
         dEFD5tfGeS8DaN8yjZ5CSjHOA179ZRiuinh2iruymXPB682faAZ74sMgKTdvDMCD3fpW
         Gkxfj3AGCMV88jxpndMmi2Hkmoafqyx3CSyqeAutzI3reOL7pGdd6BbZ63NjnGkLG5wM
         Xtso+bxT7Y7hHWo/hAj3lb9J1H8xJnd0hdEIrTc3/dB26LDZKVpzUIoVgHOA8CWNYOyZ
         Exig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786517976; x=1787122776;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s31nZQVBL8BUGSoys1iksqFJSqf6kbi1kgLlk3gjtUc=;
        b=TmVEvSkyjeLKER+wNexpKfpfC//0ro2Rbi8iWrCzSprxYZxGNyCOu9+Dm5tVsJYFYw
         4R2BD1cuMkirARgSMAzbWn/qmecmEuSz1vVwC4Y9bAVEnnVUdNvW61eq+mu25GA4KOyW
         l69N4j/eYeaBErnC2SmrC8qTMme8BXNotKECS36A9XyMSJYWIDoRAelxoALadxJWaNX/
         xs+0b8IxrlfYjVmsufY4X+hfz/VXyBAHoptOKZcnEMet/cM/i5g7GF0LsdFLJVYAww2L
         APlEB7ZEdT1spuNv55pV+00T2oGib9EbynX0ccl1hyiXk2gl5DVD8E+kR0efeCjjPg+y
         AmgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5MqJjVBA0dpRrPypvqj5wQzjlmdpcwPI2zbE7u6R9ghRjP1E7tQvEWvdmnhw97Op7eqyQlTTyJak=@vger.kernel.org
X-Gm-Message-State: AOJu0YyttUBvHCfq8pHDxybVMUiReBsE16g+mmAL4tqhQ9TTEZfb3ZXg
	E4Wcnl+I2yTDVmi2RaJkOrERKBsjYCmdBuUTBj2HsSt28zSUoV95Eh0W
X-Gm-Gg: AR+sD10fB5dcjSZv/wWRzduiWy7xAJRyAzChDsjWCApNeuR9jtMzlGVDqCzRCvO65yo
	uJaLw9bNm52zASvS69FXxlUisdtl9MmWfRmOOtz4G7OJuGerANU+2uTvwjQg3s0JRrKAT4mhRTl
	V77uRJMM+R2sw5SQ5+rlW6yBknHBaZWBFO8nnTgHan1vSOlBMTkhRU28FwYMLrNof0kmoXRb5/K
	PaeJ/gaJkN4LpC30WUDY9KbHtLpb3fEnyEJY6SgUSgk6cTGv0CLGjd2AyVTgq0HReIGSXDW54B+
	fAr5gAqi9srMeh7vqeVSOdL2UBHmSQqvyYs1v9EBvOd9O7lsthCZg5s66HDPHtLybHbAAEPa5QT
	C4iT3JuzG7R9LOugO9qRI0GHnrDrGqyQvcfGh6Sn6KgsNMMWiuOVBBONqg47jUEaaQUmak/mBBT
	yjZtYICg8zBfZfkgOJQ0O5H5CYKOoxAeUwFRQS7XdIj+60Up2O7WufQSFXqfciwd2VGgmy6Fo/J
	AmhFPHTydk7fJJZjGDgpJ+5eGfYzbJPFoDZC0Wv6mM6afWCGrVKoAMTrkxCHhDIuY5rkdqy0CBA
	UjNWPg0UtmmBOYhydMjCKK/MWBZx5B+NpdygechTGaJ3mw==
X-Received: by 2002:a05:600c:c8d:b0:495:7561:a9cc with SMTP id 5b1f17b1804b1-4997c16802amr16814285e9.4.1786517976305;
        Tue, 11 Aug 2026 23:59:36 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b15b807sm73628005e9.7.2026.08.11.23.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 23:59:35 -0700 (PDT)
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
Subject: [PATCH v7 7/7] docs/zh_CN: update DAMON LRU sort translation
Date: Wed, 12 Aug 2026 06:59:11 +0000
Message-ID: <20260812065914.3071433-8-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812065914.3071433-1-doehyunbaek@gmail.com>
References: <20260812065914.3071433-1-doehyunbaek@gmail.com>
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

