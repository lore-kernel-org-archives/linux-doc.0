Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C170FC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 13 Jan 2022 03:21:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbiAMDVY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Jan 2022 22:21:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231976AbiAMDVY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Jan 2022 22:21:24 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DA7C06173F
        for <linux-doc@vger.kernel.org>; Wed, 12 Jan 2022 19:21:23 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id i8-20020a17090a138800b001b3936fb375so16583237pja.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Jan 2022 19:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f7/v0JQAmwb8Thx8pn9hgnQTJqeTenldHrRZvi3X13s=;
        b=C/DTaPcIx+kmD/Ll2yMDWsGPdEUq0Byl2D3Opu7ontT6JW6AfS+z6ILzR1YRUCjoYy
         igdrJMQM2pptmLcLu2UJss3/QQ3HolsxoQUqrPwpHPf+JPq+OGNYSKV9lhbV6DrsMpHy
         8OWBTO7VUzTuxXkh1JrFnsbDjOs15vj4u824RUk4B9joYuFNS/5YdKFmI4IafUQYZwJC
         gVD2Cs7ujQ7oVMX3lc79vgGf+avhqQsvWemMPb5VtxGsYhBU1b5TLZm3dwvJdIiasvlB
         fb/H/5nu5mb14S/lSyL47UIzHyARhGP4zU1EduZgG+jEB2lDEoqyveJIIFK+Z9GpNIw/
         iu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f7/v0JQAmwb8Thx8pn9hgnQTJqeTenldHrRZvi3X13s=;
        b=qk3juglHHEPCAoQ06u5cplDewFt2/WgrOWqYoJIA/KsmR3YRbpS/EtNtLhyB/e32gp
         63Q0h1elPT7pNaaoz3x3zJLru4FHkuezOvS0Ud34lyB40g/FkY9rR9/KkuWHhJDb1VHB
         Rt/E3Kfm6GJimOsb/aHvbEiyX8iwU4pz9YWx5YxSM+py81yEWB1qiyUWRxoX/eq/LnVq
         75/Q8Jx2vAjMiuGbGrdtyLcsTdlmfW/hHeEZsuKtdyzRZyQCLE+Wt4n4uMm46LvGaUZ4
         qCtLeZK9eej4vLMOUz8XEuLJJRtFFRvLgjSfByCl4ejS9ukUDeK5ENw/ScwWLWUFGuMW
         T+sw==
X-Gm-Message-State: AOAM530raM5bq/+zi4tZKUnEr1UJNjUnfyEnhUUcFiOIKhijhOUg4RWA
        5g9iofypsQScEVXYjZLahE0=
X-Google-Smtp-Source: ABdhPJzUMQAJSASKC4GFbrA9ic6TdkM+0ZaNujJI8VDo6LAHeeT3gqVFWazN1GcfFxdV5QadrcyiJw==
X-Received: by 2002:a17:90b:1bc7:: with SMTP id oa7mr3011895pjb.200.1642044083460;
        Wed, 12 Jan 2022 19:21:23 -0800 (PST)
Received: from localhost.localdomain (pcd454075.netvigator.com. [203.218.244.75])
        by smtp.gmail.com with ESMTPSA id x2sm1757573pjq.40.2022.01.12.19.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 19:21:23 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 1/4] docs/zh_CN: add damon index tronslation
Date:   Thu, 13 Jan 2022 11:18:01 +0800
Message-Id: <339c625323d59c7ac7db5c679a4c5d39e9006c3c.1642043630.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1642043630.git.siyanteng@loongson.cn>
References: <cover.1642043630.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

1) Translate .../vm/damon/index.rst into Chinese.
2) add damon into .../zh_CN/vm/index.rst

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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

