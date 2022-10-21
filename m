Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4288BFA373D
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 16:04:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbiJUQER (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 12:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbiJUQEQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 12:04:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30CD7274595
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 09:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666368251;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=17geT16pG35VTrdYqV5tA3g6Cj90L+YxvyM0AjY26TQ=;
        b=cWXqlc8oSHnhD8q+7GTTVqY9vuaSjnW9NV6VaquSICPBz0xHLYuiXq9UjMumC5QvGwKWXa
        T+AksAKJSGrEy6x74Mj4glSFI5E3q03SFQ95/G7OSqHaVpGVzota/PFAMhfI04uqvn9nVc
        s3ixGpVQrAwJ5sWUZglLXKu7bz7eTXQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-604-1B0UQ1bdOpCsqSL8__37ww-1; Fri, 21 Oct 2022 12:04:10 -0400
X-MC-Unique: 1B0UQ1bdOpCsqSL8__37ww-1
Received: by mail-qv1-f70.google.com with SMTP id ma6-20020a0562145b0600b004b49a5037aeso2542567qvb.18
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 09:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17geT16pG35VTrdYqV5tA3g6Cj90L+YxvyM0AjY26TQ=;
        b=hD0tMKoNwWFaYKYhuBYjozIQjKzJ7WqoUxjjE8JO08jqVMPh2abjGZ5aZIPPyRTyTH
         DmKeOzLUmY2z+MDd3fDqgizAhvRRFMkECk8J49U98W/DzpGlFn237GMWoFIcpp9yFz0U
         udWsA5V1tMQL2Cw1e4aC8UgH61ZcYZTE1nWrzaPqUJv0PEySyj2Yb/Rl+LC6ovs3i6gd
         CLrSIljPSJy7dUf3+lIyaPqYgMDgFi8Nleb8rFr/DoNyi5IByqILJolERz7kt0O8KDSq
         R2q3hivxMLjVL9d5nu0vNAKEtv5QM2P1ZxPLkXFolktdNN0wTtLqVquiy29bdKOhP8m+
         n72w==
X-Gm-Message-State: ACrzQf32+VE2Z2GFv4IEYOcvz159+rMU8sDBqv4CZ+z/dms1QZw23Vr8
        6A4iKyLvVnNehrjaJIUnMRuzPQnZy3eFWtToYrf6ZEtKpwvWlJDAcs+JInsMM6mC6t6yLnCbnin
        u9qdUyk1JkynQv7li89+P
X-Received: by 2002:a05:620a:2414:b0:6ee:d0c5:b3ad with SMTP id d20-20020a05620a241400b006eed0c5b3admr14003967qkn.613.1666368250037;
        Fri, 21 Oct 2022 09:04:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6pELEP9EfuC3UNQ/G1TIANQewXbb7hKJRjTjdUXiNxvYiQXnDmDhOls8IIpnlQmwzpvCa9nQ==
X-Received: by 2002:a05:620a:2414:b0:6ee:d0c5:b3ad with SMTP id d20-20020a05620a241400b006eed0c5b3admr14003940qkn.613.1666368249809;
        Fri, 21 Oct 2022 09:04:09 -0700 (PDT)
Received: from nfvsdn-06.testing.baremetal.edge-sites.net (nat-pool-232-132.redhat.com. [66.187.232.132])
        by smtp.gmail.com with ESMTPSA id br22-20020a05622a1e1600b0039cb5c9dbacsm8088849qtb.22.2022.10.21.09.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 09:04:09 -0700 (PDT)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH bpf-next v4 0/1] doc: DEVMAPs and XDP_REDIRECT
Date:   Fri, 21 Oct 2022 12:59:18 -0400
Message-Id: <20221021165919.509652-1-mtahhan@redhat.com>
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
 Documentation/bpf/map_devmap.rst | 205 +++++++++++++++++++++++++++++++
 Documentation/bpf/redirect.rst   |  46 +++++++
 3 files changed, 252 insertions(+)
 create mode 100644 Documentation/bpf/map_devmap.rst
 create mode 100644 Documentation/bpf/redirect.rst

-- 
2.35.3

