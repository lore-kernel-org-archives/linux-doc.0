Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BB439CCE3
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 06:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786517982; cv=none; b=IIq+TcfNQFbCKI8q079qfYTtR20QVaRN8i25Wofcc5V13mx3UK1R6SQAA8q8YmCokwKIJVDqws26b5nfh8XFzKMijubnppnoXh2CzoI+XAxbq6qsSGra5xgbaD+AzFGJad1t8VRhGEro+rGFUIUX31sSrGO8cgvn6TtT3SvQnHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786517982; c=relaxed/simple;
	bh=IBIsXPsiyG0M3VuvrMK9bIS+RRh0mxA2w8MD+MPV0kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d63p/lHxCabfTvt8U7wGcXYYZm/c/Oos+Jp8xAJ3sJ1qXOdJnTFdaOHuuZW3hBnMHWUWBIdWJyRssJMh/8UPvYzg41IUDYpMVc8wzeDCnNZMDJRwTPHO91+4sz4BXGeqsiLJLpwHhO2tmrWwv+dHMHzTnMgy4akN3rvmniqWRMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3u6FUfs; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3u6FUfs"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4995df974b3so249645e9.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 23:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786517975; x=1787122775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gzGp4RSK/VKV73d1qH4iqIoZ1Boa7bH9bYUYJjvkcf8=;
        b=h3u6FUfs+6CzWfUe+10449DR92BUq7OPAtsBfeI4fzdz4qmLfBCyxoNYw1jUBs2Tyb
         8e4HSB8x7qV6v7iPKpYHpNTQdMhzedgS+Ea+pDmKpIKv/OXhpgaDuSqYTwyBhqRNDA0u
         BSicIn/MvxuDVkv9H8BAclDTIsqQ3yivl88fzGEjTdrygetOOEfNFfeGYpF7vqXzNEZ7
         GqbKa8ib+X/f8E8IPxm2y46IG1x6qQVOLCgAM/R+GqVeJLlal3PTBppJ32696AI1HzJo
         2+45bpea6in9zEWuoREG1u5Tfk8hs9fzfhn0suHtGGjjA6NQair9pLG1Hhhm562ORf7M
         lvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786517975; x=1787122775;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gzGp4RSK/VKV73d1qH4iqIoZ1Boa7bH9bYUYJjvkcf8=;
        b=YLAA7OjgsvnbsBb9YcaWDPrJnQe2FFiU4jz8uZPSxVx58pAUX1tsWm4+33azF441LJ
         M7ChGB3nd5FRYm8fOvF2WeVfY5qQwDoNimReMezT3xgif3kS+KIA/EBnrcAQ66JxUOvb
         +XkzCsv6XKNZXQTHLX6860N0jwdZ7H1YwtSmZUo5qyDmcsU2M7ippvK2q3PhMGZ/MCza
         eKZK3TWzV85baTjXNq/34FSCYaMoNbeEmebsvzRmWrec70RARGudL9KLm48S/wgQhIWg
         VXOLO2aPvS79lPGG1unz/BHhqaodbouDfLrrmAEbx4PYzliaV7fzw0JhgEQE+EfuY03G
         0Mug==
X-Forwarded-Encrypted: i=1; AHgh+RqmikeM9dqthoiPdi2oSbJ2DdRt67kja0wvqRV9X/21Vex/O5j7TRvjK3ZkgPSQ/ZVuFez+Qd0jUmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/oLS92tZoosOXJFywsX59qT+X46i9gBf25LSBSuSC6uc7nff9
	3JuympvgDSPuFgU8KYB1N/uTyYYw/82jEs88uxkaysDv3x+FzS9w5qhF
X-Gm-Gg: AR+sD11Iy2rROR3cGnVQDKz94MKMMCqpMJNTsOEwzU8A1u8q3JZtxqCI7lhs0TFk9k+
	J7BaMtZ1717CZH5hrtiX+oHdcY+L00pJpRCTetb6q4BYHGk/yJ9646ycsIdPEnzWI/inR/NnRfW
	vvA/udnSH7D07yPg56XVvqY/aoXK9ColDcZLUK+lKuPAv/5SZsQlOaEJNnv7PtdTle7KfkdF0Be
	3kXyTxblXqX/GxN2rjHT7Q9190tXNBF+NMGGAkRKl+yND6D5vPab8Lu1BcGA2JeCohW8UpgNgMO
	L+kUOr1JMwFvFNhIJgMcMHP3sRy7lJQBlApuez5durHEw+1IVEbr0J/QfKaSk1C5hBK0SBqxl33
	kcEj+BKRMp8Oaf4dkBm+5k+GE8F9xlaWKDtX13Wti4ylqach+T9qoG4y+14Gh6h/O1nHjAfJS6u
	1GDXcP3uzb2f8gdtO5oMrUtOrRYJV12pEk/lHv3LiK0YxP4sD1wlvQcASwQ6XvWwkw5OjS9wEUw
	PrHbVHI3Srvxd5MplLZEjLm1/Y0OskO8FCStu4qqJy6ru57ItTWX8hccC/XfV6JC5EtIeFXQzrW
	lR+CAh4FyV6AtxxpV0kg0AsYJ5UT+OkXCNo/cpL27o39XA==
X-Received: by 2002:a05:600c:1c25:b0:498:1371:660c with SMTP id 5b1f17b1804b1-4997bf8879dmr16240415e9.0.1786517974771;
        Tue, 11 Aug 2026 23:59:34 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b15b807sm73628005e9.7.2026.08.11.23.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 23:59:34 -0700 (PDT)
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
Subject: [PATCH v7 6/7] docs/zh_CN: update DAMON reclaim translation
Date: Wed, 12 Aug 2026 06:59:10 +0000
Message-ID: <20260812065914.3071433-7-doehyunbaek@gmail.com>
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

Update the Chinese translation of .../admin-guide/mm/damon/reclaim.rst.

Update the translation through commit c9380cdd949d
("Docs/{admin-guide,mm}/damon: fix DAMON documentation details").

Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
---
 .../zh_CN/admin-guide/mm/damon/reclaim.rst    | 82 ++++++++++++++++++-
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
index d14ba32f7788..1e9375947295 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
@@ -58,6 +58,19 @@ enabled
 DAMON_RECLAIM。注意，由于基于水位的激活条件，DAMON_RECLAIM不能进行真正的监测和回收。
 这一点请参考下面关于水位参数的描述。
 
+commit_inputs
+-------------
+
+让 DAMON_RECLAIM 再次读取除 ``enabled`` 外的输入参数。
+
+DAMON_RECLAIM 运行期间更新的输入参数默认不会应用。一旦该参数被设置为
+``Y``，DAMON_RECLAIM 会再次读取除 ``enabled`` 外的参数值。重新读取完成后，
+该参数会被设置为 ``N``。如果重新读取时发现无效参数，DAMON_RECLAIM 会被
+禁用。
+
+一旦向该参数写入 ``Y``，用户在再次读取 ``commit_inputs`` 返回 ``N`` 之前，
+不得写入任何参数。如果用户违反该规则，内核可能表现出未定义行为。
+
 min_age
 -------
 
@@ -68,6 +81,15 @@ min_age
 
 默认为120秒。
 
+autotune_monitoring_intervals
+-----------------------------
+
+如果该参数设置为 ``Y``，DAMON_RECLAIM 会自动调优 DAMON 的采样和聚集间隔。
+自动调优的目标是在每个 DAMON 快照中捕获有意义数量的访问事件，同时将采样
+间隔限制在最小 5 毫秒、最大 10 秒。将其设置为 ``N`` 会禁用自动调优。
+
+默认禁用。
+
 quota_ms
 --------
 
@@ -98,6 +120,29 @@ quota_reset_interval_ms
 
 默认为1秒。
 
+quota_mem_pressure_us
+---------------------
+
+期望的内存压力停滞时间水平，单位为微秒。
+
+在保持其他配额设置的上限的同时，DAMON_RECLAIM 会自动增减配额的有效水平，
+目标是产生该水平的内存压力。系统范围的 ``some`` 内存 PSI 会按每个配额重置
+间隔（``quota_reset_interval_ms``）以微秒为单位收集，并与该值比较，以判断
+目标是否满足。值为零表示禁用该自动调优功能。
+
+默认禁用。
+
+quota_autotune_feedback
+-----------------------
+
+用户可指定的有效配额自动调优反馈。
+
+在保持其他配额设置的上限的同时，DAMON_RECLAIM 会自动增减配额的有效水平，
+目标是从用户接收到值为 ``10,000`` 的反馈。DAMON_RECLAIM 假定反馈值和配额
+成正比。值为零表示禁用该自动调优功能。
+
+默认禁用。
+
 wmarks_interval
 ---------------
 
@@ -149,6 +194,8 @@ min_nr_regions
 DAMON用于冷内存监测的最小监测区域数。这可以用来设置监测质量的下限。但是，设
 置的太高可能会导致监测开销的增加。更多细节请参考DAMON文档 (:doc:`usage`) 。
 
+请注意，该值必须为 3 或更高。该下限的理由请参考设计文档的 :ref:`监测 <damon_design_monitoring_zh_CN>` 章节。
+
 max_nr_regions
 --------------
 
@@ -163,7 +210,7 @@ monitor_region_start
 目标内存区域的物理地址起点。
 
 DAMON_RECLAIM将对其进行工作的内存区域的起始物理地址。也就是说，DAMON_RECLAIM
-将在这个区域中找到冷的内存区域并进行回收。默认情况下，该区域使用最大系统内存区。
+将在这个区域中找到冷的内存区域并进行回收。默认情况下，该区域使用系统的整个物理内存。
 
 monitor_region_end
 ------------------
@@ -171,7 +218,35 @@ monitor_region_end
 目标内存区域的结束物理地址。
 
 DAMON_RECLAIM将对其进行工作的内存区域的末端物理地址。也就是说，DAMON_RECLAIM将
-在这个区域内找到冷的内存区域并进行回收。默认情况下，该区域使用最大系统内存区。
+在这个区域内找到冷的内存区域并进行回收。默认情况下，该区域使用系统的整个物理内存。
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
+分别设置为 ``1024``、``0`` 和 ``10``。那么 DAMON_RECLAIM 将处理从地址零
+开始、长度为 10 KiB 的物理地址范围（以字节表示为
+``[0 * 1024, 10 * 1024)``）。
+
+``bytes_reclaim_tried_regions`` 和 ``bytes_reclaimed_regions`` 也使用该单位。
+例如，假设 ``addr_unit``、``bytes_reclaim_tried_regions`` 和
+``bytes_reclaimed_regions`` 的值分别为 ``1024``、``42`` 和 ``32``。那么这
+表示 DAMON_RECLAIM 总共尝试回收 42 KiB 内存，并成功回收了 32 KiB 内存。
+
+如果不确定，只使用默认值（``1``）并忘记这个参数即可。
+
+skip_anon
+---------
+
+跳过匿名页回收。
+
+如果该参数设置为 ``Y``，DAMON_RECLAIM 不会回收匿名页。默认值为 ``N``。
+
 
 kdamond_pid
 -----------
@@ -223,6 +298,9 @@ DAMON_RECLAIM再次什么都不做，这样我们就可以退回到基于LRU列
     # echo 200 > wmarks_low
     # echo Y > enabled
 
+请注意，该模块（damon_reclaim）不能与其他基于 DAMON 的专用模块同时运行。
+更多细节请参考 :ref:`DAMON 设计文档的专用模块互斥性 <damon_design_special_purpose_modules_exclusivity_zh_CN>`。
+
 .. [1] https://research.google/pubs/pub48551/
 .. [2] https://lwn.net/Articles/787611/
 .. [3] https://www.kernel.org/doc/html/latest/mm/free_page_reporting.html
-- 
2.43.0

