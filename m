Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DD6C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 16:48:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12B1D61A2C
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 16:48:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhCYQrv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 12:47:51 -0400
Received: from mail-il1-f172.google.com ([209.85.166.172]:42593 "EHLO
        mail-il1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbhCYQrX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Mar 2021 12:47:23 -0400
Received: by mail-il1-f172.google.com with SMTP id l5so2651645ilv.9;
        Thu, 25 Mar 2021 09:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p60kgUQia6h9U0zFwDlfZUN+TxQFnlKZhghqx2vserA=;
        b=CWFGhM/+PXtLMltceWCjRzwQn7QztHJJTfanOxboauqMT3XBhmyGQ5hqfF34oKiXVj
         hdvDdnee1U66sKKvSalBQKDd9TcObtED6Fk4tKbHZOvGqmplg8+AWb2H0XyJazj9pu7d
         5/Upfrr7BVJOm3aQ6FLH0BULvDQPajV6nFP4Cjqb9DP0qiM6x+bE+Zzgme/lLNuuWXT8
         BLSEWO6n/i7ZMNZlXXpY6YYhoxg+8biRuYPxP8oolBymKBFMDdnduXdCbDyjdta8/P9I
         HqoE5tC7UHxPHVCpFWy8vwD2uLdD9ZgS897lGra4QqUlruDbnkR6RwJtO/mAvQVNxQts
         p9bQ==
X-Gm-Message-State: AOAM533i0YpCSPC0XxG9qKbVRHDg7NL3cmgtf7C3CHilJGbpz/7GzBQl
        /TEiHP+VARJu8OYfeJe3pg4NiJlUvA==
X-Google-Smtp-Source: ABdhPJxsNMeq3B2T1Yya2CRzQ0/VZUeWECUEnEjfrik5hjKX7WVmYFvn71LXmdyNKu3tfFaGr0h1DA==
X-Received: by 2002:a92:dc49:: with SMTP id x9mr7461691ilq.281.1616690842710;
        Thu, 25 Mar 2021 09:47:22 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.253])
        by smtp.googlemail.com with ESMTPSA id h13sm2868615ila.82.2021.03.25.09.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 09:47:20 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 0/8] dt: doc build improvements and kerneldoc addition
Date:   Thu, 25 Mar 2021 10:47:05 -0600
Message-Id: <20210325164713.1296407-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series reorganizes the DT documentation and adds the DT API
kerneldoc to the documentation build.

It's based on the current DT for-next branch which has a series of
kerneldoc fixes from Lee Jones.

Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org

Rob Herring (8):
  dt-bindings: Fix reference in submitting-patches.rst to the DT ABI doc
  docs: dt: writing-schema: Remove spurious indentation
  docs: dt: writing-schema: Include the example schema in the doc build
  docs: dt: Make 'Devicetree' wording more consistent
  docs: dt: Group DT docs into relevant sub-sections
  of: Fix kerneldoc output formatting
  of: Add missing 'Return' section in kerneldoc comments
  docs: dt: Add DT API documentation

 Documentation/devicetree/bindings/index.rst   |   7 +-
 .../bindings/submitting-patches.rst           |   4 +-
 .../{ => bindings}/writing-schema.rst         |  17 +-
 Documentation/devicetree/changesets.rst       |   8 +-
 .../devicetree/dynamic-resolution-notes.rst   |   8 +-
 Documentation/devicetree/index.rst            |  19 +-
 Documentation/devicetree/kernel-api.rst       |  57 ++++
 Documentation/devicetree/of_unittest.rst      |   6 +-
 Documentation/devicetree/overlay-notes.rst    |   8 +-
 Documentation/devicetree/usage-model.rst      |   8 +-
 drivers/of/base.c                             | 323 +++++++++---------
 drivers/of/dynamic.c                          |  19 +-
 drivers/of/fdt.c                              |  17 +-
 drivers/of/irq.c                              |  14 +-
 drivers/of/overlay.c                          |  16 +-
 drivers/of/platform.c                         |  10 +-
 drivers/of/property.c                         |  66 ++--
 include/linux/of.h                            |  63 ++--
 18 files changed, 395 insertions(+), 275 deletions(-)
 rename Documentation/devicetree/{ => bindings}/writing-schema.rst (95%)
 create mode 100644 Documentation/devicetree/kernel-api.rst

-- 
2.27.0

