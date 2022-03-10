Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFE2C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 10 Mar 2022 15:19:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbiCJPUd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Mar 2022 10:20:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232250AbiCJPUb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Mar 2022 10:20:31 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE5949F2A
        for <linux-doc@vger.kernel.org>; Thu, 10 Mar 2022 07:19:30 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id 27so4968566pgk.10
        for <linux-doc@vger.kernel.org>; Thu, 10 Mar 2022 07:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E7evVLkDJtJUOaop6w1L/EOhPN1fYcYEBNFr1yixh14=;
        b=hmTP73mght2e2jMDbKYQFXjborvvpD19s2BtkediK6Zz1aFlEo/aLVyOh1KidTUnU3
         B1Csx4U3lUTwKfh7IuqIWUkhsnhlTFI/iWtjAecbzI1RJOMoQt/FLG9CL7YUcwo81feK
         QWMmPwwrar7cVBFlC/vmEGhy6AxaGAIZS6Ys4DnJTOmfesE7wqr3bNG7RedF29oNW5DX
         W6SA3q7i4thn29YzBknC7dhJ5g4OskFYs7dnDtociBM7wd8oa0MeGcaOhrpdq/9IQkcy
         oYHQ/YntudxNyE2/OBJYqC9keWpRSWt1ZYnlnVtkfruOgEbIAtLHgzuWTbUwao35I+fj
         1c5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E7evVLkDJtJUOaop6w1L/EOhPN1fYcYEBNFr1yixh14=;
        b=1G4tMau5MB0Stpegfmp1mnEktqTosa3mhd8gq8b4vDh2L5+IkcVUJEWqEyReVa5JOL
         g6Xa22zFeFJjA8HHmTBM9Zg5feJtvXO178vxVLprOpbPp0lj+cMMBU9/orY2N6WDQHnx
         +M++qzwW4YaNbFs5Cwk5QC5tAt3szYbJSBKbThyS2dazxYWPr9MERd+DMRFumrRno04p
         Yp0yy8HKCLSTd/vpeL9PxOakIKcL3jwH79lc92AwSrAT+CfyXztP7bgtFy/7Qa++vFoE
         WqyNeJYTrykWodcGlu8H4+YGI71s7tv6O72TeJS89BWC37ac84DhLbp+nWVp8dw1DUQE
         8Jjw==
X-Gm-Message-State: AOAM530XakuoeaEefFbnzZmku9wPoAbVyjoXmh7XteJOrdlBUKppTXba
        x4o3ayGQVGTvmwLcRsKqij8=
X-Google-Smtp-Source: ABdhPJwMSFak2IviTDWZRG2IlTBnDKXDjCALY9UypQ6uNZI86qrpCesTeMLLcsl3HIdwcX9t/VtgMA==
X-Received: by 2002:a63:1620:0:b0:375:948e:65bf with SMTP id w32-20020a631620000000b00375948e65bfmr4571859pgl.49.1646925569880;
        Thu, 10 Mar 2022 07:19:29 -0800 (PST)
Received: from localhost.localdomain ([50.7.60.25])
        by smtp.gmail.com with ESMTPSA id q11-20020a056a00084b00b004f73e6c26b8sm7474424pfk.25.2022.03.10.07.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 07:19:29 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v6 0/5] docs/zh_CN: add admin-guide damon translation
Date:   Thu, 10 Mar 2022 23:20:47 +0800
Message-Id: <cover.1646899089.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


v6:
* Modify "Enable" to "enable" under Alex's advice.
* My patch thread is based on
<https://lore.kernel.org/linux-doc/cover.1646899056.git.siyanteng@loongson.cn/T/#t>

v5:
* Modify some words under Alex's advice.

v4:
* Build test in next-20220307.

v3:
* Build test in next-20220304.

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

