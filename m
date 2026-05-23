Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496353876A7
	for <linux-doc@vger.kernel.org>; Sat, 23 May 2026 09:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779529472; cv=none; b=LpoDHPp2FcMNL7cveXK/IjwugODUi7D6quodLIEcZp01jNbO7lCf5tMTPYgUzJXxNM5n1fdkQ9d4EAQCXbaxIpcAOZmJPYqK9241Dr/jIZ3Oiq2oCJqUo5rZayyGKaICOX7STbDQ5mnRmW8kGJWkGBLhlEebshoojs8BJDfsL04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779529472; c=relaxed/simple;
	bh=yQm0uUk/zGQYTSfdlCT4Wd8HtwR9VuPovFMJfq/4FCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AP3ha4Q9Cpe8Mx8KQLCk5oTfBa4pzXT7AZ3Kf/OByEMJRDIcBkQYjgp6lZELpH/s+Q58uznqPCs+VmZhYDVMvmzY2zZQzo+slsB+QdQasLyROxXQsLls9w0zm1CvpNhjWq82lFEALvkCQ2SFNNQbakjIphgtLAmtV8Uk0wTrI7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHguyHbs; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHguyHbs"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490402ae272so1107595e9.0
        for <linux-doc@vger.kernel.org>; Sat, 23 May 2026 02:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779529469; x=1780134269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ou+whx2U59SHhGAFkPh9qCbVpPpWki3qhtcolb8YFUk=;
        b=AHguyHbsLVaNH44SBESfGOWvomxy+6PtPBCV1DNle/2rxipa2Ho+FEOqPZlg5vR0aD
         K/3d3wVSmGdRbV1vtvG2nqNoxtBXiD5P9zcDJ3yCK0KFQVr8JZJ4Fjw/M0R/czBREt9B
         2lVR68bmCu1VsT0AkYncq7QGWiko83vqOrRO3A4JqhK4afVcOK/p93tLhxTZ8dIff+g2
         H9BAS8BP6wXV0qN+QjI/CLg8kDNxUlzRMPRz2ilIg92MkEK+ih4IoIWrD4fKCZwpi/qd
         X0pUgL0JdK1S8T70cGpu6iVrKWFxz/AppOoKvWkvfbyl1DyjOfgYKiDM40xYlTxNM+1y
         /+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779529469; x=1780134269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ou+whx2U59SHhGAFkPh9qCbVpPpWki3qhtcolb8YFUk=;
        b=nrPTpCxQP02qUwD33j6lXT72T1Sh8aFbmvvqW9J7VwEzbhUqKDxEYMIoJADXuAFrTJ
         L09dtCeplsX+PQ0fMuuJ+1lE7xvXDD3qo/p4I0bRhRZeU0vhurppKG2F7q9KFEdZ67uD
         friKhp3oxLwROVB8X9HIYNMdiBy1Ext3gtNPIwZvO/kbQDNIOganTPKjvhHZVIQ078Bv
         WkS3RWR1GgTc9ZQSE+Z17ZE73TPTkIPj8tkXGnp8/udBhgPzwYYIFppArLZASopSYpLZ
         9AvA97+b7kT/MSUlJMtjrqNBg/G0B3/8gatz/ucqu4MeO8IjmUnUlgbkfZA4jD4bDBfC
         WX6g==
X-Forwarded-Encrypted: i=1; AFNElJ8ZIee5KwM1oQLdouDomk7TCU0NyxbJK2OSPTwIThI1Ce1DXQFhWnMj6OVuHS+5gMbnOrB+j+Gc0Ww=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwTBiWgr2y/cnJboL71WmSba+yjSCMfiYyPUqCp2/U//dtol7J
	EsEOO4HqDa5ClW4ebrvWcAko5pb+mj7GWFkeOV4RU4HcLn//2NwbX4Q5
X-Gm-Gg: Acq92OH0lY1VAhEci48lnfb3HULHtIg3UWD9NIAz4eiWEv21kqzPKGOZsvZ8GAwUqWC
	PdyFdnpM2BLzZHPMmOWkfRxQimjnjQktyjIJB8ACRmWqDY2jesSMIlO0YZV//UNlGE5hiHN+QZw
	F6cXisyftKTJ+GhPMKuaEM23gqisE8MaXJEMCtbkJdltI8nit4hn3SX8eG2G7KUFxpF9cfN+cf9
	74EMOqrhv/LcSQgd2yHnFacAc8xbW5GsDSvDeouOC9obtmJUwte0C2x+HklUtjyT24EbJ+EkguX
	VF0cOUYswO+SttIL43AnD8DnVgWIjJOXMYlnNMXuz+g/jg0TiJ51HnlaCcC+NFEpfKvb+ATZEki
	wjZQ4/y98y6M2M/wV+QxXXJPT4/e5hHMH0fWy3b5r3jk4FOSAsxCo55rwFH7WEx2FlQMeKfZHkT
	c86KpuJ838H79+xHUhs3uu4rjj8uw9g67oFQGTSrMw89YBscmA4D75mLifHzVGN6JrWuOTZyjeo
	7LzvUnY3sPDuvBNixZNRARNObBV5U7wKPUbiw==
X-Received: by 2002:a05:600c:6995:b0:485:f1d6:2b1d with SMTP id 5b1f17b1804b1-4904224d9e9mr54654745e9.0.1779529468347;
        Sat, 23 May 2026 02:44:28 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d48e23sm10387044f8f.20.2026.05.23.02.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 02:44:27 -0700 (PDT)
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
Subject: [PATCH 2/2] docs/zh_TW: update DAMON usage sysfs documentation
Date: Sat, 23 May 2026 09:44:19 +0000
Message-ID: <20260523094420.741003-3-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523094420.741003-1-doehyunbaek@gmail.com>
References: <20260523094420.741003-1-doehyunbaek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The DAMON usage documentation translation is missing recent sysfs
interface updates that are already documented in the English version,
including refresh_ms, addr_unit, obsolete_target, goal_tuner, nid, and
max_nr_snapshots.

Update the Traditional Chinese translation for those stale sysfs entries.

Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
---
 .../zh_TW/admin-guide/mm/damon/usage.rst      | 56 +++++++++++++------
 1 file changed, 40 insertions(+), 16 deletions(-)

diff --git a/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst b/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst
index d3fd4f850793..debe455723af 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst
@@ -15,6 +15,10 @@
 
 DAMON 爲不同的用戶提供了下面這些接口。
 
+- *專用DAMON模塊。*
+  :ref:`這 <damon_modules_special_purpose>` 是爲構建、發佈或管理帶有專用DAMON用法的內
+  核的用戶準備的。使用它，用戶可以在構建、啓動或運行時以簡單的方式爲給定目的使用DAMON的主要
+  功能。
 - *DAMON用戶空間工具。*
   `這 <https://github.com/damonitor/damo>`_ 爲有這特權的人， 如系統管理員，希望有一個剛好
   可以工作的人性化界面。
@@ -55,14 +59,14 @@ DAMON sysfs接口的文件層次結構如下圖所示。在下圖中，父子關
 
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
@@ -73,10 +77,12 @@ DAMON sysfs接口的文件層次結構如下圖所示。在下圖中，父子關
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
 
-在每個kdamond目錄中，存在兩個文件（``state`` 和 ``pid`` ）和一個目錄( ``contexts`` )。
+在每個kdamond目錄中，存在三個文件（``state``、``pid`` 和 ``refresh_ms``）和一個目錄
+(``contexts``)。
 
 讀取 ``state`` 時，如果kdamond當前正在運行，則返回 ``on`` ，如果沒有運行則返回 ``off`` 。
 寫入 ``on`` 或 ``off`` 使kdamond處於狀態。向 ``state`` 文件寫 ``update_schemes_stats`` ，
@@ -117,6 +124,10 @@ kdamonds/<N>/
 
 如果狀態爲 ``on``，讀取 ``pid`` 顯示kdamond線程的pid。
 
+用戶可以要求內核通過 ``refresh_ms`` 文件週期性地更新顯示自動調優參數和DAMOS統計信息的文件。
+向該文件寫入希望的更新時間間隔（毫秒）。如果間隔爲零，則禁用週期性更新。讀取該文件會顯示當前
+設置的時間間隔。
+
 ``contexts`` 目錄包含控制這個kdamond要執行的監測上下文的文件。
 
 kdamonds/<N>/contexts/
@@ -129,8 +140,8 @@ kdamonds/<N>/contexts/
 contexts/<N>/
 -------------
 
-在每個上下文目錄中，存在一個文件(``operations``)和三個目錄(``monitoring_attrs``,
-``targets``, 和 ``schemes``)。
+在每個上下文目錄中，存在兩個文件（``operations`` 和 ``addr_unit``）和三個目錄
+（``monitoring_attrs``、``targets`` 和 ``schemes``）。
 
 DAMON支持多種類型的監測操作，包括對虛擬地址空間和物理地址空間的監測。你可以通過向文件
 中寫入以下關鍵詞之一，並從文件中讀取，來設置和獲取DAMON將爲上下文使用何種類型的監測操作。
@@ -138,6 +149,8 @@ DAMON支持多種類型的監測操作，包括對虛擬地址空間和物理地
  - vaddr: 監測特定進程的虛擬地址空間
  - paddr: 監視系統的物理地址空間
 
+``addr_unit`` 文件用於設置和獲取操作集的 :ref:`地址單位 <damon_design_addr_unit>` 參數。
+
 contexts/<N>/monitoring_attrs/
 ------------------------------
 
@@ -161,11 +174,15 @@ contexts/<N>/targets/
 targets/<N>/
 ------------
 
-在每個目標目錄中，存在一個文件(``pid_target``)和一個目錄(``regions``)。
+在每個目標目錄中，存在兩個文件（``pid_target`` 和 ``obsolete_target``）和一個目錄
+（``regions``）。
 
 如果你把 ``vaddr`` 寫到 ``contexts/<N>/operations`` 中，每個目標應該是一個進程。你
 可以通過將進程的pid寫到 ``pid_target`` 文件中來指定DAMON的進程。
 
+用戶可以向 ``obsolete_target`` 文件寫入非零值並提交它（向 ``state`` 文件寫入 ``commit``），
+從目標數組中間選擇性地刪除目標。
+
 targets/<N>/regions
 -------------------
 
@@ -239,14 +256,20 @@ schemes/<N>/quotas/
 當預計超過配額限制時，DAMON會根據 ``目標訪問模式`` 的大小、訪問頻率和年齡，對找到的內存區域
 進行優先排序。爲了進行個性化的優先排序，用戶可以爲這三個屬性設置權重。
 
-在 ``quotas`` 目錄下，存在三個文件（``ms``, ``bytes``, ``reset_interval_ms``）和一個
-目錄(``weights``)，其中有三個文件(``sz_permil``, ``nr_accesses_permil``, 和
-``age_permil``)。
+在 ``quotas`` 目錄下，存在四個文件（``ms``、``bytes``、``reset_interval_ms`` 和
+``goal_tuner``）和兩個目錄（``weights`` 和 ``goals``）。
 
 你可以設置以毫秒爲單位的 ``時間配額`` ，以字節爲單位的 ``大小配額`` ，以及以毫秒爲單位的 ``重
 置間隔`` ，分別向這三個文件寫入數值。你還可以通過向 ``weights`` 目錄下的三個文件寫入數值來設
 置大小、訪問頻率和年齡的優先權，單位爲千分之一。
 
+你可以通過向 ``goal_tuner`` 文件寫入算法名稱，設置要使用的基於目標的有效配額自動調優算法。
+讀取該文件會返回當前選定的調優器算法。
+
+``goals`` 目錄用於設置自動配額調優目標。每個目標目錄包含 ``target_metric``、
+``target_value``、``current_value`` 和 ``nid`` 文件。用戶可以讀寫這些文件來設置和獲取配額
+自動調優目標的參數。
+
 schemes/<N>/watermarks/
 -----------------------
 
@@ -271,10 +294,11 @@ schemes/<N>/stats/
 DAMON統計每個方案被嘗試應用的區域的總數量和字節數，每個方案被成功應用的區域的兩個數字，以及
 超過配額限制的總數量。這些統計數據可用於在線分析或調整方案。
 
-可以通過讀取 ``stats`` 目錄下的文件(``nr_tried``, ``sz_tried``, ``nr_applied``,
-``sz_applied``, 和 ``qt_exceeds``)）分別檢索這些統計數據。這些文件不是實時更新的，所以
-你應該要求DAMON sysfs接口通過在相關的 ``kdamonds/<N>/state`` 文件中寫入一個特殊的關鍵字
-``update_schemes_stats`` 來更新統計信息的文件內容。
+可以通過讀取 ``stats`` 目錄下的文件（``nr_tried``、``sz_tried``、``nr_applied``、
+``sz_applied``、``qt_exceeds``、``nr_snapshots`` 和 ``max_nr_snapshots``）分別檢索這些
+統計數據。這些文件默認不是實時更新的。你應該要求DAMON sysfs接口通過 ``refresh_ms`` 週期性地
+更新這些文件，或者通過在相關的 ``kdamonds/<N>/state`` 文件中寫入一個特殊的關鍵字
+``update_schemes_stats`` 來執行一次性更新。
 
 schemes/<N>/tried_regions/
 --------------------------
-- 
2.43.0

