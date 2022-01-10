Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2F0C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 10 Jan 2022 02:44:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238223AbiAJCoC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 9 Jan 2022 21:44:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238212AbiAJCoB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 Jan 2022 21:44:01 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A00C06173F
        for <linux-doc@vger.kernel.org>; Sun,  9 Jan 2022 18:44:01 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id y9so9943970pgr.11
        for <linux-doc@vger.kernel.org>; Sun, 09 Jan 2022 18:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5X/k/RZTSvlZ14/Fk9aQZahx8WzDWAdLoA7Vl36WnpI=;
        b=LTNKuP+2yjyJRPMoRD+o71i2cQwLgZu6omSYKtRtaxqLRR3L2fJ04StPWjtrjLVbmB
         4MxFYPhPov25EsU6XLwth41/vtP8akmIjqR/IXSliXK+8galAA2kpiC6FcR3o87lAQiR
         nZOIIJGxzbhft14Z7i5LLGkP0wut3/0TPhg6taAGVFJuiKCa+E5yDbQn9duQnbGiZnqY
         +OC6kmdEJ/f4/j013QS7BnDtTHQkPoSrSzg2yQ5cIsJwo9AXgX7Se0Ja5SV20X/+cBSp
         K7aj0PrOFBpb/W/9Z6aTC6wb2KQ34VH8YwIHZf73EaNt1kssz1anX1+X2f19MzZJdIHl
         e1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5X/k/RZTSvlZ14/Fk9aQZahx8WzDWAdLoA7Vl36WnpI=;
        b=Xiip0MCx9vkQDDRu/WQMmj+40oc1OorE7FgSSGiGvfn/aGDifURGA4WDavJw7fnG2t
         /KpzKHNhqFSZjShq1qLhYRPqvD6jh2ryWaCPu2RVdtmErhd2PAeaftzjVoEqo4HvhSur
         aTpOAcZgqCCa/fxHdy0UMKUVFDWyMYycbeacz0MQEbNNdpHiINLRZBEEtXXtmTQvyQHH
         h8NWm43NoECQnwzMgRRpX4SuBHXkdxHzFAcDLG2K1ue3/3c01e34YPFrimAh+XAtHUTy
         jjTRHUUYuAIP8635NuMbj7+3CFv8Jozvh8m/b3tsiCUE5WezvcwQQ6e9sQOS2snVSN3X
         Tf7w==
X-Gm-Message-State: AOAM531LttIcSL3dcd4JPSW3SfkB0iD/b1dy7ic4tzqrSY8B4huoPk1H
        FvgSs4jMjWPgIbliALZk0b0=
X-Google-Smtp-Source: ABdhPJysVeFZbG6bP+ctwNwqCzfP/+cEN5DJQxOK+QnLGFhG7KdSSNHRp8tq+fmlnJmNbp0AgPHoBw==
X-Received: by 2002:a63:7946:: with SMTP id u67mr783768pgc.83.1641782640620;
        Sun, 09 Jan 2022 18:44:00 -0800 (PST)
Received: from localhost.localdomain (pcd454193.netvigator.com. [203.218.244.193])
        by smtp.gmail.com with ESMTPSA id u5sm4711511pfk.67.2022.01.09.18.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 18:44:00 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH v2 0/3] docs/zh_CN: add active_mm and balance translation
Date:   Mon, 10 Jan 2022 10:40:50 +0800
Message-Id: <cover.1641782124.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:
* Modified some words under Yizhou advices.

v1:
* add vm into zh_CN/index.
* Translate active_mm and balance into Chinese.

Yanteng Si (3):
  docs/zh_CN: add vm/index translation
  docs_zh_CN: add active_mm translation
  docs/zh_CN: add balance translation

 Documentation/translations/zh_CN/index.rst    |  2 +-
 .../translations/zh_CN/vm/active_mm.rst       | 85 +++++++++++++++++++
 .../translations/zh_CN/vm/balance.rst         | 81 ++++++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst | 52 ++++++++++++
 4 files changed, 219 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/active_mm.rst
 create mode 100644 Documentation/translations/zh_CN/vm/balance.rst
 create mode 100644 Documentation/translations/zh_CN/vm/index.rst

-- 
2.27.0

