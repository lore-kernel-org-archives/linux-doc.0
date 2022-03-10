Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15018C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 10 Mar 2022 15:13:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244720AbiCJPOV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Mar 2022 10:14:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345075AbiCJPMu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Mar 2022 10:12:50 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5B1E02DB
        for <linux-doc@vger.kernel.org>; Thu, 10 Mar 2022 07:08:52 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id mv5-20020a17090b198500b001bf2a039831so8452171pjb.5
        for <linux-doc@vger.kernel.org>; Thu, 10 Mar 2022 07:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/f2yCdhwtpkuXsGl5O0pIwGo6islFWfJ8N/pwmqSY6c=;
        b=olVxeiMpFbihIl3xL32zIE/3DBtqUAwYdaxfKLewenVxkQABHqFm5Ub4/LWiozW8rB
         Ly0BmZraM7e4Yp8J3NFd2KPMbI/IKT6HKwtm/svHJKZWn3B4xXfAjA5tfulE70AFO1ya
         a1xfGcw4yhnrDOQJR2AONEkO98Eb62t/kmOP7+83HdKNSOF+y21G0PZldEE7cy/+ytdj
         jLaU/t9nTC5jJQrMNdhJp1pPIMJZGgt63HXVi8r6qK622WBM28UOnVqIN/DDJxrh6qnC
         qWMrDi/sHGT1k8soHRBwHSjmR2Uwik0BdMWb2gKvriu2N09PIAz0iXf6bFgkhV4AlhpF
         awdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/f2yCdhwtpkuXsGl5O0pIwGo6islFWfJ8N/pwmqSY6c=;
        b=Tf8NQRnaJcuf7eJmlzIbzdt0L/65yYS0H57xiW2CITjOF4M59Sv258/mbHdj7XtOCY
         mUkHDaT/wVmBqV/b/kKejdpDYbLaXLzSmYVAMM+yySCjE4k6d8sOcNykeuEg2WTmpUnr
         t6LiHfQw06khcsMMJu1U1tfp76p92CWtRu5JSOeBHEn8zkq6EcQuYHEgGGLpPjXmx6LA
         b4BeaSvZ5lgzPREtioZ8Erpz83GdwhRUBCdyibfUJQpmwTS2bcYtY9AOkT+6TRVp7gNh
         KQdzksybBlRrAQtDI1CcFAalbBQ/GvZ0zBbL6nFR/rI+7wg6b5OEGbd1owr+LUUnqt9p
         BPzg==
X-Gm-Message-State: AOAM533At83KyjiwlQNyFw9djE57tUpIBlfvgp8HgJw4FaUTU3ihVrWi
        t9LJK7cjF43G9Rvzcl6LJQw=
X-Google-Smtp-Source: ABdhPJwHOBMeBTI+g8JIcToukoinTQ9XVzTMxMrscxj0lScnMXYTEyX2D6HANykMvjheEWPdw1uw1A==
X-Received: by 2002:a17:90b:4c86:b0:1c2:5a5c:9149 with SMTP id my6-20020a17090b4c8600b001c25a5c9149mr1554699pjb.241.1646924931574;
        Thu, 10 Mar 2022 07:08:51 -0800 (PST)
Received: from localhost.localdomain ([50.7.60.25])
        by smtp.gmail.com with ESMTPSA id p16-20020a056a000b5000b004f756b6c315sm7149869pfo.66.2022.03.10.07.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 07:08:50 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v7 0/3] Add Chinese translations for KSM documents
Date:   Thu, 10 Mar 2022 23:10:10 +0800
Message-Id: <cover.1646899056.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v7:
    Add Yanteng's Signoff tag. [PATCH v7 1/3]

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

