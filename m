Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E6BC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 13 Jan 2022 03:21:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbiAMDVV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Jan 2022 22:21:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231976AbiAMDVU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Jan 2022 22:21:20 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E62DC06173F
        for <linux-doc@vger.kernel.org>; Wed, 12 Jan 2022 19:21:20 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id l15so7551942pls.7
        for <linux-doc@vger.kernel.org>; Wed, 12 Jan 2022 19:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1idL//4mhl12ByyIfzbWn5E+rkMRYh+iWz8xhBwQC98=;
        b=p1MPcOw0I1t2gDJrp6zdldB7kRAFCA4Am3dSI02M9qcIOJsDEcQ4rcqL28Tzw730iW
         quHjNV1iBmbNq4nbtuCmShWzu+XtBiUsfGvPeMveFksuDTb2vFZhcD+GslTQwvtzckPt
         WilcGWvr4WSUyyS1fwRVlgp10f5Q4BOcLXJ9HRQk5b/QLCYqW1xzeghayoVOQ8uB8Pk1
         xCHceMus8raeXBRWdQQEAMoUR4DW6UskSLPYO6X7cdpjAKZihmg/mgSKytd5X4fEi33C
         uhfQpPdojFqrZ9xjot79cq4VQvQVBFCc0ExpBm9+YTctyOMmYMx3Rob0Tj9nV7uKuALW
         5iYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1idL//4mhl12ByyIfzbWn5E+rkMRYh+iWz8xhBwQC98=;
        b=x3mYjd5X8TrvFpv/0AB2EbpyhFxBpfc5xnvQFGpcMfGSDKnJgKptGGtDzMfsqWkn4E
         XvpuiO6OkWUjlionfr57A4rU0Nh5fp9TaS2G6VDZR0ZvnY79TWpFIBba6LTJxqcNd8+t
         W6pKn/ozXJTtO+hauuQmjYSHCurWGAU2nUsq/nWn9owBKcdIfkwZpVvill+j6TXQXw3A
         CEXwCh+3KW1ZqBhifU6KfjDlYWoxmx63JnK6YAxryJ96vAgX7RhlA0sW1CzZBih+O+ze
         O/Ttb9+vmDwfYBe7HsJ2RCCudxk7wR5GyYFEplRFX32QlLRJc+QgS+QUVAvd27NFc/1/
         Nj1w==
X-Gm-Message-State: AOAM531cZU41tCxao6PS/KBvoUM6j5bDYUCGCvjTh8l5fYlimiVAP05t
        NJvV9MnrE3fstdr3kNhqNEk=
X-Google-Smtp-Source: ABdhPJyUu7JQciaCR1mXnnPm+HBZeU0qQUa6P1NUUkFn0gUinz1s0HM3Adj/bvMqluPcDwS/73bOnw==
X-Received: by 2002:a17:90b:1d0a:: with SMTP id on10mr12346493pjb.138.1642044080162;
        Wed, 12 Jan 2022 19:21:20 -0800 (PST)
Received: from localhost.localdomain (pcd454075.netvigator.com. [203.218.244.75])
        by smtp.gmail.com with ESMTPSA id x2sm1757573pjq.40.2022.01.12.19.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 19:21:19 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 0/4] docs/zh_CN: add vm damon translation
Date:   Thu, 13 Jan 2022 11:18:00 +0800
Message-Id: <cover.1642043630.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

All guys, let's study damon together.

Translate .../vm/damon/* into Chinese.

Yanteng Si (4):
  docs/zh_CN: add damon index tronslation
  docs/zh_CN: add damon faq translation
  docs/zh_CN: add damon design translation
  docs/zh_CN: add damon api translation

 .../translations/zh_CN/vm/damon/api.rst       |  32 ++++
 .../translations/zh_CN/vm/damon/design.rst    | 139 ++++++++++++++++++
 .../translations/zh_CN/vm/damon/faq.rst       |  48 ++++++
 .../translations/zh_CN/vm/damon/index.rst     |  33 +++++
 Documentation/translations/zh_CN/vm/index.rst |   2 +-
 5 files changed, 253 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/damon/api.rst
 create mode 100644 Documentation/translations/zh_CN/vm/damon/design.rst
 create mode 100644 Documentation/translations/zh_CN/vm/damon/faq.rst
 create mode 100644 Documentation/translations/zh_CN/vm/damon/index.rst

-- 
2.27.0

