Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A69DC433EF
	for <linux-doc@archiver.kernel.org>; Fri,  3 Dec 2021 08:04:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351085AbhLCIIG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Dec 2021 03:08:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235044AbhLCIIF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Dec 2021 03:08:05 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5513AC06173E
        for <linux-doc@vger.kernel.org>; Fri,  3 Dec 2021 00:04:42 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id i12so2146139pfd.6
        for <linux-doc@vger.kernel.org>; Fri, 03 Dec 2021 00:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ch4tAlvBmaZcX2slXSkpnenrEd+y5ZrrbGZtBrvyUJc=;
        b=JhzUoQm6IY0ysZk4gOojKUZpeuGMUgW4gy0CRSLFihS/jFGG0ev+HSCWFtFSJ79gAv
         6TFTiOAP0ynf+MV2+dpVU5bMjPUY8dQI8URCBmYlSaZ5p167TxhDuC0cTQuTjVyTOrfP
         64MB7mZRB62si3nNPGmdCsf0PJD1mNoFGnTXKoEZpkE6NyO0TlcPKMZ6e2yJr1PJU617
         puuBb6fTrrP3a7cIxrcNo4zrz0g6N9fWlWubs5dcY9ENyfCdrJt0yoJrTlXhfgWyVoVf
         6e9d97r+WJjtr8a30F6iDjjqqCI84qv9VB3tLOSZ0FI7MY9/Qek2L1pr20o3mp02dnpu
         5Lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ch4tAlvBmaZcX2slXSkpnenrEd+y5ZrrbGZtBrvyUJc=;
        b=TbZmRT8pQXAUPFR3nWwjXWJmzeNhY+FYAgUxiMblcgJ8Il4lbmcsTMo2TaoGSqmk9P
         nunghQyWEb+/mxke6S6AMWNpBnMajSHg2FPMfXlG+7UXpDuBsHJYjRe+FkUPZ3oG4sNH
         IDpqrNErRBxGYMt10vbYPShk6CiCt03VOJM4E4VRvNIYC9/XvRDWTlqcNFHk+tumVSOq
         YE2eydBhms48uBPXhRP8D+28epsL26A33cX6oPLeANWWyftF4fP7pIEKI4aYxAgPUTDy
         0HTXp0zGHSRZN21dj9h0vWcqJM8WWc1CibdGERkFUVoFQGYQApKkG9YfR0/zKtrwE5b4
         HEiQ==
X-Gm-Message-State: AOAM532k6EW/XSDJdtsnNzANDseegIZT/lfxYGSJW4yHs4ojhOo5fZcp
        avtk2v4wDHh18qukVV/MA5A=
X-Google-Smtp-Source: ABdhPJy+DJGWkNrbCN8r1xPi2rkfnd7EMdPMs+wViSoT7VS0DQIlUzdSgyvRQ/a/Fp6Q3uIZkFgL/A==
X-Received: by 2002:a63:f651:: with SMTP id u17mr3394309pgj.256.1638518681908;
        Fri, 03 Dec 2021 00:04:41 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id h6sm2543332pfh.82.2021.12.03.00.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 00:04:41 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com
Subject: [PATCH v3 0/3] docs/zh_CN: add scheduler arch and bwc translation
Date:   Fri,  3 Dec 2021 16:03:19 +0800
Message-Id: <cover.1638517064.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v3:

* remove unused label.

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
 .../zh_CN/scheduler/sched-arch.rst            |  76 +++++++
 .../zh_CN/scheduler/sched-bwc.rst             | 204 ++++++++++++++++++
 4 files changed, 284 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/scheduler/sched-arch.rst
 create mode 100644 Documentation/translations/zh_CN/scheduler/sched-bwc.rst

-- 
2.27.0

