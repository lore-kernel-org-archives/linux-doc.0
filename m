Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2831FC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 24 Feb 2022 02:58:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbiBXC7H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Feb 2022 21:59:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbiBXC7H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Feb 2022 21:59:07 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F7E4C4879
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 18:58:38 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id 12so621184pgd.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 18:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SsKsVW65/t5gQu+v26kQwSNX0AqJJWF7N8egmzAYd/A=;
        b=P/7TyS2plkpH4wxnJHznAJVyam260ImTx1zMHOeKicmD7/I2P9/+aEwtpN5KtSftZF
         eo8saG5Ii1YVRBkynsfOylbaSXYcSQrlgVJ4k7ndybDQxDCCEEyMZYjkP+faH9DeYpNg
         W9YLW7nUJfd5U+rI1xDf04BUMnShAHJM8HnOufkvOy9Fla0oBjV6zylvxZb1hV2wZ76P
         qcyiPJpc3oYjphMJ6RSFu0e0nZKfLyHMBYzFlwiWKZ/+tQmlN9bTkmbEM+v5mbsDsGC2
         d10lmv5PaMHgn+qtUrSjah1/PSProY0RCd5ks8zxzl0EsKAGi1woHuApzJoioJsQ1862
         V06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SsKsVW65/t5gQu+v26kQwSNX0AqJJWF7N8egmzAYd/A=;
        b=7sIcTq6e8CD8Lg8M+tBkkrnMoMbqzbKUP7GExSd/b7ANCfOPko2eg6YHtLD487pcre
         kD+D1nWHdpvt/+i5bRbrHl7HkapsRplbEYrGaD4Hua+m5ybK6bxNJUI3NdNW9UI99xeV
         3aAi+i29BrvDMN1jdlYYATiYjCkMCA5ggNAswLZhnTeCVsundnMmDK0gUP1rFTKHR0qZ
         nh72dqMgXd2seJjkPITz94TIRthHs7mPzfl7052CQBBvpZQytAZh0tO84ZUQRJpAtVlx
         i+xNVVP/Rb+VYBmSjnx0PXiYGU9ETwDhT1FBJ5rMV7x2Ou+8OR3TPFDEi2CSoj20D09W
         7vHA==
X-Gm-Message-State: AOAM5334C1Yw1/DEww/cA5fhmzNNY5apKHCncY50azvLk/db8prw7R8G
        rL99VGlAzECyCXvCdxLOLcs=
X-Google-Smtp-Source: ABdhPJw7VNfZg20/X0CoClDUL51KWSJQqoxZJjnae6L/omX7pfWeLXZGQfyCFW63EI8ddVWZcTuNUQ==
X-Received: by 2002:a63:9149:0:b0:372:8bfe:6b03 with SMTP id l70-20020a639149000000b003728bfe6b03mr681443pge.43.1645671517608;
        Wed, 23 Feb 2022 18:58:37 -0800 (PST)
Received: from localhost.localdomain ([50.7.60.25])
        by smtp.gmail.com with ESMTPSA id p16sm775855pgj.79.2022.02.23.18.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 18:58:37 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH v3 0/5] docs/zh_CN: add admin-guide damon translation
Date:   Thu, 24 Feb 2022 10:55:22 +0800
Message-Id: <cover.1645670438.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v3:
* Pick Alexs Reviewed-by tag. [PATCH 4-5/5]

v2:
* Pick Alexs Reviewed-by tag. [PATCH 1-3/5]
* Fix a build warning.(introduce from usage.rst)

v1:
* Translate .../admin-guide/mm/damon/* into Chinese

**Note**: my patch thread is based on:
<https://lore.kernel.org/linux-doc/cover.1645669457.git.siyanteng@loongson.cn/T/#t>

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

