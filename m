Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCD2C48BE0
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 03:01:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E77EC613BC
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 03:01:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbhFKDDT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Jun 2021 23:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbhFKDDS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jun 2021 23:03:18 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750C7C061574
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 20:01:08 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id md2-20020a17090b23c2b029016de4440381so5132471pjb.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 20:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BZ91VNGOSJqMZPNEl48tOROCWwmbbHmZsVMWctYLe00=;
        b=Fg0v/qPsij/hgSydGRl8ubx38mAvFhIwUx/yt5IRCphzDfgy7AVPETw1k0yoRA9RxE
         m6LqBOJB/JVoZ6jy5XAXfWwyBB/Ijvsd2MEIVePm7hDc7YDP/OSiPTHXYdKqJ35K8ad8
         hcDzuOVTwWEtwXhPN78XiRZnHrNrnzPFefBlah2D2HgukatTR2oJN5cUTO2FcTwfFPxI
         AFerUli8aEY7Gsj7ECfxWSxNP4K72wSsozAFpYJylKFjaW99B5srqslRmc+ckVbheQB7
         31fCnfUhn9INbWTgfHmNVz/I9XYajcnQrOdJlfWLIOWT1y8n0fnXsiuDs6SB0FHSF37E
         eYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BZ91VNGOSJqMZPNEl48tOROCWwmbbHmZsVMWctYLe00=;
        b=Li9Vu2SgAIOuTI1n3RzruopQ2sT8nGofCjfKfjFssCRcS9dU5sUd6gMXLAdttwK/lU
         rHtyZEM2/THPilOYXCQjI/1dThxWraxP8ierUVdgaRiAqB6semBFCGI1VttB0p39RKkz
         5DSBGkL6zq3Z7Otud0GhIjGT36nGF80c8fKcYS4F/2x6Svt7zWy7IF4TjwLTvWnkAzme
         KYrCdMZTq3v7DEMueA/w3KKs/c42kEPSAcoOouNiJkzFZcOX20oECu5E/rkSCohtFp/c
         pBGwuyZRPiPtUSuscdLO3irkpBq8WDXgP5/jz8FU3gC2xteWNirYmVo2zm9mo+GFyqFI
         ePwg==
X-Gm-Message-State: AOAM533Cf30YYDLvJCQGxH18y8s11pLrQmKua/xYNBcE0dSULVJKczsZ
        CWfBEUOSyM4VH7xF6hF7id7Lw23rFmw=
X-Google-Smtp-Source: ABdhPJyVQny9m3WQxUyJX+K4qzl8wd1jMcWocJ/xV6PsZ3hcAv9bRaKDZun2RRep24EAJGMIajZEsg==
X-Received: by 2002:a17:902:ee82:b029:114:8409:1b78 with SMTP id a2-20020a170902ee82b029011484091b78mr1788523pld.59.1623380467555;
        Thu, 10 Jun 2021 20:01:07 -0700 (PDT)
Received: from kir-rhat.redhat.com (c-76-104-243-248.hsd1.wa.comcast.net. [76.104.243.248])
        by smtp.gmail.com with ESMTPSA id ev11sm8856748pjb.36.2021.06.10.20.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 20:01:07 -0700 (PDT)
From:   Kir Kolyshkin <kolyshkin@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Kir Kolyshkin <kolyshkin@gmail.com>
Subject: [PATCH 0/3] docs: fix cross references
Date:   Thu, 10 Jun 2021 20:00:41 -0700
Message-Id: <20210611030044.1982911-1-kolyshkin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A few trivial issues found while building docs.

Kir Kolyshkin (3):
  docs: fix bad cross-links in motorola-cpcap
  docs/devicetree: fix a cross-ref
  docs: fix a cross-ref

 Documentation/admin-guide/ext4.rst                       | 2 +-
 Documentation/devicetree/bindings/leds/leds-bcm6328.txt  | 3 ++-
 Documentation/devicetree/bindings/leds/leds-bcm6358.txt  | 4 ++--
 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt | 4 ++--
 Documentation/filesystems/ext2.rst                       | 2 +-
 5 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.31.1

