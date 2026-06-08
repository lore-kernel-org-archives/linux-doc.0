Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AEB34DB72
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 06:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901886; cv=none; b=n8yOo5QK3aKLebuVtLDdBuhF5Kw+ifLTefd6NSl08bKy4z2Lx5zQ1xz8hhQqLcgY9jh3ZdRtbtRW118bF9uxNGyC3yyq8NagC83ne5GqGDhYPAnxxuj5+ru2+I2mKZGMIVBK0iNcee4DJx9fIpz05jkgXTRQoQpxX6lB6+3jaso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901886; c=relaxed/simple;
	bh=daMha6p2oNYOWtRGAhvmL4hHNGUoUxhlDdmrcYXzM2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P2lmLsJYNBq9Pdlb1CZTiemVWKkybn5tLprurHRph/Fd9XtLDCmK343TcIm1C014iGlPDiA9MCVy1GTpt4HKSUKrEU3oZdr3EJYjGknUsbTZZI6c1iS/oZ7cPn1i3P3ewFFtaZBvgPJz0dSPfGZzlswMevRy+zjdXkPb4NfBW/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmupJSfL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmupJSfL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490a762c8d5so4403465e9.0
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 23:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780901883; x=1781506683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hP/DKy9ZfltqBTxFhKDJJ3oi2AdrOJxEmiXUCCA4GS4=;
        b=GmupJSfLR3XtZ338dh1bb6nQRClIsv51u5YhbUnQAUwMszWbp0uZebkOR03ltOLCff
         7mYjje8gFVCFydCdqas/F/q9puJ5jOu7uFh3sO53bFwhw9S4Zuz/UJd+lIdzv+VJv+Bk
         pWyPdEbptgTg+o38jLjQs8RhOSUwzBLr+K0Q+S0wRrDzNX8h394UkCnIApvoX1u9le2I
         a6FS2Ey4xH2NNhBQD+YuTGJwZuaYo+Ns4uqIz7qS5zkMKYSSOa9grIq/jgKGMU2B72mt
         G1O9cbA3KtjONkB9bBYSFk1YyXWhmiXeW7Y9ERl4xfFnFVQQgltFG+Rek5Kp9q3nVrlq
         dPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901883; x=1781506683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hP/DKy9ZfltqBTxFhKDJJ3oi2AdrOJxEmiXUCCA4GS4=;
        b=HWFZ1Vyi3W74FlbfHSz32MKriSRGJ3ddf6MdqmoSOD/XAkduknSZV9Mkhl3TB7ktev
         1WpPykqMF05ATOZ28dsxbjC3kJ9p9CmJdariRm38nSAk155cAV5h4Mrc1L+TA2Xg/27b
         CQlp4aTFfGg0IdUQ0DKcwT9MJSdARLPLkgXjTNuWkMIZXPmGw0M/EUYbo5C3j36AD12x
         6C1OZcFRox2Wkdyx4Q5kdhz251PlQLRd/Fc+n7j7S5l82ETpB69EgK26rmcDcVd7+S04
         Hdx77sHEZs3gJtfYzI4DaoFVSc4viTFE0wX+bPeNGjOkDDfBSvbu1PeKXwEZ23mIs/vz
         +2zA==
X-Forwarded-Encrypted: i=1; AFNElJ83foD1xq7Ruydg+RLsQLDLQbYOn6xZAD1s88GnMaV8txqZaxYsA9tV6QoLJGIeyi4qIaa2LRpASIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuZqwLdLhqOyXQdK2XZ6Aj/MUzs/Mz3yC/zZq5eGyMc9GKGA5Q
	52GeD1gei3bA1lXzI+nKpIqO86NPBnfmyP70uPlyRjcKpUAZVyP5qUk8
X-Gm-Gg: Acq92OGkG3PMsZQA2qz/DBoDzAsHrb8w2eBdm/TDU++ykADqHqAg5pbVvqMZh7QinvW
	8Bc7hoKXhwQ/26gGA3HQ6SCl4d5Ar9C65Pqu7RgD57VitKVPK2H8niViLijhupspUY5/jDaX06Q
	BaF0Apyca7SdTYCtkxlplypTzNJU8w4jaZrIOCXNga9qaKMdgEpx+/979bkJLcNheqvU4dr1fQA
	+vdFrmE4EuSFdopx737JcYD3eV1HQc5FCTMvW+OHjhpeH5vUdPZRtnUeGVLBcT5+sBi8bD1iahe
	2j+LQ4sZBFeF+PjyPzbhON9hJ9DuAEZfagDi3ERuo8hAQHLnCv1zH3r0RWCf2a7m751TkXqR3gQ
	T77oLI2KmZybynMNgD3PgnWYVrA74u5PSzhtAy+YREJ2q9dYZwaSKWnp/NRly+n2SrFfNzgKu10
	gRQ91V+m/+4yG6hK+zlYuR6Fav6+J1u0YdThVQuU2/m8uj9zkjVhgFvrfZ9D1SpbUbDvxfL3JZ9
	+tSjlvZ4/ZuDivKoPLeObgIMpGVPICkm+ZoEA==
X-Received: by 2002:a05:600c:6990:b0:490:c123:3b7a with SMTP id 5b1f17b1804b1-490c25f5864mr104118855e9.4.1780901882209;
        Sun, 07 Jun 2026 23:58:02 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d69sm89908194f8f.29.2026.06.07.23.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:58:01 -0700 (PDT)
From: Doehyun Baek <doehyunbaek@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	SeongJae Park <sj@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	damon@lists.linux.dev,
	Doehyun Baek <doehyunbaek@gmail.com>
Subject: [PATCH v3 1/2] docs/zh_CN: update DAMON usage Chinese translation
Date: Mon,  8 Jun 2026 06:57:44 +0000
Message-ID: <20260608065745.1587885-2-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608065745.1587885-1-doehyunbaek@gmail.com>
References: <20260523094420.741003-1-doehyunbaek@gmail.com>
 <20260608065745.1587885-1-doehyunbaek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the translation of .../admin-guide/mm/damon/usage.rst into Chinese.

Update the translation through commit d9cfe515d36e
("Docs/admin-guide/mm/damon/usage: document goal_tuner sysfs file")

Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
---
 .../zh_CN/admin-guide/mm/damon/usage.rst      | 92 +++++++++++++------
 1 file changed, 65 insertions(+), 27 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
index 9d7cb51be493..4a31210b948e 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
@@ -15,6 +15,10 @@
 
 DAMON 为不同的用户提供了下面这些接口。
 
+- *专用DAMON模块。*
+  :ref:`这 <damon_modules_special_purpose>` 是为构建、发布或管理带有专用DAMON用法的内
+  核的用户准备的。使用它，用户可以在构建、启动或运行时以简单的方式为给定目的使用DAMON的主要
+  功能。
 - *DAMON用户空间工具。*
   `这 <https://github.com/damonitor/damo>`_ 为有这特权的人， 如系统管理员，希望有一个刚好
   可以工作的人性化界面。
@@ -55,30 +59,37 @@ DAMON sysfs接口的文件层次结构如下图所示。在下图中，父子关
 
     /sys/kernel/mm/damon/admin
     │ kdamonds/nr_kdamonds
-    │ │ 0/state,pid
+    │ │ 0/state,pid,refresh_ms
     │ │ │ contexts/nr_contexts
-    │ │ │ │ 0/operations
+    │ │ │ │ 0/avail_operations,operations,addr_unit
     │ │ │ │ │ monitoring_attrs/
     │ │ │ │ │ │ intervals/sample_us,aggr_us,update_us
+    │ │ │ │ │ │ │ intervals_goal/access_bp,aggrs,min_sample_us,max_sample_us
     │ │ │ │ │ │ nr_regions/min,max
     │ │ │ │ │ targets/nr_targets
-    │ │ │ │ │ │ 0/pid_target
+    │ │ │ │ │ │ 0/pid_target,obsolete_target
     │ │ │ │ │ │ │ regions/nr_regions
     │ │ │ │ │ │ │ │ 0/start,end
     │ │ │ │ │ │ │ │ ...
     │ │ │ │ │ │ ...
     │ │ │ │ │ schemes/nr_schemes
-    │ │ │ │ │ │ 0/action
+    │ │ │ │ │ │ 0/action,target_nid,apply_interval_us
     │ │ │ │ │ │ │ access_pattern/
     │ │ │ │ │ │ │ │ sz/min,max
     │ │ │ │ │ │ │ │ nr_accesses/min,max
     │ │ │ │ │ │ │ │ age/min,max
-    │ │ │ │ │ │ │ quotas/ms,bytes,reset_interval_ms
+    │ │ │ │ │ │ │ quotas/ms,bytes,reset_interval_ms,effective_bytes,goal_tuner
     │ │ │ │ │ │ │ │ weights/sz_permil,nr_accesses_permil,age_permil
+    │ │ │ │ │ │ │ │ goals/nr_goals
+    │ │ │ │ │ │ │ │ │ 0/target_metric,target_value,current_value,nid,path
     │ │ │ │ │ │ │ watermarks/metric,interval_us,high,mid,low
-    │ │ │ │ │ │ │ stats/nr_tried,sz_tried,nr_applied,sz_applied,qt_exceeds
-    │ │ │ │ │ │ │ tried_regions/
-    │ │ │ │ │ │ │ │ 0/start,end,nr_accesses,age
+    │ │ │ │ │ │ │ {core_,ops_,}filters/nr_filters
+    │ │ │ │ │ │ │ │ 0/type,matching,allow,memcg_path,addr_start,addr_end,target_idx,min,max
+    │ │ │ │ │ │ │ dests/nr_dests
+    │ │ │ │ │ │ │ │ 0/id,weight
+    │ │ │ │ │ │ │ stats/nr_tried,sz_tried,nr_applied,sz_applied,sz_ops_filter_passed,qt_exceeds,nr_snapshots,max_nr_snapshots
+    │ │ │ │ │ │ │ tried_regions/total_bytes
+    │ │ │ │ │ │ │ │ 0/start,end,nr_accesses,age,sz_filter_passed
     │ │ │ │ │ │ │ │ ...
     │ │ │ │ │ │ ...
     │ │ │ │ ...
@@ -104,7 +115,8 @@ kdamonds/
 kdamonds/<N>/
 -------------
 
-在每个kdamond目录中，存在两个文件（``state`` 和 ``pid`` ）和一个目录( ``contexts`` )。
+在每个kdamond目录中，存在三个文件（``state``、``pid`` 和 ``refresh_ms``）和一个目录
+(``contexts``)。
 
 读取 ``state`` 时，如果kdamond当前正在运行，则返回 ``on`` ，如果没有运行则返回 ``off`` 。
 写入 ``on`` 或 ``off`` 使kdamond处于状态。向 ``state`` 文件写 ``update_schemes_stats`` ，
@@ -117,6 +129,10 @@ kdamonds/<N>/
 
 如果状态为 ``on``，读取 ``pid`` 显示kdamond线程的pid。
 
+用户可以要求内核通过 ``refresh_ms`` 文件周期性地更新显示自动调优参数和DAMOS统计信息的文件。
+向该文件写入希望的更新时间间隔（毫秒）。如果间隔为零，则禁用周期性更新。读取该文件会显示当前
+设置的时间间隔。
+
 ``contexts`` 目录包含控制这个kdamond要执行的监测上下文的文件。
 
 kdamonds/<N>/contexts/
@@ -129,15 +145,19 @@ kdamonds/<N>/contexts/
 contexts/<N>/
 -------------
 
-在每个上下文目录中，存在一个文件(``operations``)和三个目录(``monitoring_attrs``,
-``targets``, 和 ``schemes``)。
+在每个上下文目录中，存在三个文件（``avail_operations``、``operations`` 和
+``addr_unit``）和三个目录（``monitoring_attrs``、``targets`` 和 ``schemes``）。
 
-DAMON支持多种类型的监测操作，包括对虚拟地址空间和物理地址空间的监测。你可以通过向文件
-中写入以下关键词之一，并从文件中读取，来设置和获取DAMON将为上下文使用何种类型的监测操作。
+DAMON支持多种类型的监测操作，包括对虚拟地址空间和物理地址空间的监测。你可以通过读取
+``avail_operations`` 文件获取可用的监测操作集列表。你可以通过向 ``operations`` 文件中写入
+``avail_operations`` 文件列出的关键词之一，并从文件中读取，来设置和获取DAMON将为上下文使用
+何种类型的监测操作。
 
  - vaddr: 监测特定进程的虚拟地址空间
  - paddr: 监视系统的物理地址空间
 
+``addr_unit`` 文件用于设置和获取操作集的 :ref:`地址单位 <damon_design_addr_unit>` 参数。
+
 contexts/<N>/monitoring_attrs/
 ------------------------------
 
@@ -161,11 +181,15 @@ contexts/<N>/targets/
 targets/<N>/
 ------------
 
-在每个目标目录中，存在一个文件(``pid_target``)和一个目录(``regions``)。
+在每个目标目录中，存在两个文件（``pid_target`` 和 ``obsolete_target``）和一个目录
+（``regions``）。
 
 如果你把 ``vaddr`` 写到 ``contexts/<N>/operations`` 中，每个目标应该是一个进程。你
 可以通过将进程的pid写到 ``pid_target`` 文件中来指定DAMON的进程。
 
+用户可以向 ``obsolete_target`` 文件写入非零值并提交它（向 ``state`` 文件写入 ``commit``），
+从目标数组中间选择性地删除目标。
+
 targets/<N>/regions
 -------------------
 
@@ -203,8 +227,9 @@ contexts/<N>/schemes/
 schemes/<N>/
 ------------
 
-在每个方案目录中，存在五个目录(``access_pattern``、``quotas``、``watermarks``、
-``stats`` 和 ``tried_regions``)和一个文件(``action``)。
+在每个方案目录中，存在九个目录（``access_pattern``、``quotas``、``watermarks``、
+``core_filters``、``ops_filters``、``filters``、``dests``、``stats`` 和
+``tried_regions``）和三个文件（``action``、``target_nid`` 和 ``apply_interval_us``）。
 
 ``action`` 文件用于设置和获取你想应用于具有特定访问模式的内存区域的动作。可以写入文件
 和从文件中读取的关键词及其含义如下。
@@ -218,6 +243,9 @@ schemes/<N>/
  - ``lru_deprio``: 对区域的LRU列表进行降低优先处理。
  - ``stat``: 什么都不做，只计算统计数据
 
+``target_nid`` 文件用于设置迁移目标节点，仅当 ``action`` 为 ``migrate_hot`` 或
+``migrate_cold`` 时有意义。``apply_interval_us`` 文件用于以微秒为单位设置和获取方案的应用间隔。
+
 schemes/<N>/access_pattern/
 ---------------------------
 
@@ -239,14 +267,20 @@ schemes/<N>/quotas/
 当预计超过配额限制时，DAMON会根据 ``目标访问模式`` 的大小、访问频率和年龄，对找到的内存区域
 进行优先排序。为了进行个性化的优先排序，用户可以为这三个属性设置权重。
 
-在 ``quotas`` 目录下，存在三个文件（``ms``, ``bytes``, ``reset_interval_ms``）和一个
-目录(``weights``)，其中有三个文件(``sz_permil``, ``nr_accesses_permil``, 和
-``age_permil``)。
+在 ``quotas`` 目录下，存在五个文件（``ms``、``bytes``、``reset_interval_ms``、
+``effective_bytes`` 和 ``goal_tuner``）和两个目录（``weights`` 和 ``goals``）。
 
 你可以设置以毫秒为单位的 ``时间配额`` ，以字节为单位的 ``大小配额`` ，以及以毫秒为单位的 ``重
 置间隔`` ，分别向这三个文件写入数值。你还可以通过向 ``weights`` 目录下的三个文件写入数值来设
 置大小、访问频率和年龄的优先权，单位为千分之一。
 
+你可以通过向 ``goal_tuner`` 文件写入算法名称，设置要使用的基于目标的有效配额自动调优算法。
+读取该文件会返回当前选定的调优器算法。读取 ``effective_bytes`` 会返回当前有效大小配额。
+
+``goals`` 目录用于设置自动配额调优目标。每个目标目录包含 ``target_metric``、
+``target_value``、``current_value``、``nid`` 和 ``path`` 文件。用户可以读写这些文件来设置
+和获取配额自动调优目标的参数。
+
 schemes/<N>/watermarks/
 -----------------------
 
@@ -271,16 +305,21 @@ schemes/<N>/stats/
 DAMON统计每个方案被尝试应用的区域的总数量和字节数，每个方案被成功应用的区域的两个数字，以及
 超过配额限制的总数量。这些统计数据可用于在线分析或调整方案。
 
-可以通过读取 ``stats`` 目录下的文件(``nr_tried``, ``sz_tried``, ``nr_applied``,
-``sz_applied``, 和 ``qt_exceeds``)）分别检索这些统计数据。这些文件不是实时更新的，所以
-你应该要求DAMON sysfs接口通过在相关的 ``kdamonds/<N>/state`` 文件中写入一个特殊的关键字
-``update_schemes_stats`` 来更新统计信息的文件内容。
+可以通过读取 ``stats`` 目录下的文件（``nr_tried``、``sz_tried``、``nr_applied``、
+``sz_applied``、``sz_ops_filter_passed``、``qt_exceeds``、``nr_snapshots`` 和
+``max_nr_snapshots``）分别检索这些
+统计数据。这些文件默认不是实时更新的。你应该要求DAMON sysfs接口通过 ``refresh_ms`` 周期性地
+更新这些文件，或者通过在相关的 ``kdamonds/<N>/state`` 文件中写入一个特殊的关键字
+``update_schemes_stats`` 来执行一次性更新。
 
 schemes/<N>/tried_regions/
 --------------------------
 
+该目录开始时有一个文件 ``total_bytes``。
+
 当一个特殊的关键字 ``update_schemes_tried_regions`` 被写入相关的 ``kdamonds/<N>/state``
-文件时，DAMON会在这个目录下创建从 ``0`` 开始命名的整数目录。每个目录包含的文件暴露了关于每个
+文件时，DAMON会更新 ``total_bytes`` 文件，使读取该文件返回方案尝试区域的总大小，并在这个目录下
+创建从 ``0`` 开始命名的整数目录。每个目录包含的文件暴露了关于每个
 内存区域的详细信息，在下一个 :ref:`聚集区间 <sysfs_monitoring_attrs>`，相应的方案的 ``动作``
 已经尝试在这个目录下应用。这些信息包括地址范围、``nr_accesses`` 以及区域的 ``年龄`` 。
 
@@ -290,9 +329,8 @@ schemes/<N>/tried_regions/
 tried_regions/<N>/
 ------------------
 
-在每个区域目录中，你会发现四个文件(``start``, ``end``, ``nr_accesses``, and ``age``)。
-读取这些文件将显示相应的基于DAMON的操作方案 ``动作`` 试图应用的区域的开始和结束地址、``nr_accesses``
-和 ``年龄`` 。
+在每个区域目录中，你会发现五个文件（``start``、``end``、``nr_accesses``、``age`` 和
+``sz_filter_passed``）。读取这些文件将显示相应的基于DAMON的操作方案 ``动作`` 试图应用的区域属性。
 
 用例
 ~~~~
-- 
2.43.0

