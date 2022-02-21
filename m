Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2631AC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 21 Feb 2022 10:49:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355266AbiBUKtu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Feb 2022 05:49:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355381AbiBUKtU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Feb 2022 05:49:20 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B78806E8E2
        for <linux-doc@vger.kernel.org>; Mon, 21 Feb 2022 02:10:40 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id q1so3933954plx.4
        for <linux-doc@vger.kernel.org>; Mon, 21 Feb 2022 02:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=URfvc3exmIMrwqr3U8wS9LPL2nr2RKJhkMc27KR5T+o=;
        b=aVEnMK2RwP4w3UHlMr8PaOxgxpyLjxuvLY62XffADsCVb9ksaPL5kAQtdFBSO4rywh
         mJ8qbIWDHVqcQ+nzTkTE8muC7WwFbebwmUCQke4703FsjzBgjNQkFtcoWPg6jIPnRr3l
         X2v0QNl4kwt5Npu7O/sCdrFZUUNGh2aubzsZyQRqg/1/Tk1wte2y9KNz8IfNgAaUmOXx
         zEdT73XZrg1Zfg8sVbkV5ZUr4QtfCe5oMzZYDqFIJOFS8/vkGjlXzb+en8mkb1Unu9Q7
         189q0P73wo50DFASx/yKu5nlZ4/nYYdkTutIIma5dXaLmxFTeVnOglWOFdu2ZX1Xi/Ky
         AUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=URfvc3exmIMrwqr3U8wS9LPL2nr2RKJhkMc27KR5T+o=;
        b=F1jiCILik1D4r/+C4Uvyb26ZgVGAmpgkwEw03pth2iSkS3Frc2cuZ0w7z049mvO3nz
         JO5GagyBEUmRZBvCulXiDIz6nwXG9PLZOqRJu+sYvoXlWHTWKT31Ov8T023JHgPyMPGw
         R016sWHNiuzwr8XA0Xw6+VvAhzxiR2lYd/+dbvVQKYZJVSQ4XmlF7BbM7ju/L5po7M+F
         Gx1qaNeQESpkWJnTqeRlNPAWGt4REwKslWUkKBHhuXkBcoBDd6eqZILAblxKMMzrpBQ+
         acZfiee/406jyQPySdZT50nYGKbABQB+X+W6f7r/wiLEfU+/6YrvM97bKD2cY9q/xkQi
         iJEg==
X-Gm-Message-State: AOAM532ibbpoT+muBhdKFRfY91N4ZhoDfeU/LmhIVsS3A4TQhdLrGj5l
        xNdWWrtzX2M7nRUJ0y/qQ24=
X-Google-Smtp-Source: ABdhPJw6lG6pWxgKi1y/AU5pAvH/lVvebnuOg6NsBsAvM2z2djV/ATT19fEBIToSdeitOs1S6f9woA==
X-Received: by 2002:a17:902:c105:b0:14f:c977:f718 with SMTP id 5-20020a170902c10500b0014fc977f718mr1758633pli.48.1645438240125;
        Mon, 21 Feb 2022 02:10:40 -0800 (PST)
Received: from localhost.localdomain (pcd454219.netvigator.com. [203.218.244.219])
        by smtp.gmail.com with ESMTPSA id x2sm2472938pje.24.2022.02.21.02.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 02:10:39 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH v2 0/5] docs/zh_CN: add admin-guide damon translation
Date:   Mon, 21 Feb 2022 18:06:22 +0800
Message-Id: <cover.1645437621.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:
* Pick Alexs Reviewed-by tag. [PATCH 1-3/5]
* Fix a build warning.(introduce from usage.rst)

v1:
* Translate .../admin-guide/mm/damon/* into Chinese
* note my patch thread is based on
<https://lore.kernel.org/linux-doc/20220212080024.1684590-1-xu.xin16@zte.com.cn/T/#t>

Yanteng Si (5):
  docs/zh_CN: Refactoring the admin-guide directory index
  docs/zh_CN: add admin-guide damon index translation
  docs/zh_CN: add admin-guide damon start translation
  docs/zh_CN: add damon usage translation
  docs/zh_CN: add damon reclaim translation

 .../translations/zh_CN/admin-guide/index.rst  | 122 ++++----
 .../zh_CN/admin-guide/mm/damon/index.rst      |  28 ++
 .../zh_CN/admin-guide/mm/damon/reclaim.rst    | 232 ++++++++++++++
 .../zh_CN/admin-guide/mm/damon/start.rst      | 132 ++++++++
 .../zh_CN/admin-guide/mm/damon/usage.rst      | 286 ++++++++++++++++++
 .../zh_CN/admin-guide/mm/index.rst            |   2 +-
 6 files changed, 740 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst

-- 
2.27.0

