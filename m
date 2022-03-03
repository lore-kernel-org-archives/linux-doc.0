Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F405C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  3 Mar 2022 08:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiCCIKi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Mar 2022 03:10:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbiCCIKg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Mar 2022 03:10:36 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DBB1170D7E
        for <linux-doc@vger.kernel.org>; Thu,  3 Mar 2022 00:09:50 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id mg21-20020a17090b371500b001bef9e4657cso3672262pjb.0
        for <linux-doc@vger.kernel.org>; Thu, 03 Mar 2022 00:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5DlvxTnbV4o0fSTmkuDQsUpnqLbve904abXSlQi2SbM=;
        b=oqDC5Gm/12tPfS/S9idEcFdJ0LSz3U42IBcKbCdb9cm6LJHM0c++hvquwhCQICpZ7W
         QOQ9v7Pu64lndHMscKIEtPOS8b997//ydqtVL5rW+AO19IrqLbwUa6xQCUq1jMNssohl
         kEdqYu+DgPUo6oeUu2cUTSoBE+b5Tkb4CmxBYuxBDXJhR3M2ReHXrIXne++Pr0yn6knX
         tfEHliyPdVw9oJXpTykk7XQqQIp7lqL1Q9bHgOHVUlCnQIU56kv5+z0nDF5/w4B9ILM4
         jy7g+Njx0xymadSCSfnt1A5v/kmvyJULsrJpwHKleScoRruvRXUdg8l9B1xDS5wZ7LtX
         +xZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5DlvxTnbV4o0fSTmkuDQsUpnqLbve904abXSlQi2SbM=;
        b=DWcFVomET6nTZCnaTHv+bUFmcb5mxaKU8m+W7+TnILlLmQvLou97aYY2ZDd3hqLQzs
         n8PfJJtyDRcpXJo0MaxoZsJvkN+Q/+Kk2nOMLiurRzC5jSldqbDorrE0DC4mYS4VgNFD
         InYgey9mxXJs4NWjoiscVZ3oZgr6jfmnQ2PNUQ3PyBMZ6TaYjrY0BHkU5FEXytGws4vU
         AF86SdVbY0PlizOu+9bpO5fINrkDdfiMyWTcVBbY2PayME9mWQzZt/2C9ERP7fd6XGKX
         fzY7NZwCJ1Cgba+IKQ2WFwPxfMOLsawsrf1i9Wgr1NS8nhWIasB6mJwR8XeO2z5fxT0F
         wSaQ==
X-Gm-Message-State: AOAM530k7fCToP5fYTX3f8k70vf786wqoKCnzcEkt7Vr0TVPyBTTXfcA
        YkgUL3kAwDpQpe0sbxUdXwk=
X-Google-Smtp-Source: ABdhPJx536xC1J63Q0EB/CVAoF/B/8ltrfI6uWT4O0ry2Gp/ylbTm5Xl6FH0/J4IPJMo8AV6iFCCMQ==
X-Received: by 2002:a17:902:7089:b0:14f:c32d:f0c4 with SMTP id z9-20020a170902708900b0014fc32df0c4mr34475733plk.97.1646294990091;
        Thu, 03 Mar 2022 00:09:50 -0800 (PST)
Received: from localhost.localdomain (42-200-190-71.static.imsbiz.com. [42.200.190.71])
        by smtp.gmail.com with ESMTPSA id 6-20020a630006000000b0036d11540db8sm1371229pga.76.2022.03.03.00.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 00:09:49 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 1/3] docs/zh_CN: add devicetree index translation
Date:   Thu,  3 Mar 2022 16:06:27 +0800
Message-Id: <ed0830eaad6b9832204e753bb571d21e87f52130.1646294349.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646294349.git.siyanteng@loongson.cn>
References: <cover.1646294349.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../devicetree/index.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Signed-off-by: Yanteng Si <siyanteng01@gmail.com>
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

