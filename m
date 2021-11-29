Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C4EC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 29 Nov 2021 03:04:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343931AbhK2DIM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Nov 2021 22:08:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242559AbhK2DGL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Nov 2021 22:06:11 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F7EC061759
        for <linux-doc@vger.kernel.org>; Sun, 28 Nov 2021 19:01:37 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id p18-20020a17090ad31200b001a78bb52876so14327691pju.3
        for <linux-doc@vger.kernel.org>; Sun, 28 Nov 2021 19:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ydp1mYq8tpa35ianXbUZOk+NfxiB2rCGNrs/QNPH+Mo=;
        b=PJ3tX1XYLT5iwwn0GxKvduc5O2ojgaYkI8crKud89k+7ILZW4WSaFK/9XRgokwAeJ8
         LF0cT2vgtLiJS320IeQEzUuoGRJNmPXqRJ/d2HfJnleBBLAdsZdknCgRKpkv6eVq0XJ2
         V8vGFQHUYoEuA/cidfCuQbTLUQHAYzxltiDi7W98oC7gidiITMHdKDcHO0FR60rz0new
         0rnHsOcp+3wkRxt5H2kRY49bsvmK0XeOGEY4o7OezKSrY7Jw3DLjXEDzpvJCFfMmjISz
         nSRgTDTTXjtnKj7P79mx13fxzfGI1tQxKNMw83MUXJ9b9XERAo3hz5gdjFnKSA9QJ8aL
         1GJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ydp1mYq8tpa35ianXbUZOk+NfxiB2rCGNrs/QNPH+Mo=;
        b=SUz4Y+TMP7B8JizfhICtjADexPZV7v7AagakKvbkp0070gVV5Z58O+MRuO12C5FTvT
         2j5s8VqTLVMvaz98N5nKozATaDhKi9P1iAS11fQBnL2eRAWK2xAIMGHo9PqTSFAiorPE
         /EsPyZIOITZfDYIZQZiZwFsT5WTyctorrGwy3xgyvrVfRkPeHMTOHkgweA5DMe2B07Mm
         o/D3ApE9sigapv04IcAWj++f5D/5PW03bv5D8Cdem/fDk0DF6+MzFNKCcz01XIVml079
         6IHHu4htg7waC3vIQCtB7vq71QnOJWcC5dLMEv6KXE+1rt6u6spvj8pcRa/VyVXcWDEA
         E4Aw==
X-Gm-Message-State: AOAM532TMWZxFps4iIljKbyeUSzgGX5nyXY5jL8uCUjeSmiPxm9duOmI
        VY5znvypJcnq637/oqYMM/tuI3zgVWozGr0M
X-Google-Smtp-Source: ABdhPJxZn6hXKoAtvALm7sbYRNCjsGF0Lh2kbmq8E8M44fCL2URNhsFJ01VnpfbR7V6SBmZrqHXgzQ==
X-Received: by 2002:a17:90b:3b48:: with SMTP id ot8mr35849948pjb.78.1638154897360;
        Sun, 28 Nov 2021 19:01:37 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.90])
        by smtp.gmail.com with ESMTPSA id y23sm10066271pgf.86.2021.11.28.19.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 19:01:37 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com
Subject: [PATCH v2 0/3] docs/zh_CN: add scheduler arch and bwc translation
Date:   Mon, 29 Nov 2021 11:00:20 +0800
Message-Id: <cover.1638154485.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:

* Pick Reviewed-by tag. (Patch 2/3 and 3/3)
* Modified some words under Alex's advices.

v1:

* Translate .../scheduler/sched-arch.rst and sched-bwc.rst into Chinese.
* When I translated sched-bwc, I fixed some errata along the way.
* fix a build warning in sched-bwc,I put them inside a patch or even in
  a series, so if I should split them, please let me know.

Yanteng Si (3):
  docs/zh_CN: add scheduler sched-arch translation
  docs/zh_CN: add scheduler sched-bwc translation
  docs/scheduler: fix typo and warning in sched-bwc

 Documentation/scheduler/sched-bwc.rst         |   5 +-
 .../translations/zh_CN/scheduler/index.rst    |   3 +-
 .../zh_CN/scheduler/sched-arch.rst            |  78 +++++++
 .../zh_CN/scheduler/sched-bwc.rst             | 206 ++++++++++++++++++
 4 files changed, 288 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/scheduler/sched-arch.rst
 create mode 100644 Documentation/translations/zh_CN/scheduler/sched-bwc.rst

-- 
2.27.0

