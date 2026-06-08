Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D24B34F255
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 06:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780898619; cv=none; b=CvK+6nFeAPBKVMaUJD6APuF+0KgzZiy7ClcF0xYtwPUy+qs4cnomQt/fpux9Ol7RT3yv5fz7FXw5EXrxPOg4/sqnvy9DPpi5F+38sBGmjly/iVnELX25WLkO+e7qdJgCDd489QWQCP2KGXlpRuPm5nd3CbuuohpYkupL/nAbUVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780898619; c=relaxed/simple;
	bh=Gh0AaKu26AkasIAJFX7pok6ajuk89Vb/2rv801fPSdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QEwP+s2zHizlZVuBYWe6TlWJATe6v+FyFgGOf8k+k4Q6fS01jY+M05pfAAKmchUytwGa0Qi52Ed1rI5+w5XwDFYbMJ1dYG/tWyvy6FMuN2C5a/e1YAnXQjJaikTvHfML4GUXxlQTQjwsky7dKrBxNAlo+eziNlGzxUQ0arFU2m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKylqy1O; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKylqy1O"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b1c39fe4so4174015e9.3
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 23:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780898617; x=1781503417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5x6Jb7L7bL4qfBCmRkvnj54bUQQmIBaMOERIcxNXNY=;
        b=aKylqy1O8ZGWfZ3P9/1Zfcp0NooCbbsHjs5dxY+cNhTXysYhgswtAPPakw4cbl3OVI
         MUngNB366IIYXg5yEEyBMbEzr+8zChv3OSZPxzWuMz/BBayKNxFIlS65wFxkushah+ER
         H5pccJEAumIfohhYJaBh7l33tGrhLcQIr28ei6C5Jo9xKf6AX0H9Z35XGdnjf47YQopz
         oF/3NtxcRyjFr8Q5f/dIn78VN7pQ1Glj044AGei6WllAJ6/laiXRDwQldEFwRhC1+O0B
         2VvP4V+HYYj3KHJkOBH8tUDQxITBb+KPzfdsI2c70CtJhmMBhkoH0Ij5VZjutj2GrJtl
         pk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780898617; x=1781503417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u5x6Jb7L7bL4qfBCmRkvnj54bUQQmIBaMOERIcxNXNY=;
        b=NjNy7+N4KPm3DgJXf5n/qETjYggALONZQpS03vF52wNzYLmZo9Pcz+61njoa1yuguA
         aJoW4m60mU26yRUs+ZD5U7UmLLEl7Hl/bDHqiQr97jEdOkl9xLXem4G69/m0kS0osQnQ
         Lu6ky9RHc8K3Vy54wCVux6w6Rptz9jO8/bNdnZlygRNrpFWNc7VzXnoSvrzR0Fd/bxd4
         pM6PKFLmgldeJusFg98KYSY1OLPGGQPablaSpFbGoPYirCuE08KwSHdmjOgRNAUtao59
         HYkjaBazZ8li3K3Djtq3qQZdtbIHWOVxIUfiBZJpU9sTqG9reeHeKgdFRiM37k2r+JBK
         TKrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bArlSMGyfZQd1/TT6s66cBx6pJwxwidcrX0ZX98Ay1/TP3Pb15vUiuF++islGzaGkQesiLAWBNNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfeaL4SZ95rT5t3ywis2LxxyAxlTW6Cw6ZX3GlrSELJ0d5aSl4
	eu47tmA1UAVJf3Dhm0a1dcEIvfwWajh7MFqWJe+W9QR5GfO3VS/LixkM
X-Gm-Gg: Acq92OFq6g9DDx2bC/cH+xPZtIoj6AKRYxM45pvJ5Vtn9lYIgo6KpZekCJy3LMdCZ88
	SCgESQ6to9QGHDdIp8eJ9YaEonKJoQU4m5fZn7x5GLbOZoitgcGNVfad79kJ8hQw+oOxysrQwCd
	7n3HuQsRRp4nVYlmWZh2q69lsLI4FepqJ8db1xLumWwT0Bl5vnCzbDPtmYMBqbRq3iWfLWVjQt8
	3h8zwpRjly37kpmZA+DqUuzyFYNn6i+pcJEdp8Zu2BD0ZQEib/8Kb9gnFTTLlDGX6ii8v2hQR1N
	pQfN1w5mUSTEaW0If39IyDqRWjHQG++jVCceTHFhchArIlhzMYoFdeRr5oMr4QmuzC5VkO6YQx1
	jdsdP41xy7dmun2SckXMZS5B7UfiWkphm6UyU+G1TZT4N1dc3p6XpZO1t9R1LM1UTQ2QqsLui6Z
	iAQ0x0NOOp6inzA98pTbv/OeUWxiTIKJ1d3i9Gslz3+eFwV5VYJyD8D7s+Yf+TxaLZ+rblGoYWC
	j6j1Igh+68IfYhfLs5pAl7hmnKxEvLUOYWITg==
X-Received: by 2002:a05:600c:540f:b0:490:b71f:2ed with SMTP id 5b1f17b1804b1-490c2603746mr104335155e9.5.1780898616493;
        Sun, 07 Jun 2026 23:03:36 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490be1f69bcsm392992805e9.8.2026.06.07.23.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:03:36 -0700 (PDT)
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
Subject: [PATCH v2 1/2] docs/zh_CN: update DAMON usage Chinese translation
Date: Mon,  8 Jun 2026 06:03:01 +0000
Message-ID: <20260608060302.1564003-2-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608060302.1564003-1-doehyunbaek@gmail.com>
References: <20260523094420.741003-1-doehyunbaek@gmail.com>
 <20260608060302.1564003-1-doehyunbaek@gmail.com>
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
 .../zh_CN/admin-guide/mm/damon/usage.rst      | 56 +++++++++++++------
 1 file changed, 40 insertions(+), 16 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
index 9d7cb51be493..3fbfa9df9935 100644
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
@@ -55,14 +59,14 @@ DAMON sysfs接口的文件层次结构如下图所示。在下图中，父子关
 
     /sys/kernel/mm/damon/admin
     │ kdamonds/nr_kdamonds
-    │ │ 0/state,pid
+    │ │ 0/state,pid,refresh_ms
     │ │ │ contexts/nr_contexts
-    │ │ │ │ 0/operations
+    │ │ │ │ 0/operations,addr_unit
     │ │ │ │ │ monitoring_attrs/
     │ │ │ │ │ │ intervals/sample_us,aggr_us,update_us
     │ │ │ │ │ │ nr_regions/min,max
     │ │ │ │ │ targets/nr_targets
-    │ │ │ │ │ │ 0/pid_target
+    │ │ │ │ │ │ 0/pid_target,obsolete_target
     │ │ │ │ │ │ │ regions/nr_regions
     │ │ │ │ │ │ │ │ 0/start,end
     │ │ │ │ │ │ │ │ ...
@@ -73,10 +77,12 @@ DAMON sysfs接口的文件层次结构如下图所示。在下图中，父子关
     │ │ │ │ │ │ │ │ sz/min,max
     │ │ │ │ │ │ │ │ nr_accesses/min,max
     │ │ │ │ │ │ │ │ age/min,max
-    │ │ │ │ │ │ │ quotas/ms,bytes,reset_interval_ms
+    │ │ │ │ │ │ │ quotas/ms,bytes,reset_interval_ms,goal_tuner
     │ │ │ │ │ │ │ │ weights/sz_permil,nr_accesses_permil,age_permil
+    │ │ │ │ │ │ │ │ goals/nr_goals
+    │ │ │ │ │ │ │ │ │ 0/target_metric,target_value,current_value,nid
     │ │ │ │ │ │ │ watermarks/metric,interval_us,high,mid,low
-    │ │ │ │ │ │ │ stats/nr_tried,sz_tried,nr_applied,sz_applied,qt_exceeds
+    │ │ │ │ │ │ │ stats/nr_tried,sz_tried,nr_applied,sz_applied,qt_exceeds,nr_snapshots,max_nr_snapshots
     │ │ │ │ │ │ │ tried_regions/
     │ │ │ │ │ │ │ │ 0/start,end,nr_accesses,age
     │ │ │ │ │ │ │ │ ...
@@ -104,7 +110,8 @@ kdamonds/
 kdamonds/<N>/
 -------------
 
-在每个kdamond目录中，存在两个文件（``state`` 和 ``pid`` ）和一个目录( ``contexts`` )。
+在每个kdamond目录中，存在三个文件（``state``、``pid`` 和 ``refresh_ms``）和一个目录
+(``contexts``)。
 
 读取 ``state`` 时，如果kdamond当前正在运行，则返回 ``on`` ，如果没有运行则返回 ``off`` 。
 写入 ``on`` 或 ``off`` 使kdamond处于状态。向 ``state`` 文件写 ``update_schemes_stats`` ，
@@ -117,6 +124,10 @@ kdamonds/<N>/
 
 如果状态为 ``on``，读取 ``pid`` 显示kdamond线程的pid。
 
+用户可以要求内核通过 ``refresh_ms`` 文件周期性地更新显示自动调优参数和DAMOS统计信息的文件。
+向该文件写入希望的更新时间间隔（毫秒）。如果间隔为零，则禁用周期性更新。读取该文件会显示当前
+设置的时间间隔。
+
 ``contexts`` 目录包含控制这个kdamond要执行的监测上下文的文件。
 
 kdamonds/<N>/contexts/
@@ -129,8 +140,8 @@ kdamonds/<N>/contexts/
 contexts/<N>/
 -------------
 
-在每个上下文目录中，存在一个文件(``operations``)和三个目录(``monitoring_attrs``,
-``targets``, 和 ``schemes``)。
+在每个上下文目录中，存在两个文件（``operations`` 和 ``addr_unit``）和三个目录
+（``monitoring_attrs``、``targets`` 和 ``schemes``）。
 
 DAMON支持多种类型的监测操作，包括对虚拟地址空间和物理地址空间的监测。你可以通过向文件
 中写入以下关键词之一，并从文件中读取，来设置和获取DAMON将为上下文使用何种类型的监测操作。
@@ -138,6 +149,8 @@ DAMON支持多种类型的监测操作，包括对虚拟地址空间和物理地
  - vaddr: 监测特定进程的虚拟地址空间
  - paddr: 监视系统的物理地址空间
 
+``addr_unit`` 文件用于设置和获取操作集的 :ref:`地址单位 <damon_design_addr_unit>` 参数。
+
 contexts/<N>/monitoring_attrs/
 ------------------------------
 
@@ -161,11 +174,15 @@ contexts/<N>/targets/
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
 
@@ -239,14 +256,20 @@ schemes/<N>/quotas/
 当预计超过配额限制时，DAMON会根据 ``目标访问模式`` 的大小、访问频率和年龄，对找到的内存区域
 进行优先排序。为了进行个性化的优先排序，用户可以为这三个属性设置权重。
 
-在 ``quotas`` 目录下，存在三个文件（``ms``, ``bytes``, ``reset_interval_ms``）和一个
-目录(``weights``)，其中有三个文件(``sz_permil``, ``nr_accesses_permil``, 和
-``age_permil``)。
+在 ``quotas`` 目录下，存在四个文件（``ms``、``bytes``、``reset_interval_ms`` 和
+``goal_tuner``）和两个目录（``weights`` 和 ``goals``）。
 
 你可以设置以毫秒为单位的 ``时间配额`` ，以字节为单位的 ``大小配额`` ，以及以毫秒为单位的 ``重
 置间隔`` ，分别向这三个文件写入数值。你还可以通过向 ``weights`` 目录下的三个文件写入数值来设
 置大小、访问频率和年龄的优先权，单位为千分之一。
 
+你可以通过向 ``goal_tuner`` 文件写入算法名称，设置要使用的基于目标的有效配额自动调优算法。
+读取该文件会返回当前选定的调优器算法。
+
+``goals`` 目录用于设置自动配额调优目标。每个目标目录包含 ``target_metric``、
+``target_value``、``current_value`` 和 ``nid`` 文件。用户可以读写这些文件来设置和获取配额
+自动调优目标的参数。
+
 schemes/<N>/watermarks/
 -----------------------
 
@@ -271,10 +294,11 @@ schemes/<N>/stats/
 DAMON统计每个方案被尝试应用的区域的总数量和字节数，每个方案被成功应用的区域的两个数字，以及
 超过配额限制的总数量。这些统计数据可用于在线分析或调整方案。
 
-可以通过读取 ``stats`` 目录下的文件(``nr_tried``, ``sz_tried``, ``nr_applied``,
-``sz_applied``, 和 ``qt_exceeds``)）分别检索这些统计数据。这些文件不是实时更新的，所以
-你应该要求DAMON sysfs接口通过在相关的 ``kdamonds/<N>/state`` 文件中写入一个特殊的关键字
-``update_schemes_stats`` 来更新统计信息的文件内容。
+可以通过读取 ``stats`` 目录下的文件（``nr_tried``、``sz_tried``、``nr_applied``、
+``sz_applied``、``qt_exceeds``、``nr_snapshots`` 和 ``max_nr_snapshots``）分别检索这些
+统计数据。这些文件默认不是实时更新的。你应该要求DAMON sysfs接口通过 ``refresh_ms`` 周期性地
+更新这些文件，或者通过在相关的 ``kdamonds/<N>/state`` 文件中写入一个特殊的关键字
+``update_schemes_stats`` 来执行一次性更新。
 
 schemes/<N>/tried_regions/
 --------------------------
-- 
2.43.0

