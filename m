Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07F14908C1
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 18:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040461; cv=none; b=hrt4pr92SyaCc6nERjN0hdqxVANVjC/daHT6kGwYPxqPxiTOBz61wfYF2unZ4iI82CJcPitEWSl5Ygqi77lgeVtjDzbVXgAMa74ln5WHxnxImVvvaHKNsgEteGHa3Ws9bHdkcFwcaqQygCy72O9twcSS2tIwL5Smp7kuVBO57vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040461; c=relaxed/simple;
	bh=XthFYg2P/L993vxrFRj3rwzTH/u1/ibgsyKbrT/YUW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=epzjk1oRkzTSz/uTt0cuHTgxV299AcgnwNY0tMv3KlYOkLjDzcuqGzRtjV1BficLvEzf7XuspbgCkL//f/rKMxgY2OhOyN3H7C/IYuV/3nDRG8zkxkkwKclS+XtsEBrdiiOtLPJkL0awkRKP0steemLQ9IxR/zTiQPS3BUfmeYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzIksG8p; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzIksG8p"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38eca09faa2so347073a91.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 11:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786040459; x=1786645259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UPSMuFWUOKynvxsnmZ7vftO4Eo3+m/qokbj8PLe8oQQ=;
        b=kzIksG8pJs4RwcSEB9RI90bXq5W9w8BouAjwlrb7tAwW8Trd1K2EaueSq4X14ZVSe6
         KkSiP2AhrLomaG7bwU2SxCugmh83406QwIWAYpO6xr5DuQ0xYIy+lHKiAC1+GXr0fOjJ
         Z5iizQkWjbRA2CqPj/NUGhCPT3Nsq2SNZ7Bv9X0NaMnPENdH5bo588nveMX6i8QJ977J
         2dZT2MagocdML7WBENjet2EtEMaM9ibcB9ooy2TvOUDBGDUQ7Vp2C+LamyYlhm5Nfqjr
         cU/sojbqSUlzulVra9bN+E400N5VK2SNoHJphMCR0dCpgj31h91Hwfmi4qMfsB6AgByL
         z92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040459; x=1786645259;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPSMuFWUOKynvxsnmZ7vftO4Eo3+m/qokbj8PLe8oQQ=;
        b=kHAuq52i1u5RvwYzFhkKzh3WDVYrLcHUg8bjkaHhB/jMtys6ufrvraWp+NpZ7DXiUu
         bBbn9gRpLkkroLmHYVt2ktP+ckVJ0OedxRknRngwgZwRR8V2wx+XSPlQP2ieCPBMv7Pm
         kF1icVFOzZs8/5ND7sLOzEa2GUwn860W1wGvW9IVG9TR3ExVTMXwPaAO2ZBY9ySZN8If
         gF61ZEDVHooXStrsJ2FbpDy+/+goqKVljbp4Enzu/eap4prkxTE01dbwx2K6VG60ltyl
         z1BQk9JFJlA8+n9NvpG9tQfodVzfQqhxZreUoWTOpqZmg+D0wRmWrfxW/yMRKsFhv5WY
         d0IA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2iT9Pfkliykb42tzfm1VoPVZ/9vhk0SOO4/cWcxKrdSmGJLpUsHzaeAdttGjd3EzDHiELXa9Ovyw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfp9N1bPAfRj+1RYYdDfYnEMH/xU+zH7cm3AalF9AuSiFUJirY
	5yuZNQTEf0kx8gvGnMNQn0DzNXa+LklTEyv5ydN7pKsIDKAey6EKl9QJ
X-Gm-Gg: AR+sD13uVKdi9X6APUsVrX+LYt4pkO9jqqh/8OY7ANSqH4Of4Bzx7IxL9xGWfaSjzrV
	DZcAY5fiAEYU31HY8KBDJpRWlEL87jkmOYFGx5QHQw/5WUcr8c9xw/FsycSCdQ2V8phRyG7vqYr
	v65EszSk9y1sScWL3yeKXD4sUUiBVkuCV43u3Un5FvOFWD0vrQZzf1dGNTGYK3VQ1Y3pQXbgZAD
	G6JHrD6bLfnEr5EZxFPfrf1sn1w4P4tn4aIuM1ETiGm/2o1uFvsKFC6Vx6vT3vpbukdZxXPlD1K
	fIGNn1VGTH7i2+5y+APVvZu3N9TXax99VOobzZYOoA4c4apWl221uFUoTLtUWKjGMrVNHZ9PJ9W
	f/cM4E9nkw8rqB0+Lz141KDLW8ofFNoDaa9RKeydRhJ8Tmyv+1LsFYJonqoxeBrW2pB9X7vV7iU
	OsUpRXpx6Pqido2NkF0MNfKTnEl53czMtUkspfbYLE4V44pwiBGXBsTGgBufCLkqMUB+/hUyFDN
	Jg12aXBYigWPNiRm8RdXGCIME6EEX0tLlna+rAsE2BKZpOLnmgPj9nG0nNNx/VElfGhh/rGwjfB
	hozK0g6VqrvSx42JkR23J0c=
X-Received: by 2002:a17:90b:3f48:b0:383:5a16:bd67 with SMTP id 98e67ed59e1d1-3903c783fc7mr12116171a91.4.1786040458940;
        Thu, 06 Aug 2026 11:20:58 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2b2easm2003356a91.11.2026.08.06.11.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:20:57 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Weijie Yuan <wy@wyuan.org>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 15/16] docs/zh_TW: process: localize terminology in index.rst
Date: Fri,  7 Aug 2026 02:19:48 +0800
Message-ID: <20260806181949.65648-16-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806181949.65648-1-chenyou910331@gmail.com>
References: <20260806181949.65648-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Localize mainland terms to Taiwanese Mandarin (內核→核心, 社區→社群,
文檔→文件, ...) and sync with the reworked English process index:
mirror the new section layout (introduction, tools and technical
guides, policy guides, dealing with bugs, maintainer information,
other material), keep only existing zh_TW translations in the
toctrees, and track the still-untranslated documents in TODO lists
following the zh_CN convention.

update to commit a03ef333fbd6 ("Documentation: security-bugs: explain
what is and is not a security bug")

Acked-by: Weijie Yuan <wy@wyuan.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/index.rst      | 99 ++++++++++++++++---
 1 file changed, 83 insertions(+), 16 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index 65922d9faa20..3f84437a2ca9 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -10,53 +10,121 @@
 :Original: :ref:`Documentation/process/index.rst <process_index>`
 :Translator: Alex Shi <alex.shi@linux.alibaba.com>
              Hu Haowen <2023002089@link.tyut.edu.cn>
+             Chen-Yu Yeh <chenyou910331@gmail.com>
 
 .. _tw_process_index:
 
 ========================
-與Linux 內核社區一起工作
+與Linux核心社群一起工作
 ========================
 
-你想成爲Linux內核開發人員嗎？歡迎之至！在學習許多關於內核的技術知識的同時，
-瞭解我們社區的工作方式也很重要。閱讀這些文檔可以讓您以更輕鬆的、麻煩更少的
-方式將更改合併到內核。
+你想成為Linux核心開發人員嗎？歡迎之至！在學習許多關於核心的技術知識的同時，
+瞭解我們社群的工作方式也很重要。閱讀這些文件可以讓您以更輕鬆的、麻煩更少的
+方式將更改合併到核心。
 
-以下是每位開發人員都應閱讀的基本指南：
+核心開發如何運作的介紹
+----------------------
+
+請先閱讀這些文件：理解這裡的內容將使你更順利地進入核心社群。
 
 .. toctree::
    :maxdepth: 1
 
    howto
-   code-of-conduct
-   code-of-conduct-interpretation
+   development-process
    submitting-patches
+   submit-checklist
+
+核心開發者的工具與技術指南
+--------------------------
+
+這是核心開發者應該熟悉的材料集合。
+
+.. toctree::
+   :maxdepth: 1
+
    programming-language
    coding-style
-   development-process
    email-clients
-   license-rules
-   kernel-enforcement-statement
-   kernel-driver-statement
+   volatile-considered-harmful
+
+TODOList:
 
-其它大多數開發人員感興趣的社區指南：
+* changes
+* maintainer-pgp-guide
+* applying-patches
+* backporting
+* adding-syscalls
+* botching-up-ioctls
 
+政策指南與開發者聲明
+--------------------
+
+這些是我們在核心社群（以及更廣範圍）中努力遵循的規則。
 
 .. toctree::
    :maxdepth: 1
 
-   submit-checklist
+   license-rules
+   code-of-conduct
+   code-of-conduct-interpretation
+   kernel-enforcement-statement
+   kernel-driver-statement
    stable-api-nonsense
    stable-kernel-rules
    management-style
+
+TODOList:
+
+* contribution-maturity-model
+* researcher-guidelines
+* generated-content
+* coding-assistants
+* conclave
+
+處理缺陷
+--------
+
+缺陷是無法避免的；正確地處理它們非常重要。下面的文件提供了關於除錯的一般
+建議，並描述了我們處理幾類特殊缺陷——迴歸和安全問題——的政策。
+
+.. toctree::
+   :maxdepth: 1
+
    embargoed-hardware-issues
 
-這些是一些總體性技術指南，由於不大好分類而放在這裏：
+TODOList:
+
+* debugging/index
+* handling-regressions
+* security-bugs
+* threat-model
+* cve
+
+維護者資訊
+----------
+
+如何找到會接受你補丁的人。
+
+TODOList:
+
+* maintainer-handbooks
+* maintainers
+
+其他材料
+--------
+
+這裡是一些大多數開發者會感興趣的其他社群指南：
 
 .. toctree::
    :maxdepth: 1
 
    magic-number
-   volatile-considered-harmful
+
+TODOList:
+
+* kernel-docs
+* deprecated
 
 .. only::  subproject and html
 
@@ -64,4 +132,3 @@
    ====
 
    * :ref:`genindex`
-
-- 
2.43.0

