Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9A3C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 13 Oct 2022 10:16:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbiJMKQH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Oct 2022 06:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiJMKQF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Oct 2022 06:16:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B23EF6C21
        for <linux-doc@vger.kernel.org>; Thu, 13 Oct 2022 03:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665656163;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=h1cObQ2s1xR5ZeaqLWVHbxy0BrP3z3LZ2+yRklnqRvk=;
        b=f5ozFY0r7fH7k+EZwgjCge4nR8Fo8rYY8O2xL9VLkJ1N8el9XmFV8ACNwAYIHmttU1Ztfr
        fw+Scm1pNjOeByw7J+wWeG4t2ClrGlx9LlFq7k78lv/HjXWOjNTGZRM0aUSP4xf5NdUBgZ
        Mv2D1byFtt/RxjYtKo8GSCsAymaiLRo=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-wsbiwGBWMLOHZUCW9S7q-Q-1; Thu, 13 Oct 2022 06:16:01 -0400
X-MC-Unique: wsbiwGBWMLOHZUCW9S7q-Q-1
Received: by mail-oo1-f70.google.com with SMTP id q19-20020a056820029300b00476b35bd302so770624ood.22
        for <linux-doc@vger.kernel.org>; Thu, 13 Oct 2022 03:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h1cObQ2s1xR5ZeaqLWVHbxy0BrP3z3LZ2+yRklnqRvk=;
        b=OlglnRbH55cBDW7/q7r79rNviBhyV4UfLsdqoceamG2Tzd7sSgvJ885ba5jnRhkPNA
         8LsW/9yEx4OnCrUsAfWnWvgc7OqHpq5VXpOZ9eyeMqj9mqBKHtMmRJKnFUautoUKxOQF
         ngVViYWuxfJu6zNaY8BRQ7zFIn5tYZrP60rGuRK1i6rQj40+03modgQgQ7u++QirwCAe
         xic3iifQ8w8rrCrNEmFy/yxPGOmMCwEF3GNU440Z35XQlpP+pDSp+NRXs1okJUE+lL+R
         gwXcx8yygotGjmYkjmR2Blo+F9BhZXUX9uH0qSo4ERsxlYI/yN7Xu9mflyQNkwEYmog6
         p7zg==
X-Gm-Message-State: ACrzQf3xUIAAZCxNsB3f9jh/D/tdz5ebDlLSSKCwSMJtzP+gIiOlgNGT
        mRoz+BShruhKFfj+VEmdfytcvN2lFTvW0nloB/FtzaZeR0bpJe3QmdEzV5gVR7MHm/hw/Eo+ZBo
        r6BfBPCisIxXI6a6U6NY4
X-Received: by 2002:a05:6808:1513:b0:354:f6d6:2015 with SMTP id u19-20020a056808151300b00354f6d62015mr2173378oiw.18.1665656159176;
        Thu, 13 Oct 2022 03:15:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Wlx3426Um6Yto4xX93+FqYjwG4/Vl5PILgVndKDc7GhdaqOhvp5FTBE7avNS0UTRrE2wFGw==
X-Received: by 2002:a05:6808:1513:b0:354:f6d6:2015 with SMTP id u19-20020a056808151300b00354f6d62015mr2173373oiw.18.1665656158992;
        Thu, 13 Oct 2022 03:15:58 -0700 (PDT)
Received: from nfvsdn-06.testing.baremetal.edge-sites.net (nat-pool-232-132.redhat.com. [66.187.232.132])
        by smtp.gmail.com with ESMTPSA id f187-20020aca38c4000000b00354732338desm5034605oia.17.2022.10.13.03.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 03:15:58 -0700 (PDT)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH bpf-next v2 0/1] doc: DEVMAPs and XDP_REDIRECT
Date:   Thu, 13 Oct 2022 07:11:28 -0400
Message-Id: <20221013111129.401325-1-mtahhan@redhat.com>
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

v1->v2:
- Separate xdp_redirect documentation to its own file.
- Clean up and simplify examples and usage function descriptions.

Maryam Tahhan (1):
  doc: DEVMAPs and XDP_REDIRECT

 Documentation/bpf/index.rst      |   1 +
 Documentation/bpf/map_devmap.rst | 192 +++++++++++++++++++++++++++++++
 Documentation/bpf/redirect.rst   |  46 ++++++++
 3 files changed, 239 insertions(+)
 create mode 100644 Documentation/bpf/map_devmap.rst
 create mode 100644 Documentation/bpf/redirect.rst

-- 
2.35.3

