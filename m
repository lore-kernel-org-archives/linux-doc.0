Return-Path: <SRS0=A0dr=DB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E90BC4363D
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 11:38:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1F042311B
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 11:38:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="vAQ0FAWT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727433AbgIXLiu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Sep 2020 07:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgIXLiu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Sep 2020 07:38:50 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0C3C0613CE
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2020 04:38:49 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j2so3428597wrx.7
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2020 04:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FLL/Sx98lxd1x3lyr+uBKTSay9yyyLoslx53kZxkqUI=;
        b=vAQ0FAWT0KVylcyqqJcCUfCFpNiDU+BswPp5oDUnxUalupXSWv08HnLTCWOY5Y/0vD
         /NNSV+JbKgeNHJnI/ZGBQi9LEtPzWcpRd5FZeCGxEm3bStW4h98DVZO65JP9Doo+3RvS
         vjefnFdYx0NPhxs9W/IVXx7nExH9+cIhTqtlmQleSxvZYs0wke7DIosXZ6KGrS0NeAT2
         5KongtvQepTN4osy85pgyS+O294PcAwgIHsTIXc864Zan+OahUHMoRZ9OF2hxUbHfM52
         hL/Ue0HOvAEN6/QKQY2af05vuXHmVoIYAeJksPst2UcktchbrOd7aQVrjFhzUCfZcqV8
         kCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FLL/Sx98lxd1x3lyr+uBKTSay9yyyLoslx53kZxkqUI=;
        b=s7bownp0f95sFxBzgJ6n2Bv9RJIOxpn6g/koxJqeMYQwAhOFXvjyQtDa322Td/Wmfl
         OJBzow3DqDKZP8Nl//WhGTWEUHH0P51E5VV4+6yGjO48GoFVjuzNa6IppEUpCtQ+WokX
         bHcHIdHQWaqaEpyn/F2R7nmHUK5/KoNGzDG46BVmDEu8aHUWWRWjsJmvYu3XVkFP1q7r
         wzXIxoJ1v5yrbjFDKFBGakIyKQcLwv19T+c8/yWsuFmLGska9LI8L+bXoJWNztOiDuJ1
         6vSiEvQr0EMsS+KJV0BX2CVDnf6D3nvG9s2ltkvae3If8dGRUSegJv9V4iUs4bDqnC5z
         qhmw==
X-Gm-Message-State: AOAM531g9Y1vCC2VBtTrviVjCl33B18oH2Omm0Qqt4AATtZcWchshs1F
        +4tPO6xb6zdVOsqJ1A8DM7c1Bg2reAvLWA==
X-Google-Smtp-Source: ABdhPJw1+9CUXXOeZMznTfNNY3yjhlC0wQSe/OvdJnBxNgTWl5CZGL9/IPzAlH/67qgH5fZEvKl46w==
X-Received: by 2002:a5d:49d2:: with SMTP id t18mr4366937wrs.99.1600947528426;
        Thu, 24 Sep 2020 04:38:48 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id y207sm3390133wmc.17.2020.09.24.04.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 04:38:47 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/9] gpio: mockup: refactoring + documentation
Date:   Thu, 24 Sep 2020 13:38:33 +0200
Message-Id: <20200924113842.11670-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

These patches were part of the bigger overhaul of gpio-mockup but since
the initial idea was dropped in favor of using configfs + sysfs in the
future I thought I'd resent just the refactoring of the existing code
+ documentation patches. I think it's good to apply them since we don't
really know when the new interface will be ready (configfs needs a new
functionality - commitable items - to support mockup chip instantiation).

Bartosz Golaszewski (9):
  lib: string_helpers: provide kfree_strarray()
  Documentation: gpio: add documentation for gpio-mockup
  gpio: mockup: drop unneeded includes
  gpio: mockup: use KBUILD_MODNAME
  gpio: mockup: use pr_fmt()
  gpio: mockup: remove unneeded return statement
  gpio: mockup: pass the chip label as device property
  gpio: mockup: use the generic 'gpio-line-names' property
  gpio: mockup: refactor the module init function

 .../admin-guide/gpio/gpio-mockup.rst          |  50 ++++++
 drivers/gpio/gpio-mockup.c                    | 154 +++++++++---------
 include/linux/string_helpers.h                |   2 +
 lib/string_helpers.c                          |  22 +++
 4 files changed, 152 insertions(+), 76 deletions(-)
 create mode 100644 Documentation/admin-guide/gpio/gpio-mockup.rst

-- 
2.26.1

