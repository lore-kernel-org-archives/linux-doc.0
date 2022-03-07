Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D517C433F5
	for <linux-doc@archiver.kernel.org>; Mon,  7 Mar 2022 08:41:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbiCGImI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Mar 2022 03:42:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbiCGImH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 03:42:07 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 841A42559A
        for <linux-doc@vger.kernel.org>; Mon,  7 Mar 2022 00:41:13 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id m2so7162291pll.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Mar 2022 00:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1sPEfVYsWC2bw6VAETGhc8pDPmZOiMI5OQAWEyTs4bw=;
        b=YlYs4AA8JJ7Ow0C2CfGdAw5CduO0YyHWEM25XHXQ7bb8R9oT8j3HB5I7eMu8MgY5nK
         ntNMH4Dgn8jb1Yz3LddQjYkImTzCft/Kn2edzvp8KbQOl9t2VsQ/aT6RphuORAeNOwVq
         xGLfwQsUvtJ0rkSu2EXV3uY0KS/VAx1Aae3XpSYbFgo9YLdezLzD7y0XP8gkGqAtk0D0
         MUaMEunYoZ0OJXrueUq3qtc/3+O9218vTycPkDQn6ZI7fZ1EKDti/rMqP1WNVXYmDino
         Bb06FoF/8reQyELCnaVXtyee6VIf7uJHrATlXC7z89HP06Tl7eyPYTI/QSvn72DQb96A
         piMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1sPEfVYsWC2bw6VAETGhc8pDPmZOiMI5OQAWEyTs4bw=;
        b=dMOX1aTmioigqdZDR7ftPh1MgpppM1UIaYu1P+pSjFKVdW+WjNa8SQzoAgkSjhfhZ6
         gaBaqmRCtnhTi4pgiDv1W8kMibggiBgKNtbEEl+2ihUJDor6VRV85XSth/u8ozBYUxsm
         VQCrRpZe9FeuJTXVKWNVz3tu0vM1mg5Bm8yX+4imRBFNO/UUZ9jOcu/6XFDWyWJtpglJ
         fgYUdv7Ti58/r/77wW3XoqpraxyxcJAfdCeDcvIWWwU08yMZjiyowr8dk6CBqYt7hYlL
         GbZwt3fz8GUinNkrJRx3BEU5eWjbXMFkXRBgni3j+kFEf6N1/dnrYa/aHJ+Jwd1IL0Mz
         oNfw==
X-Gm-Message-State: AOAM5307E2qJyFqMB+ggVtNkixQzKDfl1DpI7r09syn0AtyfiSQTshNe
        FKKAho3m0cqAg0ZDptmYJyMpPaP1vlkSDg==
X-Google-Smtp-Source: ABdhPJwQcsrbQpHNuHReNSi4Ahuq9kxxPTMbV8QHuo7HB9lKFYILkruCTbyIYflMt4UdTznUFhjSuw==
X-Received: by 2002:a17:90a:3e0f:b0:1be:db1b:96de with SMTP id j15-20020a17090a3e0f00b001bedb1b96demr24037174pjc.141.1646642472984;
        Mon, 07 Mar 2022 00:41:12 -0800 (PST)
Received: from localhost.localdomain ([50.7.17.55])
        by smtp.gmail.com with ESMTPSA id bd10-20020a056a00278a00b004f6fe0f4cbasm2929431pfb.101.2022.03.07.00.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 00:41:12 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 1/3] docs/zh_CN: add devicetree index translation
Date:   Mon,  7 Mar 2022 16:42:20 +0800
Message-Id: <0a01f2eee980da02c0810d3d99b95af9013b646f.1646642188.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646642188.git.siyanteng@loongson.cn>
References: <cover.1646642188.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

Translate .../devicetree/index.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/devicetree/index.rst   | 49 +++++++++++++++++++
 Documentation/translations/zh_CN/index.rst    |  6 ++-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/devicetree/index.rst

diff --git a/Documentation/translations/zh_CN/devicetree/index.rst b/Documentation/translations/zh_CN/devicetree/index.rst
new file mode 100644
index 000000000000..5ca1ae87b57d
--- /dev/null
+++ b/Documentation/translations/zh_CN/devicetree/index.rst
@@ -0,0 +1,49 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/Devicetree/index.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+=============================
+Open Firmware 和 Devicetree
+=============================
+
+该文档是整个设备树文档的总目录，标题中多是业内默认的术语，初见就翻译成中文，
+晦涩难懂，因此尽量保留，后面翻译其子文档时，可能会根据语境，灵活地翻译为中文。
+
+内核Devicetree的使用
+=======================
+.. toctree::
+   :maxdepth: 1
+
+Todolist:
+
+*   usage-model
+*   of_unittest
+*   kernel-api
+
+Devicetree Overlays
+===================
+.. toctree::
+   :maxdepth: 1
+
+Todolist:
+
+*   changesets
+*   dynamic-resolution-notes
+*   overlay-notes
+
+Devicetree Bindings
+===================
+.. toctree::
+   :maxdepth: 1
+
+Todolist:
+
+*   bindings/index
diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index 23f8f4c68e83..46a29f006bd4 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -56,10 +56,14 @@ TODOList:
 
 下列文档描述了内核需要的平台固件相关信息。
 
+.. toctree::
+   :maxdepth: 2
+
+   devicetree/index
+
 TODOList:
 
 * firmware-guide/index
-* devicetree/index
 
 应用程序开发人员文档
 --------------------
-- 
2.27.0

