Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C106CC433F5
	for <linux-doc@archiver.kernel.org>; Tue,  8 Mar 2022 08:11:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344819AbiCHIL4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Mar 2022 03:11:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344901AbiCHILn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 03:11:43 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54823EF29
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 00:10:41 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id z11so16362827pla.7
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 00:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JyJnw5KmzjztIYRh9AYntg6yEfzpdS/pcpt5AbZll/0=;
        b=Xc/hjwcHFtkguQTei0MTIwRh0lYC4R+n6SETGC8h+m7dwG9d7Dv15tuW2uzrXyrVtJ
         1ABrGICeTl0JKwoX94PXRKNg9iGT2WQyna+ef65IAgtfOcjL9UXdGktXAgnZJxAnHkAe
         kaTkeZTPFBUi6z18nQLyQu5WVI/dFkfr3uhD5pdPFV81hrRiEmQXZx6UEUx0mrXUBEvU
         zS27W3nTPyAJE3bZhXrUKEzJLjmPj4n/Q0U7yD4HUWKgKvVu5GU0QlXs2BfQ8m6JLi+o
         kJ892KHcSUalarff6vq+lJ+I+xR3ke4vjqrl5q6FWcUw9CeWmMAYUEztfZESZDhMoTXY
         4fFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JyJnw5KmzjztIYRh9AYntg6yEfzpdS/pcpt5AbZll/0=;
        b=0PSvhQI5LkQUsflxzJ4DvD8UdKCXMCUn5tbX9BzGZP40ugcqbZUIxdcvF2VxwNN5Wv
         uKR3PJhMemR9l3PCF/Ljbc3sYwvPMFz7tPEbuxAoj7WXYFwIql502hQjICTfPzs42d9e
         mphOvyI84q/UKjIDD9iTVKjMdjdM8HKhLVojl+2X4O9kN2ffvsfb4+zuc3Eqv2nXimam
         wmUpHnXvh9xTTbgJIWtQYk3VEYSqQjnd0yaMNn1Nk0/DZDZJ58XGe5Ez7A5shCoJQC0/
         20SB8G8BylHwCS+i7WranhumCXFZDfUsvEETwmp8+U4yEszLilzRfJpFEh5eGMuh7pjx
         Fp1w==
X-Gm-Message-State: AOAM532QbepO58Re6lHfkh4Hy93dJTFpvF4JLHtd1b7cPlpkvUFnwdte
        qoctmAUKI5o16MG4R+1BWAE=
X-Google-Smtp-Source: ABdhPJwkbE1KKqp6oYs9wHCDekfmVG9p3yMWpXz3CHHk6wYDTJ8LnaejBzWJBIPTjU4FypK1imVyVg==
X-Received: by 2002:a17:90a:2d6:b0:1b8:cd70:697d with SMTP id d22-20020a17090a02d600b001b8cd70697dmr3465649pjd.78.1646727041259;
        Tue, 08 Mar 2022 00:10:41 -0800 (PST)
Received: from localhost.localdomain ([50.7.60.25])
        by smtp.gmail.com with ESMTPSA id d14-20020a056a0024ce00b004f7281cda21sm2165282pfv.167.2022.03.08.00.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 00:10:40 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v4 0/5] docs/zh_CN: add admin-guide damon translation
Date:   Tue,  8 Mar 2022 16:11:58 +0800
Message-Id: <cover.1646723249.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v4:
* Build test in next-20220307.
* My patch thread is based on
<https://lore.kernel.org/linux-doc/cover.1646723502.git.siyanteng@loongson.cn/T/#t>

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

