Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BB3C4321E
	for <linux-doc@archiver.kernel.org>; Mon, 17 Oct 2022 08:53:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbiJQIxS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Oct 2022 04:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbiJQIxA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Oct 2022 04:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935B7248D4
        for <linux-doc@vger.kernel.org>; Mon, 17 Oct 2022 01:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665996756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Lz76llnI70u7uCZcTOSr/aib1axFYq6vl4LNEDDUrLw=;
        b=CaSdIzYWnPtbw1V1tf//WfjedmnNPM580NtWAFJukyZ0ST3c4DQgWxIdxnQYl6YDFKnnbn
        +2B5hjRUWnB+YAJmTapXbXS2C3AvI6E3mMfJ2GJZWr1PoGw/zuj1DQ3YMmgqpJvVIDpaIz
        Mb0/+xHN0PdwKQRdF+S6OmC4oLTYe4c=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-267-6QwjDjjQORGCPhRCA4tcOA-1; Mon, 17 Oct 2022 04:52:34 -0400
X-MC-Unique: 6QwjDjjQORGCPhRCA4tcOA-1
Received: by mail-qk1-f198.google.com with SMTP id i11-20020a05620a404b00b006eeb0791c1aso9085625qko.10
        for <linux-doc@vger.kernel.org>; Mon, 17 Oct 2022 01:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lz76llnI70u7uCZcTOSr/aib1axFYq6vl4LNEDDUrLw=;
        b=XgC7raZgImXRQeywFlp8yuMFhEA+x1hrxPNZb83gWEoS0YPGin8H/s0I/Mv9I9bZrx
         RTSs2MMok0gZHWf9J845w2e4X4r6Biev9FDquU54KDn5QeIvYwaBJ1BhkSZ16vCShP+u
         hO+0VqAvCqx4BFUBh6vzbPuPBiM+aeQZ1Bdaz41T5/LaHKfzL/Lj8EbMFdoDwLjubpqk
         whOBGJAd8/2ExSX8fQk32ocPAwG7As8CildEzkQwf8CJMp1N88JtstM2TMnkWElTds0Z
         Mj0Q3/LIcGAWcaC/vlS0RK5KOrCGaIwNUIqk6p3VTdeKP49g3x+byIh0RZhcmnkcj5hL
         G43Q==
X-Gm-Message-State: ACrzQf0XeX353uXZZRyd/WPi5sbBu44Gj9fYBtgbZ1e6QawH/uFNNMHQ
        LXIy7C61SRZ93/YVEIyA6ZMuYisLbdiRXbB/GR17kDBxScyma5SMRWDqeL4qKJCyZktYbSGoBMW
        jMBBdzBL06SgcOlqWIyuz
X-Received: by 2002:a37:ef02:0:b0:6e4:9fd5:ba76 with SMTP id j2-20020a37ef02000000b006e49fd5ba76mr6583930qkk.405.1665996754234;
        Mon, 17 Oct 2022 01:52:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7HH6prC3VABzVT3B7/GBsFSwRWO98Nge7dCJway0voYUGMXVEPtHR8dKjX8gR77ZPLBhj8Ig==
X-Received: by 2002:a37:ef02:0:b0:6e4:9fd5:ba76 with SMTP id j2-20020a37ef02000000b006e49fd5ba76mr6583924qkk.405.1665996754046;
        Mon, 17 Oct 2022 01:52:34 -0700 (PDT)
Received: from nfvsdn-06.testing.baremetal.edge-sites.net (nat-pool-232-132.redhat.com. [66.187.232.132])
        by smtp.gmail.com with ESMTPSA id a20-20020a05622a065400b0039853b7b771sm7571591qtb.80.2022.10.17.01.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 01:52:33 -0700 (PDT)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH bpf-next v3 0/1] doc: DEVMAPs and XDP_REDIRECT 
Date:   Mon, 17 Oct 2022 05:47:52 -0400
Message-Id: <20221017094753.1564273-1-mtahhan@redhat.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Maryam Tahhan <mtahhan@redhat.com>


Add documentation for BPF_MAP_TYPE_DEVMAP and
BPF_MAP_TYPE_DEVMAP_HASH including kernel version
introduced, usage and examples.

Add documentation that describes XDP_REDIRECT.

v2->v3:
- Fixed indentations in usage section to exclude non note text.
- Replace links to selftest with actual paths.

v1->v2:
- Separate xdp_redirect documentation to its own file.
- Clean up and simplify examples and usage function descriptions.

Maryam Tahhan (1):
  doc: DEVMAPs and XDP_REDIRECT

 Documentation/bpf/index.rst      |   1 +
 Documentation/bpf/map_devmap.rst | 189 +++++++++++++++++++++++++++++++
 Documentation/bpf/redirect.rst   |  46 ++++++++
 3 files changed, 236 insertions(+)
 create mode 100644 Documentation/bpf/map_devmap.rst
 create mode 100644 Documentation/bpf/redirect.rst

-- 
2.35.3

