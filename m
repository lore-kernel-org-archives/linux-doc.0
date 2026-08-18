Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DD238425B
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 07:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787036718; cv=none; b=MInwlk8jtAi05UJAir1dGmr99HWqpzbG2JK8CfU7YyDrlRA88v1VlqQ/qw3ncPUpklBgCJJZRg3h/rNJldr1FJSuPzs3r6W4qCIHMbv3ylIM8iJ701QCXWhv+k4IYCrc7uY4qzo3HOYZ9HQOBBvIpfinPBeQnYpyGjOo8+UMfIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787036718; c=relaxed/simple;
	bh=IBIsXPsiyG0M3VuvrMK9bIS+RRh0mxA2w8MD+MPV0kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U83pIVeqUIVW8JcIpzhqIiMV961AUSNvlSh8FewUwFL/vspcykpvTG+YPdS5PgtirD25PaeGK103t5HdLPpUrZIFovITmAzws4YnmMjkjWxKhj/ucxpxtXy9l32WoUkYFXDUgdk9iP81GWFj2GulS2Z/ZlE+D5lkSG9gb2EKjco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=peOVR5ua; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="peOVR5ua"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4956d1d9fb2so5776115e9.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 00:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787036713; x=1787641513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gzGp4RSK/VKV73d1qH4iqIoZ1Boa7bH9bYUYJjvkcf8=;
        b=peOVR5ua+Fdhg5vSVU/BDTVBCgycR5PEuzeWwdM166xjutVdrmaRlpnM5SgU9MbscX
         0RYo49FvW1n5dzfEI1T272K5mHgPujKCkLwN2noJ5UTvW4U6JXBBqot23jo/xFjQ6pYS
         zzQ6Q8XNDcpMV8oTEQEPYnb77A++40hd3Q3TqhLQ5gr9QnW87+XJai0mGcbcp1Kw6j3Z
         ho+pzk+d6ZABUKcp+FbVbLwYi7ifEyPGisHQp7Kn/PC8QJtIZDwq0jFYaqZLiwC398g8
         KBNExwcPrlogv3QT85z1J7tv4xW7ok+t8HZQwgRTS8TmNgnjKwjgQswIYMg1TCYpSfZi
         ZrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787036713; x=1787641513;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gzGp4RSK/VKV73d1qH4iqIoZ1Boa7bH9bYUYJjvkcf8=;
        b=bMIgEXlUtwNE6wDftiWkL0knKg1zJvY+4Lzs23uuKRXlmqpAU0/nF+PbxYk59anxFA
         /cySnlIXZEolO3S6iB0U/z61DOfuirg5Yze7rVligtSOmpRPsAeBh/+i0auYT+Y34ScF
         PYq+tOfZT1zt8AR5rDR+HhWd4pUsxn29n3N60PjDk5gBwl1MzH07cB09P8pGFwAKrGtg
         VIfd+3ttZT7VFywFUicXMzcsrVmD7GXgfeOUObAUqLNFr+LhV+/4xwsjIMl5PPFsvUgL
         BCcEWvQlo4nM4qJY6EJMH80t/EQ1T03Op3HJPo4aN1Sx7fj+kt2nYdnvFWWwylffDm2Z
         Lj3A==
X-Forwarded-Encrypted: i=1; AHgh+RqGEsCcDtIK4lGxifoN8IeFnLCgZWkl61wUrH8YlVO7tjJtg6hvHP6PX87sBfB0+bMA5cFdSRSeHXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDjmOs5iSgmaGHdX4BvvAdH+Xv99ZhyQ/ubQFtgddlTKH8FmYT
	n4A4lmqY9DVcyltqamNjJrYEBva3grj5nw8PCtBFC20NqwbNsKiLl80Q
X-Gm-Gg: AR+sD12ot51HEbu5/wPtCectTaLVH8iCARKDmKGzgilbc6YYiequy+NtVhiKdaPr0rE
	L+cXtjO5nzf+a0IIywRuFblJSqQcqH3DzYMbzfoO/23fQMl41MUeV9qbhtvqV/3v+/JjR6NnmW7
	GOQ+/yDdamqkLp+60px53NRUb6Dz3ghwei1ArkFtlTnTOsj6Sk2GkTm9rOaF/abVNqRieYts713
	01Lq6JgcoKsBtQ+vQrQofqRFVlTuOJEezb1hKcZsDdVsOi1zJf8YFAOwhwgPo3Ws2dZAG61xVAy
	1Df4fzwu7/fcKsbtSMkPZi071LMMxh1/8SvzZvuOW9VQybnFqITqMCz0JrAEynCAaHBc1+52s6/
	imf/LvX2Iq05W7mxPCajw4Fuo+LMxs4Jp2sOIzsIOMZIpjNB78f8Ps5qZGo5WBQ1ntfRGevNmKO
	HA0eH9TpDVoTKZj5I9BNOmMVWSxBmSNPmU1l783/DQiLOmslp7KrOJlp84fWcALWzbPEuhLcjtn
	QfY9YcNpsMVGvoQyi+DPYJdnGRVoWa4bnDdB3lLIAL8rLjlT/Zcx9fXr+F2U5J+AiNVAYJ8e46U
	lz7wRWdQ81BnG7M1lwEZf0N/QK0ZceHaP3Zlb6yDGbV4/g==
X-Received: by 2002:a05:600c:8b57:b0:499:8411:9e8d with SMTP id 5b1f17b1804b1-499878cb099mr229920075e9.0.1787036713178;
        Tue, 18 Aug 2026 00:05:13 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996188217sm495557495e9.13.2026.08.18.00.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 00:05:12 -0700 (PDT)
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
Subject: [PATCH v8 6/7] docs/zh_CN: update DAMON reclaim translation
Date: Tue, 18 Aug 2026 07:03:48 +0000
Message-ID: <20260818070358.455768-7-doehyunbaek@gmail.com>
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

