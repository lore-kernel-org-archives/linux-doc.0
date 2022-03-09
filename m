Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0478C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  9 Mar 2022 09:30:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbiCIJbu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Mar 2022 04:31:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbiCIJbu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Mar 2022 04:31:50 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C4216EA98
        for <linux-doc@vger.kernel.org>; Wed,  9 Mar 2022 01:30:52 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id a5so1755629pfv.2
        for <linux-doc@vger.kernel.org>; Wed, 09 Mar 2022 01:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6iUMfxTPZ/xGXo8phZbqT7bbvLlXXKAahmgVBRqWKz0=;
        b=Yc3UFaY0lg3TCkMmLDUUUyYM9Ci1ac3bqoe613ltCkFQBNjjP3W2khuqOPC4VnfSX7
         8f1PSiTX74fookzhvSrr9ht7C3Ix7maOZmy5QGWICE2ADPNA04GGDZnVFmXmwxA2KdJH
         28RI8jmVNY6mae13wPEtYa2IFdT8gLCV/Kfd7c4vGhSqmEdGanMf9MCFmZfD5tjAZz9q
         VoJ2F3dOcAbyQns0UDC9dBLjsRAHQ8Cn89CpGY+YbpJEbDRcI/xl6F5NCpytLJxmnGN1
         Rx+8QFutYF69rQnpgi+Teyh5lQvI2Axes6Xhioj6hw+rW6Fm4tYRqD6fFUQE9b0ltD/f
         ctKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6iUMfxTPZ/xGXo8phZbqT7bbvLlXXKAahmgVBRqWKz0=;
        b=GCOIZ0+NhYtLvC2csw8NUrh+RieZj/GOI1snFL2WfuR1/jdY0u0Dc6Xhjdohr89sZy
         5+sTg6RBlx96mxvhsXr+JGZmrNZZfTKeQxlHHW350XmBH45PjZYe80d08T3Vyn5gHZKT
         SAYO/ZTeiu7kM5jSffTLNDjaoYgTi6TswrJ4afk3cItfCBlgm4x4VvYsiQaR2FTPeEGZ
         1oG2Gy4Uv3nGK3rhffSpOU2dmvsRaNjSW+sZ1QLcQ2unSuDCupwhOZ05ztUBZ0jIwjKK
         2dtrLqy4OFhkN0D2vevFeA/HzqKhboNuSQTzT+CVgKblMGMixx2hXI3cxO1LAEaG4uq/
         xceQ==
X-Gm-Message-State: AOAM533C68AYpLoJUOCf8opvH0r1kvJ53cXcX3FbvwUD3juRLUHREMdk
        jPRBxg/X/ZpEWb+Y3gYnzBiUv7tA4S2wdgXh
X-Google-Smtp-Source: ABdhPJwFRGE6WXVhRqlV4LHh+99iqyxryTI/l+PxuHHZOvp6jlMCgdpFdL474viZN4TbXeMC6INUJg==
X-Received: by 2002:a62:1a43:0:b0:4f6:ce73:d572 with SMTP id a64-20020a621a43000000b004f6ce73d572mr22757450pfa.69.1646818251624;
        Wed, 09 Mar 2022 01:30:51 -0800 (PST)
Received: from localhost.localdomain ([50.7.60.25])
        by smtp.gmail.com with ESMTPSA id h21-20020a056a00231500b004e13188af99sm2173369pfh.38.2022.03.09.01.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 01:30:51 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.coms
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v5 0/5] docs/zh_CN: add admin-guide damon translation
Date:   Wed,  9 Mar 2022 17:32:05 +0800
Message-Id: <cover.1646817889.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v5:

* Modify some words under Alex's advice.

v4:
* Build test in next-20220307.
* My patch thread is based on
<https://lore.kernel.org/linux-doc/cover.1646723502.git.siyanteng@loongson.cn/T/#t>

v3:
* Build test in next-20220304.

v2:
* Pick Alexs Reviewed-by tag. [PATCH 1-3/5]
* Fix a build warning.(introduce from usage.rst)

v1:
* Translate .../admin-guide/mm/damon/* into Chinese
* note my patch thread is based on
<https://lore.kernel.org/linux-doc/20220212080024.1684590-1-xu.xin16@zte.com.cn/T/#t>

Yanteng Si (5):
  docs/zh_CN: Refactoring the admin-guide directory index
  docs/zh_CN: add admin-guide damon index translation
  docs/zh_CN: add admin-guide damon start translation
  docs/zh_CN: add damon usage translation
  docs/zh_CN: add damon reclaim translation

 .../translations/zh_CN/admin-guide/index.rst  | 122 ++++----
 .../zh_CN/admin-guide/mm/damon/index.rst      |  28 ++
 .../zh_CN/admin-guide/mm/damon/reclaim.rst    | 232 ++++++++++++++
 .../zh_CN/admin-guide/mm/damon/start.rst      | 132 ++++++++
 .../zh_CN/admin-guide/mm/damon/usage.rst      | 286 ++++++++++++++++++
 .../zh_CN/admin-guide/mm/index.rst            |   2 +-
 6 files changed, 740 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst

-- 
2.27.0

