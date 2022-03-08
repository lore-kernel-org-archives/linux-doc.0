Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC3FC433FE
	for <linux-doc@archiver.kernel.org>; Tue,  8 Mar 2022 08:02:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344736AbiCHIDF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Mar 2022 03:03:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344738AbiCHIDD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 03:03:03 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4767E3E0F5
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 00:02:03 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id p8so16662271pfh.8
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 00:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3EIDBF5AS7jlwBeieaiQRuzNzeF0Ko9peyb2xt9gbkw=;
        b=SMvpNzqoZX/FbBjOANwIvimQ8FLtaPrXv0g5lNQidMjg0jzEnbED9Fi21y75v7EtAX
         TgEbKfAX7G3b6DmQlJWifx8WDnxeqlB8QGjpVsllMK9n+BvipSvBHHBnkzl94GfJ+r87
         pqysAeZo4XsMeI99Q0ItdMqYguolexr5HyXQzq0Ft0laD6Of+bQFtx0+dg+SiM0TuLDA
         q8pX4vSL4tn9JCIhYYP/F7z3pP6ar4ObMfcRXPqDsmovPJ5q+zTKa0jQyQasZSF64FRM
         Fo9lXiUzXCa8IENp/GGYyL3U1RuGv2KjNTlwJU9J78R2kmV8qWV79jyq84/SYSZkCg+2
         LtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3EIDBF5AS7jlwBeieaiQRuzNzeF0Ko9peyb2xt9gbkw=;
        b=OhSpqgkn/yiCQQE1IOV9DyBitA4qOHOh1MJYHTZsTJ49q/jQFP05bmVW309lEofn45
         g9uvPfH25ZeE+VNFdCd4KuN3Atf8lQVlZV6fFQrGNgeVWPx+NGS02alZTbcewN+74NxS
         ELVS2iPPjno3NZzMsobrW1Mz74IYgMf6Y4OfWN6h+8Q7bmHOZoEfORWo553O1keNvOyH
         OM02TMR3nYnjRYHHvnaKlW+dcJlYIlIe+CohFjCdNee2a6Ji0F6RZaTzclN3TtPTTttO
         UfNKF1IfpKSHfVB7UAHtSl04WRcJFBOzuvwVcf63vIg6LwAwMIBOa3TZi+R4tcrYKkBg
         CmYA==
X-Gm-Message-State: AOAM532Lfkt8ZnnGr1uTGYmxjn2F6iZAWDE3ty+ut1jETfEB9UbhHB7S
        0kZkysGVb/UjnLcWsfJpBlNJJQfEvAKa1PzD
X-Google-Smtp-Source: ABdhPJz8Q/IzxaGHof83HMotu5fpr/A+oHMXxYNpLIqHvosD4gAI76d5avyde+hFcTsyetLx3t2sag==
X-Received: by 2002:a63:89:0:b0:37c:54f9:25b6 with SMTP id 131-20020a630089000000b0037c54f925b6mr13334608pga.494.1646726522701;
        Tue, 08 Mar 2022 00:02:02 -0800 (PST)
Received: from localhost.localdomain (111-250-33-204.dynamic-ip.hinet.net. [111.250.33.204])
        by smtp.gmail.com with ESMTPSA id q8-20020a056a00088800b004bca31c8e56sm19282401pfj.115.2022.03.08.00.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 00:02:02 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v6 0/3] Add Chinese translations for KSM documents
Date:   Tue,  8 Mar 2022 16:03:21 +0800
Message-Id: <cover.1646723502.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v6:

    Build test in next-20220307.

v5:
    Add Yanteng's Signoff tag. [PATCH v5 2/3 and 3/3]

v4:
    Fix build error and build warning.

v3:
        Fix the patch '[1/3] Add Chinese translation for vm/ksm.rst'
        because its old version does not apply for the latest commit.

v2:

        According to the suggestions from Yanteng Si, Alex Shi and
        Jonathan Corbet, I have modified my patches. Here are my specific
        changelog:

        1. Remove Redundant Labels in added Documents like ``.. _ksm_sysfs:``

           Yanteng Si said: Too many tags will cause a compilation
           warning, because an identical one already exists for the Origin
           document. Jonathan Corbet think so.

        2. Align with standard Chinese format on the 'original', 'translator',
           etc.

        3. fix some translation error like “pages_unshared”, I remove  '独享'.

           Alex Shi suggest to remove '独享'.

        4. Refactor translations/zh_CN/admin-guide/mm/index.rst.

           Yanteng Si: Compile pass is only one of the basis for checking
           through, we also have to check the html for any problems, as
           far as I know, the above treatment is very ugly.

xu xin (3):
  Add Chinese translation for vm/ksm.rst
  zh_CN: Add translations for admin-guide/mm/ksm.rst
  zh_CN: Add translation for admin-guide/mm/index.rst

 .../translations/zh_CN/admin-guide/index.rst  |   2 +-
 .../zh_CN/admin-guide/mm/index.rst            |  49 ++++++
 .../translations/zh_CN/admin-guide/mm/ksm.rst | 148 ++++++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst |   1 +
 Documentation/translations/zh_CN/vm/ksm.rst   |  70 +++++++++
 5 files changed, 269 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/index.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
 create mode 100644 Documentation/translations/zh_CN/vm/ksm.rst

-- 
2.27.0

