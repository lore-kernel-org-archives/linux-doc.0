Return-Path: <SRS0=ajHd=6Z=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442CCC47255
	for <linux-doc@archiver.kernel.org>; Mon, 11 May 2020 23:32:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CAC92075E
	for <linux-doc@archiver.kernel.org>; Mon, 11 May 2020 23:32:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hmkTZmcY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbgEKXcd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 May 2020 19:32:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725854AbgEKXcd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 May 2020 19:32:33 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343FEC061A0C
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2020 16:32:33 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id hi11so8599462pjb.3
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2020 16:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xU6XMFoWF023UKxWu5DBFTUKYIQF4dpwdxpl48CmnvI=;
        b=hmkTZmcY9eimS7zi32p2CbRuT9se7M2eQNUTTR3FZqdvTCpZc3jZjXqT4gpZdmE769
         AZtNeOpQEhsX+ga2HTyU6+lHdh+IT0MBBzJ+2FOzsnYLYbCH+hTuIet0bGweiZtC+12q
         kDXwi87kgJ7ITnkNTpTREfS+Qqxxp4erB3IAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xU6XMFoWF023UKxWu5DBFTUKYIQF4dpwdxpl48CmnvI=;
        b=jSbFxCJbzIdXebcZs/2/gpu5PFkO5HRfThgvMn1EboYyq0/bBrc2V5XklG656gySmH
         EK/feKSlVHq5/6td434Vq3Ucm7ieEyaM70elpFzAFGEzZQJuvYh3KUm+YftZzyJPoARo
         nMMQLfFOMf6iQM8vf7cj5ON8676hemnEKU0AdFPemlSLdqCt8+uQoK0Rmpp2Jb6GpgXa
         YxTFGlCSFvldfnsobObsCOeNMkEgUOnlSSMODlnDHFcQZNx7Ac09x1Nsu0yQeI4YH9FF
         pmhYfu5BserNWtHDc5C77hatdyL9Ak/IjCDti2dg+CFmktVNaMfl5eofzEDkWwCgLGGR
         ZYbA==
X-Gm-Message-State: AGi0PuY8Vk0ct8ioZuCCbVJ93dgdX9JafFmHJeFUZRaqmCtsEKYS00Or
        +GmE72nmjC/U/Zy4uXUCzzhv/Q==
X-Google-Smtp-Source: APiQypIgnigda0IfbYZaAZeoDqi306WfjOgDzWWw5NxF50ONJAY+5AzUPXuEd44x79WdKoX43FT6NA==
X-Received: by 2002:a17:90a:f98b:: with SMTP id cq11mr24781058pjb.193.1589239952517;
        Mon, 11 May 2020 16:32:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 23sm8996607pgm.18.2020.05.11.16.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 16:32:31 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     WeiXiong Liao <liaoweixiong@allwinnertech.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH v8 00/11] pstore: mtd: support crash log to block and mtd device
Date:   Mon, 11 May 2020 16:32:18 -0700
Message-Id: <20200511233229.27745-1-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

After some small fixes, here's v8. :) Thanks!

-Kees

v8:
- oops -> kmsg dump (WeiXiong)
- typo/language fixes (Randy)
- fix bdev failure paths (WeiXiong)
- fix dev_err() -> pr_err (WeiXiong)

v7: https://lore.kernel.org/lkml/20200510202436.63222-1-keescook@chromium.org/
v6: https://lore.kernel.org/lkml/20200509234103.46544-1-keescook@chromium.org/
v5: https://lore.kernel.org/lkml/1589022854-19821-1-git-send-email-liaoweixiong@allwinnertech.com/
v4: https://lore.kernel.org/lkml/20200508064004.57898-1-keescook@chromium.org/
v3: https://lore.kernel.org/lkml/1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com/
v2: https://lore.kernel.org/lkml/1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com/
v1: https://lore.kernel.org/lkml/1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com/

Kees Cook (1):
  pstore/blk: Introduce "best_effort" mode

WeiXiong Liao (10):
  pstore/zone: Introduce common layer to manage storage zones
  pstore/blk: Introduce backend for block devices
  pstore/zone,blk: Add support for pmsg frontend
  pstore/zone,blk: Add console frontend support
  pstore/zone,blk: Add ftrace frontend support
  Documentation: Add details for pstore/blk
  pstore/zone: Provide way to skip "broken" zone for MTD devices
  pstore/blk: Provide way to query pstore configuration
  pstore/blk: Support non-block storage devices
  mtd: Support kmsg dumper based on pstore/blk

 Documentation/admin-guide/pstore-blk.rst |  243 ++++
 MAINTAINERS                              |    1 +
 drivers/mtd/Kconfig                      |   10 +
 drivers/mtd/Makefile                     |    1 +
 drivers/mtd/mtdpstore.c                  |  563 +++++++++
 fs/pstore/Kconfig                        |  109 ++
 fs/pstore/Makefile                       |    6 +
 fs/pstore/blk.c                          |  521 ++++++++
 fs/pstore/zone.c                         | 1463 ++++++++++++++++++++++
 include/linux/pstore_blk.h               |  118 ++
 include/linux/pstore_zone.h              |   60 +
 11 files changed, 3095 insertions(+)
 create mode 100644 Documentation/admin-guide/pstore-blk.rst
 create mode 100644 drivers/mtd/mtdpstore.c
 create mode 100644 fs/pstore/blk.c
 create mode 100644 fs/pstore/zone.c
 create mode 100644 include/linux/pstore_blk.h
 create mode 100644 include/linux/pstore_zone.h

-- 
2.20.1

