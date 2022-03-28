Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B896AC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 28 Mar 2022 09:58:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237336AbiC1KAZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 06:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238866AbiC1KAY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 06:00:24 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D4FDECB
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 02:58:44 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id q19so11861309pgm.6
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 02:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZpmUw5pJXjZFr8mFnRrSzFF846g2eqmilwOEjUAsY8g=;
        b=Tak+O48FWMEa0wbHMOItBx+7/GF80veKE5runQz9cenuI+Gve0xU1FizNB+ddWVqYe
         azELdtHAejL81cFxtkSwCkGuoIMwReQ+TPDOSrXW0QoHMTheM5XPO9blaX0SU9NXmZxW
         cmM8uioxo+6dUpo6+7eHx7vyizEkurn2GZRT0f2i96nPGIjWR0GPYd8PNrLldR/83Jxl
         EgIdjljZtqLzEZIK1IFzF3Oqv1ISdPV8fAck/29bXAzWQ39wHM15hCMaMPcCpHTpexCr
         QYYIBbmDxuNeqlZKL5gWRui66TNKXfOv0+jrljOOFM6dsRYOS9SKB3G8oZ5qUbEMyw9t
         86Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZpmUw5pJXjZFr8mFnRrSzFF846g2eqmilwOEjUAsY8g=;
        b=eB4KS5kL23hNzGSqUgPTiWsw53qTYfPIdsHREFoscgI3CQuXSuf7aH5yGtT4ETil+c
         qy8/NTrvW4thF5Z1Bud+hqero54w12QX5nkg7GaNdN9WUsmdb6zAKkvheRlsXNjhtXjS
         rOpSuSMV6K/IeRt8gTvn9tGlxiFijWcehQ9f0wVDi9gPC1V7SM7jZRGaba+xM/lzWWFQ
         g1VLGfI19BWuY0zvCTAaMzuQ3K9Sn6QWij7oZokh9L+4MeCdPanB6AZYHvmmhab+siQX
         +n6lL89nbG2yiW6Jz3ychRgFNG5RX6U3xZRX7zZV2UsjNq816tuP268GqanFOaroMEom
         wCVw==
X-Gm-Message-State: AOAM5312Dzx2JSvONZ90YnIDQ8FZgGs3iLcDuWQz8eaSuYpAWhmMZ2IW
        aIsdwiThawpYjt3LGwcSdxM=
X-Google-Smtp-Source: ABdhPJxuR2MtD7BbbzO3/FN8DXhug1WRoyKtVXiezmOAxH7Vdge3+ceaErtWsnwJMyJ9t7/tI9bjVw==
X-Received: by 2002:a65:4081:0:b0:381:6ff8:f4ba with SMTP id t1-20020a654081000000b003816ff8f4bamr9628281pgp.457.1648461523606;
        Mon, 28 Mar 2022 02:58:43 -0700 (PDT)
Received: from localhost.localdomain (111-250-2-155.dynamic-ip.hinet.net. [111.250.2.155])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a174800b001c7d8b160f0sm10526637pjm.51.2022.03.28.02.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 02:58:43 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v3 00/12] docs/zh_CN: add a little vm translation
Date:   Mon, 28 Mar 2022 17:59:42 +0800
Message-Id: <cover.1648458742.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v3:

* Modify some words under Alex's advice.
* Optimized some words. [PATCH 2/12]

v2:
* Modify some words under Alex's advice.
* Optimized some words. [PATCH 07-12/12]

v1:
* Translate a little .../vm/*.rst into Chinese.

* It is expected that all vm documentation will be
 translated in a short time, sorry for the huge review
 pressure on maintainer. I look like a troublemaker. >_<

Yanteng Si (12):
  docs/zh_CN: add vm frontswap translation
  docs/zh_CN: add vm hwpoison translation
  docs/zh_CN: add vm memory-model translation
  docs/zh_CN: add vm mmu_notifier translation
  docs/zh_CN: add vm overcommit-accounting translation
  docs/zh_CN: add vm page_frags translation
  docs/zh_CN: add vm page_owner translation
  docs/zh_CN: add vm page_table_check translation
  docs/zh_CN: add vm remap_file_pages translation
  docs/zh_CN: add vm split_page_table_lock translation
  docs/zh_CN: add vm z3fold translation
  docs/zh_CN: add vm zsmalloc translation

 .../translations/zh_CN/vm/frontswap.rst       | 196 ++++++++++++++++++
 .../translations/zh_CN/vm/hwpoison.rst        | 166 +++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst |  24 +--
 .../translations/zh_CN/vm/memory-model.rst    | 135 ++++++++++++
 .../translations/zh_CN/vm/mmu_notifier.rst    |  97 +++++++++
 .../zh_CN/vm/overcommit-accounting.rst        |  86 ++++++++
 .../translations/zh_CN/vm/page_frags.rst      |  38 ++++
 .../translations/zh_CN/vm/page_owner.rst      | 116 +++++++++++
 .../zh_CN/vm/page_table_check.rst             |  56 +++++
 .../zh_CN/vm/remap_file_pages.rst             |  32 +++
 .../zh_CN/vm/split_page_table_lock.rst        |  96 +++++++++
 .../translations/zh_CN/vm/z3fold.rst          |  31 +++
 .../translations/zh_CN/vm/zsmalloc.rst        |  78 +++++++
 13 files changed, 1139 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/vm/frontswap.rst
 create mode 100644 Documentation/translations/zh_CN/vm/hwpoison.rst
 create mode 100644 Documentation/translations/zh_CN/vm/memory-model.rst
 create mode 100644 Documentation/translations/zh_CN/vm/mmu_notifier.rst
 create mode 100644 Documentation/translations/zh_CN/vm/overcommit-accounting.rst
 create mode 100644 Documentation/translations/zh_CN/vm/page_frags.rst
 create mode 100644 Documentation/translations/zh_CN/vm/page_owner.rst
 create mode 100644 Documentation/translations/zh_CN/vm/page_table_check.rst
 create mode 100644 Documentation/translations/zh_CN/vm/remap_file_pages.rst
 create mode 100644 Documentation/translations/zh_CN/vm/split_page_table_lock.rst
 create mode 100644 Documentation/translations/zh_CN/vm/z3fold.rst
 create mode 100644 Documentation/translations/zh_CN/vm/zsmalloc.rst

-- 
2.27.0

