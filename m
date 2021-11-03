Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F304C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  3 Nov 2021 02:47:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0181B60F39
	for <linux-doc@archiver.kernel.org>; Wed,  3 Nov 2021 02:47:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhKCCtx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Nov 2021 22:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhKCCtw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Nov 2021 22:49:52 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB939C061714
        for <linux-doc@vger.kernel.org>; Tue,  2 Nov 2021 19:47:16 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id r10-20020a056830448a00b0055ac7767f5eso1622133otv.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Nov 2021 19:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=55CgLH7QOjxjRTXu6oiUaCHLHtEy1MOu2eNnvptaDPg=;
        b=mKDGNGD4Cwn/T6c4x5mQkYILHIoZcPMeps2+4KMXj+Pd8Acznfe2bdg7kpiwva/36L
         RSNdgsDZtNMMvpaLLseMna/9GbC6GyL2kdxUHT8+EHNdXJtvFhXg5feMOusnkDqm+CBu
         9TlLNo7HuueDTcnpN6eSge76XFGBtfU2fr98J+KvTvEuU/klERexG4dyyzz/5fE2kvil
         tLbXslo7tsX55tYzxB5UJ33qrHG/pR0hO3xsMSCUD92P6pBHzOISYhuUnK1DOPH45zN0
         Ye7EAp5hD90cpERGJUVv5OerJ0sjKPlajcZ/vDQvomBBAyRL7cEZYM/LTjxsc/RzcLml
         7/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=55CgLH7QOjxjRTXu6oiUaCHLHtEy1MOu2eNnvptaDPg=;
        b=HQoQ6TDhxfPGyQHNKSd7lQKjJGAxHxLFgVZGMc5wkD+T19DZgzjBjGEzHRz74rYDHI
         8s1YfXL/N5ZO5KY/XaymRss1gYB8PS3mcPhqbUt3KEjjw5p2e2hSTRkJh0z6tg6a8J6T
         vRYzCWH4PTTCYAEIIb7+QkSbX95WtJHHD/yLd6/ybh4PWbePZv2j9WnHQGQLMtV+2cAx
         ELk8ni5xZrVXen6OKONnIrURZzVhX9VqG9iPoNEDyA96Py+cNAlL4DjlPi1Q38UcxxHa
         UR8h1dimUABac2yvvZkOu4oigzIhtiGt5nrpQqxoxjDXGkzvyPsMMHlS4M5gF9QOVoht
         eCcQ==
X-Gm-Message-State: AOAM531llzSvdog75vbrddoevT9gTq3x1a3cWh1o/aD0BGwxpJ6JnykV
        lIlYWlMw8qnF1CJjp8Hin+E=
X-Google-Smtp-Source: ABdhPJyvTiVdrt6EhGQQ9CBm12j3hm+grnULBHOc4eh3Q3Utb2OsZNyJUyir6gzYYCBELugnkdDr2w==
X-Received: by 2002:a9d:759a:: with SMTP id s26mr20468038otk.122.1635907636336;
        Tue, 02 Nov 2021 19:47:16 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
        by smtp.gmail.com with ESMTPSA id y4sm220303ots.73.2021.11.02.19.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 19:47:16 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com, leoyang.li@nxp.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, src.res@email.cn,
        wanjiabing@vivo.com, bernard@vivo.com
Subject: [PATCH v2 0/2] docs/zh_CN: move and update sparse
Date:   Wed,  3 Nov 2021 10:46:30 +0800
Message-Id: <cover.1635907089.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:

At the suggestion of Leo Li:

* typo fix.
* recovert `` `` to “ ”.

v1:

The Chinese sparse documentation is too old, so let's update it to
the latest version and move it to ../zh_CN/dev-tools/.

Yanteng Si (2):
  docs/zh_CN: move sparse into dev-tools
  docs/zh_CN: update sparse translation

 .../translations/zh_CN/dev-tools/index.rst    |  2 +-
 .../{sparse.txt => dev-tools/sparse.rst}      | 63 ++++++++++++-------
 2 files changed, 41 insertions(+), 24 deletions(-)
 rename Documentation/translations/zh_CN/{sparse.txt => dev-tools/sparse.rst} (59%)

-- 
2.27.0

