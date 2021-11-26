Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B839C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 26 Nov 2021 02:25:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242916AbhKZC2k (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Nov 2021 21:28:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357546AbhKZC0k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Nov 2021 21:26:40 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ACA0C0613FD
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 18:21:46 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id nh10-20020a17090b364a00b001a69adad5ebso6975404pjb.2
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 18:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XAiGNm774kEm5wp1HStR60njlch8w1juWncQ58NpcGU=;
        b=IPdN/oWgB7nxQiikM0/fqI7boD/e5jQAftSSZ8HljbMaL1RR+cXGs6EpuatFoyO1a6
         qHzS6GfmwB4qULY9yMKFeFtMhl/zJJvm0N2FgQkVYfpnR2M5qR5ncaG4B84O2LAhv3S4
         V9W4s52pRbUxfQQJslfXhy7FUNpHa+ZQ6Nq1zLE9o19jVAEci/Am/apRL43Pl4OqspxQ
         BT31xa22PbyO8VJydfSqvIz+AINcnL303d5HbeAVL8dhkHrzI5NgN4O6lBHxHnmqJnDe
         lcgWUcTMreeSXecXyrBKF7lr8aN8xwjLtGRnMAfbPBtgVqqfEOOnBZiATwdhKyfgaqOj
         4FUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XAiGNm774kEm5wp1HStR60njlch8w1juWncQ58NpcGU=;
        b=Wn1CYJ0XpxOQbW6k+LLTweaTSmjUy9HjCv+WhaboUKoYNnHvkcn33lXPkmo1em1uQG
         6HSwnD8PZl1kkReTKBByLrwDaDUz+sFkOBbQEa2qK4RsvuK6HgFzx9keK2a38crvMps7
         HWAmB6AAJOZwujZghsFs7VLkTxjcrsi1WnfMrC08OUO350gC8SLAEbtwOolKrGU00Olr
         i7nKy/v5J2v7yKIP3SPhwX07fsDc6grFNElmn/wwzJqW1dtMagAdEpQ/hFUtoZCJY0TI
         9kpXVRcIIDikYM6CvwdEa+UUz0tt2eJ2FXO74dmjVrUqj9K1Eu0WtPS5PmKHe+PGYfEk
         73TQ==
X-Gm-Message-State: AOAM5339d5T/BJsFM1zfj3GrxuKmV0mHA0alUoTQg05IT5xYz/k3tzkO
        WniIqIWUZ7UWvbR1mGe4kVs=
X-Google-Smtp-Source: ABdhPJxo1pMgXhD3Am6xVh1fIMYQEwiuSq2HcIRaS5ZPuCOhGo1KGATzeK1Zezj+sHtbHQWovxAy2w==
X-Received: by 2002:a17:90a:6906:: with SMTP id r6mr12158378pjj.118.1637893305674;
        Thu, 25 Nov 2021 18:21:45 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.90])
        by smtp.gmail.com with ESMTPSA id a10sm3422379pgw.25.2021.11.25.18.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 18:21:45 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v2 0/2] docs/zh_CN: add scheduler completion translation
Date:   Fri, 26 Nov 2021 10:20:34 +0800
Message-Id: <cover.1637892363.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:

* Modified some words under Alex's advices.

v1:

* Translate .../scheduler/completion.rst and index.rst into Chinese.

Yanteng Si (2):
  docs/zh_CN: add scheduler index translation
  docs/zh_CN: add completion translation

 Documentation/translations/zh_CN/index.rst    |   2 +-
 .../zh_CN/scheduler/completion.rst            | 256 ++++++++++++++++++
 .../translations/zh_CN/scheduler/index.rst    |  45 +++
 3 files changed, 302 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/scheduler/completion.rst
 create mode 100644 Documentation/translations/zh_CN/scheduler/index.rst

-- 
2.27.0

