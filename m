Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FFF2C4332F
	for <linux-doc@archiver.kernel.org>; Thu, 10 Nov 2022 15:15:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbiKJPPP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Nov 2022 10:15:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiKJPPO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Nov 2022 10:15:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F2A13F7E
        for <linux-doc@vger.kernel.org>; Thu, 10 Nov 2022 07:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668093252;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=zEvplYuwssLJ3t9LRCQjT4FvP3g4vYYyMhE2+Vd/Jhg=;
        b=W72mg/Hwl3xAXOdXweLxbqwnd5jagVjSFM3SBRYIyU3Gn8QMZEQ2BZQ206/rPOihlTjh3Q
        paRFMI2ak/s1tw39SKgZI/RWmnbKyRoA7bNpg+5p69f3uqZ5QPOAUKZ2+sOO4FMr6jX9Kt
        Y7cGAORAok2ZSLlF2uHGkMdnnvWHB6A=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-512-OL148ni9Ni-vO6xEU88-qg-1; Thu, 10 Nov 2022 10:14:11 -0500
X-MC-Unique: OL148ni9Ni-vO6xEU88-qg-1
Received: by mail-qt1-f198.google.com with SMTP id c19-20020a05622a059300b003a51d69906eso1567619qtb.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Nov 2022 07:14:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEvplYuwssLJ3t9LRCQjT4FvP3g4vYYyMhE2+Vd/Jhg=;
        b=W11OTs+gqzLVUorY3KIpm3jpfbAzOspbmY37DiUoc35izH4cVZd4ni8ARfdGDPAi61
         GL3tn3JBixbESQ/+KPmLWIN5rPSNEPxAWd1ljaq16+SVx3Yjt4u4IVBoAoKVBpaoOQs1
         al64soobByOTtkekPcypwlSTUGggXuxJk+Io7GS7mqK+z4TNlLBxcQ13mv7FOTrgSShU
         dq2rGbElaV9qVcAVnLvNAqF4AxUUj6S8vCpXcZ0DCfaTjcgFtLc720PSGyiThAynNsJo
         EL83Na2fPstb2mqcivN8FVkEZvniAueS78QEZGiwc1rdP+J0LJV1nctTunHxdIfE6e0l
         gkgQ==
X-Gm-Message-State: ACrzQf0AtTjaIgstCJeP0B+XvwIfILVY4bo8pihHkj2yN6r43Z8M5Q/Q
        l0Fi0sjHzpipsz4c//N/gJbkY+Yru+ER+f2wnjRaNXTi9mxAdHJpIFSIU/2hc7W8Uu5bdxTjuTb
        FqpLg5dafBVXINRNWqkvX
X-Received: by 2002:a05:620a:13db:b0:6fa:28c5:e06 with SMTP id g27-20020a05620a13db00b006fa28c50e06mr43421381qkl.629.1668093247068;
        Thu, 10 Nov 2022 07:14:07 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6SrgJUuJzXrqbA4GxWXofdLpOydoJ4P2uTKkpP4SreDc2IjZepp/HIqPuhN2wzy4WK+ZYaRw==
X-Received: by 2002:a05:620a:13db:b0:6fa:28c5:e06 with SMTP id g27-20020a05620a13db00b006fa28c50e06mr43421357qkl.629.1668093246786;
        Thu, 10 Nov 2022 07:14:06 -0800 (PST)
Received: from nfvsdn-06.redhat.com (nat-pool-232-132.redhat.com. [66.187.232.132])
        by smtp.gmail.com with ESMTPSA id fg26-20020a05622a581a00b00399b73d06f0sm11320703qtb.38.2022.11.10.07.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 07:14:06 -0800 (PST)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jbrouer@redhat.com, thoiland@redhat.com, donhunte@redhat.com,
        yhs@meta.com, Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH bpf-next v8 0/1] doc: DEVMAPs and XDP_REDIRECT
Date:   Thu, 10 Nov 2022 11:08:17 -0500
Message-Id: <20221110160818.1053910-1-mtahhan@redhat.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Maryam Tahhan <mtahhan@redhat.com>

Add documentation for BPF_MAP_TYPE_DEVMAP and
BPF_MAP_TYPE_DEVMAP_HASH including kernel version
introduced, usage and examples.

Add documentation that describes XDP_REDIRECT.

v7->v8:
- Updated multicast to use description suggested by Toke Høiland-Jørgensen.

v6-v7:
- Got rid of unnecessary initializations in examples.

v5->v6:
- Separate Kernel BPF and userspace functions for devmaps.
- Include some packet/tracepoint debug info in the redirect
  documentation.

v4->v5:
- Remove unused 'index' variable in example.

v3->v4:
- Prepend supported map section for XDP_REDIRECT documentation.

v2->v3:
- Fixed indentations in usage section to exclude non note text.
- Replace links to selftest with actual paths.

v1->v2:
- Separate xdp_redirect documentation to its own file.
- Clean up and simplify examples and usage function descriptions.

Maryam Tahhan (1):
  doc: DEVMAPs and XDP_REDIRECT

 Documentation/bpf/index.rst      |   1 +
 Documentation/bpf/map_devmap.rst | 222 +++++++++++++++++++++++++++++++
 Documentation/bpf/redirect.rst   |  81 +++++++++++
 net/core/filter.c                |   8 +-
 4 files changed, 310 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/bpf/map_devmap.rst
 create mode 100644 Documentation/bpf/redirect.rst

--
2.35.3

