Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9993FC63799
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 10:04:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E8056127C
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 10:04:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231818AbhGVJYC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jul 2021 05:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbhGVJXy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Jul 2021 05:23:54 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEBC9C0613C1
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 03:03:56 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id ec55so6092620edb.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 03:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uNGWBLvKXB/+TAbUSGjomhaMNFFHNEb+9nWG9b67XRs=;
        b=X5tqliXw3hgO2LiEq/kZ8jLJ/jsHu3roAtTxI/m941MNVT9I1h/KCDKCnhnkEjdaIp
         RCKhtmIfeaJZsKnnRv4/eEZp2SGv6xXxc+RbtJD5uHH/PaP6ntPkfSYuEJKvR4lCGNz/
         W7FVuOtLLb4Mvk0ORzuUBj9uPeXBEsXZFA72d1fmfAVvBNnTlrdtYndjdxM2zoAVLL/8
         SJErjTXdoaDaOnuiwZ5PJYurmqOx+ia2eFKM9NDWpEvV95xKU0mv1wWu/idsZVrMNst2
         NQgODoHqiLBsjzJ7394U+fZRCBUGuNyJK0HWEBqHOZ7+xJWFBez0CtdItNjWT+44FG/R
         OB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uNGWBLvKXB/+TAbUSGjomhaMNFFHNEb+9nWG9b67XRs=;
        b=VhQba2EpvEcxLLMkAbFZ9stjgFRebjb6iSv40TiNH6JWvk7FjdzwLEdopz/cj27DMG
         PMYOWnYS99TzGwnIezJiM9e7QFP4jlDxBQno5XeUkD1jBiu96hoADp2GblE3LSTDiM06
         CbKWjNJ1FqJpkm65CXhaFj00ur0hUEYdKqHSc+LPkvSpo4A4cD1gWVbgRBuXsmBUJZYC
         Bb5ea5fPzON62D1RIZZeHepAbeqVeg2/OzlN/yZen+V1iL776DEIuR4gO2uYKakWYiTj
         GJW/wUq6C7n0VHPU5V0UWlLk4HA/4R/O50FhmuuIQsnqiMZpgWTAi2d5vZHGMm2vFskP
         bM/g==
X-Gm-Message-State: AOAM531iasN+wM7OILZbplp55sk2p83FaA8EwPfkCB4ljK7Jqt9qUcQ2
        1/O9s+z9Xp5DzXiEidpyoAg=
X-Google-Smtp-Source: ABdhPJwYgzBZiF0RtOBsXgZ4N4U29ZIdncudharPwvaaS+kfWvOT/32L58zKDC8bXAz4Rfga5A0kOA==
X-Received: by 2002:a50:9554:: with SMTP id v20mr52499577eda.179.1626948235361;
        Thu, 22 Jul 2021 03:03:55 -0700 (PDT)
Received: from yoga-910.localhost ([82.76.66.29])
        by smtp.gmail.com with ESMTPSA id cb4sm9341749ejb.72.2021.07.22.03.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 03:03:54 -0700 (PDT)
From:   Ioana Ciornei <ciorneiioana@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-doc@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Jing Zhang <jingzhangos@google.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH 0/4] docs: small fixes
Date:   Thu, 22 Jul 2021 13:03:52 +0300
Message-Id: <20210722100356.635078-1-ciorneiioana@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Ioana Ciornei <ioana.ciornei@nxp.com>

This patch set is just a bundle of small fixes for problems and build
warnings that I stumbled upon when trying to add a new section of
documentation.

Ioana Ciornei (4):
  docs: printk-formats: fix build warning
  docs: kvm: fix build warnings
  docs: kvm: properly format code blocks and lists
  docs: networking: dpaa2: fix chapter title format

 Documentation/core-api/printk-formats.rst     |  1 +
 .../ethernet/freescale/dpaa2/dpio-driver.rst  |  1 +
 Documentation/virt/kvm/api.rst                | 32 +++++++++++--------
 3 files changed, 20 insertions(+), 14 deletions(-)

-- 
2.31.1

