Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E86C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jan 2022 01:50:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbiA0Bub (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Jan 2022 20:50:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232321AbiA0Bu3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Jan 2022 20:50:29 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5568DC06161C
        for <linux-doc@vger.kernel.org>; Wed, 26 Jan 2022 17:50:29 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id b1-20020a17090a990100b001b14bd47532so1434227pjp.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Jan 2022 17:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OIJ/xs4WipJQlYsc9VklmPLRiPoDXi1htq5lfVOUS48=;
        b=EcAeuRcCAlR33pvU25vRJ2GKzgOmCUADKl+TDNxa8TMELeGihorwlJKCg2y0o4wREi
         h2R4vHPRVcS9kJu86B7xX/SDCnoSUShbV4L3yOH1YowEK8mr0M2ZYFhcW8KOHQQ4GHxO
         /q1Xl5fuEEGTTktSXps9mDdvpR//4VsRBYwjYriHJX66mJKviofWPZUZkoxW6UhYOgc1
         /pWvebzuI7LMYVG5dbgtaHpXnrmmcOGyP2QjP64dR/t90uyYk9S2lyQ48vdEJlnf656e
         vuBtbtYKEXCYyf1eaio1BvjMiQv8jfedjNsSzFRFx03a2BOn3L4nwYH0g+M+NeQ0Tiya
         MPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OIJ/xs4WipJQlYsc9VklmPLRiPoDXi1htq5lfVOUS48=;
        b=2tVjeHaUfIpRJMYvCyUd3gL2ok+/rPIxdg52rBDhYTSUtdap2MJOO1i0Mo7aKPIK+m
         ZW0QqUYX+TQKMMX3fRQEDMtZpYFf4R3M6ZcnB6xz68KVYUu1EJZMjFldjV7G0m0369rL
         lYBmA0FsC5wS3HaDWLJYsPFpzpYN96u/tNrda4HLPycVl4dz+BHYdUT0FDZOgAXyMaPH
         4jaCcNuPN9JHcd0R/25NyAsGOmVu2RUYYs00o9+fy7tyxbVkjDBdOVgAXWgDsmmYur5N
         tPLehKKZSokavDApBAhyaHCsgdHXNnm/9Sn6fUzy28O2fIv+o/Urp2kbOrY6KN846Y/S
         9Ttw==
X-Gm-Message-State: AOAM531QSjJsU6bV+QSILO3oDw90FsZPnR7DtWqxNdqXMlUppcvTjWYM
        tDL1l8FhSOM/hb4z5umO4b3WLBd/LteaSQ==
X-Google-Smtp-Source: ABdhPJwb1YNCu1FynSkOJS2BgdL7sQOCHkMglgc+h1CIt47XIfTR9CEBgp4LSY10oIdeitzlq0n/8g==
X-Received: by 2002:a17:90a:6c02:: with SMTP id x2mr11583000pjj.0.1643248228747;
        Wed, 26 Jan 2022 17:50:28 -0800 (PST)
Received: from localhost.localdomain (cm218-252-25-221.hkcable.com.hk. [218.252.25.221])
        by smtp.gmail.com with ESMTPSA id a14sm3594562pfv.212.2022.01.26.17.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 17:50:28 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 0/2] docs/zh_CN: add free_page_reporting and highmem translation
Date:   Thu, 27 Jan 2022 09:47:52 +0800
Message-Id: <cover.1643246827.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../vm/free_page_reporting.rst .../vm/highmem.rst into Chinese.

Yanteng Si (2):
  docs/zh_CN: add free_page_reporting translation
  docs/zh_CN: add highmem translation

 .../zh_CN/vm/free_page_reporting.rst          |  38 ++++++
 .../translations/zh_CN/vm/highmem.rst         | 128 ++++++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst |   7 +-
 3 files changed, 170 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/vm/free_page_reporting.rst
 create mode 100644 Documentation/translations/zh_CN/vm/highmem.rst

-- 
2.27.0

