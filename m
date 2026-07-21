Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43DF43F08A
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 21:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784671059; cv=none; b=rHVeYPJPfD+yPMzsENfsfWC2ODsNpCv35OauGlvLdlWTE76qkc3u6mgNN1se8SwEE4QqB14e7Axf2saDessdVAWS6vQz1StkfRwR6aVqFgfIOPLSoMg3VbKljOviiWeBWm4C1DD8T42fEirXClbOXvYZ+iYYdpdRRjSiOmAsla0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784671059; c=relaxed/simple;
	bh=Wo6kyXIQbuzBY3vbl28kGTEsmPhq9lm89WuJttjy0aM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qdvMeRF04MM5U1D2nL73lx5UgfjGklUY2P7a7YtRILx96c/d1l4Q8iv3ktCPWDJAtATeWYnjSIAey4sr+yAcTtHJoeVvM3ykvXCmU9us/AvLRZklPgx+lynBryD5knUpXrYzRfLpCWPYoSL/sdB8pRYX81yKpkWOoSAfNw93Ojw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrhEIKy4; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrhEIKy4"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceeee8c46bso22092045ad.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 14:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784671057; x=1785275857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WxswvxMv95xPCVaFPonecyVeSQav7znYzmRMA2piC/I=;
        b=DrhEIKy4AKfmAmr1XaCbGnx6Ef9YSWg2ozWifUk3+b7fKnOhkUJjwDwUuYuHmrZU4y
         30Ccs5MOn3Pw6SH9OC9OGBNRV999vUCI95/C9q5ylnfVXqCSLvJ8T7H2yVEJDaTYIFoL
         DBb2J+yzV1zk+taTXCcl2FViUo6K3sIbsb3iPc1JqZ7pyvYimImKaZYUI9f1iBJ1QgLm
         19HysWKUwLFY+1uANkj8dhvfw6Y3GdSe4I9mv/+ezRAfrkpFNWgC1qQIPEhZBMMgnSg1
         7+FFGmW5w2EuuGa31S4d2eQ9dFdu2T3CLqqjqrNRaH5Wa+aBafe4GuW0TUmqJ/MuoraV
         /NJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784671057; x=1785275857;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WxswvxMv95xPCVaFPonecyVeSQav7znYzmRMA2piC/I=;
        b=bW0oDa0nBBxfObxPit/DJTBk61xZJDKE43bFhIcdWglM29BnHDH7oNvN30NeDW1MPX
         DBzC6upRcBY0xbN9CyRmYg0gIT8MnDonoNL1Ntpk1tc1ji7HoiA8RKsWOzdaRqL+hT7M
         kl58o4a/doqPqLpIwCPIHSfsXJpSKFGmpol5H+igeI6GFsr2ojwDb7w52HdEOvxjcATE
         6IjBqWKCjhKvM7tzedm4Dpa67v5i3jpN4cDtfi1Ppyq4LHurTzlXfdOaFOX/Pi4ixWaj
         3cTSUryhZeDHrkirbMrwOe7c/olWOSk2+r0rFB6QRmYfHWpdR4ir2HO5Sm1dbwLRQm5U
         SCVg==
X-Forwarded-Encrypted: i=1; AHgh+RqV4Jkl1bnZojkAb7q2T6ncA7mODCRFCu/1k6jeKCacpYcVwC953xcsL1yRrrx5Hvb1kNoZ2PJx1I8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQTTJE1lHGIN0MynrohCYf57M7IX2Eb5/2yJoWaoU0OU4LGu9F
	CCogH6DnYduBtznesb9hNAEXnbeb3hJrsPweGzktq6ptwt44HuMsfGfN
X-Gm-Gg: AR+sD13E12zEjKNFLIwx8GXaY9N1mRH+aBsauy6iUqDxFTmqnjKU2J1FbM8clC+X79K
	6VhAwEZPPeKJAJqDkGBx/62bJAxKmB+d1+nVmb3rGSle1FwIqa3YQiWoYlOmHEbrycmF4fqcPdG
	QgBFvt+PwQDBjLpVW5w+mua8x47AGTWpIOJtZZFoWCKqOuivJ7NGOStuldek5osC1SRXR6UDXeb
	uXLau0jdQ3vs2rnYyDRpyrt/Qy3h1Et70rjzFYuun2jnP8zZ+SllpIBljiZbtfOz4KlhsQ8tZhp
	jHKOtVw0D+hYKIzDcixB/3UbxjMw3gQuY86f0zzap7ec4JHju5OlBPaxt/s2BXUrF31S9dhM5DY
	2lX6sRLWpGByIr+xU01rmGFvdGEk1OcYkW7HZsmYRezJOffPeuBDUy4ligSSxU3c8kMCXLGRwML
	vIRd5BZhdZUfq5Qw0IcGQQQrXXCb86XyN6Nn6/6GVr0+EK7o46mVDa068uKHoNmfpsjtZN6QADv
	o5+2t5j9O4tWVCDy/G/UEYoLb3ILQ0Kh6jLJVHj
X-Received: by 2002:a17:903:4b46:b0:2ca:d344:7743 with SMTP id d9443c01a7336-2cf805d3298mr40312945ad.7.1784671057088;
        Tue, 21 Jul 2026 14:57:37 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8edea703sm3697115ad.0.2026.07.21.14.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:57:36 -0700 (PDT)
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
Subject: [PATCH 15/16] docs/zh_TW: process: localize terminology in index.rst
Date: Wed, 22 Jul 2026 05:55:41 +0800
Message-ID: <20260721215542.98435-16-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721215542.98435-1-chenyou910331@gmail.com>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
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

update to commit a03ef333fbd6 ("Documentation: security-bugs: explain what is and is not a security bug")

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

