Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520A3C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 17 Jan 2022 04:35:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234217AbiAQEfC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 16 Jan 2022 23:35:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiAQEfC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 Jan 2022 23:35:02 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 473EDC061574
        for <linux-doc@vger.kernel.org>; Sun, 16 Jan 2022 20:35:02 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id a1-20020a17090a688100b001b3fd52338eso19819752pjd.1
        for <linux-doc@vger.kernel.org>; Sun, 16 Jan 2022 20:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GW6Cr2EDnoiYE6Z38XaMDMd0d2DMS0he+uNelARpcj4=;
        b=PkQH+/FdeLpR+qUGPhZsv1lzQOSdE/ko2kod8sxSZZFR7TN32XPUeEPaXVOdIPNr/8
         oDfC7lBKiwbdXBXlt6AV6qb0A0NfUl0OOXt+KqY8kzE9dK2ESmjy8JGHK05N5GAb9tzz
         3dW4VKWPIvI0gIz1fLVmxZsp75CSX/ssS+M+CH4gmpUuoPMGbACz9CPr0fl+iLCxCuR5
         DpA34Wmty2MmmZ9BMwT/0LSfmdeBnhuMunhvUg40Y0ZY/LKfwl3sySV5GjibBOuZxheM
         wnWtcUWoaO8/GIg6YBMmm8unggtecOf2sJGiBUGVZH8ldNkmaPpZ00NDXyEqeZpeGYbR
         U4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GW6Cr2EDnoiYE6Z38XaMDMd0d2DMS0he+uNelARpcj4=;
        b=cNKAd1RXfk07i9as7t9New9FgbyxzakhkdupTI+5C8ZRm1JVYVgF11h8kY6St9yCBS
         SRFHGnel/8AF7J7+dCdQ7Urc1q6LrWo7QvnFImLdFoRSrEKguRSu3n6wwfnv1Qhi0/Sq
         YPnptjQw8SAzBBSQ8FtQ2zgRiWGXg3l8JroCpDUnCmHYI6TBkkAMqtX01asc8E4tU9Rk
         vOJ6I12hLOIcv7+05MHPPBHZf8gbYFP9Tbj3rEYK/MwkemRZJZxsDOjoPkmvgBy5ghAD
         +3gfsdWbQPm7jl0RXgWRJ3I8KcaMmSGYLML3d2zrCOlUNML+9laymuAf/DSK+B6W8Igf
         X+3A==
X-Gm-Message-State: AOAM531CdPDRZcR9W62eFd3nV9b62rT9yNNzjALHnu/KlxaKP1w0SHjV
        F29d7me5xQsoRoEbhFMeZSw=
X-Google-Smtp-Source: ABdhPJxh0De5KE0747bUsFB30nGfCR5eN+DyyZ0j/LdkVDKBC8jlZXW5Nn418t99DaNqRU8f0BdbVg==
X-Received: by 2002:a17:90a:5996:: with SMTP id l22mr4696105pji.27.1642394101834;
        Sun, 16 Jan 2022 20:35:01 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id om7sm11623830pjb.47.2022.01.16.20.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jan 2022 20:35:01 -0800 (PST)
From:   cgel.zte@gmail.com
X-Google-Original-From: xu.xin16@zte.com.cn
To:     sterlingteng@gmail.com, seakeel@gmail.com, corbet@lwn.net
Cc:     siyanteng01@gmail.com, linux-doc@vger.kernel.org,
        xu.xin16@zte.com.cn, cgel.zte@gmail.com
Subject: [PATCH v2 0/3] Add Chinese translations for KSM documents
Date:   Mon, 17 Jan 2022 04:34:55 +0000
Message-Id: <20220117043455.861550-1-xu.xin16@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: xu xin <xu.xin16@zte.com.cn>

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

I have rebased this patch series on top of Yanteng Si's series on his
commit:
https://lore.kernel.org/linux-doc/60c579b34792c4c76194c4843a695263a982b37d.1641866889.git.siyanteng@loongson.cn/

xu xin (3):
  Add Chinese translation for vm/ksm.rst
  Add Chinese translations for admin-guide/mm/ksm.rst
  Add admin-guide/mm/index.rst

 .../translations/zh_CN/admin-guide/index.rst       |   2 +-
 .../translations/zh_CN/admin-guide/mm/index.rst    |  49 +++++++
 .../translations/zh_CN/admin-guide/mm/ksm.rst      | 148
+++++++++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst      |   1 +
 Documentation/translations/zh_CN/vm/ksm.rst        |  70 ++++++++++
 5 files changed, 269 insertions(+), 1 deletion(-)
 create mode 100644
Documentation/translations/zh_CN/admin-guide/mm/index.rst
 create mode 100644
Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
 create mode 100644 Documentation/translations/zh_CN/vm/ksm.rst
-- 
2.15.2

