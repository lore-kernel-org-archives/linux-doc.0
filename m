Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00997C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 11:21:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbiJULVC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 07:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbiJULVA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 07:21:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70FE02514CD
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 04:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666351257;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ReqbEj8BqOln93pvlV1AGFFDODx76Z1OSm0u26Ew1ZQ=;
        b=cMNXdQ+BkWKetQYFXwBVUphIPg+Ps3dSutsaZ91R0FCvSgA+bEBocTaQC5KUWvaUG4ha7j
        V74ZpkYW0kVklAfv+IyQj3XoMJL2SrqaxWVVnW0/elQsnq5a0fMMKaP6oNLifcu/alx6ua
        ZwkQzd02fT/qS7Y83uubEy9xv23NHg4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-iKGkDXl-P0GCmlJ7M0cDmw-1; Fri, 21 Oct 2022 07:20:49 -0400
X-MC-Unique: iKGkDXl-P0GCmlJ7M0cDmw-1
Received: by mail-qv1-f71.google.com with SMTP id ny15-20020a056214398f00b004b9152f4b53so2102667qvb.17
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 04:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReqbEj8BqOln93pvlV1AGFFDODx76Z1OSm0u26Ew1ZQ=;
        b=Xanvt/+rqYwu4jPH6xEBw9jucaNaDEe0teaIPrpzT4AfHNUQbp3zIqS9dJrcH/PqKd
         mX9km7IXaz2v9N2Vky3PrUEaSmARUxy62OhnnYLB9TIxla49VAuKsgbrf8lfRMz/J8+W
         yBjLZiv+6EUQG11qAREnbU4bqh6JagGyxzmBt/sRxIWb9KaZynFm7uUMwzIo74vSx8dw
         +kCJX8/mr5AlFJ7SlD9p+qXiaZLi9I+F1uod1MbkCHvkt0WZ0nxFq7mOhjHV1SKbo6ll
         YI4U4U5RKsvvlL+yaHGJHEw1aSaY3k4TSMIuAgXoaUd9wxcOaiGcnQ5AeFNZWOKD32Nd
         Xb/Q==
X-Gm-Message-State: ACrzQf2OwXEt4r8Pvy9qq/hI6UgnXGL4a2QgzVV70a5oHN+MY2b+SbaZ
        1HlyuSFWyPdwrYVraXPtDHLb2KYBXMRhhV5+hZJXvQ33M5yhNKkK6zczB/3VDY4R1LT046NPwdr
        jhgc4t4UNeTitwoli2cJA
X-Received: by 2002:a05:620a:16d5:b0:6ec:52ab:e8bd with SMTP id a21-20020a05620a16d500b006ec52abe8bdmr12849026qkn.424.1666351248716;
        Fri, 21 Oct 2022 04:20:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6P8dlyWGTrZobZd3w5ieHLYuNRCnqoDjXom734aeT3HyS1kvD7hNbry43KHSZ1JgSdyY/NOw==
X-Received: by 2002:a05:620a:16d5:b0:6ec:52ab:e8bd with SMTP id a21-20020a05620a16d500b006ec52abe8bdmr12849007qkn.424.1666351248493;
        Fri, 21 Oct 2022 04:20:48 -0700 (PDT)
Received: from nfvsdn-06.testing.baremetal.edge-sites.net (nat-pool-232-132.redhat.com. [66.187.232.132])
        by smtp.gmail.com with ESMTPSA id c25-20020ac81119000000b003996aa171b9sm7766604qtj.97.2022.10.21.04.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 04:20:47 -0700 (PDT)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH bpf-next v3 0/1] doc: DEVMAPs and XDP_REDIRECT 
Date:   Fri, 21 Oct 2022 08:15:56 -0400
Message-Id: <20221021121557.3486894-1-mtahhan@redhat.com>
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
- Update examples in DEVMAPs documentation for broadcast scenario.
- Update key reference for BPF_MAP_TYPE_DEVMAP_HASH (doesn't have to be
  ifindex).
- Remove information re xdp_redirect internals.

v1->v2:
- Separate xdp_redirect documentation to its own file.
- Clean up and simplify examples and usage function descriptions.

Maryam Tahhan (1):
  doc: DEVMAPs and XDP_REDIRECT

 Documentation/bpf/index.rst      |   1 +
 Documentation/bpf/map_devmap.rst | 208 +++++++++++++++++++++++++++++++
 Documentation/bpf/redirect.rst   |  41 ++++++
 3 files changed, 250 insertions(+)
 create mode 100644 Documentation/bpf/map_devmap.rst
 create mode 100644 Documentation/bpf/redirect.rst

-- 
2.35.3

