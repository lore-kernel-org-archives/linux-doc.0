Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73126C4332F
	for <linux-doc@archiver.kernel.org>; Wed, 23 Nov 2022 09:26:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237678AbiKWJ0S (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Nov 2022 04:26:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237501AbiKWJZs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Nov 2022 04:25:48 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA06C846D
        for <linux-doc@vger.kernel.org>; Wed, 23 Nov 2022 01:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669195406;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=fc7BgEWK5CMEA7cvzcbtUcvqyz0msU0YsHhfcZmgv5E=;
        b=Yi09aouzx+ELkb4ev7qHCa2PScakfH8ffXwCQ9ojMEd5tlkhkFig4feq9pqnCE3EicHNgU
        uIxN7x4XxmWH3qLvDl9DlZ2Mn5MB8XKfhHlyIQm9Fxtgw0icyMA6uBKuSYkXV/xvJmUJnc
        7SyZQdgEgUCaL7jdpbtuPehCfpTNr+o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-531-Eqj-bXHSNkS9A96FqI5Bvw-1; Wed, 23 Nov 2022 04:23:25 -0500
X-MC-Unique: Eqj-bXHSNkS9A96FqI5Bvw-1
Received: by mail-wm1-f71.google.com with SMTP id l32-20020a05600c1d2000b003cfefa531c9so1666235wms.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Nov 2022 01:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fc7BgEWK5CMEA7cvzcbtUcvqyz0msU0YsHhfcZmgv5E=;
        b=onEYMRZL32Vnxxk3jUDP85JtJbz5OPY3rNRIAZeaP0e9sDnghiKqzR3zznzG0WBJcV
         kNheWjk8T5bEpq5eRYmPCLqBhmjVGojctTa+kP0ESdsnT7gV+FD8or+IpgsJxCKVHX6x
         yZd4TOF07ecYgF3+SaoWi1nHoTRk/rNZgX/p+X04IMxi5WgRdxZ+dy5kBdodQmCGkcix
         5OVsqCQDjRxRIeHGDf7uJCkppJyOLvHLtw1uBw680EoBg/YYWTwE8N6rCLsGL7pB5Yv5
         XPtsWt2+N18i/WzCzV/F7KJCW+1fxLr18hf7zzx+O8qkkURwTXi3h6Ps5ZmwcC6yf4ni
         rjuA==
X-Gm-Message-State: ANoB5plxAcT274hcGHzy6uIgrsp98C5STjr8kWEMutRso5wOkEdT3Zd0
        t04xuz1lC1ZgqhOO+Ziwb/HHYhqy/i9QX94qSLRvGkSCZ1dxLAtFmo6HQw7gleaWaCebKHg1Ja9
        T/+8F8RuHbK8qbv/5aQpO
X-Received: by 2002:a5d:6f16:0:b0:241:ce9e:77f4 with SMTP id ay22-20020a5d6f16000000b00241ce9e77f4mr10169717wrb.702.1669195403874;
        Wed, 23 Nov 2022 01:23:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7z2VrXjsysBH0iXTYYXz/WSU67Q88R3i470A/DqMdNYUBmV0ys7VxGm0nYMtjnJBSCXbC3Cg==
X-Received: by 2002:a5d:6f16:0:b0:241:ce9e:77f4 with SMTP id ay22-20020a5d6f16000000b00241ce9e77f4mr10169701wrb.702.1669195403636;
        Wed, 23 Nov 2022 01:23:23 -0800 (PST)
Received: from localhost.localdomain ([78.19.107.254])
        by smtp.gmail.com with ESMTPSA id w19-20020adfbad3000000b00241c6729c2bsm13048855wrg.26.2022.11.23.01.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 01:23:23 -0800 (PST)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jbrouer@redhat.com, thoiland@redhat.com, donhunte@redhat.com,
        akiyks@gmail.com, Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH bpf-next v3 0/2] docs: fix sphinx warnings for cpu+dev maps
Date:   Wed, 23 Nov 2022 09:23:19 +0000
Message-Id: <20221123092321.88558-1-mtahhan@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Maryam Tahhan <mtahhan@redhat.com>

Sphinx version >=3.1 warns about duplicate function declarations in the
CPUMAP and DEVMAP documentation. This is because the function name is the
same for Kernel and User space BPF progs but the parameters and return types
they take is what differs. This patch moves from using the ``c:function::``
directive to using the ``code-block:: c`` directive. The patches also fix
the indentation for the text associated with the "new" code block delcarations.
The missing support of c:namespace-push:: and c:namespace-pop:: directives by
helper scripts for kernel documentation prevents using the ``c:function::``
directive with proper namespacing.
---
v3:
- Update Sphinx version to 3.1.
- Add note about namespacing.

v2:
- Fix references to user space.
---
Maryam Tahhan (2):
  docs: fix sphinx warnings for cpumap
  docs: fix sphinx warnings for devmap

 Documentation/bpf/map_cpumap.rst | 56 +++++++++++++++-----------
 Documentation/bpf/map_devmap.rst | 68 ++++++++++++++++++++------------
 2 files changed, 76 insertions(+), 48 deletions(-)

--
2.34.1

