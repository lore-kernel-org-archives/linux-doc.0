Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C534C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 06:51:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbiCQGwO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Mar 2022 02:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbiCQGwF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Mar 2022 02:52:05 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C585ECC58
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 23:50:48 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id i3so349631pgc.5
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 23:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OKJrRsApU+wNWy7xb86nWYvaG5AizX+o9W0wqAgcqew=;
        b=osjZ5PlKb7qaOeP+ZOuL+9g4sm+KpZNaBT8om8f7k8c3x1qvu2PODpFjnqWRlLnmw8
         Ruy68k8LSXzB7AZtCeXv1XcKN7Sdl/vxhDSzCFS2smHef5I6+lYvPtXpfOjmBkW5RD/R
         sWa1kO9UA9jgZyyAIH245/ZiSWogh19Bi7Sh8J6BpkUbalmkikJR9TO5t9pqOnW+CYhv
         xwyAXOUG9vtacPPRNPthb2L3pJHmakWIF723pHUPFR733zBWaHktGEUy5U3v/3HPdfZw
         bE8wCJRoFbYDQMr3Kwuvyu0qlPZ0taYFR71aCIF5iICc2jf8RBaDYlqSuCgtn7q812x+
         M3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OKJrRsApU+wNWy7xb86nWYvaG5AizX+o9W0wqAgcqew=;
        b=uZEuQCAOsEf43XEhz5LB0j+cdMLwh0r3omzclW3XlAiMXpiNSmykjQIfHyxrQLzq0g
         V6zp2+MuMYlpcegjyfQP51jERlWr0DRY2P7MrP/gYmdl6Yhg1RvVgjaSnxlrjhh9chND
         WF6p1ZoyaPqPcsyw5sFWsYPWysReduqvAw5fY2jsUSOThg0vSAew3cJ5WmlKpVxy13aY
         X3QB+r6SwEQAVdwL22NVcr976MTRHEhw50XSrs5kK6pe0bBPOdBDnQyCF+rHsFdw2V80
         Z/PKQ68K4KYh0twPOcm4kqSkxbOcABHZHJMJm9WrKYXYyiiWxEroj7HNN9mQjhoRYhv7
         J8uA==
X-Gm-Message-State: AOAM530HhK8DgI3fqy5kbKUowpNyPF97gId3uXMKNzzm3abi8ju2TzUd
        ts2I7NHfeu01LOAZqbfPI0E=
X-Google-Smtp-Source: ABdhPJzFCVGf42hFLP0YLDgMxl2teb3JQ6oMsRyaaGVmr8ru/vCguVA4zgjffr0y60ZUi2H180Iztg==
X-Received: by 2002:a05:6a00:2451:b0:4f7:72de:88dd with SMTP id d17-20020a056a00245100b004f772de88ddmr3392113pfj.82.1647499847715;
        Wed, 16 Mar 2022 23:50:47 -0700 (PDT)
Received: from localhost.localdomain (pcd454078.netvigator.com. [203.218.244.78])
        by smtp.gmail.com with ESMTPSA id k15-20020a63ab4f000000b00381eef69bfbsm3622152pgp.3.2022.03.16.23.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 23:50:47 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v2 00/12] docs/zh_CN: add a little vm translation
Date:   Thu, 17 Mar 2022 14:50:41 +0800
Message-Id: <cover.1647498763.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:
* Modify some words under Alex's advice.
* Optimized some words. [PATCH 07-12/12]

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

