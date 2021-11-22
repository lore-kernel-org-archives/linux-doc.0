Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5EC8C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 22 Nov 2021 07:40:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233028AbhKVHoC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Nov 2021 02:44:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232870AbhKVHoC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Nov 2021 02:44:02 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894D5C061574
        for <linux-doc@vger.kernel.org>; Sun, 21 Nov 2021 23:40:56 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id v19so13336809plo.7
        for <linux-doc@vger.kernel.org>; Sun, 21 Nov 2021 23:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KKVLVR/ovoGpRZ7JHPwg2CZHJxWJI8VdBuIY4vfVEAk=;
        b=Mank2xDaiTkkiRKPqjc4KFZjVTEEr+VY2abFS4QKz+LoJeKHPx0+4x9AuJt3SknL6R
         NhUwFNv//XeyoFDP+ai5RYZZ/+fWhmb+MJpJClWXSCND02CY8EOTvD8dEAtlpyTJaShf
         mDopfRhKJcebwJXkZy9vXlrLuXofxZIZFZP2KUufGdXC0s825p1pLAwTd5/LJ6iyPrhi
         CTmvad9+Rhlp3m0IH4/m4az4o0n87Nde0tQB5FrHMJwE3jRpxywntqPA6NBu5HxjdpR/
         p3AOu+KGvl+0b+OFBHVILHg9S9QWUut9okxJQDD9HafT1OrjTc2/ImiSqteVvGN6cE8E
         TpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KKVLVR/ovoGpRZ7JHPwg2CZHJxWJI8VdBuIY4vfVEAk=;
        b=J19bqLvNSZNUl6eSYVfdMJIK5ksF/1SCCQ74Hc1H1nXkXGNQmOKjv38CwVMweTVf4A
         quS4OiXi4eYhmr1lv711ceVZTRfLcjEhtkbG1p5CiSVBm1GoBGlnOTPJiZ4+Vpd4YKF/
         6jozg/8740jpP4sLJnuJrfF3rR4fSvI0UWS/WxCcjrgT1n9XAJkA5btbHsWKcotlA63U
         sjhZFisfQZ7t5nJYlz7wRBEjCHmLdDFzwdQEzcI1Vt1/8V34Og3jRoNwwQsq8B9OrBKG
         M5gPqIqljdPsnmJl6Te0ZeBG1RuBm5Rb/0cbCmsruOnaEq80tqd+7pU47JR6pVIg+kth
         2RxA==
X-Gm-Message-State: AOAM530Bqj3/xRO0zt3C8BPVA2NznVBgqSXrZmSbEjUfXWY2nWv9OTL/
        1cBCNmSCHEuVA2qlo0Qhrbg=
X-Google-Smtp-Source: ABdhPJwF+T54cpcK0yULGNZHsYuwmMtPegVZWk/ThOUGFcKXcRzi7/LbmxFbC0Uev7JPx3elLkvpRA==
X-Received: by 2002:a17:903:2291:b0:142:b53:6e08 with SMTP id b17-20020a170903229100b001420b536e08mr106244909plh.10.1637566856103;
        Sun, 21 Nov 2021 23:40:56 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id b6sm7900314pfm.170.2021.11.21.23.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 23:40:55 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v2 0/2] docs/zh_CN: add msi-howto and sysfs-pci translation
Date:   Mon, 22 Nov 2021 15:39:48 +0800
Message-Id: <cover.1637565137.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:

* Pick Alex's Reviewed-by tag.
* MSI -> 消息标记中断。
* modify index.rst. (When applying the series, they depend on the **pciebus-howto and pci-iov-howto**)


v1:

* Translate .../PCI/msi-howto.rst and ../PCI/sysfs-pci.rst into Chinese.

Yanteng Si (2):
  docs/zh_CN: add msi-howto translation
  docs/zh_CN: add sysfs-pci trnaslation

 .../translations/zh_CN/PCI/index.rst          |   6 +-
 .../translations/zh_CN/PCI/msi-howto.rst      | 235 ++++++++++++++++++
 .../translations/zh_CN/PCI/sysfs-pci.rst      | 128 ++++++++++
 3 files changed, 366 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/PCI/msi-howto.rst
 create mode 100644 Documentation/translations/zh_CN/PCI/sysfs-pci.rst

-- 
2.27.0

