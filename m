Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E5EC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 24 Feb 2022 12:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232374AbiBXMTH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Feb 2022 07:19:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbiBXMTH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Feb 2022 07:19:07 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A092B91C1
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 04:18:37 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id x11so1530130pll.10
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 04:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fIqLO8MVKMEUcwwPUYheK77xkfr49/k2ikDX6SvIgHY=;
        b=cFpWdBcBAzBu6+/CKZN2czHdnjDK0eccNjZ50jxSbC6oYf+nAxGiPgTuBg/hw16i5w
         jTKYCKltdTdWoGhdf0COgcodzGJtDmt6N3iDdFimQ5VlBig5+MZDNPjjtzUQfirTimVU
         NO1NraSmOyqfsMRBc4SUpMVMrRsrhWvtFTrpPHdRda3lwYI4D4jEOhaEX0FlQXISNsYY
         Ief4p2N/u8voiy4FZ9hYnZsRf373+riMuNc74UBs/2EGlvrnJxfXa0gCP9G6dUZlzeVg
         YD7tp6xnzL0CH8HkNyrmKhEHeYXPBHaRUUyE6W3ENg7TDPB00Hg91We9VSjc4vNcLJ1o
         zJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fIqLO8MVKMEUcwwPUYheK77xkfr49/k2ikDX6SvIgHY=;
        b=llRQf/rtN9zondS7aIZWsZyixp2ym0HF/R31t9JnVBVrFFvNyrz7JP+5SrFDAu9aoG
         1XmR6ctPuJ/2pDWXXIa6F7mGl2W1jdtaP8HrVjIqN5+hWkoq94/wjeTPlP27JgWkySNk
         x159QSktr5wx5CnNmJR94IP1v13Vd4CK8Eez4XRgzwsTfVAW8UyfvKQLF+wfb6748kIb
         i8N1aGfGVgtuaFSBld/UTnpPG0Y961u/sAlytXDBAcm9CmlFh/FOTis6JZk4mLEBjQHh
         sA3HPG5pDo6LxOkMB9JyfSNjRgqJcZOtJgkFgtIXA26xejPdcuZj06EZ0VrnKt1G2qIB
         ZB6w==
X-Gm-Message-State: AOAM5334ioBfVz/unmr19L/VUoVEe4tX52IealmcbH1IOXcxR5A8ArCG
        2ESDinnNL+Ogh4gbHRyVXRQ=
X-Google-Smtp-Source: ABdhPJyjrqYPQzCnoVQtckDujrYmYiLAsVNl9SYDQP8EXLWsf1B/nt+yub+4KtVA/Vko19vS0Ykkfg==
X-Received: by 2002:a17:90a:4308:b0:1b8:bed5:c747 with SMTP id q8-20020a17090a430800b001b8bed5c747mr2571671pjg.0.1645705116819;
        Thu, 24 Feb 2022 04:18:36 -0800 (PST)
Received: from localhost.localdomain (pcd454219.netvigator.com. [203.218.244.219])
        by smtp.gmail.com with ESMTPSA id e3sm2577643pgc.41.2022.02.24.04.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 04:18:36 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 2/3] docs/zh_CN: add peci index translation
Date:   Thu, 24 Feb 2022 20:13:51 +0800
Message-Id: <265d0f4aa33357ccd62c21f1833169d4378bb5b8.1645704571.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1645704571.git.siyanteng@loongson.cn>
References: <cover.1645704571.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../pici/index.rst into Chinese

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/index.rst    |  1 +
 .../translations/zh_CN/peci/index.rst         | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/peci/index.rst

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index 23f8f4c68e83..4cab13c1f69e 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -114,6 +114,7 @@ TODOList:
    filesystems/index
    scheduler/index
    vm/index
+   peci/index
 
 TODOList:
 
diff --git a/Documentation/translations/zh_CN/peci/index.rst b/Documentation/translations/zh_CN/peci/index.rst
new file mode 100644
index 000000000000..c536dbe1e1a8
--- /dev/null
+++ b/Documentation/translations/zh_CN/peci/index.rst
@@ -0,0 +1,26 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/peci/index.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+=================
+Linux PECI 子系统
+=================
+
+.. toctree::
+
+TODOList
+*   peci
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
-- 
2.27.0

