Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B963E63BB
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496055; cv=none; b=I+eVHaJuFb8hP1Q8ra/n3RA9uVEgwqGicx/yEUdBiMwdk4FsRUN2tzpYa5NTvlQHD5EG7xuQyqYmH8t4cm80Gfm0gW1cEN4S/0IQkMcVswCEgEWHhytoE54vfJXM0Vx0hPc5MdLFhwrR6SlXHCPN3mvSXfW1RFyJXv19MlxUvLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496055; c=relaxed/simple;
	bh=IBIsXPsiyG0M3VuvrMK9bIS+RRh0mxA2w8MD+MPV0kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bEuiFlMbqcMkghkgeiGqSeqqcNdqYb84rqK5B6qiVzd7jNOGDU9+uBeJW1JJq+Tpug5gMRuC6Ky0ZzA2wzdoZw7cnn7ekaokid89YwZAHnLOPGASUM3RrX4gCAmSVWMRWLJ63ZDzKS2HlxTHInPIThIIslm7HzFCeW1U7VEj6yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFAAxF3y; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFAAxF3y"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490d6730461so349595e9.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 00:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783496032; x=1784100832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gzGp4RSK/VKV73d1qH4iqIoZ1Boa7bH9bYUYJjvkcf8=;
        b=TFAAxF3yLsPHpMdathFtlDeDKF42jVtqkN4WfWUbdOSHdJn49K4wCqwkS75sSEJMYk
         qVlq7mjKD/BWsOVbDm6Z34cLvM5edBx42NlOcOe900gilYhwDBo7fJpVtEzdYjL8UyUv
         JsMa9m4YItd6ncduU+x3fwDwlT2me832YZ7WwjjyXQEjg8yB9dhgNVoYzMePYFywZhFe
         w3iQOHl5e1IpOoy/3sj3LBddni/UQxhYwtiT8cwK+UT+akLB153g0AInJMOcJo4qW6Nx
         AX/mFe3e/2cxi61PCoKUjEvUnqTqv2VU/oRW7Nyra+zAYO2H7Qc6v9dk5UTJCkrs+vS3
         BiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783496032; x=1784100832;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gzGp4RSK/VKV73d1qH4iqIoZ1Boa7bH9bYUYJjvkcf8=;
        b=LTX/VmClHiDAJdKngBCSy4o/+M2p0iUhtP8luAFtmwKPxrLNozccNbDlT7mtwQmtTz
         7dsx7SHoU9dfAqFROm2/UgB0t2UwLBlvtjkTOp7Ry0ZWqv/t0wIl12hsBNEzJawbss4p
         WVDm9KW4Uy0GvJDS/egWDMYhx09Zdk6rwXvHq6grfr0G77ySLZnxlFNbhgiETLgJDsEB
         GjZN8SO5B8kn9vuLkOTW71rCgVT3/yjq6hgUiJ5LoJtDngOjoKb+uDHWgKJMHSyfOWvC
         LnkgSgrO6O+k8rHwXvIk8Oy0sEo4QYrIxem8pj18tqtjyAB9pOmsOBecFjUHJkZ7MKlv
         WKQg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/d6G6x/q9IK2fduipaG0zLgsbzRJBb1tqxdAo+Zxja2WfqWo9CM7OJzbGBWgwbGsn7HpDW5xnPtY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw79BFCOF5U9JXVd8KpfJZSqVhm+8BcgHX14wpqPfzuRQ93qUOO
	lS7xsYMkD7NQQUG7D+gFHdQTTaZFL9e3ChujbusVV1Um5wuCfGDfQby2
X-Gm-Gg: AfdE7cnTngUlvkKa16dz+b4+xQwvoa5QMKaCBBnQZt7gGutM37Rzm62A+wYyOfTF6KD
	1iHvT+fRu2i9sV0w1dQ2C2eNciR4ok6hfJ1JkYgZ8aG3+kqX4kmn/r1sUNr1ACC2xx9mzl6HUNj
	Ms40bc2YJzTXtxGlKyYGylHFN1X86OBugTVMYD+umAjFqZPyE4vXNyHOtmMBbYG+EY03Nv2WUBh
	u3fx05Cb9cilQF1wu0b9bIqPT9To5wLAfJG/LAzxVSVbX5xsFwntBTojerX5Nj5iIbMzd8vQmXN
	0ZxcmM8fkglmCO23lx8TZG29vp6/OvTDDU9AGHcZS6OG3EB3G+RyP53gYtqvFCj+H8JmyCCfJ5y
	vnp3sNjr/IhCDPVvDroQOAqT5Epgq7c6qckGYDwMqmUfwk20uHr8UayeeHGdPWirME8FopQ/QQx
	PSwpPjPacm8fskDZSu6o930EaZd2IXWzK+UrPJIluZapJlldKU+md9rBMlnqMlKriAjbxbRjfyK
	yD0PijLNloJEqd3z6MCvT4D6V4=
X-Received: by 2002:a05:600c:34d1:b0:493:b7f1:2e03 with SMTP id 5b1f17b1804b1-493e65e09a9mr7319995e9.0.1783496031640;
        Wed, 08 Jul 2026 00:33:51 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e610532fsm32876355e9.0.2026.07.08.00.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 00:33:50 -0700 (PDT)
From: Doehyun Baek <doehyunbaek@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	SJ Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Doehyun Baek <doehyunbaek@gmail.com>
Subject: [PATCH v6 6/7] docs/zh_CN: update DAMON reclaim translation
Date: Wed,  8 Jul 2026 07:32:45 +0000
Message-ID: <20260708073246.1652828-7-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708073246.1652828-1-doehyunbaek@gmail.com>
References: <20260708073246.1652828-1-doehyunbaek@gmail.com>
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

