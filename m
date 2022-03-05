Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F61C433EF
	for <linux-doc@archiver.kernel.org>; Sat,  5 Mar 2022 16:24:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiCEQZe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Mar 2022 11:25:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbiCEQZe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Mar 2022 11:25:34 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC0651D63A0
        for <linux-doc@vger.kernel.org>; Sat,  5 Mar 2022 08:24:43 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id z15so10167639pfe.7
        for <linux-doc@vger.kernel.org>; Sat, 05 Mar 2022 08:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mfaXEtlTmD3jc5Nw9oIBtuP/9IPaiopchpQTP1Tr9b4=;
        b=XPrpwLOwDls4T1o0JBKMNkkR704ywlnSEQKElPP75jE5/jyWaE5xymXhvGbijOFk/K
         fTlgUc2/WqMNPI5xJxqtGT5+3uX5OC8dQ1nS8htiSWclpdK77d8uwjhqMUOEpsIDaUcf
         buEu7t2BobsKrjnQdH9KRMysynWHIaTBvpjBxTJFJUdDKI9zWytmX8qJ7DWTLGL4haL1
         yO5AYGfBHtPF69MuOXST93+hraqab9eDNvhpPMK89usSWQdGYVT32a4dHXDq0oJz7Zb9
         t1E1XVekKGN1Z+RfDzHZRcyu/6PT358I5DtilSG3BAhZW3kuezybWmjJkoeLRB6RTK/z
         0kdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mfaXEtlTmD3jc5Nw9oIBtuP/9IPaiopchpQTP1Tr9b4=;
        b=cr/uxpxszTLKsPP5Hasl761mKnt4u48dS65LrGjHwggUK77g1CqI4o2UMSDr4I7+vg
         pTg6xkJXndpLs2ZJd5A5PLuMLlL8RBNxCP2jueFGnmS8lLMWJLIni0T2xW2C2gdYXyEE
         1St6WwQXbaT5alKLcCprPfVQMInd0Dz7NyRfjiM+i/EjAT9e8DG1vvBFdGi6Jr/GHSmS
         UYW8OitNJxxoe+758mo22uIxCBUuMUR6CzHx7NPlkYguNHM0zdcfWFp68brgtxtKR18e
         nW1IYUUnooS/KNi3TQyWlrg7FbQgRtXghMAjem43Chx/d4uJy0JyPR6a+NJiAvgSLZjH
         HCsQ==
X-Gm-Message-State: AOAM532C5r3rJw8Z9SnEn7BCLIRFgAdQjQhhjR8q4kq7tuvRmzjJFUSN
        YLvdiYkpAGZKzYhVYI/xcXGJnY86FUHCtvt+
X-Google-Smtp-Source: ABdhPJzXznVceQlyxbYQrk4G4uwEDMq1423F5szOaxxv2iAj9dzSmAvyUaqmJklDCK9SxHYQf7/X0w==
X-Received: by 2002:a05:6a00:2481:b0:4f6:b71f:3330 with SMTP id c1-20020a056a00248100b004f6b71f3330mr4401375pfv.47.1646497483149;
        Sat, 05 Mar 2022 08:24:43 -0800 (PST)
Received: from localhost.localdomain (42-200-190-71.static.imsbiz.com. [42.200.190.71])
        by smtp.gmail.com with ESMTPSA id x7-20020a17090a1f8700b001bf1db72189sm6106269pja.23.2022.03.05.08.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 08:24:42 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 00/12] docs/zh_CN: add a little vm translation
Date:   Sun,  6 Mar 2022 00:26:00 +0800
Message-Id: <cover.1646496448.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v1:
* Translate a little .../vm/*.rst into Chinese.

* It is expected that all vm documentation will be
 translated in a short time, sorry for the huge review
 pressure on maintainer. I look like a troublemaker. >_<

Yanteng Si (12):
  docs/zh_CN: add vm frontswap translation
  docs/zh_CN: add vm hwpoison translation
  docs/zh_CN: add vm memory-model translation
  docs/zh_CN: add vm mmu_notifier translation
  docs/zh_CN: add vm overcommit-accounting translation
  docs/zh_CN: add vm page_frags translation
  docs/zh_CN: add vm page_owner translation
  docs/zh_CN: add vm page_table_check translation
  docs/zh_CN: add vm remap_file_pages translation
  docs/zh_CN: add vm split_page_table_lock translation
  docs/zh_CN: add vm z3fold translation
  docs/zh_CN: add vm zsmalloc translation

 .../translations/zh_CN/vm/frontswap.rst       | 196 ++++++++++++++++++
 .../translations/zh_CN/vm/hwpoison.rst        | 166 +++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst |  24 +--
 .../translations/zh_CN/vm/memory-model.rst    | 135 ++++++++++++
 .../translations/zh_CN/vm/mmu_notifier.rst    |  97 +++++++++
 .../zh_CN/vm/overcommit-accounting.rst        |  86 ++++++++
 .../translations/zh_CN/vm/page_frags.rst      |  38 ++++
 .../translations/zh_CN/vm/page_owner.rst      | 116 +++++++++++
 .../zh_CN/vm/page_table_check.rst             |  56 +++++
 .../zh_CN/vm/remap_file_pages.rst             |  32 +++
 .../zh_CN/vm/split_page_table_lock.rst        |  96 +++++++++
 .../translations/zh_CN/vm/z3fold.rst          |  31 +++
 .../translations/zh_CN/vm/zsmalloc.rst        |  78 +++++++
 13 files changed, 1139 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/vm/frontswap.rst
 create mode 100644 Documentation/translations/zh_CN/vm/hwpoison.rst
 create mode 100644 Documentation/translations/zh_CN/vm/memory-model.rst
 create mode 100644 Documentation/translations/zh_CN/vm/mmu_notifier.rst
 create mode 100644 Documentation/translations/zh_CN/vm/overcommit-accounting.rst
 create mode 100644 Documentation/translations/zh_CN/vm/page_frags.rst
 create mode 100644 Documentation/translations/zh_CN/vm/page_owner.rst
 create mode 100644 Documentation/translations/zh_CN/vm/page_table_check.rst
 create mode 100644 Documentation/translations/zh_CN/vm/remap_file_pages.rst
 create mode 100644 Documentation/translations/zh_CN/vm/split_page_table_lock.rst
 create mode 100644 Documentation/translations/zh_CN/vm/z3fold.rst
 create mode 100644 Documentation/translations/zh_CN/vm/zsmalloc.rst

-- 
2.27.0

