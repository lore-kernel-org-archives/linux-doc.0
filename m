Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC6BC433FE
	for <linux-doc@archiver.kernel.org>; Thu, 10 Nov 2022 09:36:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbiKJJg2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Nov 2022 04:36:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbiKJJg0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Nov 2022 04:36:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C1A267F7A
        for <linux-doc@vger.kernel.org>; Thu, 10 Nov 2022 01:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668072935;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=A8kKFFAUCTx/SqicI25Ltk8g9h3a8wHU1qN0+iZz57A=;
        b=Ui/5saV8SKyLpLlM/347qrKd8cTFxyBLRUATxvxxYkWY3XrxbRE+oKCqTEWHfJDu+M2FQk
        6OQu0cqC8uJovWMTqU/ARKSEIfqgIUMqyCUKM/+gf3xR5uK8Xnjw5yRuuElOduIJ7cUfId
        CB4yyFFH9xpLUjRWY8pSfUXprmMWH58=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-324-YkaF1_RiMZSKLAzw4w79PQ-1; Thu, 10 Nov 2022 04:35:34 -0500
X-MC-Unique: YkaF1_RiMZSKLAzw4w79PQ-1
Received: by mail-qk1-f199.google.com with SMTP id bs7-20020a05620a470700b006fac7447b1cso1386575qkb.17
        for <linux-doc@vger.kernel.org>; Thu, 10 Nov 2022 01:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8kKFFAUCTx/SqicI25Ltk8g9h3a8wHU1qN0+iZz57A=;
        b=Vmt3PUAqFTdJPTIYV9AosDVxsQJBJKqsaQpqCT05wptm2AYvB4YqsuQjTouWRkZIAm
         wjQBAw4AtmSvG8tctgsk1pYHNRTYUGi0oJFZ8HtHY38SAWGdBQb7w9DkP3vJbb2pyuLw
         yBdPoIwNE4yeaLjJShSQ5Y74WZ5jEYIyc6YDYeSAKtXXXE09xp8kj4XroMtFIteGqlNK
         YPJRF8cpX7yuZe1l3ZQUmm4Pu8A1rtHFHW0T/BMeOxj60dEy/kD1UbRvfpYfKv8Yqmfg
         wfIVHY8kbatdlE3XvvjJBfrTkK2PwR03mWCMzkw8lLiEt4EPj6HMMDnnbOb1HzArasfC
         f9zA==
X-Gm-Message-State: ACrzQf1VFyJcT15/0wjP1PQS6GNeOFVCyIxVkjOqN//wKi+D098FuF8S
        hn3HfIVKmaYrXTZz++prDwkJZJ3hAznKnbCUeIgQg86YaEFgc4y8pcE5ET+X+sKn7gKT9smrbXA
        oaTDw7C+onuNkGsdCSFIi
X-Received: by 2002:a05:6214:2521:b0:4bb:7c6a:ce7b with SMTP id gg1-20020a056214252100b004bb7c6ace7bmr58574935qvb.103.1668072933644;
        Thu, 10 Nov 2022 01:35:33 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5/yXnjFPMUWuibYEwUfj/etJ1606/crJ8YfuxR7IK9PWpea0TGnPA8MBZmvWAxykbZHayIxw==
X-Received: by 2002:a05:6214:2521:b0:4bb:7c6a:ce7b with SMTP id gg1-20020a056214252100b004bb7c6ace7bmr58574925qvb.103.1668072933461;
        Thu, 10 Nov 2022 01:35:33 -0800 (PST)
Received: from nfvsdn-06.redhat.com (nat-pool-232-132.redhat.com. [66.187.232.132])
        by smtp.gmail.com with ESMTPSA id br7-20020a05620a460700b006bbc09af9f5sm12762258qkb.101.2022.11.10.01.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 01:35:33 -0800 (PST)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jbrouer@redhat.com, thoiland@redhat.com, donhunte@redhat.com,
        yhs@meta.com, Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH bpf-next v7 0/1] doc: DEVMAPs and XDP_REDIRECT 
Date:   Thu, 10 Nov 2022 05:29:49 -0500
Message-Id: <20221110102950.2633685-1-mtahhan@redhat.com>
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
 Documentation/bpf/map_devmap.rst | 221 +++++++++++++++++++++++++++++++
 Documentation/bpf/redirect.rst   |  82 ++++++++++++
 net/core/filter.c                |   8 +-
 4 files changed, 310 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/bpf/map_devmap.rst
 create mode 100644 Documentation/bpf/redirect.rst

-- 
2.35.3

