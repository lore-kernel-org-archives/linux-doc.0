Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD377C4332F
	for <linux-doc@archiver.kernel.org>; Tue,  8 Nov 2022 16:55:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233985AbiKHQzP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Nov 2022 11:55:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233704AbiKHQzO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Nov 2022 11:55:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94F422BF2
        for <linux-doc@vger.kernel.org>; Tue,  8 Nov 2022 08:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667926454;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=fWBiQlvS1LnuRc8wZ5xGuWJrY9OP9xHPVPpIfrUrek0=;
        b=cYkkluy96u/aVEkba+6Mcu7LXgHscqUYGf9oImPTt4tHHfard5bh80vaFnt2yPiyGXlUvp
        2JXpKMcsE7khUT+Xu97A7rEh3yRh63avLJ7B2LOR8Bzo3sUmCzESSBV80agNs930ktIZ1O
        vmrgrvIy4+8QmKerHaoO5q5zJ4KswnI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-199-Sygx8mwnMEe43DXn6HQQmA-1; Tue, 08 Nov 2022 11:54:13 -0500
X-MC-Unique: Sygx8mwnMEe43DXn6HQQmA-1
Received: by mail-qk1-f199.google.com with SMTP id ay43-20020a05620a17ab00b006fa30ed61fdso13256063qkb.5
        for <linux-doc@vger.kernel.org>; Tue, 08 Nov 2022 08:54:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fWBiQlvS1LnuRc8wZ5xGuWJrY9OP9xHPVPpIfrUrek0=;
        b=mqX+zuqgG7yLDqMlZTnfUMXIV00dqTXwlw1adUh5PMeKSh3b6Wk8t0SaSdWy5ffqmE
         l7aqak0RzkK7VJ49qHBpCAM89x+Sqju1xBdJcc/+Azqfs/bTd/Jv11Ecl71lK4WJKkoh
         7gSBiIFpl7JMJsuy67cjOFQBo6ksNosyWALIxzzznJ9hi3jMho9EntiqeSkzk/Xp5TuF
         rFhf8tcDqtd9BLx86umg7+N5cI1vskCpVujGCg4Yiz3NuOT/5Q1QPqesyQb62TvjD8yM
         bdgQ+jtxEJpaVGOlWknqeu66hLh/OpNugKlKoF6+PMcpVG7ktGIdqh/KqwdHvuNiPv7L
         8Rpw==
X-Gm-Message-State: ACrzQf33SRujsD3ZjnIfe2TNO5Qfrboo3vmQYhAf3sOXajJZ+RVnwXHD
        +HDVBixQ+Q9ElBc2JQuBiuTGy0OxZE7SWeqCjVnWQtt2JITJtr/7KSwF0RmKqM/ph+YtHtri7LH
        /lO1OoXIFGF2U0aBsdWoS
X-Received: by 2002:a05:6214:ca1:b0:4bb:9b8c:55a0 with SMTP id s1-20020a0562140ca100b004bb9b8c55a0mr50167719qvs.131.1667926452589;
        Tue, 08 Nov 2022 08:54:12 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6imRg7+S75Tr0aMDtmz+GBQeGE9Vnw5XLwXictPazQh3fSVVVEpkMlIDXncyIlvJ6HQn1Akg==
X-Received: by 2002:a05:6214:ca1:b0:4bb:9b8c:55a0 with SMTP id s1-20020a0562140ca100b004bb9b8c55a0mr50167700qvs.131.1667926452332;
        Tue, 08 Nov 2022 08:54:12 -0800 (PST)
Received: from nfvsdn-06.testing.baremetal.edge-sites.net (nat-pool-232-132.redhat.com. [66.187.232.132])
        by smtp.gmail.com with ESMTPSA id h18-20020ac85852000000b003a57eb7f212sm7444579qth.10.2022.11.08.08.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 08:54:11 -0800 (PST)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jbrouer@redhat.com, thoiland@redhat.com, donhunte@redhat.com,
        Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH bpf-next v6 0/1] doc: DEVMAPs and XDP_REDIRECT 
Date:   Tue,  8 Nov 2022 12:48:32 -0500
Message-Id: <20221108174833.1106947-1-mtahhan@redhat.com>
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

