Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94B652D2C1
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687523; cv=none; b=Vo0Sy+7ttqTU/wNkWU5ByM0/ss+ud3HZF0NOEjdugRJl/NRDgY5QMujetPIBG/lRZaJn3eOs6CvHp9iRkI69IlawmDVxtrDzJQgWBLArjot7sjJmPtrTSCTwLCXFBnJ75uZtEmgX2hwp9eMunu/0+FwBvnHTX/JLov1WKxB/RvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687523; c=relaxed/simple;
	bh=HTirRA90UalDWnFdFzCITcI7hIB/YN/mxlnPD1vae+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LZnmyyFQrmyJcI8WN8bwlxTN2pDhFyF3jZfYC5UVdEqytpj5/SZEj9FMC3nhNmKv2OFfT15hJiQeOb3ZRdrWOGZPdaJwYM9hu7Mrq7VS89+ZmqxiSMIZcbbuiw8NNntqq1MbWF9sZtqbWqLcJfOt+Z7Cb+DfW7+0XWjRXYMme/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFbtaL9K; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFbtaL9K"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a4a98a79b8so79681a91.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 06:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687520; x=1791292320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UBGD0ul96jtIpbbV7jZQH0Vpd8aSl2z94lNjdsQZDSA=;
        b=SFbtaL9K5bglNs1f9/5o2Ig+eOIERiGSv+jH4hNw+9Z9azr69cRgRBpZqlqZnQ1YEO
         XEgiyTd531uD18tLsaYnbdrQW7XHCNAPvHKjoCGJilo+gbxmz9kMm96HoBcPhltQ/uAB
         pFk/0NPxCUAIim6eeFSrq4jNgBWx7N5QbWZBvQTcxlrGD3vfUDn2FoWwq+KwrVvkoHWR
         1u4oj5fu2Xbe9ikTB5Cq1AfHhgLnvfenJGYBNIr3JD10Df8oMXvjOwyTJk3TeHe200iI
         SmnJPVxaefWREtM8o39JpI6NgZergAWxow9azm3H8XmeaN747hdOvrC9XShOP5/StLyD
         j+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687520; x=1791292320;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UBGD0ul96jtIpbbV7jZQH0Vpd8aSl2z94lNjdsQZDSA=;
        b=0GWeY91TksyJhYjwzNs1uQcqX+/XwyBsVOIdRXJ24dwtBV8g9M+0jvsaKW5UPVA8XU
         pneEyUzDUvbgEOm45jYCQWmcTSDgBxD/blRoemdj7WuKXDbbbH4WnxF6+3H0m+NULnix
         nQGJBOfJU9UHEjnkVjMRKJ1TZiOoVKht/dHsGYOdpW8f9Et0DWqWYTiIrLuC2mHAaXNn
         +KzQCziHql4qeJcFAd6/1acg8hUAEwYM7Z6tFhka78YG0YvrMF6MWoyTY0qYF61CejPq
         8ew9uXg79aSnkb1JEH7G+ES1nKmK0AGJ5U1vwMxLK7lITcJbTBNFf87mm1mCePh3Yxtn
         sFtw==
X-Forwarded-Encrypted: i=1; AKwUvBxIddMF0UhwnWPjN3g+nIzbUh5Sn0Dd4dZt1kUpLm3sfgXawEjBPpNUUaKxhynmQXpTroWRHOI3JcI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+d28KwN7rHWIZSHX38ZZvvUKWaQ33A7Ygzxf1JgcrhWZUgYCK
	9DzQMq2SpSHRd1BxWHW6WfHXvK2PfVHpBL2ZKPWjduekCFHO6K5QMIfY
X-Gm-Gg: AYBFou1DNuyfHldFTYwilCjmqodZgh7FhyG0yszHBmHd7b6qbvbAaKcphCMH17capoO
	IMmfJ766xwTIZe+gZ+ywIuVJWwUUfFBfR/a7cUwfrmtCxEvz6OjwJssUbFojGQ0r9HFaHE6NqQI
	g95tHJuFAqA8kpwK0UZW0GSfZsu4SssU0bXNLN+AJRlUy/BpVDUESM4LwYzyjxtR5ix+d0fmJtN
	ZPnJnkVS4l9S2VZIZtEZ1MS2YYu8cwSs/yVhpDpL3NQoeVfBzpPwMXPF86vUInULJOydCQHDxKZ
	xs98o9L+0EmTGWAHiEz59l9IxeyAN1zFIbEE8Q1jHTsSzZroO85z6/6mu5tKHOCDjM/emfnIwMb
	+oFJLzprUTY1+y6buCyMbIv2FFAHY8DYdWQ1qYynPsbtthNrc/irAdhlJpQDW8mi6WhKI9EjkS5
	g+qUOBbojfRETBVTisn4B1/R9Rn6zmB4mmr1NMfxKeNnm2cT6QmiRQo71EWWmnUp+C5xf/931UP
	9hzNXjwAsZCbRJAi2wJJ/8Jy9N6HpSX4O5DjnSVSkTqPil24pKHp3bP8g==
X-Received: by 2002:a17:90b:3c4e:b0:3a4:88c2:32b8 with SMTP id 98e67ed59e1d1-3a488c245e0mr6140505a91.1.1790687520329;
        Tue, 29 Sep 2026 06:12:00 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985fed22sm5582137a91.9.2026.09.29.06.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:11:59 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org
Cc: dzm91@hust.edu.cn,
	wy@wyuan.org,
	si.yanteng@linux.dev,
	srcres258@furdevs.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 3/3] docs/zh_TW: link filesystems/ and cpu-freq/ from the index
Date: Tue, 29 Sep 2026 21:11:40 +0800
Message-ID: <20260929131142.266819-4-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929131142.266819-1-chenyou910331@gmail.com>
References: <20260929131142.266819-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

filesystems/ and cpu-freq/ each have an index.rst, but nothing links to
either, so their translations cannot be reached from the rest of the
zh_TW documentation.  As agreed in the zh_TW scope discussion, link them
rather than drop them.

The English documentation reaches both through subsystem-apis.rst,
which the zh_TW index lists only as a TODO item.  Translate
subsystem-apis.rst, with the two translated areas in its toctrees and
the rest under TODOList as zh_CN does, and link it from the index.
"Core subsystems" is rendered as 基礎子系統 rather than
核心子系統, which would read the same as the page title
now that "kernel" is 核心.

Like the pages it links to, the new page carries the notice for
translations not kept in sync.

update to commit 4f10f1dfb235 ("net: remove ISDN subsystem and Bluetooth
CMTP")

Link: https://lore.kernel.org/linux-doc/CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com/
Link: https://lore.kernel.org/linux-doc/ap5xEtMdwXS8Pvcf@wyuan.org/
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/translations/zh_TW/index.rst    |  6 +-
 .../translations/zh_TW/subsystem-apis.rst     | 99 +++++++++++++++++++
 2 files changed, 104 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_TW/subsystem-apis.rst

diff --git a/Documentation/translations/zh_TW/index.rst b/Documentation/translations/zh_TW/index.rst
index 1dddf5963864..001680d040ea 100644
--- a/Documentation/translations/zh_TW/index.rst
+++ b/Documentation/translations/zh_TW/index.rst
@@ -39,12 +39,16 @@ TODOList:
 
 開發人員使用的內核內部交互接口手冊。
 
+.. toctree::
+   :maxdepth: 1
+
+   subsystem-apis
+
 TODOList:
 
 * core-api/index
 * driver-api/index
 * 內核中的鎖 <locking/index>
-* subsystem-apis
 
 開發工具和流程
 --------------
diff --git a/Documentation/translations/zh_TW/subsystem-apis.rst b/Documentation/translations/zh_TW/subsystem-apis.rst
new file mode 100644
index 000000000000..5c874aafe70c
--- /dev/null
+++ b/Documentation/translations/zh_TW/subsystem-apis.rst
@@ -0,0 +1,99 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ./disclaimer-zh_TW.rst
+.. include:: ./unmaintained-zh_TW.rst
+
+:Original: Documentation/subsystem-apis.rst
+
+==============
+核心子系統文件
+==============
+
+這些書從核心開發者的角度，深入介紹特定核心子系統如何運作。這裡的大部分
+資訊直接取自核心原始碼，並視需要加上補充材料（或者至少是我們設法加上的
+部分——很可能 *並非* 所有需要的材料都已具備）。
+
+基礎子系統
+----------
+
+TODOList:
+
+* core-api/index
+* driver-api/index
+* mm/index
+* power/index
+* scheduler/index
+* timers/index
+* locking/index
+
+人機介面
+--------
+
+TODOList:
+
+* input/index
+* hid/index
+* sound/index
+* gpu/index
+* fb/index
+* leds/index
+
+網路介面
+--------
+
+TODOList:
+
+* networking/index
+* netlabel/index
+* infiniband/index
+* mhi/index
+
+儲存介面
+--------
+
+.. toctree::
+   :maxdepth: 1
+
+   filesystems/index
+
+TODOList:
+
+* block/index
+* cdrom/index
+* scsi/index
+* target/index
+* nvme/index
+
+其他子系統
+----------
+
+**Fixme**：這裡還需要更多的分類整理工作。
+
+.. toctree::
+   :maxdepth: 1
+
+   cpu-freq/index
+
+TODOList:
+
+* accounting/index
+* edac/index
+* fpga/index
+* i2c/index
+* iio/index
+* pcmcia/index
+* spi/index
+* w1/index
+* watchdog/index
+* virt/index
+* hwmon/index
+* accel/index
+* security/index
+* crypto/index
+* bpf/index
+* usb/index
+* PCI/index
+* misc-devices/index
+* peci/index
+* wmi/index
+* tee/index
-- 
2.43.0

