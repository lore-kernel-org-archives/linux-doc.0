Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B474772A7
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 14:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151528; cv=none; b=aV8YTYSUF1w5u8i0UhAAP+x3cPB/yvZxV5KxyH3xyhIWJie4gqKS4Ry8t6hnYkC2ELd9qOhouYJs3AiNH9n11d6Td7dc9O/DAnwtPVKVUW+LA0POtr66EP3kDpsFHEozBk6Nt89wSZGHbYz2CpZDSCrTs3fdD84awDNC3SUQIMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151528; c=relaxed/simple;
	bh=Y/63NVGEWuAJUvWP+GGDgM7fSd4Kv9fQ9dRZWYcrVnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E0CBsjs28kQ+pdwaJF26aswMxxJG1LVk8hjv+xP4x3ykdZkaNn7m+3s0h/AAUprL+m0PDoSeRGOjIXAHj7Latjpv4356+4nIBmmM5uorOIIG+DOVr3z/rFrMNt+DDnqGaxm3r2aPjiVf+2zDNNqTHYUhGwxbrIXYgQxWG6s62Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=os+mUrN/; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="os+mUrN/"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbedaf975a3so144081a12.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 07:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787151521; x=1787756321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lMc8XhHMhYAlAGjizdj77n4FTXqzEOGkMj4+qQB3agU=;
        b=os+mUrN/PAD+5asb8OqHDNevpg/a+R+u1lNPhxbxuaZmtqLU2L/6btCTNSAGyoMI+X
         HqKVxKdOBFj5KrLbwIMzHaE8UV5+ke4IyH+Iph8H/LGm+N62leBm9Bqo8qWEK9c2rly0
         a+efR6nR6/HBJ0vAuqaqPNZ5kIYFqeF4pX/37he8/JN2OpqWhlbPRxcXCUVHGPBpyy4X
         UcAwAO9GZ+Y5vNLupPaIM4lauIpHdWO1u+MA65TsaHV89M6nL/qLPNnPlMk65q2jd4xa
         73tcaOpyxuwQd0I6QHaFyu5LqhJcSBAMRc2KO0FI6u8ViMqlbsOM/UMzAMUMj/op7LRz
         8+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787151521; x=1787756321;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lMc8XhHMhYAlAGjizdj77n4FTXqzEOGkMj4+qQB3agU=;
        b=H8+6fb8jmMTBU4wyjTNhqn3tcBmacBVxroJRhlqejZ4hW3OHe4KRywN5mONybWrVRv
         9dobZ98I1td6+gG7iX7e0v5zCMqtD0U/ZHzJ7nej/5yHsZYnkCM3Pedmn+vDFjDma8yD
         zCq6f0+RbInr3ANHFs20fV9m5Sff5AlxidJF24b5CZpX+D16CrRimVK+rpv48J0wWxHn
         +GIkxveshU+5FlJAT2LZvwwR1Lo87vRBDOm1YK18IuEaUOqsiPvUFElUQMjmM3dRJV9U
         TFZkn9/mPe8GryCpaZuLyJfYl17AcYyP8ovpcLNErdFmxRdokeEoCA9ukz8iGj4XCzgE
         O38w==
X-Forwarded-Encrypted: i=1; AHgh+RoqPilXwFr7XNfn3p/K6zPRNhor3KeFO3+M2fLqOq8mtams8k/97bUBQPHhcLjBhp0yLQwM4QEPMFs=@vger.kernel.org
X-Gm-Message-State: AFuF++mDhojagdGb/UgY+2pZYTWXVGcpLpaxqcB9byQ9nWGOmNXWs/na
	QEMGtmbSaIPbsUph/cLf/9P0zSoH5dtCtRXwO6ltU+56L46mq048t4T4
X-Gm-Gg: AR+sD10yAoabgIrKOT+HuzQtPyD0Zfq3IRlSPHp65peP5WRXdu6oNpAtsweDbjQPqqy
	9FEvWocJ5XxMMUopi7KGOa2TgFQh/xGmxZ98wYuuFQ2uXJOc2wW0tgsN4ogIlQiSP+QGFlgDDfw
	IbY+ZBQbeRu2T2KkMZIKU5NXDc7hOST9uJrzAX1uQUmFFCb41EPCDYl1pfvTpK/Jvk9Axw1HR8M
	VETla7ejeVC5XAbW0CqPlfovFa5WxHyAqQvXwLnpb4VUqtKbzsgdkblP/nWMUA83Yr6pNMa3I/W
	6wIYu/vk+gJ2mv3PR2SjAKQ+oN9mObMK7DOy4XnTzFBJAESU1G47uq/VHJ2N4yVAp6NquVJPq8U
	c92IwG86de1dPxspwGYScGERs/G2rvcFOD2n4Bo9MTT0cQVZMKBXHH/jxrNZuGRl4E86NpHH54y
	U/A+K7QDKCQYcNYM77hUj8ZkMUkjEXEv+voGk4fve+hP+B0fBwi/P180jr5uoLALjwtQvJIDy/I
	VIDJRpJMuMnNvK5aF4aqDzMuwbTSpw8FIGGH8yeJWdLe6s3
X-Received: by 2002:a17:903:8cc:b0:2c9:e846:a582 with SMTP id d9443c01a7336-2d5fd33191fmr54384155ad.0.1787151521526;
        Wed, 19 Aug 2026 07:58:41 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e528b3sm25429145ad.46.2026.08.19.07.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:58:40 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Weijie Yuan <wy@wyuan.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <srcres258@furdevs.cn>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 7/7] docs/zh_TW: remove the last maintainer contact references
Date: Wed, 19 Aug 2026 22:58:06 +0800
Message-ID: <20260819145808.291567-8-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819145808.291567-1-chenyou910331@gmail.com>
References: <20260819145808.291567-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

disclaimer-zh_TW.rst is included by every zh_TW document and told
readers to mail the listed maintainer directly; index.rst asked
would-be contributors to send patches to the same address.  Point both
at MAINTAINERS instead, so the contact information lives in one place,
and drop the remaining contact blocks in the top-level files.

This mirrors disclaimer-zh_CN.rst, which names no address and refers to
the Chinese documentation maintainers and reviewers instead.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/translations/zh_TW/IRQ.txt              | 8 --------
 Documentation/translations/zh_TW/disclaimer-zh_TW.rst | 7 ++++---
 Documentation/translations/zh_TW/index.rst            | 2 +-
 Documentation/translations/zh_TW/io_ordering.txt      | 6 ------
 4 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/Documentation/translations/zh_TW/IRQ.txt b/Documentation/translations/zh_TW/IRQ.txt
index 8115a7618307..b9a3e18495d2 100644
--- a/Documentation/translations/zh_TW/IRQ.txt
+++ b/Documentation/translations/zh_TW/IRQ.txt
@@ -6,8 +6,6 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Maintainer: Eric W. Biederman <ebiederman@xmission.com>
-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
 ---------------------------------------------------------------------
 Documentation/core-api/irq/index.rst 的繁體中文翻譯
 
@@ -15,12 +13,6 @@ Documentation/core-api/irq/index.rst 的繁體中文翻譯
 交流有困難的話，也可以向繁體中文版維護者求助。如果本翻譯更新不及時或
 者翻譯存在問題，請聯繫繁體中文版維護者。
 
-英文版維護者： Eric W. Biederman <ebiederman@xmission.com>
-繁體中文版維護者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-繁體中文版翻譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-繁體中文版校譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
-
 以下爲正文
 ---------------------------------------------------------------------
 何爲 IRQ?
diff --git a/Documentation/translations/zh_TW/disclaimer-zh_TW.rst b/Documentation/translations/zh_TW/disclaimer-zh_TW.rst
index 28b734c223b6..b65cffabd696 100644
--- a/Documentation/translations/zh_TW/disclaimer-zh_TW.rst
+++ b/Documentation/translations/zh_TW/disclaimer-zh_TW.rst
@@ -3,9 +3,10 @@
 .. warning::
      此文件的目的是爲讓中文讀者更容易閱讀和理解，而不是作爲一個分支。因此，
      如果您對此文件有任何意見或改動，請先嘗試更新原始英文文件。如果要更改或
-     修正某處翻譯文件，請將意見或補丁發送給維護者（聯繫方式見下）。
+     修正某處翻譯文件，請將意見或補丁發送給繁體中文文件的維護者（見
+     MAINTAINERS 檔案）。
 
 .. note::
-     如果您發現本文檔與原始文件有任何不同或者有翻譯問題，請聯繫該文件的譯者，
-     或者發送電子郵件給胡皓文以獲取幫助：<2023002089@link.tyut.edu.cn>。
+     如果您發現本文檔與原始文件有任何不同或者有翻譯問題，請發建議或者補丁給
+     繁體中文文件的維護者和審閱者（見 MAINTAINERS 檔案）。
 
diff --git a/Documentation/translations/zh_TW/index.rst b/Documentation/translations/zh_TW/index.rst
index 660a74d2023c..e72f86e37f2d 100644
--- a/Documentation/translations/zh_TW/index.rst
+++ b/Documentation/translations/zh_TW/index.rst
@@ -15,7 +15,7 @@
 
 .. note::
    內核文檔繁體中文版的翻譯工作正在進行中。如果您願意並且有時間參與這項工
-   作，歡迎提交補丁給胡皓文 <2023002089@link.tyut.edu.cn>。
+   作，歡迎將補丁提交給繁體中文文件的維護者（見 MAINTAINERS 檔案）。
 
 與Linux 內核社區一起工作
 ------------------------
diff --git a/Documentation/translations/zh_TW/io_ordering.txt b/Documentation/translations/zh_TW/io_ordering.txt
index 00b374092d7e..8ced3f08e69d 100644
--- a/Documentation/translations/zh_TW/io_ordering.txt
+++ b/Documentation/translations/zh_TW/io_ordering.txt
@@ -6,7 +6,6 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
 ---------------------------------------------------------------------
 Documentation/driver-api/io_ordering.rst 的繁體中文翻譯
 
@@ -14,11 +13,6 @@ Documentation/driver-api/io_ordering.rst 的繁體中文翻譯
 交流有困難的話，也可以向繁體中文版維護者求助。如果本翻譯更新不及時或
 者翻譯存在問題，請聯繫繁體中文版維護者。
 
-繁體中文版維護者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-繁體中文版翻譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-繁體中文版校譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
-
 以下爲正文
 ---------------------------------------------------------------------
 
-- 
2.43.0

