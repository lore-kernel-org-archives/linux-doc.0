Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13685C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 12:53:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C932A613CA
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 12:53:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbhDTMyF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Apr 2021 08:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232338AbhDTMyD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Apr 2021 08:54:03 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4964C06138A
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 05:53:31 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id w3so58142243ejc.4
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 05:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LFSy6RUpmpxDY/av6j+qBKwzw9xjIiwGKoFPLhg8tus=;
        b=QtTfIVqNetrqW4nTr7FwKTIwm+1OIi3Nra0FiQmuv9hzZKbiw3b37hKwuSh0WN6loT
         odlE76AGfBHPWaVt+36pVZWkF8mcCnBWYqIksPJLIFSR5+TfiRaxKOgV4w2Z0JwqJMFd
         08GEfGNc6ZgWSlhzpyBRDb7cLBWW6RkUKBDQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LFSy6RUpmpxDY/av6j+qBKwzw9xjIiwGKoFPLhg8tus=;
        b=GPMzi9xc2ZTQHH5B+iR0/MLhc+JNECWFQX5QkLE/aa7mfn2W/RM0mdnlBEHEr8hg+X
         1EpObIzGigJMd4Cvrt6OgUAtihKYLkPxIBiG0WNXh6hseKviBylmQxdNBvHa0ox9FfUq
         dmFWhtioHGBuCOQ4hzZxQ+wRcrDTqOM4Po5uVRK7aUEDk9inzzq3osdq5EW2PkCdoPvi
         7q8/qQvp+IdSrpLaCpGdvhbh2ODx4O/Vyh2tAlHVThr7/PeSeJKKdC963UTE0j8aR8qg
         Y1qW1LRtYGzSgRlNL29dI9dGqNcNvX8MM6zZHza8OkwCWOp+Qm0knuaEX/DWO9zXRr+r
         m4ZQ==
X-Gm-Message-State: AOAM5328m7jXy49ggAh/BlkZOrLo1GiKtVfq5tnYl+ywpSlR0KnYQhN2
        wS8aT1CndWs4OJjfmPzPspbQPTWRd6hI5A53
X-Google-Smtp-Source: ABdhPJywF6by0hgnnggMx0wab/r6dZZPA6xMNsxXYtachGELVYwTG3qr92ipBsA2HjH11SWlnXmqoQ==
X-Received: by 2002:a17:906:1d0e:: with SMTP id n14mr27679497ejh.97.1618923210436;
        Tue, 20 Apr 2021 05:53:30 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([80.208.71.248])
        by smtp.gmail.com with ESMTPSA id g20sm15836908edb.7.2021.04.20.05.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 05:53:29 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs: admin-guide: update description for kernel.modprobe sysctl
Date:   Tue, 20 Apr 2021 14:53:24 +0200
Message-Id: <20210420125324.1246826-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When I added CONFIG_MODPROBE_PATH, I neglected to update
Documentation/. It's still true that this defaults to /sbin/modprobe,
but now via a level of indirection. So document that the kernel might
have been built with something other than /sbin/modprobe as the
initial value.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---

Andrew, this is a followup or a fixup, however you want to handle it,
to "modules: add CONFIG_MODPROBE_PATH" (in next-20210419 known as
8bc50a36278dbf3e14b25236e3acee25f75d5bd8). I.e., please add this as-is
to your patch queue, or fold this into that one.

 Documentation/admin-guide/sysctl/kernel.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 1d56a6b73a4e..7ca8df5451d4 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -483,10 +483,11 @@ modprobe
 ========
 
 The full path to the usermode helper for autoloading kernel modules,
-by default "/sbin/modprobe".  This binary is executed when the kernel
-requests a module.  For example, if userspace passes an unknown
-filesystem type to mount(), then the kernel will automatically request
-the corresponding filesystem module by executing this usermode helper.
+by default ``CONFIG_MODPROBE_PATH``, which in turn defaults to
+"/sbin/modprobe".  This binary is executed when the kernel requests a
+module.  For example, if userspace passes an unknown filesystem type
+to mount(), then the kernel will automatically request the
+corresponding filesystem module by executing this usermode helper.
 This usermode helper should insert the needed module into the kernel.
 
 This sysctl only affects module autoloading.  It has no effect on the
-- 
2.29.2

