Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C32C4332F
	for <linux-doc@archiver.kernel.org>; Thu, 25 Nov 2021 13:02:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354878AbhKYNFx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Nov 2021 08:05:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354970AbhKYNDw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Nov 2021 08:03:52 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCE0C0613E0
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 04:55:17 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id o14so4501830plg.5
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 04:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tqhq0XPoH4NlQLNNd95bUv2GHlZhsdgICT1mWV9mxKE=;
        b=WLSpHvIbGo24CfAVG9GxtW+qgeQPyzePUWSQpKW4iiXdYAVTy5xt6AMEB3oWo0wwBr
         CsGYsnIDL1Vl7KG/mXdA9eis7/2g6Kw6zD60xBH++n8lTMFl/AhLGQfJdI4TZxKly/6h
         Vy0KptyWHzXdwSXak6teJNVADSq1dst/IkzubYW+zrG97PMj6icJSnQ/Vxd7WrpRdB19
         0IhHo81y3wQDlzjc4q3CswYxq9ADqnPu35b+ygCBZCAh8YB82bnVz4CS8fGfRKCx1EYX
         WGD2Cd59Mkb3jTqYQg/vkdjzfazFOfh/OmFFhgrQ/RYHqBHaolTLrBrTQ20/GocCWwrR
         murg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tqhq0XPoH4NlQLNNd95bUv2GHlZhsdgICT1mWV9mxKE=;
        b=K2dOzyl2cg2z5+sRtBesMs1B0ODgjJQOzZb2326dtXWF62r0rhEH+qsaeLNan3253F
         GXtLvZ/rVqcVeETM5DBTOv1Ow4rVmFxtteUxacRuMDlt5FloGq2zKU6fkydZ0vzjswC2
         PEdVNU46ohfu+ufPFFIYYx9rHXYFIotNDPiMfgAwMPTqakP4s5mg3dbPGCznliegQwjK
         UFetcWvO+coDY4sfmkhSV6/E4nO6uJ2+nZn1zyvS5hjc4dTwgC59gWYpoiZTt2M7Dm7V
         Wp8tz2hhF/NefDMzruMO2n3trn9Bajn4mep5g8NdAzTWsldnEjKWEpIar+ahQ2OCZRrz
         LPhw==
X-Gm-Message-State: AOAM530NQvX1nzUWHbnQ3socCuiTD5yNcHbv811lMiDaPJgk+dwZOV4G
        +qBr/3sDyMdCLs3Ag3Z8oljmx+cv7Lthzg==
X-Google-Smtp-Source: ABdhPJzOEsc17xIonqu82Wt1yIsWGb+J6XIyv13+/33v/ASBegHp4KYeEftzsViVmSnbiS7HIYSCEw==
X-Received: by 2002:a17:903:408c:b0:142:45a9:672c with SMTP id z12-20020a170903408c00b0014245a9672cmr29348030plc.7.1637844917378;
        Thu, 25 Nov 2021 04:55:17 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.90])
        by smtp.gmail.com with ESMTPSA id d7sm3694923pfj.91.2021.11.25.04.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 04:55:16 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com
Subject: [PATCH 0/3] docs/zh_CN: add scheduler arch and bwc translation
Date:   Thu, 25 Nov 2021 20:54:02 +0800
Message-Id: <cover.1637843107.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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
 .../zh_CN/scheduler/sched-arch.rst            |  78 +++++++
 .../zh_CN/scheduler/sched-bwc.rst             | 206 ++++++++++++++++++
 4 files changed, 288 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/scheduler/sched-arch.rst
 create mode 100644 Documentation/translations/zh_CN/scheduler/sched-bwc.rst

-- 
2.27.0

