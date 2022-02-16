Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA85C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 16 Feb 2022 09:38:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232098AbiBPJiK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Feb 2022 04:38:10 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:58770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiBPJiK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Feb 2022 04:38:10 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C4C65CD
        for <linux-doc@vger.kernel.org>; Wed, 16 Feb 2022 01:37:58 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id k60-20020a17090a4cc200b001b932781f3eso3941189pjh.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Feb 2022 01:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FG4wPhNBVOj7jfUcH2cC2CLQ827xbxyYmRCowSShVVw=;
        b=AZn/FquRAA4cf3Ah0MPIRk2gNAvZCNixygtrOagztwvMCiw+//u9AX3BlyGHhQ4wJa
         EX+mYXrWwG+Ic4RE/rbhue9xfsufiF8s8w5tH0THcWH+gB5M6FZt+S8qhesAtxBisnpu
         KllrOa3LxzOIb2WAq5Q7X2+8EqpJu4WCnj5jHEJX83WjmaCaMuo2u+LrzgwRmTq77KJa
         OzHkerIO7hdu3lYk18m+0bN6Yz6ZfdU/Nq1uxCQO6b89fa4eNOo2T1CA3D+Nayh7LVRs
         qxqEBV9onrEnLhO52hhnsGTTVivvlYSoXfAl3hxg+dxr4blFWvikZPc5kaBiYspD2cUS
         k36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FG4wPhNBVOj7jfUcH2cC2CLQ827xbxyYmRCowSShVVw=;
        b=7SvoTZxU5++T0hhiXcwrVWmzQ9gYPNkf414Juj5LVEcyVIOmpOiyuScs5WDetBzldY
         AwUODY7SxOgYzj7tAAThRVzPAcMhY5jsObxkWlOx7Uc5ioJyIwm9v+46AUB90z33Zb/7
         GfUMmlxXOyhnf13GmAAJ1M2toLOjWyXiKfUxs2D48RuRDFMcOIry1OcIG2zztujLEq1X
         gZDwEZz+aJLQfTbTsKa7bet1ZC+4/8yS1+NFI0ZHab4cDrAIDKcQtaaP+EQle+WnWMy9
         K7HMSC1KwJ/0rUIKTVHXw37JPRaVLxEhG9R/OoHoMs7bCjTfgUOtMX/iMdR8z14DpoVN
         hzsA==
X-Gm-Message-State: AOAM530Mauer9G4ln24x0+t6FRZmDN3pyP8I6EjmzByXRvkS+VsJC+hc
        EE51roJtLIG+mQh6lIychJfe/FztnfKTn0ei
X-Google-Smtp-Source: ABdhPJwq1pDPt+jMSwy42g7Z2FEbHuyrUKb5pJvFmw8LrfdqvHQa6nTdj5/qDtO4DoTgRthQzYrGAg==
X-Received: by 2002:a17:90b:3e81:b0:1b8:6090:6701 with SMTP id rj1-20020a17090b3e8100b001b860906701mr749395pjb.6.1645004278365;
        Wed, 16 Feb 2022 01:37:58 -0800 (PST)
Received: from localhost.localdomain ([211.109.233.153])
        by smtp.gmail.com with ESMTPSA id 11sm19251289pja.36.2022.02.16.01.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 01:37:58 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 0/5] docs/zh_CN: add admin-guide damon translation
Date:   Wed, 16 Feb 2022 17:34:41 +0800
Message-Id: <cover.1645003763.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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

