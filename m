Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DAC3C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 08:00:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2FA161361
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 08:00:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbhINIB5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Sep 2021 04:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbhINIB5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Sep 2021 04:01:57 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDDEC061574
        for <linux-doc@vger.kernel.org>; Tue, 14 Sep 2021 01:00:40 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so1491820pjc.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Sep 2021 01:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LhrAvImAqgLfrBfkx3Rx1St8YkK5frHNL1i1qbv328U=;
        b=iIlAdagG1OwmEBpeZBSkh9eRrl2Fd1oekuYCSF7K2wwttJOAbfeKOfkSDbdALp0eHu
         ejYsLz7VpiH8CxcFDfQNgZmrKNVYdEtAe3SZ3QO9IKPhCfv9x4h1ZUvaE/A0vQULblw/
         aw5SdakUyGjpQcW4l1ioZogS0/eq0wSfW70HWTLAiK9zmSgm+FWPK/sxWEe7FvlCJcST
         tvBGas/jxIiZZPnkdzdWXNIno6GWVNm/zg7pSgXFJM/Plm9cNDDbKtVeV4Brc1tDWmFc
         QDVhFcsHJTLwxPxOkocuwbHKyAhwbaL06SzzR/gPa+zwS8pWJgQiLBgjLFkqqRPILtiC
         +XXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LhrAvImAqgLfrBfkx3Rx1St8YkK5frHNL1i1qbv328U=;
        b=Ph0uk/dH2WixEEbSQ7yuzhmXeFQHM8IdeKUXW+hKjI0xsBHsj+nJKCgaZEo1Vi01co
         OgeJ3weZ3O3gVx3zqlkK3buUdEpJaq/uYUVKmFzcZtsekugDmVPSb9usjcq3llYGchZd
         eDSxYjuXblbEU2i71pPSPq/dRepGEP8yO2TQ7jQ8kU/XpKYpiEDyeefo01zAIVIC+uqB
         nsnS8UjFF9Oh5Aov/irmBC+Chvx4WLpzFgY1+2o013DgF3Gvy8GimassC/MyrQ8Um1gp
         tIdv3M4W444tv6hhH/k5nLMt2rjBCtbKJ08oP/Xx6eSWOCFhPAsPoqRWSEh2viKUzt69
         UYkw==
X-Gm-Message-State: AOAM531NSNd/bWjcJOJR9NGS/hnGPyFXwZ5bsSt8VRG0B7FQTFD4bWv1
        UmJfoHPbWsdEmHLIoycVDRLg3eSLTeul8A1+T5c=
X-Google-Smtp-Source: ABdhPJw8V0xULnDMUdA4BeaqFBcQBSG9wxeBeWxqmd4EPneC6/IL2/VVRQCOpAuumobN47MSWfx9Ew==
X-Received: by 2002:a17:902:7c83:b0:13b:721d:f786 with SMTP id y3-20020a1709027c8300b0013b721df786mr14131443pll.70.1631606440266;
        Tue, 14 Sep 2021 01:00:40 -0700 (PDT)
Received: from localhost.localdomain ([8.47.69.162])
        by smtp.gmail.com with ESMTPSA id w11sm10226721pgf.5.2021.09.14.01.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 01:00:39 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 0/3] docs/zh_CN: improve process translation
Date:   Tue, 14 Sep 2021 15:59:46 +0800
Message-Id: <cover.1631605791.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

* Modify some content that may mislead the reader, we should describe the patch in English.
* improve howto.rst and 5.Posting.rst.
* typo fix.

Yanteng Si (3):
  docs/zh_CN: Improve zh_CN/process/howto.rst
  docs/zh_CN: typo fix and improve translation
  docs/zh_CN: modify some words

 Documentation/translations/zh_CN/process/5.Posting.rst | 10 +++++-----
 Documentation/translations/zh_CN/process/howto.rst     | 10 +++++-----
 .../translations/zh_CN/process/submitting-patches.rst  |  4 ++--
 3 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.27.0

