Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99472C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 20 Oct 2021 10:04:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84DDE610D0
	for <linux-doc@archiver.kernel.org>; Wed, 20 Oct 2021 10:04:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhJTKGs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Oct 2021 06:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhJTKGr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Oct 2021 06:06:47 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75667C06161C
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 03:04:33 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id r1-20020a4a9641000000b002b6b55007bfso1856290ooi.3
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 03:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+hbIIqJ2ePFSO1LgKjbMdFOK5eJNFw+N2k0Gyw+cKDE=;
        b=qD1aKFlYiP3/Quoj/l+p5Z6ngSzh8lqadSeZkmSSZWS9p9M4Zbv8eaacIKHhSsSlf1
         h+4bqNpoHRn/HD6G82c+Lczx85JvoKXoXR/QYL3D1i1I01aJeLEeBQiU3EpM0oDpfcSn
         2AYGqdtPunX2Kks5eIUcCrDMJs47i74MOyZ+nfW1WQtKRavsEjMI4A3SoNn0Y+pgqOiO
         a3jddbXLFSrDzyJdph+8xbPpCHiJzgHiId70j64a8rp2aaBGVwfjevmZRaPLD/fg/A5T
         iGWjjdOQN1kVtnj9fIV+vGaerBvifWyJSdQmT5XX5DeOCFsdprmKVThffp1rv0RY+jcF
         rDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+hbIIqJ2ePFSO1LgKjbMdFOK5eJNFw+N2k0Gyw+cKDE=;
        b=kBWbfXn1V6NqxzzHuat/LQDM+l/NS7ErTihvFV44+9IUs+8ZsBSxn25Ur2gn11WtIV
         qRF8lQe9eraVlVy/E5ReyG7XbrN9esTz5ReAeCzsUz8pxYuEDvGT07Z/3XF8D+DfU30W
         8B/twl8KOptHZXd+CU9WmxzgTeg5cwtvBHYYjtOuiPpVMFv6FwPs3IFdZUEHBnQxi8G+
         edQRFdzOhvY/5AdY+gF2+65fboFECU0y6oNq7QWX9YCaOk5ngN/S8JdGmu+CzzW6++YF
         kkCvKIXb3ibPktBD05taqhllw0IZmywsYJxf+iiNWkHjBAVbuGV7j4ek83R2TEAT6+uG
         hygg==
X-Gm-Message-State: AOAM533OSTyMrGv7hxXUY7e8jX9LVmbyn38iiQs1T5N9ErvErTZ3fgOv
        L01AuPWN79JID6zndEYuG64=
X-Google-Smtp-Source: ABdhPJzl9nCfR8OoF2zpUtyAJdjqnbcv8ZUOb2t4cVsOLbllgOxLe0nfC6KXtqwFJ5mG4ETQhHQO6w==
X-Received: by 2002:a4a:b501:: with SMTP id r1mr8886344ooo.20.1634724272864;
        Wed, 20 Oct 2021 03:04:32 -0700 (PDT)
Received: from localhost.localdomain ([8.47.15.131])
        by smtp.gmail.com with ESMTPSA id h91sm374557otb.38.2021.10.20.03.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 03:04:32 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 0/2] docs/zh_CN add pci.rst translation
Date:   Wed, 20 Oct 2021 18:04:11 +0800
Message-Id: <cover.1634723736.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate ../PCI/pci.rst into Chinese

Yanteng Si (2):
  docs/zh_CN add PCI index.rst translation
  docs/zh_CN add PCI pci.rst translation

 .../translations/zh_CN/PCI/index.rst          |  36 ++
 Documentation/translations/zh_CN/PCI/pci.rst  | 514 ++++++++++++++++++
 Documentation/translations/zh_CN/index.rst    |   2 +-
 3 files changed, 551 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/PCI/index.rst
 create mode 100644 Documentation/translations/zh_CN/PCI/pci.rst

-- 
2.27.0

