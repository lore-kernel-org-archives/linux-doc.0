Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF65C433EF
	for <linux-doc@archiver.kernel.org>; Sat, 15 Jan 2022 07:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbiAOHR0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 15 Jan 2022 02:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbiAOHRZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 15 Jan 2022 02:17:25 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01EE2C061574
        for <linux-doc@vger.kernel.org>; Fri, 14 Jan 2022 23:17:25 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id u11so9834585plh.13
        for <linux-doc@vger.kernel.org>; Fri, 14 Jan 2022 23:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p+Q68LfMNDqM5IhTRepEPBAm+My8ZLk6EgzM6WkWFOw=;
        b=mNcfyiGriMezlbJ7UDE/esNkttzoRBVJqU0DtkB4ym+SpUXOQXkHNHwLxqr3aMs1Nw
         feala/YpuWvoFDN+3lVmXAX5a2w1lg5OnN8CfXOYLU7snb0b0t3EaiKOVz1ZevujL4Py
         cKI1M3UKUUPCtFRn+9x5BxMLQsvfhpuR/WpwYRPOK3NBUSuiia3u45M/edYvA554hc4p
         8KrVse9CIGnlYh/TeDQ+yBwzVclzPAoOjK0xbaa1R0q7NofAkqex3StQgmG/Fl3A+o2V
         AjsVL4WhfulPqEHueqNzqTkSih1RPgFbPM8k7VVWCazxIIInlUVoQYSIb/ap6Mz1JP6+
         lhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p+Q68LfMNDqM5IhTRepEPBAm+My8ZLk6EgzM6WkWFOw=;
        b=xnar5kXwr1LCFs/X7Z9TfSefrzJcV4jIVn4EkvPa1TBWCKBACVoMVJUixWvuZH+XT+
         GQa1fxWpuNuDBEqEZpGG12eNv9ESb6nOSnsbkaWofjs+12UmGx6TfxdWX3Lp1ca2zhp/
         CXIslIrvYYLv5uhipMO+djMV5OXOAvNxSgLHOwlo4ypmslVFxc8y91cYTlBTOHsLCsHz
         qpngWW/v4SDBggTR3+NiBhOLfb7q9nGSlOTsgapVJPoJaICz9gYn4peXEiyy6DbWz8hm
         4CTmwxzCerRc624assecV5vzt51d5DepzbkmWPBqKBb1hs13G/vGlgONBGrBiCQw3xeV
         zUTw==
X-Gm-Message-State: AOAM532Huf6FcQ5mw1Cvh+fxSDcsBsQRYYFL2U3HunbzpO/snYwsRJUS
        EgQShSEqgoi5XB6eVDZ9Iq0=
X-Google-Smtp-Source: ABdhPJxRy36FGdCUkN2FTwo9X2/WTConkzDJCropQWSq2VHkdTP3qf6sHnIm5eA5bcXdih6x+rrHjA==
X-Received: by 2002:a17:903:228e:b0:14a:82b9:a967 with SMTP id b14-20020a170903228e00b0014a82b9a967mr9775047plh.141.1642231044497;
        Fri, 14 Jan 2022 23:17:24 -0800 (PST)
Received: from localhost.localdomain (cm218-252-25-221.hkcable.com.hk. [218.252.25.221])
        by smtp.gmail.com with ESMTPSA id u8sm7888909pfi.147.2022.01.14.23.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 23:17:24 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 1/4] docs/zh_CN: add damon index tronslation
Date:   Sat, 15 Jan 2022 15:15:00 +0800
Message-Id: <8e8c7651785f1ce20766bc1b3a4fc44faedb84bb.1642230669.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1642230669.git.siyanteng@loongson.cn>
References: <cover.1642230669.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

1) Translate .../vm/damon/index.rst into Chinese.
2) add damon into .../zh_CN/vm/index.rst

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/vm/damon/index.rst     | 33 +++++++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst |  2 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/damon/index.rst

diff --git a/Documentation/translations/zh_CN/vm/damon/index.rst b/Documentation/translations/zh_CN/vm/damon/index.rst
new file mode 100644
index 000000000000..9a7b4ea91cb8
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/damon/index.rst
@@ -0,0 +1,33 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+:Original: Documentation/vm/damon/index.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+==========================
+DAMON:数据访问监视器
+==========================
+
+DAMON是Linux内核的一个数据访问监控框架子系统。DAMON的核心机制使其成为
+（该核心机制详见(Documentation/translations/zh_CN/vm/damon/design.rst)）
+
+ - *准确度* （监测输出对DRAM级别的内存管理足够有用；但可能不适合CPU Cache级别），
+ - *轻量级* （监控开销低到可以在线应用），以及
+ - *可扩展* （无论目标工作负载的大小，开销的上限值都在恒定范围内）。
+
+因此，利用这个框架，内核的内存管理机制可以做出高级决策。会导致高数据访问监控开销的实
+验性内存管理优化工作可以再次进行。同时，在用户空间，有一些特殊工作负载的用户可以编写
+个性化的应用程序，以便更好地了解和优化他们的工作负载和系统。
+
+.. toctree::
+   :maxdepth: 2
+
+TODOLIST:
+*   faq
+*   design
+*   api
diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index fc39f0d60318..432bc3ef1c18 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -23,10 +23,10 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
 
    active_mm
    balance
+   damon/index
 
 TODOLIST:
 * arch_pgtable_helpers
-* damon/index
 * free_page_reporting
 * frontswap
 * highmem
-- 
2.27.0

