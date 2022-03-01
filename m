Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F383C433EF
	for <linux-doc@archiver.kernel.org>; Tue,  1 Mar 2022 04:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiCAEWc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Feb 2022 23:22:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231700AbiCAEWc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Feb 2022 23:22:32 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC02338A1
        for <linux-doc@vger.kernel.org>; Mon, 28 Feb 2022 20:21:52 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id ay5so9659335plb.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Feb 2022 20:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/uJjpUfz7KEDEUiGobXbxL7MCEU9TyXuaS3h77xBrTQ=;
        b=lklUhQ998nFxjTCIoKD5GygWrDcgkombNPThnu3aZHWo33gPBNjO735ee4VbUWIoOb
         poxCAVxBLqoQwb77ZupUgmI/XOQ9Q3FjF511wyPDGVB28FYaDWkbWIEP4pnQKgv4bYFm
         FBkejb+Eb+BJ0kPs1qFJ5+V1rbYX/c8PK4u1pZy1qvMaOjK0wgVz0rOVrgiRGlOagFRH
         mLYE4ui1bhx5sTtZ3WttG3y0GvKDnP0CtucuRAG3o16G6XBfyVX4S+0fhpXGIal0jom5
         IrwdA/Z89QybZl9Qk4R+lU+TFeDWA3opLAotJoeDfLsjVpIFSC7Z1FT2sURo4EO71FLC
         qIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/uJjpUfz7KEDEUiGobXbxL7MCEU9TyXuaS3h77xBrTQ=;
        b=Jbax57vCnfCTmtAW6Wc+Z114MJvg+jcbPkeBqU6ZfWWb/V/7C0MVHZuccI/Pq69Ryg
         zBaelSI/iKmFtyeyNGAuOYeBVNFeDHFbt8WTnpshUqsI5A+/9S+2855Ne+KyTR1oZt8I
         oxIUgb4pOJOhSDBs5MMNY93DWp+rrMW2Yq0CZwj5ffcok59KWZJUiNXK81FyjE2OP+c4
         u/VNZfJRDRmDAPsLr8BeOGpWiDqUUxur2dtrkxdRHzDIQBAVR9ErzTgJ8S5LGiMbRLDS
         WRjeDG0CK3x4kbhkG3TDovhpIB9aU5Va+MSCFaTKqRtXTYtxIomnBQuupkCf9dIQq99I
         X95w==
X-Gm-Message-State: AOAM533ajBFQy8XCBtFgbPrnPr2Yoccy4uCyqSIetd6WOy1xAZ7tw/Kq
        X2nFe8MQXqtgEqu1WOcnqk0=
X-Google-Smtp-Source: ABdhPJxpjgTLJUhACbZil5seBMTqzEMApCPaqwcS+KzgHchYd4MGxO4fPII8BuRoKOlFGDJrk/2jGg==
X-Received: by 2002:a17:902:7890:b0:14d:502e:fa64 with SMTP id q16-20020a170902789000b0014d502efa64mr23624915pll.150.1646108511735;
        Mon, 28 Feb 2022 20:21:51 -0800 (PST)
Received: from localhost.localdomain (111-250-8-126.dynamic-ip.hinet.net. [111.250.8.126])
        by smtp.gmail.com with ESMTPSA id t41-20020a056a0013a900b004e167af0c0dsm15937178pfg.89.2022.02.28.20.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 20:21:51 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 2/3] docs/zh_CN: add peci index translation
Date:   Tue,  1 Mar 2022 12:18:25 +0800
Message-Id: <9fdba94417277ae20db7e3b13418584c652be93f.1646108017.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646108017.git.siyanteng@loongson.cn>
References: <cover.1646108017.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

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

