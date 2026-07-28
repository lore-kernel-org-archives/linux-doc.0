Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E800D41F34E
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229912; cv=none; b=aJ3702rVubpJbMpdXWIhKgZ8SKo2lbpNRFs7fMQ9s13cvXirrXYwiL2Sl6QIhXIZ+UTfAqsblHLrltg7s2yMy8vf1O4h5OJgHdNfTy1DaOIX9KTs/I6CpBXhGyPHnVlsk8tg8EPA4O5ClhPKo51DkRRJz87FzPINpjuD3DV8Oos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229912; c=relaxed/simple;
	bh=x96ONeKaheriTWrcBm1HpFmLqWMnF7q/a9VyVzyj/Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hH70FPILqFMtyny66JQQNW2mNV/Ur5DR9X3v+NFdpjAm1+kU+fcQCeF03pGo0gC8Z3M5D7sq1bjN90hqCHUBmareFnEwnQyHb95Nlg/uVTTBktxDhPMLoTrIntsRyw1Fp8IuduXhtLhVkBJLGARc88U6a0yQTefarDLnERyzwKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmyYRI3W; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmyYRI3W"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cb2513ec378so436854a12.3
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 02:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785229910; x=1785834710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j/I8K3ryg+iSkSuKBr7SCqpyBiiZOrGewqoe0ouB3m0=;
        b=TmyYRI3WrubH7/qlzmUn4j7yH3Roz2rL84R5jcUuPg5gtR4KdspGY1U3Ou1/SZpaGS
         zSeddJlKy3d77SKtzQjUW7HeM6V1yESWb92/rg3jFAdohwKxuXloswOn2aFaA44QBZY2
         ZJbdkE4eKYnWQmSnnBncL+RRXtsmLofM0HOKCx6XPJEdO+2p+L5Cvv7LFh8HPdzg37Na
         JZYDHcDan0t7D1kidnCYGMR3snoICo8Q+gti4yr1M4mRO4Eis3aLr/i7a2Jtt43jnjGg
         BxDuOGbQBEyoaItruICa/ng3qwU+Q4F7kwxwt1TMKlWpi150zOfRDaskXkpsKG1+D3bM
         yqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785229910; x=1785834710;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/I8K3ryg+iSkSuKBr7SCqpyBiiZOrGewqoe0ouB3m0=;
        b=jq8Eki35NC+4LbLFK4DwBuwj7A/jNMDbk+vlWxKuf47Xr78w/gSPPwqhige6+wG6TI
         Fl59Mi2BwFjxDNamUITL9qWzIkJA5Cif0P/1ayJDHY0KEyNs+RpvaO1E48YyKQZNUj/E
         aWadU1i8IX979uwK5ohxcfXnP75MdAADOgk7Iadb60neNl6KYO4alSAEYxlLUzZ6PX9B
         qd/JawoqeshBmKIJrsnVh3wznRUMD6sJoqJeD/uJhGAIjZzNt9S+RDfRLe0+HRlos6qw
         B9nSParizL5MgODoZH+mLWT0pwBlFS/BeK+L98sNYJDs5i1GcenAjPmbyrqcpZcFIDtu
         oc8g==
X-Forwarded-Encrypted: i=1; AHgh+Rr7vPQRzGvR5OJbR/AuwD0ChB16bNoDLJgm29Mgn7lJR01qI5zokhwkmA6LJhpX7s9c0/jJ8qRRebs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/hJL6y86D41fKuossTbO114Kl2CX1p6tqJiazJc8qPjcGbMLA
	RMunVM9w8qAf+biBn+HKYcDnebfhfekL0HkxSWAFxzlJU0WoHXNXmZNQ
X-Gm-Gg: AR+sD12FQmhLQc3idk/3IkjMycKUm720i3WDFRwnpsD4aoXo6ziv6MSFSTL8E/Jew4Y
	4QJMTtnyzPiusXPytAyC2nu8D/f9LD5Hc1Z03dpNiEjQ/xm71LQb4meC2wt75ehPNbMVD8dBFMm
	mwUBZXyluSvOVoHf0QF8OQpSZdW7ibG7MqdWBtLBF5HcSS+0oaa1vBfpBD+EIZPAtN9gHzEKUcQ
	7V91TigRCPun13FxdKojJBhRZ1CNMchn5+xq8DM3Cm/oNVxWkctDnNRBkJNJUuIP128l6ZXqLiF
	gY3PvYgo1h8AjF0Sl4oxMhxKlws5aOkg3/82IU/7FtnlP4r1jJz6edx++IWEASqNlDSaFxzJXhU
	CkFF4SPizBunhpx8/0d7AiI5kG+39mzkESS3te5JzxYJhFyJgr9RjzXGK3w7vFbd54NzX0QqVtc
	6zybYWQqIJs4iG+BSOSzP8OSuB48xeMXbSzp0x51WM5i/JnK5vfAD8ibNkUkYsLudbor6dO4Uhe
	yXOFQh4seJ+sNN1/wkd6hkbRUJ4oxFUDMVepDsXEb9t53S19jtiXUasEIOyTmL8r3H/EUdOtz0z
	vANIUGJXv+uTI64wYRHOOxk=
X-Received: by 2002:a05:6a00:a456:b0:84e:227f:8011 with SMTP id d2e1a72fcca58-84e93323656mr805259b3a.4.1785229910137;
        Tue, 28 Jul 2026 02:11:50 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5328180dsm4099303b3a.23.2026.07.28.02.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:11:49 -0700 (PDT)
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
Subject: [PATCH v2 15/16] docs/zh_TW: process: localize terminology in index.rst
Date: Tue, 28 Jul 2026 17:10:37 +0800
Message-ID: <20260728091038.171033-16-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728091038.171033-1-chenyou910331@gmail.com>
References: <20260728091038.171033-1-chenyou910331@gmail.com>
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

