Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D52C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 17 Sep 2021 06:34:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A3716103B
	for <linux-doc@archiver.kernel.org>; Fri, 17 Sep 2021 06:34:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235837AbhIQGf3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Sep 2021 02:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234814AbhIQGf2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Sep 2021 02:35:28 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FD00C061764
        for <linux-doc@vger.kernel.org>; Thu, 16 Sep 2021 23:34:07 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id lb1-20020a17090b4a4100b001993f863df2so6611889pjb.5
        for <linux-doc@vger.kernel.org>; Thu, 16 Sep 2021 23:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ThNoZtaL82ILbloYlFLQOAouOYNEqJs0YkuXy3Hxmig=;
        b=RQb+wStBekuqdQXyoXz16qI7jyhFEvOKJ+G+mOJEFO0yiOMPwPLNwi/V24xP75eXcK
         W40EzrbizGTbXkcqY6+dlL26alC+2yXokJeFXepC84SWds+p4sg+kuTTwO0E+NaoOpKk
         Ax4KpUooioDwaQJZpBtP8XUYC+0uMVqOXYiEgMCk/Org0yKqAdBlgpqSl6VXAEtqWuCa
         k1fL9ww/EBWoifDolFnC1AR+6G0L84S9+Sw134I5imt1I7ub/prlDQ3GcD1p1mSV+8OZ
         hggh3FP3lWMzKX73LKGxpYPBoxIRUJj8QWQtUiZ1DEqemWvk9RfJct/z6AHuptKUA3Ia
         1wCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ThNoZtaL82ILbloYlFLQOAouOYNEqJs0YkuXy3Hxmig=;
        b=naVpj2yPBgLT0G6HLo/0c1zcdKDMBch8ASZlw2B6XEpveGVRRlSUrPNLUT5/P2AyJc
         F0eC3CMtshy6spAanwfUCwOm6aiKSi+jNkDtXBsPEWfk5W661EhRv/FUSFYyorxXHsM3
         +lmKavlcTf1B9DEg6BOuZTZDKmK2bc/mQH/AKPCSu+LkythpKPtTsTYveu85auvCI064
         iTdi5TEbA9JdoxK+Gp0BXTY3jcFyG8aVfBA+m4B/iKFS50Rlanv3bREwUw369En6wHo0
         PPjuaKG7OCG0VJHJeT2eawbq9Dz90KnL6pqMDQtczKhDTR2nVQcjhBzCMSB6BUtOgdUW
         zREA==
X-Gm-Message-State: AOAM530bqf3wZLguGySX+7++IxGX563C5Y7tsrB7SwZ8s8a/YDPoZxAV
        lwEoFxFAOx+cYcrN6gDoWjg6EB+7gpxVvb+0
X-Google-Smtp-Source: ABdhPJx4qEva2ahPiT3V5wj/jcBpN6MAr9Ys7anA7WnnybBIxQXzaBcH/26sn7SJb79PHyuxDgskCg==
X-Received: by 2002:a17:90b:791:: with SMTP id l17mr10520457pjz.155.1631860446493;
        Thu, 16 Sep 2021 23:34:06 -0700 (PDT)
Received: from localhost.localdomain ([8.47.69.169])
        by smtp.gmail.com with ESMTPSA id d4sm4723775pfv.21.2021.09.16.23.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 23:34:06 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v6 0/6] docs/zh_CN: add core-api Memory management translation
Date:   Fri, 17 Sep 2021 14:33:01 +0800
Message-Id: <cover.1631846923.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v6:

warning fix:
Documentation/translations/zh_CN/core-api/mm-api.rst:35: WARNING: duplicate label mm-api-gfp-flags, other instance in /stuff/k/git/kernel/Documentation/core-api/mm-api.rst

It looks like two identical tags are causing that warning, but I
tested it in sphinx-2.4.4 and sphinx-4.1.2 and got no warning.

I have modified the tags in the Chinese documentation:

diff --git a/Documentation/translations/zh_CN/core-api/mm-api.rst b/Documentation/translations/zh_CN/core-api/mm-api.rst

-.. _mm-api-gfp-flags:
+.. _cn_mm-api-gfp-flags:
 
 内存分配控制
 ============

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

