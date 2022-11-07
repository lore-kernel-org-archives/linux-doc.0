Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE54FC4332F
	for <linux-doc@archiver.kernel.org>; Mon,  7 Nov 2022 15:58:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbiKGP6j (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Nov 2022 10:58:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231795AbiKGP6i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Nov 2022 10:58:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 243191A81F
        for <linux-doc@vger.kernel.org>; Mon,  7 Nov 2022 07:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667836665;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=BTJbY9Wr/+q8C2Vju1/W3nu3nFbvK1UE5CikMYHFAaE=;
        b=LrKZ3uXZ1B3J4hQ22KYdTGwHuS+K5Mwr7xcRtWql0twIoOgq1BUfiB7nRmRTFEi29QnyCY
        9tjhRqXKE74wSID8Yidu0GSvawj3jSpwuXs/bHnrDXBoazw+z8pEYMkZGVYnS+wFYRV07g
        8fC5MNiZPUk8Q1vwZz39yFjsfGAz9Ho=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-TlltO3bkNgeuIBNTu4PnlQ-1; Mon, 07 Nov 2022 10:57:44 -0500
X-MC-Unique: TlltO3bkNgeuIBNTu4PnlQ-1
Received: by mail-qt1-f197.google.com with SMTP id cm12-20020a05622a250c00b003a521f66e8eso8373964qtb.17
        for <linux-doc@vger.kernel.org>; Mon, 07 Nov 2022 07:57:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTJbY9Wr/+q8C2Vju1/W3nu3nFbvK1UE5CikMYHFAaE=;
        b=K1mmVZRMgVfCNGplmDn+7xXuzICi6/9bAsM+wJt0tI/c7IZfllHJsSvQH1f5C4FMBp
         aFtSbo0iXZ9ytAJspK3RQ0v8ClzzBtFSaharoCqY/VeG+xU7sw2eCSr0hweB66YUhtMn
         WxFd7LCVmou/+iRF1k4wFpL1Zgy1QbAqmj+VyAIzGYIxwLpHy0ByHgUxELagG/A94XY5
         ZdyJb0djLBlIL9Dhayt0qi8f7NBG97Mvt6f2Roq9ES0j49DQ6bJGK5I2j9Lok1OrAlKF
         reydRFXFcYzLnuZV+IcOF+37qtTCRY9bsIjAMwhw0Q/dyfl0Wm1WYnT2/u39oQbQI+Gv
         S02w==
X-Gm-Message-State: ANoB5pk7QZwS2dE/bWSYiH3OwYsdIgVzR6ZUv/S7S0zMLggT9c4Fr4ME
        LrHHblKK+3QSSITrdT2ecU7sNHggNITZ17xQ5/Z0kl8JkXAZfPOoko3XeLwSyfA0z21dhGh1TEG
        7CoGDC8wP/EkCer/kIogM
X-Received: by 2002:ae9:ea05:0:b0:6fa:f6fa:45ab with SMTP id f5-20020ae9ea05000000b006faf6fa45abmr1265713qkg.224.1667836663736;
        Mon, 07 Nov 2022 07:57:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6GAuKKTW/5tSVjEgebzrJCMTocCIgaWGBSGVpcjPLiW95dcK0iRUc3GTN2cHgzmbrlj2UIqA==
X-Received: by 2002:ae9:ea05:0:b0:6fa:f6fa:45ab with SMTP id f5-20020ae9ea05000000b006faf6fa45abmr1265703qkg.224.1667836663521;
        Mon, 07 Nov 2022 07:57:43 -0800 (PST)
Received: from nfvsdn-06.redhat.com (nat-pool-232-132.redhat.com. [66.187.232.132])
        by smtp.gmail.com with ESMTPSA id q16-20020ac84510000000b00398df095cf5sm6248889qtn.34.2022.11.07.07.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:57:43 -0800 (PST)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jbrouer@redhat.com, thoiland@redhat.com, donhunte@redhat.com,
        Maryam Tahhan <mtahhan@redhat.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH bpf-next v3 0/1] docs: BPF_MAP_TYPE_CPUMAP
Date:   Mon,  7 Nov 2022 11:52:06 -0500
Message-Id: <20221107165207.2682075-1-mtahhan@redhat.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Maryam Tahhan <mtahhan@redhat.com>

Add documentation for BPF_MAP_TYPE_CPUMAP including
kernel version introduced, usage and examples.

Signed-off-by: Maryam Tahhan <mtahhan@redhat.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>

v3:
- Updated introduction to use cpumap definition from kernel/bpf/cpumap.c
- Separated examples and APIs under Kernel and Userspace headings.
- Updated Userspace function signatures.
- Fixed typos.
- Migrated the use of u32 types to __u32.

v2:
- Removed TMI.
- Updated example to use a round robin scheme.

Maryam Tahhan (1):
  docs: BPF_MAP_TYPE_CPUMAP

 Documentation/bpf/map_cpumap.rst | 166 +++++++++++++++++++++++++++++++
 kernel/bpf/cpumap.c              |   9 +-
 2 files changed, 172 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/bpf/map_cpumap.rst

-- 
2.35.3

