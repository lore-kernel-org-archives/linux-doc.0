Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F02DC433F5
	for <linux-doc@archiver.kernel.org>; Sat,  4 Dec 2021 03:15:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384136AbhLDDTV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Dec 2021 22:19:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384126AbhLDDTV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Dec 2021 22:19:21 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8012C061751
        for <linux-doc@vger.kernel.org>; Fri,  3 Dec 2021 19:15:56 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id o4so4658584pfp.13
        for <linux-doc@vger.kernel.org>; Fri, 03 Dec 2021 19:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FmqeKaTfeqbTyzJQ9JV/nZjmvAIa1nUWAnm4wYjDwSY=;
        b=TLwxNRN4JfVWgfsXghgho1w8mwvoHjYmkYOgDPinKK5OGaspdNzCt3MjoT0wtMgPdG
         ReySqIVKZUK93c4cObzNtCMBAo38bHyBXxvAsRmGzDOzw3KX6r61EuTS87CID+tR33NU
         LfcwMOQyHAUpEhiUJEItsok+Mr++7aUPU5nj6Tv9oXBUffgYZHic6ar/cAKQWHb0ZeMf
         wwbUoDwh7Z27m4P2v60bT7/TmC7P4IP/pZhKK1uobFmgi/vArhNH0uCpLMIWN3Y+9YO+
         n28WOMxlenPzCBtsAYt1jd/xZVWDtOqkjEYrowTyFRYtIsa6OZHiuhkOhxNfmm/Xmarm
         zWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FmqeKaTfeqbTyzJQ9JV/nZjmvAIa1nUWAnm4wYjDwSY=;
        b=UAGX9zDeVWGTWFpfU0q8JmbkZuIcBUSD8hgPEPIx/7Dn+EkCDfK01KTXRsapMhrYYV
         TLdvm4/8bj7nudQwQrsCEXvRJGtPBknCQEIoDr+jl9hSokmmJ7UVS3jGBtJT6XRpdokT
         Hk/DRuG0De1e8TyPelUEKTvPgCTMuwwcEUEDjRhNUKrCaLc/1wxZkYh4Jfd6/vGfHW/0
         DGs99aTjw3RtxPTsYnMKSUUu0STpTeeza9ykfP6pyCGJd2swxRF9fVWD2meiwr8+seNq
         jHfPeUamURJ90v8riqu2N8TczZjac96oHE/cbAtjKSLRd25MsGZPfcUt104+JmiYlEwW
         lQAw==
X-Gm-Message-State: AOAM533PqXZrqAu/60EkZ4cEfVAGMvnnLHgSemGYFrrWJONQK9AwSu0t
        sviFtjeWR0wOVQF3YyKpaOM=
X-Google-Smtp-Source: ABdhPJz108vSudrf8PN8roYnI3MeljFXVT8MM1WZQ+aVsScFdpYOnmnP3wmnFhdnjihjDPqhG9WmIw==
X-Received: by 2002:a63:e4f:: with SMTP id 15mr7647225pgo.336.1638587756161;
        Fri, 03 Dec 2021 19:15:56 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id y32sm4803262pfa.145.2021.12.03.19.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 19:15:55 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com, tangyizhou@huawei.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v5 1/2] docs/zh_CN: add scheduler index translation
Date:   Sat,  4 Dec 2021 11:14:26 +0800
Message-Id: <48f7676d7fa91dbac5481eae3b22e50e031eb8ca.1638587477.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638587477.git.siyanteng@loongson.cn>
References: <cover.1638587477.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

Translate .../scheduler/index.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 Documentation/translations/zh_CN/index.rst    |  2 +-
 .../translations/zh_CN/scheduler/index.rst    | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/scheduler/index.rst

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index a34e58733ac8..aebe336ab538 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -106,6 +106,7 @@ TODOList:
    virt/index
    infiniband/index
    accounting/index
+   scheduler/index
 
 TODOList:
 
@@ -140,7 +141,6 @@ TODOList:
 * PCI/index
 * scsi/index
 * misc-devices/index
-* scheduler/index
 * mhi/index
 
 体系结构无关文档
diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Documentation/translations/zh_CN/scheduler/index.rst
new file mode 100644
index 000000000000..9b0c8cb11c87
--- /dev/null
+++ b/Documentation/translations/zh_CN/scheduler/index.rst
@@ -0,0 +1,42 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/scheduler/index.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+
+===============
+Linux调度器
+===============
+
+.. toctree::
+    :maxdepth: 1
+
+
+TODOList:
+
+    completion
+    sched-arch
+    sched-bwc
+    sched-deadline
+    sched-design-CFS
+    sched-domains
+    sched-capacity
+    sched-energy
+    sched-nice-design
+    sched-rt-group
+    sched-stats
+
+    text_files
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
-- 
2.27.0

