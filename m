Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC01C433F5
	for <linux-doc@archiver.kernel.org>; Sat,  4 Sep 2021 10:01:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96D9A60F91
	for <linux-doc@archiver.kernel.org>; Sat,  4 Sep 2021 10:01:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235449AbhIDKCo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 4 Sep 2021 06:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235274AbhIDKCo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 4 Sep 2021 06:02:44 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD2BFC061575
        for <linux-doc@vger.kernel.org>; Sat,  4 Sep 2021 03:01:42 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id s29so1491860pfw.5
        for <linux-doc@vger.kernel.org>; Sat, 04 Sep 2021 03:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=We2wMjoE/rlPZ2BowUWGX57WDVrHto0OvQqK+p6ptyM=;
        b=Sv1R2tya27LVyvoyhXfGwZViZSOpZCPP8FHEbS2S8aZ5Ss1n4yzOKAetJ4QUdHDaNo
         Wrjtlwx5vbz3v9zD4TMPHdLQR8wYyPHwk5pEheeCdyvSmyKKFOslQKlVUOWOB1pIgigC
         d6QMI/LCmtyZTObluv/cHZUwS9atNSX60zBI9hJhsIriAkIB9blXsTyiB8RE5/Jo037e
         gsn8y1JFdOfNlWhA9LYU4BELHrAY3iflWHtM815nm5S2olJn4IbMtVowye8FeqIrHAYI
         lt6meE1L7JaIWYmpfhuJk+swP8BW9K3UvnvRpothANMfyYaM6MWqIwArikS+uqpGkmCN
         uyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=We2wMjoE/rlPZ2BowUWGX57WDVrHto0OvQqK+p6ptyM=;
        b=rEwYkp2vKUx4A4wRwBvDl4cv5OuCtvKeabmvxl6jiFZjZ2ZXRDB4Vyjl7U4BEVfuzK
         fxH4traAaQ3wIe4UcAWosSjWlxvnBW2W3c0x1TVlALNuHjqnwzMrewM+W2aLwE+jLrCX
         Fhyr7pVvpfta4JOpyGIF1Nq0mvVLjIqNBKrVFh6lr4Gpi6qgedrqx6NhCyVu6xbPaiQ8
         1rMRCmGD+vsi4QgcwGt4s1/z6OdWsPC28v69tmXid5z7cqxZ7E/wgDFH+g12MJggY98V
         vhG1CGe/F03T1b+qQQD1tsRIQFfI5IzGLJkeLQDPbWNvI5cLfqjBVm1W4aHL0TX+b+PP
         y3QQ==
X-Gm-Message-State: AOAM533z1fFXHABUnRknU6nUNpn7TW9KrurY4BKX/+3HvQNmUq2wyqLs
        S5xVX4DmN/Mo4ySAXcYcXq0=
X-Google-Smtp-Source: ABdhPJxdk/WStAeHnOC+AVVVgddVGwR5OVqyBexEzDfMqTPS6dKNR6Dwq5svJFJWj/Kq/i/Yg/Ldtw==
X-Received: by 2002:a63:df0d:: with SMTP id u13mr2946023pgg.417.1630749702396;
        Sat, 04 Sep 2021 03:01:42 -0700 (PDT)
Received: from localhost.localdomain ([107.172.82.230])
        by smtp.gmail.com with ESMTPSA id e16sm1955458pfj.90.2021.09.04.03.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 03:01:42 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v5 0/6] docs/zh_CN: add core-api Memory management translation
Date:   Sat,  4 Sep 2021 18:00:58 +0800
Message-Id: <cover.1630747462.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v5:

* resent to linux-doc list.

v4:

* pick Alex's Reviewed-by tag.
* Modified some words under Alex's advices.

v3:

* Modified some words under Jiaxun's advices.[PATCH 5/6]

v2:

* Modified some words under Alex's advices;Many thanks to alex for his review, which
    kept him busy until the early hours of the morning.Thank you!

* add 校译者(proofreading) sign.If you don't want me to do this, please let me know.

Yanteng Si (6):
  docs/zh_CN: add core-api memory-allocation translation
  docs/zh_CN: add core-api unaligned-memory-access translation
  docs/zh_CN: add core-api mm-api translation
  docs/zh_CN: add core-api genalloc translation
  docs/zh_CN: add core-api boot-time-mm translation
  docs/zh_CN: add core-api gfp_mask-from-fs-io translation

 .../zh_CN/core-api/boot-time-mm.rst           |  49 ++++
 .../translations/zh_CN/core-api/genalloc.rst  | 109 +++++++++
 .../zh_CN/core-api/gfp_mask-from-fs-io.rst    |  66 +++++
 .../translations/zh_CN/core-api/index.rst     |  14 +-
 .../zh_CN/core-api/memory-allocation.rst      | 138 +++++++++++
 .../translations/zh_CN/core-api/mm-api.rst    | 110 +++++++++
 .../core-api/unaligned-memory-access.rst      | 229 ++++++++++++++++++
 7 files changed, 710 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/boot-time-mm.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/genalloc.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/gfp_mask-from-fs-io.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/memory-allocation.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/mm-api.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/unaligned-memory-access.rst

-- 
2.27.0

