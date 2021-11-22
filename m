Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBECC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 22 Nov 2021 07:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhKVHme (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Nov 2021 02:42:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232847AbhKVHmd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Nov 2021 02:42:33 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899AAC061574
        for <linux-doc@vger.kernel.org>; Sun, 21 Nov 2021 23:39:27 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id v23so13099472pjr.5
        for <linux-doc@vger.kernel.org>; Sun, 21 Nov 2021 23:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=El4EgUFISJEHsI2Fm1jq1yS25FMZPtBFKskz024n6kc=;
        b=BJdIXTltz32FymudVjyrJ8nRjr1UM4LC3MTRE+i2k8+TF2RBOMrzMz4tdXtnXVTja6
         ZJS/tLXujzBv9eGs/M5gCaDXLDSLAbkIg89IpMQPw2JBf3bLOA1HXdsK6Bv2a0rZ+ul8
         pv9e1J0heFGPp1yHyZFIM1dz4MUoMqptg9B1GU+QYiRizLopcIaqU3wfL+qTGSZrNBy2
         jI+MKMS2J7WgNzrcfX+PiMFnc3f/JBK+r7FLRTF0VXVYxZb9Dt/a+dZu0tocItAPJu4w
         tH0mMjy1UJWW5CSh8jfDATm8P3HvrIHhEwce2k0Ja0egkD6cyEZY+5+FK5mDHN3jzZTq
         ltwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=El4EgUFISJEHsI2Fm1jq1yS25FMZPtBFKskz024n6kc=;
        b=fPLNthGub/a2q4s3evt24Hhjk3Fet/IKnXW6egLUt3lRoIb38Ur87TdhCsccF8WCoF
         hsdiKyYGy7qGO7jzbix8Z6IqUF2eU+/b9f3EqludAQJPLKu0jemDU2PLNIPQYh6ELlby
         0GAx+1zEUUB0ZkufIpL/j7D10MPioARTTa2pNZ6PMhgYNftMQ45EXKg0du5qJqCzh5Xr
         jeoNUKNOjGPQW6o/zRvE51i1ZJJAqyzuUif7E/9q0TboyZ+jeYmvbnSNesO14C+6fnzu
         Cu1s/0M9K6WpeUicOrmQhdhU4jR4h3NwghvZztEOC09Up03ZJfYHGVzDylVQ0LqffiPe
         ey5Q==
X-Gm-Message-State: AOAM530mQmaWCneMvVUErAw23yG2IqxqvItaJ8BBFIE8Q9IERj3nCNBl
        cr88Km1jxspw/nwGmgrdF5EYz7nKgFCEKA==
X-Google-Smtp-Source: ABdhPJxq3xlWJnIrVduPJVCfnJzU2BunTPzHj80GLe3rUrUIH45AtgR0kcYuDpW+OCUNrm6jVPVuGw==
X-Received: by 2002:a17:902:e544:b0:144:e3fa:3c2e with SMTP id n4-20020a170902e54400b00144e3fa3c2emr38073272plf.17.1637566767071;
        Sun, 21 Nov 2021 23:39:27 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id j7sm7800671pfc.74.2021.11.21.23.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 23:39:26 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v3 0/2] docs/zh_CN: add pciebus-howto and pci-iov-howto translation
Date:   Mon, 22 Nov 2021 15:38:17 +0800
Message-Id: <cover.1637565438.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v3:

* Testing on the next-20211118.

v2:

* Pick Alex's reviewed-by tag.

v1:

* Translate .../PCI/pci-iov-howto.rst and .../PCI/pciebus-howto.rst into Chinese.

Yanteng Si (2):
  docs/zh_CN: add pciebus-howto translation
  docs/zh_CN: add pci-iov-howto translation

 .../translations/zh_CN/PCI/index.rst          |   5 +-
 .../translations/zh_CN/PCI/pci-iov-howto.rst  | 170 ++++++++++++++++
 .../translations/zh_CN/PCI/pciebus-howto.rst  | 192 ++++++++++++++++++
 3 files changed, 365 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/PCI/pci-iov-howto.rst
 create mode 100644 Documentation/translations/zh_CN/PCI/pciebus-howto.rst

-- 
2.27.0

