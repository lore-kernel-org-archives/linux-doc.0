Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37AD9C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 11:45:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1259C60D07
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 11:45:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234114AbhJZLsU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Oct 2021 07:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233543AbhJZLsU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Oct 2021 07:48:20 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B178BC061745
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 04:45:56 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id o83so20146946oif.4
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 04:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9+vkp4UF1+CIg0Zx8ISSlLxgqMnpIQBnIiJf3PacjFc=;
        b=gcaCltrJdnLDEljVkRGBCsK5/Riagmz97l3d88Ubb4IqE2xiWIuD3Opj4PR482GD+2
         Pt8FHQ3ovtordsihPwSlxZ1sHCOtGpjHy3aVYV70dX7WRroX3yYi884h/TK2Ld+EwHNR
         oy+ONA0Fm8t0gzkLYO/nhQMihCfMbDTD+XUrFtxmiWtNNhCIds9ZXoosW8vXbmIf4Os4
         MQNq17xGkQI+4WZCHmunKB9DBnN9vFa4hr4lzCIslw1hLnOLpngG3hThYgwtHGpVQiKh
         DadJGWEoGQYJcj2KuO95Dnf8zoUcvavZlpP0UdQw2s2XIfNURkULqGrvIVE+HJNmtFwg
         4Fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9+vkp4UF1+CIg0Zx8ISSlLxgqMnpIQBnIiJf3PacjFc=;
        b=pNfLNYX8mWiF2ynbNjx9Fih32oYKotYxpLheuDKkZb3Ju32mx7IAhQIA+SzagbzyqC
         7BbdQJCOLFJSU2/tOCtq9h+XlgA+WN94aE5KRkgtgW9bvHXMgq5vAd7VJpWDRjLPRGCS
         lVqMsng4EDP1wtcC7vpHrq6sZ+1h1C3Wl437pgCJDB++Pj42mDvXvZ3iZBEioOeFBTBY
         2zdQRaxy897fP3W775btiF7wVNuLSv0drkIcDIjuHWBbZfTnTGc10aGEIIr/G+mzWG46
         kBesxJrcmTACdiWcSCkjv7sKO8ZQ4qZe4+MpQ4SH0yCENa5nUz/InI8bvt/qvGZYNmR4
         xIig==
X-Gm-Message-State: AOAM5319LInloFlP9dA4ku+y+zmfkeLDpE9q8viK+bbx/Bk7Y8Pk6xol
        A4mU6tMjUjcl8l63LUmcgKM=
X-Google-Smtp-Source: ABdhPJxgvzMzrjVXa/otfboebDEB0jVTGK3VuuuSZ8BkejBug/kq5aBiuUu7DoEWImRzjOyUACMNig==
X-Received: by 2002:a05:6808:1210:: with SMTP id a16mr17821829oil.130.1635248756045;
        Tue, 26 Oct 2021 04:45:56 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.170])
        by smtp.gmail.com with ESMTPSA id e23sm4404340oih.40.2021.10.26.04.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 04:45:55 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v2 0/2] docs/zh_CN add pci.rst translation
Date:   Tue, 26 Oct 2021 19:45:29 +0800
Message-Id: <cover.1635248253.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:

pick Alex's Reviewed-by tag.

v1:

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

