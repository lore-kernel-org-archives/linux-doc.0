Return-Path: <SRS0=LtJm=CT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65276C43461
	for <linux-doc@archiver.kernel.org>; Thu, 10 Sep 2020 19:40:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27DD521556
	for <linux-doc@archiver.kernel.org>; Thu, 10 Sep 2020 19:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hCSXD6up"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgIJTkG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Sep 2020 15:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbgIJTjo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Sep 2020 15:39:44 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447E7C061573
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 12:39:44 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id kk9so530605pjb.2
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/OnhzWxRrpb9iMtadcuHWcNh629tQc4KM19Wi54LRtg=;
        b=hCSXD6upMfBV9X5KA/ZtlWSvvN2u/jrPNiyohNzJP5Um1eFsUXMt0IYITSRfjZ2N7F
         CCqyc169XJ1S8IpNzSTR7/Q5A6TudydibF3Vn3kjFa/RYlfcqOXVCvzTm5PgzV4g4OqP
         8v0wzqe/u6KCVeDEuK6H/5IOXZL8hQeFkHNqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/OnhzWxRrpb9iMtadcuHWcNh629tQc4KM19Wi54LRtg=;
        b=aV5xoUEFYcWP6JsnEiF5e/jWZsvto44lHdq5RWp+CAVxbspcYFFk1H8GBczsPQt0RZ
         2rkc/7Sxhryz11MAOLCfysLrTXuUv3ZBL7/TPgut04NAe5P+qge5jAVaWsGotbFmUeZj
         032YyxmmSBumgkIDUGq3g+y0EUk9RPgnwDM1wwjUtwUIHOZGg0iMMEftgTMVQL0Ty9rR
         WvAVbqOZgod47Bxz0ML8uePScMgGD5K4ua0c4n8mxxl/bZrfMz2ceYf8rJyQCBkaYTE9
         CpRNUbTgPU9di87UrHSBea8qvc/82zXqfREfL/iVkswMHcl/Ajl4/ZrFwmn7ZAnffcWd
         M4Bw==
X-Gm-Message-State: AOAM530q+8a2nx/wQuPU33pG0/5sq4hxaq1HynsgH337+kRRbNkTJ7fK
        9+ngYLZt3iNF76UwUtzF/hcSI9t9/U+pMCo2
X-Google-Smtp-Source: ABdhPJxXAuAUy5u4R4yCF630iZaul9HrpugdlwL5m6UWHu3jTbgBmhRTURbZ4j97AJLKFthjZy6HwQ==
X-Received: by 2002:a17:90a:5a48:: with SMTP id m8mr1431789pji.181.1599766783160;
        Thu, 10 Sep 2020 12:39:43 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q24sm6804281pfs.206.2020.09.10.12.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 12:39:42 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Kees Cook <keescook@chromium.org>, Joe Perches <joe@perches.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mailmap: Add older email addresses for Kees Cook
Date:   Thu, 10 Sep 2020 12:39:39 -0700
Message-Id: <20200910193939.3798377-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This adds explicit mailmap entries for my older/other email addresses.

Reported-by: Joe Perches <joe@perches.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 .mailmap | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.mailmap b/.mailmap
index 50096b96c85d..a780211468e4 100644
--- a/.mailmap
+++ b/.mailmap
@@ -169,6 +169,10 @@ Juha Yrjola <juha.yrjola@solidboot.com>
 Julien Thierry <julien.thierry.kdev@gmail.com> <julien.thierry@arm.com>
 Kamil Konieczny <k.konieczny@samsung.com> <k.konieczny@partner.samsung.com>
 Kay Sievers <kay.sievers@vrfy.org>
+Kees Cook <keescook@chromium.org> <kees.cook@canonical.com>
+Kees Cook <keescook@chromium.org> <keescook@google.com>
+Kees Cook <keescook@chromium.org> <kees@outflux.net>
+Kees Cook <keescook@chromium.org> <kees@ubuntu.com>
 Kenneth W Chen <kenneth.w.chen@intel.com>
 Konstantin Khlebnikov <koct9i@gmail.com> <khlebnikov@yandex-team.ru>
 Konstantin Khlebnikov <koct9i@gmail.com> <k.khlebnikov@samsung.com>
-- 
2.25.1

