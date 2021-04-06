Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2B6C433B4
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 07:37:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB44C613C2
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 07:37:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235036AbhDFHhv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 03:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234913AbhDFHhv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Apr 2021 03:37:51 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86AC7C06174A
        for <linux-doc@vger.kernel.org>; Tue,  6 Apr 2021 00:37:43 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id z1so15309436edb.8
        for <linux-doc@vger.kernel.org>; Tue, 06 Apr 2021 00:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xQj0Ylb3LYmdPuY5xjMjIghNY6SvWK3uROSYtfvbu8Y=;
        b=f+hAhK2M0XyUy60xThSlYYX2e2/23qFf8qyjutC3bf0Wyekqrx/5kZfckXHwgXJ3k2
         S0SWf+l26X7ccG5OalDkZ+LAaSUSbnyGXz9W9Omkh0gmIFFzE33BugitYq/lt80lOxwS
         bx3RBCGLYQhi9pvrP+zkE9SCVDVwXCBNi0Og90xif+K/MEEmug/fAbvkgUxhrJJswFOm
         HiI4RwzuhF7nUKRcgVyn3+wcJdWSMCK8FBbSb6SLwDYoWqHYv+CwyZOjwFRePFpVVHeg
         /DKWTsd20Wn5iDDOPgtjwjh8LLICbGsZQOocb11JkwZMcgjWqj/ZL0+M7fSrEqfRa1A5
         s83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xQj0Ylb3LYmdPuY5xjMjIghNY6SvWK3uROSYtfvbu8Y=;
        b=L0IQcrLHbbzp4JR9bvuduJWXjNVCZ3UP3jESqXTN+xGnVC84aNjTWgQSNPSra0Pdy8
         zAzYXaDGL1g8VO5DJeAnTArV5zGDZcAYjQbeFeQflbFiq3Q0PvdXLtFmD/ir7Mtcw0x4
         5HRVSOfeTaZJWz3cjKa/E3xuD3B8+TrU17TBUIduzlxEXL2H7gVxRyoRmS/VR9ImVDFm
         uOtGc1VK8dUmptO28UDKNrXSbBiPK27TqyR1ol/bNC3GofJkvigPOQ5VfJRv1C6eTa5S
         lBt6QglSJi0Y/0E5FQyigEwYOttzKl4jRlfqfelsP7bl4g+RWOGnsH2XydIt1OAJGkc4
         AiqA==
X-Gm-Message-State: AOAM530fxg7/u4TjLr9rcTWGR5ydEK3ofRzvOzDV6DuiLxPTUSH1C/Ct
        j4qqWwwsY2EY7LeXc1rFO0O76g==
X-Google-Smtp-Source: ABdhPJxMPX4DYpYY1FnmT1khgda9Wq8cI7J2q70JA0aV0/r7wAljH8K6I0YRVN5u8yAI8qXe6E8efg==
X-Received: by 2002:aa7:d453:: with SMTP id q19mr7017123edr.384.1617694662256;
        Tue, 06 Apr 2021 00:37:42 -0700 (PDT)
Received: from gkim-laptop.fkb.profitbricks.net (ip5f5aeee5.dynamic.kabel-deutschland.de. [95.90.238.229])
        by smtp.googlemail.com with ESMTPSA id o6sm12843305edw.24.2021.04.06.00.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 00:37:42 -0700 (PDT)
From:   Gioh Kim <gi-oh.kim@ionos.com>
To:     linux-block@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     axboe@kernel.dk, akinobu.mita@gmail.com, corbet@lwn.net,
        hch@infradead.org, sagi@grimberg.me, bvanassche@acm.org,
        haris.iqbal@ionos.com, jinpu.wang@ionos.com,
        Gioh Kim <gi-oh.kim@ionos.com>
Subject: [PATCH for-next 0/5] Enable Fault Injection for RNBD
Date:   Tue,  6 Apr 2021 09:37:22 +0200
Message-Id: <20210406073727.172380-1-gi-oh.kim@ionos.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

My colleagues and I would like to apply the fault injection
of the Linux to test error handling of RNBD module. RNBD module
consists of client and server modules that are connected via
Infiniband network. So it is important for the client to receive
the error of the server and handle it smoothly.

When debugfs is enabled, RNBD is able to export interfaces
to fail RNBD client and server.
Following fault injection points are enabled:
- fail BIO processing on RNBD server side
- fail IO transferation on RNBD client side
- fail device unmapping on RNBD client side

This patch set is just a starting point. We will enable various
faults and test as many error cases as possible.

Best regards

Gioh Kim (5):
  block/rnbd: Enable the fault-injection
  block/rnbd-srv: Inject a fault at bio processing
  block/rnbd-clt: Inject some fault points
  docs: fault-injection: Add fault-injection manual of RNBD
  docs: Add RTRS/RNBD to the index of fault-injection

 Documentation/fault-injection/index.rst       |   2 +
 .../fault-injection/rnbd-fault-injection.rst  | 208 ++++++++++++++++++
 drivers/block/rnbd/rnbd-clt-sysfs.c           |  53 +++++
 drivers/block/rnbd/rnbd-clt.c                 |  17 ++
 drivers/block/rnbd/rnbd-clt.h                 |  15 ++
 drivers/block/rnbd/rnbd-common.c              |  44 ++++
 drivers/block/rnbd/rnbd-proto.h               |  14 ++
 drivers/block/rnbd/rnbd-srv-sysfs.c           |  37 ++++
 drivers/block/rnbd/rnbd-srv.c                 |   7 +
 drivers/block/rnbd/rnbd-srv.h                 |  13 ++
 10 files changed, 410 insertions(+)
 create mode 100644 Documentation/fault-injection/rnbd-fault-injection.rst

-- 
2.25.1

